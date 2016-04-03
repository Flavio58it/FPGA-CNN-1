----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.03.2016 16:17:57
-- Design Name: 
-- Module Name: ConvEngineWeightBank_MainControl_Level2_v2 - Behavioral
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

entity ConvEngineWeightBank_MainControl_Level2_v2 is
	Port (clk,rst: in std_logic;
		-- Hadnshaking with control 
		StartNextNetworkIteration: in std_logic;
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
	
		-- Port Signals from Read And Write Ctrl
			--Write Ctrl
		WriteBankAddr                           : out ConvEngineWeightBankWriteAddr_t;
		WriteBank_En                            : out std_logic_vector(0 downto 0);
		DataToWeightBank                        : out ConvEngineWeightBank_InputSinglePort_t;
		DDR_LayerIdx_Rqst                       : out LayerIdx_st;
		DDR_KernelIdx_Rqst                      : out KernelIdx_st;
		DDR_GroupOf24Idx_Rqst                   : out KernelSize_InMultipleOf24Weights_t;
		RqstToDDR                               : out std_logic;
		AckFromDDR                              : in  std_logic;
		DataFromDDR                             : in  DDR_DataOut_t;
			--Read Ctrl
		ReadBankAddr                             : out ConvEngineWeightBankReadAddr_t;
		FlowCtrl_ContinueStreaming_StrmEngineToWeightBank   : in  std_logic;
		FlowCtrl_ContinueStreaming_WeightBankToStreamEngine : out std_logic;
		FeatureRowSize_ToStreamEngine: out std_logic_vector(4 downto 0)
	);
end ConvEngineWeightBank_MainControl_Level2_v2;

architecture Behavioral of ConvEngineWeightBank_MainControl_Level2_v2 is
--#Begin --Component
component ConvEngineWeightBank_ReadControl_Level2_v1
	port(clk, rst                                            : in  std_logic;
		 StartReadingNetwork                                 : in  std_logic;
		 DontCheckWritePtr                                   : in  std_logic;
		 DoneWithNetwork                                     : out std_logic;
		 NumberOfLayersInNetwork_unfloped                    : in  LayerIdx_st;
		 Layer_Base_unfloped                                 : in  ConvEngineTotalWeightAddrInTermsOf16Words_t;
		 SetSize_InTermsOf16Words_unfloped                   : in  SetSize_InTermsOf16Words_t;
		 TotalNumberOfSetsInALayer_unfloped                  : in  KernelIdx_st;
		 NumberOfLoopOverTheSet_unfloped                     : in  NumberOfLoopOverTheSet_t;
		 KernelsInLastSet_unfloped                           : in  NumberOfSimultaneousKernel_t;
		 SizeOfLastSet_InTermsof16Words_unfloped             : in  SetSize_InTermsOf16Words_t;
		 NumberOfSimultaneousKernel_unfloped                 : in  NumberOfSimultaneousKernel_t;
		 SetCrossesBankBoundary_unfloped                     : in  std_logic;
		 NetworkFitsInWeightBank_unfloped                    : in  std_logic;
		 FeatureRowSize_unflopped							 : in std_logic_vector(4 downto 0); -- In multiples of 8 words
		 Rqst_ToNetworkArchitectureBank                      : out std_logic;
		 Ack_FromNetworkArchitectureBank                     : in  std_logic;
		 LayerIdxToNetworkArchitectureBank                   : out LayerIdx_st;
		 DoneReadingLoop                                     : out std_logic;
		 ReadingLastLoop                                     : out std_logic;
		 CurrentSetAddress_OfReadingUnit                     : out ConvEngineWeightBankReadAddr_t;
		 Current_ReadPtr                                     : out ConvEngineWeightBankReadAddr_t;
		 Current_WritePtr                                    : in  ConvEngineWeightBankReadAddr_t;
		 DoneWritingFourthWordOfSet                          : in  std_logic;
		 CurrentWriteLayerIdx                                : in  LayerIdx_st;
		 CurrentWriteSetIdx                                  : in  KernelIdx_st;
		 FlowCtrl_ContinueStreaming_StrmEngineToWeightBank   : in  std_logic;
		 FlowCtrl_ContinueStreaming_WeightBankToStreamEngine : out std_logic;
		 FeatureRowSize_ToStreamEngine						 : out std_logic_vector(4 downto 0);
		 ReadBankAddr                                        : out ConvEngineWeightBankReadAddr_t);
