----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.03.2016 11:46:30
-- Design Name: 
-- Module Name: ConvEngineWeightBank_WriteControl_Level2 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.NetworkPackage.all;
use work.ConvPackage.all;
use work.ConvEngineWeightBankPkg.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--#Begin --Component
--#End  --Components
--#Begin --Type
--#End	 --Type
--#Begin --Signals
--#End	 --Signals

entity ConvEngineWeightBank_WriteControl_Level2 is
  Port (clk,rst: in std_logic;
	  	-- Control I/O from Master
		StartWritingNetwork: in std_logic;
	  	DoneWithNetwork: out std_logic;

	  	--Network architecture
  			-- Data from Network architecture bank
		NumberOfLayersInNetwork_unfloped: in LayerIdx_st;
		Layer_Base_unfloped: in ConvEngineTotalWeightAddrInTermsOf16Words_t;
		SetSize_InTermsOf16Words_unfloped: in SetSize_InTermsOf16Words_t;
		TotalNumberOfSetsInALayer_unfloped: in KernelIdx_st; -- Max sets possible= MAx kernels in a layer
		NumberOfLoopOverTheSet_unfloped: in NumberOfLoopOverTheSet_t; --Depends on column size and zero padding in rows
		KernelsInLastSet_unfloped: in NumberOfSimultaneousKernel_t;
		SizeOfLastSet_InTermsof16Words_unfloped: in SetSize_InTermsOf16Words_t;
		NumberOfSimultaneousKernel_unfloped: in NumberOfSimultaneousKernel_t;
  		SetCrossesBankBoundary_unfloped: in std_logic; 
  		NetworkFitsInWeightBank_unfloped: in std_logic;
  			-- Control signal to/from Network architecture
		Rqst_ToNetworkArchitectureBank: out std_logic;
		Ack_FromNetworkArchitectureBank: in std_logic;
		LayerIdxToNetworkArchitectureBank: out LayerIdx_st;
  		
  		--HandShaking and data from Read Ctrl
		DoneReadingLoop: in std_logic;
  		ReadingLastLoop: in std_logic;
  		CurrentWriteLayerIdx: out LayerIdx_st;
		CurrentWriteSetIdx: out KernelIdx_st;

  		-- Signals of Level1 control unit
		    -- Handshaking with Read Cntrl	
		CurrentSetAddress_OfReadingUnit: in ConvEngineWeightBankReadAddr_t;
		Current_ReadPtr: in ConvEngineWeightBankReadAddr_t;
		DoneWithFirstFiveWordInTheSet: out std_logic;
			-- Output to Weight Bank
		WriteBankAddr: out ConvEngineWeightBankWriteAddr_t;
		WriteBank_En: out std_logic_vector(0 downto 0);
		DataToWeightBank: out ConvEngineWeightBank_InputSinglePort_t; 			
			-- Output to DDR controller
		DDR_LayerIdx_Rqst: out LayerIdx_st;
		DDR_KernelIdx_Rqst: out KernelIdx_st;
		DDR_GroupOf24Idx_Rqst: out KernelSize_InMultipleOf24Weights_t;
		RqstToDDR: out std_logic;
			-- Input from DDR controller
		AckFromDDR: in std_logic;
			--- Input to Weight Bank from DDR	
		DataFromDDR: in DDR_DataOut_t  
  
  );
end ConvEngineWeightBank_WriteControl_Level2;

