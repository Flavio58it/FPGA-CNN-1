----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.02.2016 16:55:42
-- Design Name: 
-- Module Name: ConvEngineTop - Behavioral
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

entity ConvEngineTop is
	  Port (clk,rst: in std_logic; 
	  		-- HadnShaking with Master
			StartNextNetworkIteration: in std_logic;
			DoneWithNetworkIteration: out std_logic;
	  		
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
	  		
	  		-- Handshaking With MAC unit
			EnableStreamingWeightsToMAC     : in  std_logic;
		 	TellMACToWait                   : out std_logic;		 
			-- Data To MAC unit
			WeightsToMac: out ConvUnitWeightPort_t;
		
			-- DDR signals
			DDR_LayerIdx_Rqst                       : out LayerIdx_st;
			DDR_KernelIdx_Rqst                      : out KernelIdx_st;
			DDR_GroupOf24Idx_Rqst                   : out KernelSize_InMultipleOf24Weights_t;
			RqstToDDR                               : out std_logic;
			AckFromDDR                              : in  std_logic;
			DataFromDDR                             : in  DDR_DataOut_t
		);
end ConvEngineTop;

architecture Behavioral of ConvEngineTop is
--#Begin --Component
component ConvEngineWeightBankToMACTop
	port(clk, rst                        : in  std_logic;
		 FeatureRowSize                  : in  unsigned(4 downto 0);
		 EnabelLoadingWeightsFromBank    : in  std_logic;
		 EnableStreamingWeightsToMAC     : in  std_logic;
		 TellMACToWait                   : out std_logic;
		 RqstToSendWeightsFromWeightBank : out std_logic;
		 WeightBank_OuputPort            : in  ConvEngineWeightBank_OutputSinglePort_t;
		 OutputToMACunits                : out ConvUnitWeightPort_t);
end component ConvEngineWeightBankToMACTop;
component ConvEngineWeightBankTop
	port(clk, rst             : in  std_logic;
		 ReadPort_DataOutput  : out ConvEngineWeightBank_OutputSinglePort_t;
		 ReadPort_DataInput   : in  ConvEngineWeightBank_InputSinglePort_t;
		 WritePort_DataOutput : out ConvEngineWeightBank_OutputSinglePort_t;
		 WritePort_DataInput  : in  ConvEngineWeightBank_InputSinglePort_t;
		 ReadAddr             : in  ConvEngineWeightBankReadAddr_t;
		 WriteAddr            : in  ConvEngineWeightBankReadAddr_t;
		 WritePort_WriteEn    : in  std_logic_vector(0 downto 0));
end component ConvEngineWeightBankTop;
component ConvEngineWeightBank_MainControl_Level2_v2
	port(clk, rst                                            : in  std_logic;
		 StartNextNetworkIteration                           : in  std_logic;
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
		 FeatureRowSize_unflopped                            : in  std_logic_vector(4 downto 0);
		 Rqst_ToNetworkArchitectureBank                      : out std_logic;
		 Ack_FromNetworkArchitectureBank                     : in  std_logic;
		 LayerIdxToNetworkArchitectureBank                   : out LayerIdx_st;
		 WriteBankAddr                                       : out ConvEngineWeightBankWriteAddr_t;
		 WriteBank_En                                        : out std_logic_vector(0 downto 0);
		 DataToWeightBank                                    : out ConvEngineWeightBank_InputSinglePort_t;
		 DDR_LayerIdx_Rqst                                   : out LayerIdx_st;
		 DDR_KernelIdx_Rqst                                  : out KernelIdx_st;
		 DDR_GroupOf24Idx_Rqst                               : out KernelSize_InMultipleOf24Weights_t;
		 RqstToDDR                                           : out std_logic;
		 AckFromDDR                                          : in  std_logic;
		 DataFromDDR                                         : in  DDR_DataOut_t;
		 ReadBankAddr                                        : out ConvEngineWeightBankReadAddr_t;
		 FlowCtrl_ContinueStreaming_StrmEngineToWeightBank   : in  std_logic;
		 FlowCtrl_ContinueStreaming_WeightBankToStreamEngine : out std_logic;
		 FeatureRowSize_ToStreamEngine                       : out std_logic_vector(4 downto 0));
end component ConvEngineWeightBank_MainControl_Level2_v2;
--#End  --Components

--#Begin --Signals
	-- Signals between Weight bank and weight steam engine