end component ConvEngineWeightBank_ReadControl_Level2_v1;
component ConvEngineWeightBank_WriteControl_Level2
	port(clk, rst                                : in  std_logic;
		 StartWritingNetwork                     : in  std_logic;
		 DoneWithNetwork                         : out std_logic;
		 NumberOfLayersInNetwork_unfloped        : in  LayerIdx_st;
		 Layer_Base_unfloped                     : in  ConvEngineTotalWeightAddrInTermsOf16Words_t;
		 SetSize_InTermsOf16Words_unfloped       : in  SetSize_InTermsOf16Words_t;
		 TotalNumberOfSetsInALayer_unfloped      : in  KernelIdx_st;
		 NumberOfLoopOverTheSet_unfloped         : in  NumberOfLoopOverTheSet_t;
		 KernelsInLastSet_unfloped               : in  NumberOfSimultaneousKernel_t;
		 SizeOfLastSet_InTermsof16Words_unfloped : in  SetSize_InTermsOf16Words_t;
		 NumberOfSimultaneousKernel_unfloped     : in  NumberOfSimultaneousKernel_t;
		 SetCrossesBankBoundary_unfloped         : in  std_logic;
		 NetworkFitsInWeightBank_unfloped        : in  std_logic;
		 Rqst_ToNetworkArchitectureBank          : out std_logic;
		 Ack_FromNetworkArchitectureBank         : in  std_logic;
		 LayerIdxToNetworkArchitectureBank       : out LayerIdx_st;
		 DoneReadingLoop                         : in  std_logic;
		 ReadingLastLoop                         : in  std_logic;
		 CurrentWriteLayerIdx                    : out LayerIdx_st;
		 CurrentWriteSetIdx                      : out KernelIdx_st;
		 CurrentSetAddress_OfReadingUnit         : in  ConvEngineWeightBankReadAddr_t;
		 Current_ReadPtr                         : in  ConvEngineWeightBankReadAddr_t;
		 DoneWithFirstFiveWordInTheSet           : out std_logic;
		 WriteBankAddr                           : out ConvEngineWeightBankWriteAddr_t;
		 WriteBank_En                            : out std_logic_vector(0 downto 0);
		 DataToWeightBank                        : out ConvEngineWeightBank_InputSinglePort_t;
		 DDR_LayerIdx_Rqst                       : out LayerIdx_st;
		 DDR_KernelIdx_Rqst                      : out KernelIdx_st;
		 DDR_GroupOf24Idx_Rqst                   : out KernelSize_InMultipleOf24Weights_t;
		 RqstToDDR                               : out std_logic;
		 AckFromDDR                              : in  std_logic;
		 DataFromDDR                             : in  DDR_DataOut_t);
end component ConvEngineWeightBank_WriteControl_Level2;
--#End  --Components

--#Begin --Type
type NetworkDetailArbitrationFSM_StateType_t is (S_Rst,S_Write,S_Read);
type StateType_t is (S_Rst, S_FirstReadAndWrite_0, S_FirstReadAndWrite_1, S_DoneWithNetwork, S_ReadOnly );
--#End	 --Type

--#Begin --Signals
	--NetworkDetailsArbitration
signal NetworkDetailArbitration_PrState,NetworkDetailArbitration_NxtState: NetworkDetailArbitrationFSM_StateType_t;
signal Ack_FromNetworkArchitectureBank_ToWriteCtrl, Ack_FromNetworkArchitectureBank_ToReadCtrl: std_logic;
signal Rqst_ToNetworkArchitectureBank_FromWriteCtrl, Rqst_ToNetworkArchitectureBank_FromReadCtrl: std_logic;
signal LayerIdxToNetworkArchitectureBank_FromWriteCtrl, LayerIdxToNetworkArchitectureBank_FromReadCtrl: LayerIdx_st;
	--FSM
signal PrState, NxtState: StateType_t;
	-- Flags
signal DoneWithFirstIteration, DoneWithFirstIteration_En: std_logic;
signal CommandWriteNetwork, CommandReadNetwork: std_logic;
signal DoneWritingNetwork, DoneReadingNetwork: std_logic;
signal NetworkFitsInWeightBank, DontCheckWritePtr: std_logic;
	-- PortMapping Signals
		-- FromReadToWriteCtrl
signal DoneReadingLoop_FrmReadToWriteCtrl, ReadingLastLoop_FrmReadToWriteCtrl:std_logic;
signal CurrentSetAddress_OfReadingUnit_FrmReadToWriteCtrl:ConvEngineWeightBankReadAddr_t;
signal Current_ReadPtr_FrmReadToWriteCtrl:ConvEngineWeightBankReadAddr_t;
		-- FromWrite to read control