architecture Behavioral of ConvEngineWeightBank_WriteControl_Level2 is
--#Begin --Components
component ConvEngineWeightBank_WriteControl_Level1_v2
	port(clk, rst                        : in  std_logic;
		 LayerIdx                        : in  LayerIdx_st;
		 SetIdx                          : in  KernelIdx_st;
		 Last_Set                        : in  std_logic;
		 Set_Done						 : out std_logic;
		 Layer_base                      : in  ConvEngineTotalWeightAddrInTermsOf16Words_t;
		 SetSize_InTermsOf16Words        : in  SetSize_InTermsOf16Words_t;
		 SizeOfLastSet_InTermsof16Words  : in  SetSize_InTermsOf16Words_t;
		 NumberOfSimultaneousKernel      : in  NumberOfSimultaneousKernel_t;
		 KernelsInLastSet                : in  NumberOfSimultaneousKernel_t;
		 StartWritingSetInWeightBank     : in  std_logic;
		 DoneLoadingSet                  : out std_logic;
		 DoneWithFirstFiveWordInTheSet   : out std_logic;
		 CurrentSetAddress_OfReadingUnit : in  ConvEngineWeightBankReadAddr_t;
		 Current_ReadPtr                 : in  ConvEngineWeightBankReadAddr_t;
		 SetCrossesBankBoundary          : in  std_logic;
		 ReadingLastLoop                 : in  std_logic;
		 WriteBankAddr                   : out ConvEngineWeightBankWriteAddr_t;
		 WriteBank_En                    : out std_logic_vector(0 downto 0);
		 DataToWeightBank                : out ConvEngineWeightBank_InputSinglePort_t;
		 DDR_LayerIdx_Rqst               : out LayerIdx_st;
		 DDR_KernelIdx_Rqst              : out KernelIdx_st;
		 DDR_GroupOf24Idx_Rqst           : out KernelSize_InMultipleOf24Weights_t;
		 RqstToDDR                       : out std_logic;
		 AckFromDDR                      : in  std_logic;
		 DataFromDDR                     : in  DDR_DataOut_t);
end component ConvEngineWeightBank_WriteControl_Level1_v2;
--#End  --Components
--#Begin --Type
type StateType_t is (S_Rst,S_RqstLayerInfo_0, S_RqstLayerInfo_1,
					S_NoLoop_0,S_NoLoop_1, S_NoLoop_2,
					S_Loop_0,S_Loop_0_1, S_Loop_1,S_Loop_2,
					S_DoneWithNetwork
);
--#End	 --Type

--#Begin --Signals
	-- Network Architecture
signal LoadLayerDetails: std_logic;
signal NumberOfLayersInNetwork:  LayerIdx_st;
signal Layer_Base:  ConvEngineTotalWeightAddrInTermsOf16Words_t;
signal SetSize_InTermsOf16Words:  SetSize_InTermsOf16Words_t;
signal TotalNumberOfSetsInALayer: KernelIdx_st; -- Max sets possible= MAx kernels in a layer
signal NumberOfLoopOverTheSet:  NumberOfLoopOverTheSet_t; --Depends on column size and zero padding in rows
signal KernelsInLastSet:  NumberOfSimultaneousKernel_t;
signal SizeOfLastSet_InTermsof16Words:  SetSize_InTermsOf16Words_t;
signal NumberOfSimultaneousKernel:  NumberOfSimultaneousKernel_t;
signal SetCrossesBankBoundary: std_logic;
signal NetworkFitsInWeightBank: std_logic;
	-- Idx and Flags
signal CurrentLayerIdx: LayerIdx_st;
signal CurrentSetIdx: KernelIdx_st;
signal CurrentSetIdx_Rst, CurrentSetIdx_Enable: std_logic;
signal CurrentLayerIdx_Rst,CurrentLayerIdx_Enable : std_logic;
signal Set_done,Layer_Done, Last_Set, Network_Done: std_logic;
	-- handshaking signals
signal CommandToWriteSet, DoneWritingSet: std_logic;
	--FSM
signal PrState, NxtState: StateType_t;

--#End	 --Signals
begin
--#Begin --FSM
PrStateProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			PrState <= S_Rst;
		else
			PrState <= NxtState;
		end if;
	end if;
end process PrStateProc;