signal ReadPort_DataOutput_FrmBankToStream: ConvEngineWeightBank_OutputSinglePort_t;
	-- HandShake between MainCtrl and BankToMAC
signal FlowCtrl_ContinueStreaming_StrmEngineToWeightBank   : std_logic;
signal FlowCtrl_ContinueStreaming_WeightBankToStreamEngine : std_logic;
signal FeatureRowSize_ToStreamEngine                       : std_logic_vector(4 downto 0);
	-- Signal between Main Ctrl and Bank
signal ReadBankAddr_FrmMainCtrlToBank, WriteBankAddr_FrmMainCtrlToBank: ConvEngineWeightBankReadAddr_t;
signal WriteBank_En_FromMainCtrlToBank: std_logic_vector(0 downto 0);
signal DataToWeightBank_FromMainCtrlToBank: ConvEngineWeightBank_InputSinglePort_t;
	-- DUmmy
signal ReadPort_DataInput_Dummy: ConvEngineWeightBank_InputSinglePort_t;
--#End	 --Signals

begin
ReadPort_DataInput_Dummy<= (others => std_logic_vector(to_unsigned(0,18)));

Bank: ConvEngineWeightBankTop
	port map(
		clk                  => clk,
		rst                  => rst,
		ReadPort_DataOutput  => ReadPort_DataOutput_FrmBankToStream,
		ReadPort_DataInput   => ReadPort_DataInput_Dummy,
		WritePort_DataOutput => open,
		WritePort_DataInput  => DataToWeightBank_FromMainCtrlToBank,
		ReadAddr             => ReadBankAddr_FrmMainCtrlToBank,
		WriteAddr            => WriteBankAddr_FrmMainCtrlToBank,
		WritePort_WriteEn    => WriteBank_En_FromMainCtrlToBank
	);
BankToMac: ConvEngineWeightBankToMACTop
	port map(
		clk                             => clk,
		rst                             => rst,
		FeatureRowSize                  => unsigned(FeatureRowSize_ToStreamEngine),
		EnabelLoadingWeightsFromBank    => FlowCtrl_ContinueStreaming_WeightBankToStreamEngine,
		EnableStreamingWeightsToMAC     => EnableStreamingWeightsToMAC,
		TellMACToWait                   => TellMACToWait,
		RqstToSendWeightsFromWeightBank => FlowCtrl_ContinueStreaming_StrmEngineToWeightBank,
		WeightBank_OuputPort            => ReadPort_DataOutput_FrmBankToStream,
		OutputToMACunits                => WeightsToMac
	);
MainCtrl: ConvEngineWeightBank_MainControl_Level2_v2
	port map(
		clk                                                 => clk,
		rst                                                 => rst,
		StartNextNetworkIteration                           => StartNextNetworkIteration,
		DoneWithNetwork                                     => DoneWithNetworkIteration,
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
		FeatureRowSize_unflopped                            => FeatureRowSize_unflopped,
		Rqst_ToNetworkArchitectureBank                      => Rqst_ToNetworkArchitectureBank,
		Ack_FromNetworkArchitectureBank                     => Ack_FromNetworkArchitectureBank,
		LayerIdxToNetworkArchitectureBank                   => LayerIdxToNetworkArchitectureBank,
		WriteBankAddr                                       => WriteBankAddr_FrmMainCtrlToBank,
		WriteBank_En                                        => WriteBank_En_FromMainCtrlToBank,
		DataToWeightBank                                    => DataToWeightBank_FromMainCtrlToBank,
		DDR_LayerIdx_Rqst                                   => DDR_LayerIdx_Rqst,
		DDR_KernelIdx_Rqst                                  => DDR_KernelIdx_Rqst,
		DDR_GroupOf24Idx_Rqst                               => DDR_GroupOf24Idx_Rqst,
		RqstToDDR                                           => RqstToDDR,
		AckFromDDR                                          => AckFromDDR,
		DataFromDDR                                         => DataFromDDR,
		ReadBankAddr                                        => ReadBankAddr_FrmMainCtrlToBank,
		FlowCtrl_ContinueStreaming_StrmEngineToWeightBank   => FlowCtrl_ContinueStreaming_StrmEngineToWeightBank,
		FlowCtrl_ContinueStreaming_WeightBankToStreamEngine => FlowCtrl_ContinueStreaming_WeightBankToStreamEngine,
		FeatureRowSize_ToStreamEngine                       => FeatureRowSize_ToStreamEngine
	);

end Behavioral;
