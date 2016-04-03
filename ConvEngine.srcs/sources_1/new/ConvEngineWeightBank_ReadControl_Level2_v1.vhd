----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.03.2016 16:22:47
-- Design Name: 
-- Module Name: ConvEngineWeightBank_ReadControl_Level2_v1 - Behavioral
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

entity ConvEngineWeightBank_ReadControl_Level2_v1 is
	  Port ( clk,rst: in std_logic;
	  		-- Control I/O from Master
	  		StartReadingNetwork: in std_logic;
			DontCheckWritePtr: in std_logic;
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
	  		FeatureRowSize_unflopped: in std_logic_vector(4 downto 0); -- In multiples of 8 words
	  			-- Control signal to/from Network architecture
			Rqst_ToNetworkArchitectureBank: out std_logic;
			Ack_FromNetworkArchitectureBank: in std_logic;
			LayerIdxToNetworkArchitectureBank: out LayerIdx_st;
	  		
	  		--HandShaking and data from Read Ctrl
			DoneReadingLoop: out std_logic;
	  		ReadingLastLoop: out std_logic;
	  		CurrentSetAddress_OfReadingUnit: out ConvEngineWeightBankReadAddr_t;
			Current_ReadPtr: out ConvEngineWeightBankReadAddr_t;
			Current_WritePtr: in ConvEngineWeightBankReadAddr_t;
			DoneWritingFourthWordOfSet: in std_logic;
	  		CurrentWriteLayerIdx: in LayerIdx_st;
			CurrentWriteSetIdx: in KernelIdx_st;
	  		-- Handshaking with Stream Engine
	  		FlowCtrl_ContinueStreaming_StrmEngineToWeightBank: in std_logic;
	  		FlowCtrl_ContinueStreaming_WeightBankToStreamEngine: out std_logic;
			FeatureRowSize_ToStreamEngine: out std_logic_vector(4 downto 0);
			-- Read Ctrl Level1 signals
			ReadBankAddr: out ConvEngineWeightBankReadAddr_t
	  			  );
end ConvEngineWeightBank_ReadControl_Level2_v1;

architecture Behavioral of ConvEngineWeightBank_ReadControl_Level2_v1 is
--#Begin --Component
component ConvEngineWeightBank_ReadControl_Level1_v2
	port(clk, rst                                            : in  std_logic;
		 Layer_Idx                                           : in  LayerIdx_st;
		 Layer_Base                                          : in  ConvEngineTotalWeightAddrInTermsOf16Words_t;
		 SetSize_InTermsOf16Words                            : in  SetSize_InTermsOf16Words_t;
		 TotalNumberOfSetsInALayer                           : in  KernelIdx_st;
		 NumberOfLoopOverTheSet                              : in  NumberOfLoopOverTheSet_t;
		 KernelsInLastSet                                    : in  NumberOfSimultaneousKernel_t;
		 SizeOfLastSet_InTermsof16Words                      : in  SetSize_InTermsOf16Words_t;
		 NumberOfSimultaneousKernel                          : in  NumberOfSimultaneousKernel_t;
		 Rqst_ToStartNextLayer                               : in  std_logic;
		 DoneWithLayer                                       : out std_logic;
		 DoneWithASingleLoopOnASet                           : out std_logic;
		 ReadingLastLoop									 : out std_logic;
		 CurrentSetStartingAddr_ToWriteCntrl                 : out ConvEngineWeightBankReadAddr_t;
		 CurrentWritePtr                                     : in  ConvEngineWeightBankReadAddr_t;
		 CurrentWriteLayerIdx                                : in  LayerIdx_st;
		 CurrentWriteSetIdx                                  : in  KernelIdx_st;
		 DoneWritingFourthWordOfSet                          : in  std_logic;
		 DontCheckWritePtr                                   : in  std_logic;
		 FlowCtrl_ContinueStreaming_StrmEngineToWeightBank   : in  std_logic;
		 FlowCtrl_ContinueStreaming_WeightBankToStreamEngine : out std_logic;
		 ReadAddr                                            : out ConvEngineWeightBankReadAddr_t;
		 Port_En                                             : out std_logic);
end component ConvEngineWeightBank_ReadControl_Level1_v2;
--#End  --Components