NxtAndOutputProc : process (PrState, Ack_FromNetworkArchitectureBank, DoneReadingLoop, DoneWritingSet, Layer_Done, Network_Done, ReadingLastLoop, SetCrossesBankBoundary, StartWritingNetwork)
begin
	case PrState is 
		when S_Rst =>
			CurrentSetIdx_Rst<= '1'; CurrentSetIdx_Enable<='0';
			CurrentLayerIdx_Rst<= '1'; CurrentLayerIdx_Enable<='0';
			Rqst_ToNetworkArchitectureBank<='0';
			CommandToWriteSet <= '0';
			DoneWithNetwork<='1';
			LoadLayerDetails<='0';
			if (StartWritingNetwork='1') then
				NxtState<= S_RqstLayerInfo_0;
			else
				NxtState<= S_Rst;
			end if;					
		--- Extracting Layer Info
		when S_RqstLayerInfo_0 =>
			CurrentSetIdx_Rst<= '0'; CurrentSetIdx_Enable<='0';
			CurrentLayerIdx_Rst<= '0'; CurrentLayerIdx_Enable<='0';
			Rqst_ToNetworkArchitectureBank<='1';
			CommandToWriteSet <= '0';
			DoneWithNetwork<='0';
			if (Ack_FromNetworkArchitectureBank='1')then
				LoadLayerDetails <= '1';
				NxtState<= S_RqstLayerInfo_1;
			else
				LoadLayerDetails <= '0';
				NxtState<= S_RqstLayerInfo_0;
			end if;
		when S_RqstLayerInfo_1 =>
			CurrentSetIdx_Rst<= '0'; CurrentSetIdx_Enable<='0';
			CurrentLayerIdx_Rst<= '0'; CurrentLayerIdx_Enable<='0';
			Rqst_ToNetworkArchitectureBank<='0';
			CommandToWriteSet <= '1';
			DoneWithNetwork<='0';
			LoadLayerDetails<='0';
			if (SetCrossesBankBoundary='1') then
				NxtState<= S_Loop_0;
			else
				NxtState<= S_NoLoop_0;
			end if;		
		-----------------
		------- No-Loop Branch
		when S_NoLoop_0 =>
			CurrentSetIdx_Rst<= '0'; CurrentSetIdx_Enable<='0';
			CurrentLayerIdx_Rst<= '0'; CurrentLayerIdx_Enable<='0';
			Rqst_ToNetworkArchitectureBank<='0';
			CommandToWriteSet <= '0';
			DoneWithNetwork<='0';
			LoadLayerDetails<='0';
			if(DoneWritingSet='1') then
				NxtState<= S_NoLoop_1;
			else
				NxtState<= S_NoLoop_0;
			end if;
		when S_NoLoop_1 =>			
			Rqst_ToNetworkArchitectureBank<='0';
			CommandToWriteSet <= '0';
			DoneWithNetwork<='0';
			LoadLayerDetails<='0';
			if Network_Done = '1' then
				CurrentSetIdx_Rst<= '0'; CurrentSetIdx_Enable<='0';
				CurrentLayerIdx_Rst<= '0'; CurrentLayerIdx_Enable<='0';
				NxtState<= S_DoneWithNetwork;
			elsif Layer_Done='1' then
				CurrentSetIdx_Rst<= '1'; CurrentSetIdx_Enable<='0';
				CurrentLayerIdx_Rst<= '0'; CurrentLayerIdx_Enable<='1';
				NxtState<= S_RqstLayerInfo_0;
			else
				CurrentSetIdx_Rst<= '0'; CurrentSetIdx_Enable<='1';
				CurrentLayerIdx_Rst<= '0'; CurrentLayerIdx_Enable<='0';
				NxtState<= S_NoLoop_2;
			end if;

		when S_NoLoop_2 =>	-- Give command to write only when SetIdx is stable
			CurrentSetIdx_Rst<= '0'; CurrentSetIdx_Enable<='0';
			CurrentLayerIdx_Rst<= '0'; CurrentLayerIdx_Enable<='0';
			Rqst_ToNetworkArchitectureBank<='0';
			CommandToWriteSet <= '1';
			DoneWithNetwork<='0';
			LoadLayerDetails<='0';
			NxtState <= S_NoLoop_0;
		----------------------
		
		------- Loop Branch-------
		when S_Loop_0 =>
			CurrentSetIdx_Rst<= '0'; CurrentSetIdx_Enable<='0';
			CurrentLayerIdx_Rst<= '0'; CurrentLayerIdx_Enable<='0';
			Rqst_ToNetworkArchitectureBank<='0';
			CommandToWriteSet <= '0';
			DoneWithNetwork<='0';
			LoadLayerDetails<='0';
			if(ReadingLastLoop='0' and DoneWritingSet='1' and DoneReadingLoop='1') then
				NxtState<= S_Loop_0_1; -- Rewrite Same Set again 
			elsif (ReadingLastLoop='1' and DoneWritingSet='1') then
				NxtState<= S_Loop_1; -- Start writing next set
			else
				NxtState<=S_Loop_0;
			end if;
		when S_Loop_0_1 =>
			CurrentSetIdx_Rst<= '0'; CurrentSetIdx_Enable<='0';
			CurrentLayerIdx_Rst<= '0'; CurrentLayerIdx_Enable<='0';
			Rqst_ToNetworkArchitectureBank<='0';
			CommandToWriteSet <= '1';
			DoneWithNetwork<='0';
			LoadLayerDetails<='0';
			NxtState<= S_Loop_0;
		when S_Loop_1 =>
			Rqst_ToNetworkArchitectureBank<='0';
			CommandToWriteSet <= '0';
			DoneWithNetwork<='0';
			LoadLayerDetails<='0';
			if Network_Done = '1' then
				CurrentSetIdx_Rst<= '0'; CurrentSetIdx_Enable<='0';
				CurrentLayerIdx_Rst<= '0'; CurrentLayerIdx_Enable<='0';
				NxtState<= S_DoneWithNetwork;
			elsif Layer_Done='1' then
				CurrentSetIdx_Rst<= '1'; CurrentSetIdx_Enable<='0';
				CurrentLayerIdx_Rst<= '0'; CurrentLayerIdx_Enable<='1';
				NxtState<= S_RqstLayerInfo_0;
			else
				CurrentSetIdx_Rst<= '0'; CurrentSetIdx_Enable<='1';
				CurrentLayerIdx_Rst<= '0'; CurrentLayerIdx_Enable<='0';
				NxtState<= S_Loop_2;
			end if;
		when S_Loop_2 => --Give command to write only when SetIdx is stable
			CurrentSetIdx_Rst<= '0'; CurrentSetIdx_Enable<='0';
			CurrentLayerIdx_Rst<= '0'; CurrentLayerIdx_Enable<='0';
			Rqst_ToNetworkArchitectureBank<='0';
			CommandToWriteSet <= '1';
			DoneWithNetwork<='0';
			LoadLayerDetails<='0';
			NxtState <= S_Loop_0;
		----------------
		
		when S_DoneWithNetwork =>
			CurrentSetIdx_Rst<= '0'; CurrentSetIdx_Enable<='0';
			CurrentLayerIdx_Rst<= '0'; CurrentLayerIdx_Enable<='0';
			Rqst_ToNetworkArchitectureBank<='0';
			CommandToWriteSet <= '0';
			DoneWithNetwork<='1';
			LoadLayerDetails<='0';
			if(StartWritingNetwork='1') then
				CurrentSetIdx_Rst<= '1';
				CurrentLayerIdx_Rst<= '1';
				NxtState<= S_RqstLayerInfo_0;
			else
				CurrentSetIdx_Rst<= '0';
				CurrentLayerIdx_Rst<= '0';
				NxtState<= S_DoneWithNetwork;
			end if;
	end case;