signal DoneWithFirstFiveWordInTheSet_FrmWriteToReadCtrl: std_logic;
signal CurrentWriteLayerIdx_FrmWriteToReadCtrl:LayerIdx_st;
signal CurrentWriteSetIdx_FrmWriteToReadCtrl:KernelIdx_st;
		-- From Write Ctrl
signal WriteBankAddr_signal: ConvEngineWeightBankReadAddr_t;

--#End	 --Signals
begin
	
------------------------------------------------#begin -- Main FSM
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

NxtAndOutputProc : process (PrState, DoneReadingNetwork, DoneWritingNetwork, NetworkFitsInWeightBank, StartNextNetworkIteration)	
begin
	case PrState is 
		when S_Rst =>
			CommandReadNetwork<='0'; 
			DoneWithNetwork<= '1';
			DontCheckWritePtr<='0';
			if (StartNextNetworkIteration='1') then
				CommandWriteNetwork<='1';
				NxtState<= S_FirstReadAndWrite_0;
			else
				CommandWriteNetwork<='0';
				NxtState<= S_Rst;
			end if;
		when S_FirstReadAndWrite_0 =>
			DoneWithNetwork<= '0';
			CommandWriteNetwork<='1'; CommandReadNetwork<='1';
			DontCheckWritePtr<='0';
			NxtState<= S_FirstReadAndWrite_1;
		when S_FirstReadAndWrite_1 =>
			DoneWithNetwork<= '0';
			CommandWriteNetwork<='0'; CommandReadNetwork<='0';
			DontCheckWritePtr<=DoneWritingNetwork;
			if (DoneWritingNetwork='1' and DoneReadingNetwork='1' ) then
				NxtState<= S_DoneWithNetwork;
			else
				NxtState<= S_FirstReadAndWrite_1;
			end if;
		when S_DoneWithNetwork =>
			DoneWithNetwork<= '1';
			if (StartNextNetworkIteration='1') then
				if (NetworkFitsInWeightBank='1') then 
					DontCheckWritePtr<='1';
					CommandReadNetwork<='1';
					CommandWriteNetwork<='0';
					NxtState<= S_ReadOnly;
				else
					DontCheckWritePtr<='0';
					CommandReadNetwork<='0';
					CommandWriteNetwork<='1';
					NxtState<= S_FirstReadAndWrite_0;
				end if;
			else
				DontCheckWritePtr<='0';
				CommandReadNetwork<='0';
				CommandWriteNetwork<='0';
				NxtState<= S_DoneWithNetwork;
			end if;
		when S_ReadOnly =>
			DontCheckWritePtr<='1';			
			DoneWithNetwork<= '0';
			CommandWriteNetwork<='0'; CommandReadNetwork<='0';
			if (DoneReadingNetwork='1' ) then
				NxtState<= S_DoneWithNetwork;
			else
				NxtState<= S_ReadOnly;
			end if;
	end case;
end process NxtAndOutputProc;
------------------------------------------------#End -- Main FSM
	
------------------------------------------------#begin -- NetworkDetailArbitration_FSM
ArbitratePrStateProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			NetworkDetailArbitration_PrState <= S_Rst;
		else
			NetworkDetailArbitration_PrState <= NetworkDetailArbitration_NxtState;
		end if;
	end if;