--#Begin --Type
type StateType_t is (S_Rst,S_RqstLayerInfo_0, S_RqstLayerInfo_1,
					S_Read_0, S_DoneWithLayer
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
signal FeatureRowSize: std_logic_vector(4 downto 0);
	-- Idx and Flags
signal CurrentLayerIdx: LayerIdx_st;
signal CurrentLayerIdx_Rst,CurrentLayerIdx_Enable : std_logic;
signal Network_Done: std_logic;
	--FSM
signal PrState, NxtState: StateType_t;
	-- Handshaking
signal CommandToReadLayer, DoneReadingLayer: std_logic;
	-- Addr
signal CurrentReadAddr: ConvEngineWeightBankReadAddr_t;
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

NxtAndOutputProc : process (PrState, Ack_FromNetworkArchitectureBank, DoneReadingLayer, Network_Done, StartReadingNetwork)
begin
	case PrState is 
		when S_Rst =>
			CurrentLayerIdx_Rst<= '1'; CurrentLayerIdx_Enable<='0';
			Rqst_ToNetworkArchitectureBank<='0';
			CommandToReadLayer <= '0';
			DoneWithNetwork<='1';
			LoadLayerDetails<='0';
			if (StartReadingNetwork='1') then
				NxtState<= S_RqstLayerInfo_0;
			else
				NxtState<= S_Rst;
			end if;
		when S_RqstLayerInfo_0 =>
			CurrentLayerIdx_Rst<= '0'; CurrentLayerIdx_Enable<='0';
			Rqst_ToNetworkArchitectureBank<='1';
			CommandToReadLayer <= '0';
			DoneWithNetwork<='0';
			if (Ack_FromNetworkArchitectureBank='1')then
				LoadLayerDetails <= '1';
				NxtState<= S_RqstLayerInfo_1;
			else
				LoadLayerDetails <= '0';
				NxtState<= S_RqstLayerInfo_0;
			end if;
		when S_RqstLayerInfo_1 =>
			CurrentLayerIdx_Rst<= '0'; CurrentLayerIdx_Enable<='0';
			Rqst_ToNetworkArchitectureBank<='0';
			CommandToReadLayer <= '1';
			DoneWithNetwork<='0';
			LoadLayerDetails<='0';
			NxtState <= S_Read_0;
		when S_Read_0 =>
			CurrentLayerIdx_Rst<= '0'; CurrentLayerIdx_Enable<='0';
			Rqst_ToNetworkArchitectureBank<='0';
			CommandToReadLayer <= '0';
			DoneWithNetwork<='0';
			LoadLayerDetails<='0';
			if (DoneReadingLayer ='1') then
				NxtState<= S_DoneWithLayer;
			else
				NxtState<= S_Read_0;
			end if;
		when S_DoneWithLayer =>
			CurrentLayerIdx_Rst<= '0'; 
			Rqst_ToNetworkArchitectureBank<='0';
			CommandToReadLayer <= '0';
			DoneWithNetwork<='0';			
			LoadLayerDetails<='0';
			if Network_Done = '1' then
				CurrentLayerIdx_Enable<='0';
				NxtState<= S_Rst;
			else
				CurrentLayerIdx_Enable<='1';
				NxtState<= S_RqstLayerInfo_0;
			end if;			 
	end case;
end process NxtAndOutputProc;

--#Begin 	--Flags
Network_Done<= '1' when (CurrentLayerIdx=std_logic_vector(unsigned(NumberOfLayersInNetwork)-1)) else
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
--#End 	--Flop of Current Layer and Set IDx

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
			FeatureRowSize<= (others=>'0');
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
			FeatureRowSize<= FeatureRowSize_unflopped;
		end if;
	end if;
end process LayerDetailProc;
--#End --Layer Details

--#Begin --Port map
ReadCtrl_Level1: ConvEngineWeightBank_ReadControl_Level1_v2
	port map(
		clk                                                 => clk,
		rst                                                 => rst,
		Layer_Idx                                           => CurrentLayerIdx,
		Layer_Base                                          => Layer_Base,
		SetSize_InTermsOf16Words                            => SetSize_InTermsOf16Words,
		TotalNumberOfSetsInALayer                           => TotalNumberOfSetsInALayer,
		NumberOfLoopOverTheSet                              => NumberOfLoopOverTheSet,
		KernelsInLastSet                                    => KernelsInLastSet,
		SizeOfLastSet_InTermsof16Words                      => SizeOfLastSet_InTermsof16Words,
		NumberOfSimultaneousKernel                          => NumberOfSimultaneousKernel,
		Rqst_ToStartNextLayer                               => CommandToReadLayer,
		DoneWithLayer                                       => DoneReadingLayer,
		DoneWithASingleLoopOnASet                           => DoneReadingLoop,
		ReadingLastLoop										=> ReadingLastLoop,
		CurrentSetStartingAddr_ToWriteCntrl                 => CurrentSetAddress_OfReadingUnit,
		CurrentWritePtr                                     => Current_WritePtr,
		CurrentWriteLayerIdx                                => CurrentWriteLayerIdx,
		CurrentWriteSetIdx                                  => CurrentWriteSetIdx,
		DoneWritingFourthWordOfSet                          => DoneWritingFourthWordOfSet,
		DontCheckWritePtr                                   => DontCheckWritePtr,
		FlowCtrl_ContinueStreaming_StrmEngineToWeightBank   => FlowCtrl_ContinueStreaming_StrmEngineToWeightBank,
		FlowCtrl_ContinueStreaming_WeightBankToStreamEngine => FlowCtrl_ContinueStreaming_WeightBankToStreamEngine,
		ReadAddr                                            => CurrentReadAddr,
		Port_En                                             => open
	);
--#End	 --Port map

--#BEgin --Assign Output
LayerIdxToNetworkArchitectureBank <= CurrentLayerIdx;
Current_ReadPtr<= CurrentReadAddr;
ReadBankAddr<= CurrentReadAddr;
FeatureRowSize_ToStreamEngine<= FeatureRowSize;
--#End --Assign Output

end Behavioral;