end process NxtAndOutputProc;
--#End --FSM

--#Begin --Flags
Last_Set<= '1' when (CurrentSetIdx = std_logic_vector((unsigned(TotalNumberOfSetsInALayer)-1))) else
				'0';
Layer_Done<= '1' when (CurrentSetIdx=std_logic_vector(unsigned(TotalNumberOfSetsInALayer)-1) and DoneWritingSet='1') else
			'0';
Network_Done<= '1' when (CurrentLayerIdx=std_logic_vector(unsigned(NumberOfLayersInNetwork)-1) and Layer_Done='1') else
			'0';
--#End 	--Flags

--#Begin --Flop of Current Layer and Set IDx
LayerIdxProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or CurrentLayerIdx_Rst='1' then
			CurrentLayerIdx <= (others=>'0');			
		elsif (CurrentLayerIdx_Enable='1') then
			CurrentLayerIdx <= std_logic_vector(unsigned(CurrentLayerIdx)+1);
		end if;
	end if;
end process LayerIdxProc;
SetIdxProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or CurrentSetIdx_Rst='1' then
			CurrentSetIdx <= (others=>'0');			
		elsif (CurrentSetIdx_Enable='1') then
			CurrentSetIdx <= std_logic_vector(unsigned(CurrentSetIdx)+1);
		end if;
	end if;
