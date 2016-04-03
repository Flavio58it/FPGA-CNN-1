----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.03.2016 18:56:06
-- Design Name: 
-- Module Name: ConvEngineWeightBank_MainControl_Level2_v1 - Behavioral
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

entity ConvEngineWeightBank_MainControl_Level2_v1 is
	  Port ( clk,rst: in std_logic;
	  		-- Control to/from Master Ctrl
	  		StartFirstLayer: in std_logic;
			DoneWithAllLayers: out std_logic;
	  		
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
			Ack_FromNetworkArchitectureBank: out std_logic;
			LayerIdxToNetworkArchitectureBank: out LayerIdx_st;
			
			
			--Weight Bank
				-- Addr and Ctrl signals to Weight Bank
			ReadAddr:out ConvEngineWeightBankReadAddr_t;
			Read_En: out std_logic;
			WriteAddr: out ConvEngineWeightBankReadAddr_t;
			Write_En: out std_logic_vector(0 downto 0);
				-- Data
			DataToWeightBank:in ConvEngineWeightBank_InputSinglePort_t;	

			-- DDR Signals
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
end ConvEngineWeightBank_MainControl_Level2_v1;


architecture Behavioral of ConvEngineWeightBank_MainControl_Level2_v1 is
--#Begin --Component
component ConvEngineWeightBank_ReadControl_Level1_v2
	port(clk, rst                                            : in  std_logic;
		 Layer_Base                                          : in  ConvEngineTotalWeightAddrInTermsOf16Words_t;
		 SetSize_InTermsOf16Words                            : in  SetSize_InTermsOf16Words_t;
		 TotalNumberOfSetsInALayer                           : in  KernelIdx_st;
		 NumberOfLoopOverTheSet                              : in  NumberOfLoopOverTheSet_t;
		 KernelsInLastSet                                    : in  NumberOfSimultaneousKernel_t;
		 SizeOfLastSet_InTermsof16Words                      : in  SetSize_InTermsOf16Words_t;
		 NumberOfSimultaneousKernel                          : in  NumberOfSimultaneousKernel_t;
		 Rqst_ToStartNextLayer                               : in  std_logic;
		 Rqst_ToStartNextLayer                                : in  std_logic;
		 DoneWithLayer                                       : out std_logic;
		 DoneWithASingleLoopOnASet                           : out std_logic;
		 DoneWithSet                                         : out std_logic;
		 CurrentSetStartingAddr_ToWriteCntrl                 : out ConvEngineWeightBankReadAddr_t;
		 CurrentWritePtr                                     : in  ConvEngineWeightBankReadAddr_t;
		 FlowCtrl_ContinueStreaming_StrmEngineToWeightBank   : in  std_logic;
		 FlowCtrl_ContinueStreaming_WeightBankToStreamEngine : out std_logic;
		 ReadAddr                                            : out ConvEngineWeightBankReadAddr_t;
		 Port_En                                             : out std_logic);
end component ConvEngineWeightBank_ReadControl_Level1_v2;
component ConvEngineWeightBank_WriteControl_Level1_v2
	port(clk, rst                        : in  std_logic;
		 LayerIdx                        : in  LayerIdx_st;
		 SetIdx                          : in  KernelIdx_st;
		 Last_Set                        : in  std_logic;
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
		 WriteBankAddr_unfloped                   : out ConvEngineWeightBankWriteAddr_t;
		 WriteBank_En_unfloped                    : out std_logic_vector(0 downto 0);
		 DataToWeightBank_unfloped                : out ConvEngineWeightBank_InputSinglePort_t;
		 DDR_LayerIdx_Rqst               : out LayerIdx_st;
		 DDR_KernelIdx_Rqst              : out KernelIdx_st;
		 DDR_GroupOf24Idx_Rqst           : out KernelSize_InMultipleOf24Weights_t;
		 RqstToDDR                       : out std_logic;
		 AckFromDDR                      : in  std_logic;
		 DataFromDDR                     : in  DDR_DataOut_t);
end component ConvEngineWeightBank_WriteControl_Level1_v2;
--#End  --Components

--#Begin --Type
type StateType_t is (S_Rst, S_RqstForLayerDetails_0,S_RqstForLayerDetails_1, 
					S_WriteRqst_0, S_FirstWriteAndReadRqst, S_ReadRqst
);
--#End	 --Type

--#Begin --Signals
	-- Network Architecture
signal LoadLayerDetails: std_logic;
signal NumberOfLayersInNetwork:  LayerIdx_st;
signal Layer_Base:  ConvEngineTotalWeightAddrInTermsOf16Words_t;
signal SetSize_InTermsOf16Words:  SetSize_InTermsOf16Words_t;
signal TotalNumberOfSetsInALayer: ConvEngineWeightBankReadAddr_t; -- Max sets possible= MAx kernels in a layer
signal NumberOfLoopOverTheSet:  NumberOfLoopOverTheSet_t; --Depends on column size and zero padding in rows
signal KernelsInLastSet:  NumberOfSimultaneousKernel_t;
signal SizeOfLastSet_InTermsof16Words:  SetSize_InTermsOf16Words_t;
signal NumberOfSimultaneousKernel:  NumberOfSimultaneousKernel_t;
signal SetCrossesBankBoundary: std_logic;
signal NetworkFitsInWeightBank: std_logic;
	-- Control to/from Read control level1
signal Rqst_ToStartReadingNextLayer: std_logic;  		
signal Rqst_ToStartReadingNextLoop:  std_logic;
signal DoneWithLayer_FromRead: std_logic; 
signal DoneWithASingleLoopOnASet_FromRead: std_logic;
signal DoneWithSet_FromRead: std_logic;
	-- Control to/from Write Control Level 1
signal Rqst_ToStartWritingGivenSet: std_logic;
signal DoneWithSet_FromWrite: std_logic;
	-- Idx and Flags
signal CurrentLayerIdx: LayerIdx_st;
signal CurrentWriteSetIdx, CurrentReadSetIdx: ConvEngineWeightBankReadAddr_t;
signal CurrentReadLoopIdx: NumberOfLoopOverTheSet_t;
signal CurrentReadLoopIdx_Rst, CurrentReadLoopIdx_Enable: std_logic;
signal CurrentWriteSetIdx_Rst, CurrentWriteSetIdx_Enable: std_logic;
signal CurrentLayerIdx_Rst,CurrentLayerIdx_Enable : std_logic;
signal Set_done,Layer_Done,LastLoop,Last_Set, Network_Done: std_logic;
signal DoneWriting_FirstFiveWordInTheSet: std_logic;
signal DoneWithFirstIteration, DoneWithFirstIteration_unfloped: std_logic; 
	-- FSM
signal PrState, NxtState: StateType_t;
	-- Port Mapping signals
signal CurrentSetStartingAddr_FrmReadToWriteCntrl: ConvEngineWeightBankReadAddr_t; 
signal ReadAddr_FrmReadToWriteCtrl: ConvEngineWeightBankReadAddr_t;
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

NxtAndOutputProc : process (PrState, Ack_FromNetworkArchitectureBank, DoneWithSet_FromWrite, StartFirstLayer)
begin
	case PrState is 
		when S_Rst =>
			CurrentWriteSetIdx_Rst<= '1'; CurrentWriteSetIdx_Enable<='0';
			CurrentLayerIdx_Rst<= '1'; CurrentLayerIdx_Enable<='0';
			CurrentReadLoopIdx_Rst<='0';CurrentReadLoopIdx_Enable<='0';
			Rqst_ToNetworkArchitectureBank<='0';
			LoadLayerDetails<='0';
			Rqst_ToStartWritingGivenSet<='0';
			Rqst_ToStartReadingNextLoop<='0';
			if (StartFirstLayer='1') then
				NxtState<= S_RqstForLayerDetails_0;
			else
				NxtState<= S_Rst;
			end if;
		when S_RqstForLayerDetails_0 =>
			CurrentWriteSetIdx_Rst<= '0'; CurrentWriteSetIdx_Enable<='0';
			CurrentLayerIdx_Rst<= '0'; CurrentLayerIdx_Enable<='0';
			CurrentReadLoopIdx_Rst<='0';CurrentReadLoopIdx_Enable<='0';
			Rqst_ToNetworkArchitectureBank<='1';
			Rqst_ToStartWritingGivenSet<='0';
			Rqst_ToStartReadingNextLoop<='0';
			
			if (Ack_FromNetworkArchitectureBank='1')then
				LoadLayerDetails <= '1';
				NxtState<= S_RqstForLayerDetails_1;
			else
				LoadLayerDetails <= '0';
				NxtState<= S_RqstForLayerDetails_0;
			end if;
		when S_RqstForLayerDetails_1 =>	-- Dummy Stage to let layer details load properly
			CurrentWriteSetIdx_Rst<= '0'; CurrentWriteSetIdx_Enable<='0';
			CurrentLayerIdx_Rst<= '0'; CurrentLayerIdx_Enable<='0';
			CurrentReadLoopIdx_Rst<='0';CurrentReadLoopIdx_Enable<='0';
			Rqst_ToNetworkArchitectureBank<='0';
			LoadLayerDetails <= '0';
			Rqst_ToStartWritingGivenSet<='1';
			Rqst_ToStartReadingNextLoop<='0';
			NxtState<= S_WriteRqst_0;

		when S_WriteRqst_0 =>
			CurrentWriteSetIdx_Rst<= '0'; CurrentWriteSetIdx_Enable<='0';
			CurrentLayerIdx_Rst<= '0'; CurrentLayerIdx_Enable<='0';
			CurrentReadLoopIdx_Rst<='0';CurrentReadLoopIdx_Enable<='0';
			Rqst_ToNetworkArchitectureBank<='0';
			LoadLayerDetails <= '0';
			Rqst_ToStartWritingGivenSet<='0';
			if(DoneWriting_FirstFiveWordInTheSet='1') then
				NxtState<= S_FirstWriteAndReadRqst;
				Rqst_ToStartReadingNextLoop<='1';
			else
				Rqst_ToStartReadingNextLoop<='0';
				NxtState<= S_WriteRqst_0;
			end if;
		when S_FirstWriteAndReadRqst =>
			CurrentWriteSetIdx_Rst<= '0'; CurrentWriteSetIdx_Enable<='0';
			CurrentLayerIdx_Rst<= '0'; CurrentLayerIdx_Enable<='0';
			Rqst_ToNetworkArchitectureBank<='0';
			LoadLayerDetails <= '0';
			Rqst_ToStartWritingGivenSet<='0';
			Rqst_ToStartReadingNextLoop<= '0';
			if (SetCrossesBankBoundary='1') then
			else
			end if;			
			
			
			
			
			if (DoneWithASingleLoopOnASet_FromRead='1' and DoneWithSet_FromWrite='1') then				
				if (SetCrossesBankBoundary='1') then	
					if (Set_done='1') then
						CurrentReadLoopIdx_Rst<='1';					
						CurrentReadLoopIdx_Enable<='0';
						Rqst_ToStartWritingGivenSet<='0';
						NxtState <= S_WriteRqst_0;						
					else
						CurrentReadLoopIdx_Rst<='0';					
						CurrentReadLoopIdx_Enable<='1';
						Rqst_ToStartWritingGivenSet<='1'; -- As set crosses boundary we need to again write the set
						NxtState <= S_WriteRqst_0;
					end if;
				else
					CurrentReadLoopIdx_Rst<='0';					
					CurrentReadLoopIdx_Enable<='0';
					Rqst_ToStartWritingGivenSet<='0';
					NxtState <= S_WriteRqst_0;						
				end if;
			else
				NxtState <= S_FirstWriteAndReadRqst;
			end if;

	
		when S_ReadRqst =>
			null;
		


	end case;
end process NxtAndOutputProc;


--#End	 --FSM



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
		if rst = '1' or CurrentWriteSetIdx_Rst='1' then
			CurrentWriteSetIdx <= (others=>'0');			
		elsif (CurrentWriteSetIdx_Enable='1') then
			CurrentWriteSetIdx <= std_logic_vector(unsigned(CurrentWriteSetIdx)+1);
		end if;
	end if;
end process SetIdxProc;
LoopIdxProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or CurrentReadLoopIdx_Rst='1' then
			CurrentReadLoopIdx<= (others=>'0');
		elsif (CurrentReadLoopIdx_Enable='1') then
			CurrentReadLoopIdx<= std_logic_vector(unsigned(CurrentReadLoopIdx)+1);
		end if;
	end if;
end process LoopIdxProc;
FirstIterProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			DoneWithFirstIteration<='0';
		else
			DoneWithFirstIteration<= DoneWithFirstIteration_unfloped;
		end if;
	end if;
end process FirstIterProc;
--#End	--Flop of Current Layer and Set IDx

--#Begin --Flags for end of subset, set, layer
Set_Done <= '1' when CurrentReadLoopIdx= std_logic_vector(unsigned(NumberOfLoopOverTheSet)-1) else
			 '0';
Layer_Done<= '1' when (CurrentWriteSetIdx=std_logic_vector(unsigned(TotalNumberOfSetsInALayer)-1) and Set_Done='1') else
			'0';
Network_Done<= '1' when (CurrentLayerIdx=std_logic_vector(unsigned(NumberOfLayersInNetwork)-1) and Layer_Done='1') else
			'0';
LastLoop<= '1' when CurrentReadLoopIdx = std_logic_vector(unsigned(NumberOfLoopOverTheSet)-1) else
			'0';
--#End   --Flags for end of subset, set, layer

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
ReadCtrl: ConvEngineWeightBank_ReadControl_Level1_v2
	port map(
		clk                                                 => clk,
		rst                                                 => rst,
		Layer_Base                                          => Layer_Base,
		SetSize_InTermsOf16Words                            => SetSize_InTermsOf16Words,
		TotalNumberOfSetsInALayer                           => TotalNumberOfSetsInALayer,
		NumberOfLoopOverTheSet                              => NumberOfLoopOverTheSet,
		KernelsInLastSet                                    => KernelsInLastSet,
		SizeOfLastSet_InTermsof16Words                      => SizeOfLastSet_InTermsof16Words,
		NumberOfSimultaneousKernel                          => NumberOfSimultaneousKernel,
		Rqst_ToStartNextLayer                               => Rqst_ToStartNextLayer,
		Rqst_ToStartNextLayer                                => Rqst_ToStartNextLoop,
		DoneWithLayer                                       => DoneWithLayer,
		DoneWithASingleLoopOnASet                           => DoneWithASingleLoopOnASet,
		DoneWithSet                                         => DoneWithSet,
		CurrentSetStartingAddr_ToWriteCntrl                 => CurrentSetStartingAddr_ToWriteCntrl,
		CurrentWritePtr                                     => CurrentWritePtr,
		FlowCtrl_ContinueStreaming_StrmEngineToWeightBank   => FlowCtrl_ContinueStreaming_StrmEngineToWeightBank,
		FlowCtrl_ContinueStreaming_WeightBankToStreamEngine => FlowCtrl_ContinueStreaming_WeightBankToStreamEngine,
		ReadAddr                                            => ReadAddr,
		Port_En                                             => Port_En
	);
WriteCtrl: ConvEngineWeightBank_WriteControl_Level1_v2
	port map(
		clk                             => clk,
		rst                             => rst,
		LayerIdx                        => LayerIdx,
		SetIdx                          => SetIdx,
		Last_Set                        => Last_Set,
		Layer_base                      => Layer_base,
		SetSize_InTermsOf16Words        => SetSize_InTermsOf16Words,
		SizeOfLastSet_InTermsof16Words  => SizeOfLastSet_InTermsof16Words,
		NumberOfSimultaneousKernel      => NumberOfSimultaneousKernel,
		KernelsInLastSet                => KernelsInLastSet,
		StartWritingSetInWeightBank     => StartWritingSetInWeightBank,
		DoneLoadingSet                  => DoneLoadingSet,
		DoneWithFirstFiveWordInTheSet   => DoneWithFirstFiveWordInTheSet,
		CurrentSetAddress_OfReadingUnit => CurrentSetAddress_OfReadingUnit,
		Current_ReadPtr                 => Current_ReadPtr,
		SetCrossesBankBoundary          => SetCrossesBankBoundary,
		WriteBankAddr_unfloped                   => WriteBankAddr,
		WriteBank_En_unfloped                    => WriteBank_En,
		DataToWeightBank_unfloped                => DataToWeightBank,
		DDR_LayerIdx_Rqst               => DDR_LayerIdx_Rqst,
		DDR_KernelIdx_Rqst              => DDR_KernelIdx_Rqst,
		DDR_GroupOf24Idx_Rqst           => DDR_GroupOf24Idx_Rqst,
		RqstToDDR                       => RqstToDDR,
		AckFromDDR                      => AckFromDDR,
		DataFromDDR                     => DataFromDDR
	)
--#End   --Port Mapping

end Behavioral;