end process ArbitratePrStateProc;
ArbitrateNxtAndOutputLogic : process (NetworkDetailArbitration_PrState, Ack_FromNetworkArchitectureBank, LayerIdxToNetworkArchitectureBank_FromReadCtrl, LayerIdxToNetworkArchitectureBank_FromWriteCtrl, Rqst_ToNetworkArchitectureBank_FromReadCtrl, Rqst_ToNetworkArchitectureBank_FromWriteCtrl)
begin
	case NetworkDetailArbitration_PrState is 
		when S_Rst =>
			Rqst_ToNetworkArchitectureBank<='0';
			Ack_FromNetworkArchitectureBank_ToReadCtrl<= '0';
			Ack_FromNetworkArchitectureBank_ToWriteCtrl<= '0';
			if (Rqst_ToNetworkArchitectureBank_FromWriteCtrl='1') then
				LayerIdxToNetworkArchitectureBank<= LayerIdxToNetworkArchitectureBank_FromWriteCtrl;
				NetworkDetailArbitration_NxtState<= S_Write;
			elsif (Rqst_ToNetworkArchitectureBank_FromReadCtrl='1') then
				LayerIdxToNetworkArchitectureBank<= LayerIdxToNetworkArchitectureBank_FromReadCtrl;
				NetworkDetailArbitration_NxtState<= S_Read;
			else				
				LayerIdxToNetworkArchitectureBank<= (others=>'0');
				NetworkDetailArbitration_NxtState<= S_Rst;
			end if;
		when S_Write =>
			Rqst_ToNetworkArchitectureBank<=Rqst_ToNetworkArchitectureBank_FromWriteCtrl;
			Ack_FromNetworkArchitectureBank_ToReadCtrl<= '0';
			Ack_FromNetworkArchitectureBank_ToWriteCtrl<= Ack_FromNetworkArchitectureBank;
			LayerIdxToNetworkArchitectureBank<= LayerIdxToNetworkArchitectureBank_FromWriteCtrl;			
			if (Ack_FromNetworkArchitectureBank='1') then
				NetworkDetailArbitration_NxtState<= S_Rst;
			else
				NetworkDetailArbitration_NxtState<= S_Write;
			end if;
		when S_Read =>
			Rqst_ToNetworkArchitectureBank<=Rqst_ToNetworkArchitectureBank_FromReadCtrl;
			Ack_FromNetworkArchitectureBank_ToReadCtrl<= Ack_FromNetworkArchitectureBank;
			Ack_FromNetworkArchitectureBank_ToWriteCtrl<= '0';
			LayerIdxToNetworkArchitectureBank<= LayerIdxToNetworkArchitectureBank_FromReadCtrl;			
			if (Ack_FromNetworkArchitectureBank='1') then
				NetworkDetailArbitration_NxtState<= S_Rst;
			else
				NetworkDetailArbitration_NxtState<= S_Read;
			end if;
	end case;
end process ArbitrateNxtAndOutputLogic;
------------------------------------#End	 -- NetworkDetailArbitration_FSM

--#Begin	--Flags and Idx
FirstIterFlagProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			DoneWithFirstIteration <= '0';
		elsif(DoneWithFirstIteration_En='1') then
			DoneWithFirstIteration<= '1';
		end if;
	end if;
end process FirstIterFlagProc;
NetworkFitsInBankFlops : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			NetworkFitsInWeightBank<= '1';
		elsif (Ack_FromNetworkArchitectureBank='1') then
			NetworkFitsInWeightBank<= NetworkFitsInWeightBank_unfloped;
		end if;
	end if;
end process NetworkFitsInBankFlops;
--#Begin	--Flags and Idx

--#Begin --PortMapping
ReadCtrl_Level2: ConvEngineWeightBank_ReadControl_Level2_v1
	port map(
		clk                                                 => clk,
		rst                                                 => rst,
		StartReadingNetwork                                 => CommandReadNetwork,
		DontCheckWritePtr                                   => DontCheckWritePtr,
		DoneWithNetwork                                     => DoneReadingNetwork,
		NumberOfLayersInNetwork_unfloped                    => NumberOfLayersInNetwork_unfloped,
		Layer_Base_unfloped                                 => Layer_Base_unfloped,
		SetSize_InTermsOf16Words_unfloped                   => SetSize_InTermsOf16Words_unfloped,
		TotalNumberOfSetsInALayer_unfloped                  => TotalNumberOfSetsInALayer_unfloped,
		NumberOfLoopOverTheSet_unfloped                     => NumberOfLoopOverTheSet_unfloped,
		KernelsInLastSet_unfloped                           => KernelsInLastSet_unfloped,
		SizeOfLastSet_InTermsof16Words_unfloped             => SizeOfLastSet_InTermsof16Words_unfloped,
		NumberOfSimultaneousKernel_unfloped                 => NumberOfSimultaneousKernel_unfloped,
		SetCrossesBankBoundary_unfloped                     => SetCrossesBankBoundary_unfloped,
		NetworkFitsInWeightBank_unfloped                    => NetworkFitsInWeightBank_unfloped,
		FeatureRowSize_unflopped							=> FeatureRowSize_unflopped,
		Rqst_ToNetworkArchitectureBank                      => Rqst_ToNetworkArchitectureBank_FromReadCtrl,
		Ack_FromNetworkArchitectureBank                     => Ack_FromNetworkArchitectureBank_ToReadCtrl,
		LayerIdxToNetworkArchitectureBank                   => LayerIdxToNetworkArchitectureBank_FromReadCtrl,
		DoneReadingLoop                                     => DoneReadingLoop_FrmReadToWriteCtrl,
		ReadingLastLoop                                     => ReadingLastLoop_FrmReadToWriteCtrl,
		CurrentSetAddress_OfReadingUnit                     => CurrentSetAddress_OfReadingUnit_FrmReadToWriteCtrl,
		Current_ReadPtr                                     => Current_ReadPtr_FrmReadToWriteCtrl,
		Current_WritePtr                                    => WriteBankAddr_signal,
		DoneWritingFourthWordOfSet                          => DoneWithFirstFiveWordInTheSet_FrmWriteToReadCtrl,
		CurrentWriteLayerIdx                                => CurrentWriteLayerIdx_FrmWriteToReadCtrl,
		CurrentWriteSetIdx                                  => CurrentWriteSetIdx_FrmWriteToReadCtrl,
		FlowCtrl_ContinueStreaming_StrmEngineToWeightBank   => FlowCtrl_ContinueStreaming_StrmEngineToWeightBank,
		FlowCtrl_ContinueStreaming_WeightBankToStreamEngine => FlowCtrl_ContinueStreaming_WeightBankToStreamEngine,
		FeatureRowSize_ToStreamEngine						=> FeatureRowSize_ToStreamEngine,
		ReadBankAddr                                        => ReadBankAddr
	);