end process SetIdxProc;
--#End	 --Flop of Current Layer and Set IDx

--#Begin --Layer Details
LayerDetailProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			NumberOfLayersInNetwork<= (others=>'0');
			Layer_Base<= (others=>'0');
			SetSize_InTermsOf16Words<= (others=>'0');
			TotalNumberOfSetsInALayer<= (others=>'0');
			NumberOfLoopOverTheSet<= (others=>'0');
			KernelsInLastSet<= (others=>'0');
			SizeOfLastSet_InTermsof16Words<= (others=>'0');
			NumberOfSimultaneousKernel<= (others=>'0');
			SetCrossesBankBoundary<= '0';
			NetworkFitsInWeightBank<='0';
		elsif (LoadLayerDetails='1') then
			NumberOfLayersInNetwork<= NumberOfLayersInNetwork_unfloped;
			Layer_Base<=Layer_Base_unfloped;
			SetSize_InTermsOf16Words<=SetSize_InTermsOf16Words_unfloped;
			TotalNumberOfSetsInALayer<=TotalNumberOfSetsInALayer_unfloped;
			NumberOfLoopOverTheSet<=NumberOfLoopOverTheSet_unfloped;
			KernelsInLastSet<= KernelsInLastSet_unfloped;
			SizeOfLastSet_InTermsof16Words<=SizeOfLastSet_InTermsof16Words_unfloped;
			NumberOfSimultaneousKernel<= NumberOfSimultaneousKernel_unfloped;
			SetCrossesBankBoundary<= SetCrossesBankBoundary_unfloped;
			NetworkFitsInWeightBank<= NetworkFitsInWeightBank_unfloped;
		end if;
	end if;
end process LayerDetailProc;
--#End	 --Layer Details

--#Begin --Port Mapping
WriteCtrl_Level1: ConvEngineWeightBank_WriteControl_Level1_v2
	port map(
		clk                             => clk,
		rst                             => rst,
		LayerIdx                        => CurrentLayerIdx,
		SetIdx                          => CurrentSetIdx,
		Last_Set                        => Last_Set,
		Set_Done						=> open,
		Layer_base                      => Layer_base,
		SetSize_InTermsOf16Words        => SetSize_InTermsOf16Words,
		SizeOfLastSet_InTermsof16Words  => SizeOfLastSet_InTermsof16Words,
		NumberOfSimultaneousKernel      => NumberOfSimultaneousKernel,
		KernelsInLastSet                => KernelsInLastSet,
		StartWritingSetInWeightBank     => CommandToWriteSet,
		DoneLoadingSet                  => DoneWritingSet,
		DoneWithFirstFiveWordInTheSet   => DoneWithFirstFiveWordInTheSet,
		CurrentSetAddress_OfReadingUnit => CurrentSetAddress_OfReadingUnit,
		Current_ReadPtr                 => Current_ReadPtr,
		SetCrossesBankBoundary          => SetCrossesBankBoundary,
		ReadingLastLoop                 => ReadingLastLoop,
		WriteBankAddr                   => WriteBankAddr,
		WriteBank_En                    => WriteBank_En,
		DataToWeightBank                => DataToWeightBank,
		DDR_LayerIdx_Rqst               => DDR_LayerIdx_Rqst,
		DDR_KernelIdx_Rqst              => DDR_KernelIdx_Rqst,
		DDR_GroupOf24Idx_Rqst           => DDR_GroupOf24Idx_Rqst,
		RqstToDDR                       => RqstToDDR,
		AckFromDDR                      => AckFromDDR,
		DataFromDDR                     => DataFromDDR
	);
--#End  -- Port Mapping

--#BEgin --Assign Output
LayerIdxToNetworkArchitectureBank <= CurrentLayerIdx;
CurrentWriteLayerIdx<= CurrentLayerIdx;
CurrentWriteSetIdx<= CurrentSetIdx;
--#End --Assign Output

end Behavioral;