WriteCtrl_Level2: ConvEngineWeightBank_WriteControl_Level2
	port map(
		clk                                     => clk,
		rst                                     => rst,
		StartWritingNetwork                     => CommandWriteNetwork,
		DoneWithNetwork                         => DoneWritingNetwork,
		NumberOfLayersInNetwork_unfloped        => NumberOfLayersInNetwork_unfloped,
		Layer_Base_unfloped                     => Layer_Base_unfloped,
		SetSize_InTermsOf16Words_unfloped       => SetSize_InTermsOf16Words_unfloped,
		TotalNumberOfSetsInALayer_unfloped      => TotalNumberOfSetsInALayer_unfloped,
		NumberOfLoopOverTheSet_unfloped         => NumberOfLoopOverTheSet_unfloped,
		KernelsInLastSet_unfloped               => KernelsInLastSet_unfloped,
		SizeOfLastSet_InTermsof16Words_unfloped => SizeOfLastSet_InTermsof16Words_unfloped,
		NumberOfSimultaneousKernel_unfloped     => NumberOfSimultaneousKernel_unfloped,
		SetCrossesBankBoundary_unfloped         => SetCrossesBankBoundary_unfloped,
		NetworkFitsInWeightBank_unfloped        => NetworkFitsInWeightBank_unfloped,
		Rqst_ToNetworkArchitectureBank          => Rqst_ToNetworkArchitectureBank_FromWriteCtrl,
		Ack_FromNetworkArchitectureBank         => Ack_FromNetworkArchitectureBank_ToWriteCtrl,
		LayerIdxToNetworkArchitectureBank       => LayerIdxToNetworkArchitectureBank_FromWriteCtrl,
		DoneReadingLoop                         => DoneReadingLoop_FrmReadToWriteCtrl,
		ReadingLastLoop                         => ReadingLastLoop_FrmReadToWriteCtrl,
		CurrentWriteLayerIdx                    => CurrentWriteLayerIdx_FrmWriteToReadCtrl,
		CurrentWriteSetIdx                      => CurrentWriteSetIdx_FrmWriteToReadCtrl,
		CurrentSetAddress_OfReadingUnit         => CurrentSetAddress_OfReadingUnit_FrmReadToWriteCtrl,
		Current_ReadPtr                         => Current_ReadPtr_FrmReadToWriteCtrl,
		DoneWithFirstFiveWordInTheSet           => DoneWithFirstFiveWordInTheSet_FrmWriteToReadCtrl,
		WriteBankAddr                           => WriteBankAddr_signal,
		WriteBank_En                            => WriteBank_En,
		DataToWeightBank                        => DataToWeightBank,
		DDR_LayerIdx_Rqst                       => DDR_LayerIdx_Rqst,
		DDR_KernelIdx_Rqst                      => DDR_KernelIdx_Rqst,
		DDR_GroupOf24Idx_Rqst                   => DDR_GroupOf24Idx_Rqst,
		RqstToDDR                               => RqstToDDR,
		AckFromDDR                              => AckFromDDR,
		DataFromDDR                             => DataFromDDR
	);

--#End	 --PortMapping

--#Begin --Assign Outpu
WriteBankAddr<= WriteBankAddr_signal;
--#End	--Assign Outpu
end Behavioral;
