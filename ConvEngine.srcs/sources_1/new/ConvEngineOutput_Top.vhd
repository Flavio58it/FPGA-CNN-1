----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.03.2016 18:40:41
-- Design Name: 
-- Module Name: ConvEngineOutput_Top - Behavioral
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
use work.ConvEngineDataBankPkg.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--#Begin --Component
--#End	 --Component
--#Begin --Type
--#End 	--Type
--#Begin --Signal
--#End	 --Signal

entity ConvEngineOutput_Top is
  Port (clk,rst: in std_logic;
  		  -- Data In From DSP
		  MACUnit0_Output,MACUnit1_Output,MACUnit2_Output,MACUnit3_Output: in MACUnitRawOutput_t;

		---HandShake to/from Master Control
	  		LoadOutputs_FromMaster: in std_logic;
			ClearToSendOutputs_ToMaster: out std_logic;	 		 
			LayerIdx: in LayerIdx_st;

		--- Network Details
			LayerBase: in ConvEngineDataBankAddr_t;
			FullyConnectedLayer_In: in std_logic;
			--NumberOfOutputsInFullyConnectedLayer: in FeatureRowSize_t;			
			FeatureRowSize: in FeatureRowSize_t; -- In multiple of 8 Words
			TotalFeaturesInLayer: in DataFeatureIdx_st;
			--TotalNumberOfActualRowsInAFeature_SizeInTermsOf8Words: in DataFeatureRowIdx_st; -- -- Actual number of rows
			TotalNumberOfRowsInAFeature_SizeInTermsOf16Words: in DataFeatureRowIdx_st; -- -- Where row Size is in terms of 16 words. If actual row size is of 8 words, then row Size Should be halved
			LastSetOfKernel: in std_logic;
			NumberOfSimultaneousKernel: in NumberOfSimultaneousKernel_t;
			KernelsInLastSet: in NumberOfSimultaneousKernel_t;						
				-- TO decide whether to write in DDR
			NetworkFitsInBank: in std_logic; -- If it doesn't fit, Everything has to be written to DDR, no matter what
				-- To decide whether to write in bank
			NoFeatureToBeWrittenToBank: in std_logic; 
			LastPositionInRowToBeWrittenToBank: in FeatureRowSize_t; -- In terms of 8 words, but must be alligned to 16-word as well as 24-word boundary 
			LastRowToBeWrittenToBank: in DataFeatureRowIdx_st;
			LastFeatureToBeWrittenToBank: in DataFeatureIdx_st;
			TotalGroupsInFeature: in DataFeatureSize_InMultipleOf24Words_t;  

			-- Network Detail for Datapath alternate		  
		   FeatureRowSize_OfInputLayer: in FeatureRowSize_t;
		  
		 	-- Output
		 		--Output to Bank
			RqstToBank:	out std_logic;
			AckFromBank:in std_logic;	
			DataOut: out ConvEngineDataBank_DataPort_t;
			IdxOut: out ConvEngineDataBank_IdxPort_t;	
	  		WeightBankAddr: out ConvEngineDataBankAddr_t;
				--Output to DDR 	
			RqstToDDR: out std_logic;
			DDR_LayerIdx: out LayerIdx_st;
			DDR_FeatureIdx: out DataFeatureIdx_st;
			DDR_GroupIdxInAFeature: out DataFeatureSize_InMultipleOf24Words_t;
			DDR_DataOut: out DDR_YOut;
			AckFromDDR: in std_logic
	  
  );
end ConvEngineOutput_Top;

architecture Behavioral of ConvEngineOutput_Top is
--#Begin --Component
component ConvEngineOutput_Datapath_Alternate
	port(clk, rst                                                           : in  std_logic;
		 MACUnit0_Output, MACUnit1_Output, MACUnit2_Output, MACUnit3_Output : in  MACUnitRawOutput_t;
		 FullyConnectedLayer                                                : in  std_logic;
		 FeatureRowSize_OfInputLayer                                        : in  FeatureRowSize_t;
		 Latch_Outputs                                                      : in  std_logic;
		 Shift_Row0AndRow1                                                  : in  std_logic;
		 Shift_Row2AndRow3                                                  : in  std_logic;
		 ChooseSetOfRow                                                     : in  std_logic;
		 LastPositionBeingLoaded_InOutputFeature                            : in  std_logic;
		 PipeLine_En_ClrToSend												: in std_logic; -- "Clear To Send" signal of control
		 MACOutput_GrpOf8Words                                              : out MACFinalOutput_InGrpOf8_t;
		 MACOutputIdx_GrpOf8Words                                           : out MACFinalOutputIdx_InGrpOf8_t);
end component ConvEngineOutput_Datapath_Alternate;
component ConvEngineOutput_Control
	port(clk, rst                                         : in  std_logic;
		 LoadOutputs_FromMaster                           : in  std_logic;
		 ClearToSendOutputs_ToMaster                      : out std_logic;
		 LayerIdx                                         : in  LayerIdx_st;
		 LayerBase                                        : in  ConvEngineDataBankAddr_t;
		 FullyConnectedLayer_In                           : in  std_logic;
		 FeatureRowSize                                   : in  FeatureRowSize_t;
		 TotalFeaturesInLayer                             : in  DataFeatureIdx_st;
		 TotalNumberOfRowsInAFeature_SizeInTermsOf16Words : in  DataFeatureRowIdx_st;
		 LastSetOfKernel                                  : in  std_logic;
		 NumberOfSimultaneousKernel                       : in  NumberOfSimultaneousKernel_t;
		 KernelsInLastSet                                 : in  NumberOfSimultaneousKernel_t;
		 NetworkFitsInBank                                : in  std_logic;
		 NoFeatureToBeWrittenToBank                       : in  std_logic;
		 LastPositionInRowToBeWrittenToBank               : in  FeatureRowSize_t;
		 LastRowToBeWrittenToBank                         : in  DataFeatureRowIdx_st;
		 LastFeatureToBeWrittenToBank                     : in  DataFeatureIdx_st;
		 Latch_Outputs                                    : out std_logic;
		 Shift_Row0AndRow1                                : out std_logic;
		 Shift_Row2AndRow3                                : out std_logic;
		 ChooseSetOfRow                                   : out std_logic;
		 FullyConnectedLayer_Out                          : out std_logic;
		 LastPositionBeingLoaded_InOutputFeature          : out std_logic;
		 PipeLine_En_ClrToSend 							  : out std_logic;
		 Load8Words_DDR                                   : out std_logic;
		 ClearToSendData_DDR                              : in  std_logic;
		 GrpOf8WordsLeftInARow                            : out FeatureRowSize_t;
		 FirstPositionOfRowBeingWritten                   : out std_logic;
		 LastFeatureOfSetBeingWritten                     : out std_logic;
		 NumberOfSimultaneousKernel_Final                 : out NumberOfSimultaneousKernel_t;
		 DDR_LayerIdx_In                                  : out LayerIdx_st;
		 DDR_FeatureIdx_In                                : out DataFeatureIdx_st;
		 DDR_GroupIdxInAFeature_In                        : out DataFeatureSize_InMultipleOf24Words_t;
		 Load8Words_Bank                                  : out std_logic;
		 ClearToSendData_Bank                             : in  std_logic;
		 LastPositionInRow                                : out std_logic;
		 WriteBankAddr                                    : out ConvEngineDataBankAddr_t);
end component ConvEngineOutput_Control;
component ConvEngineOutput_Control_Level1_DataBank
	port(clk, rst                 : in  std_logic;
		 LoadData_FromMaster                 : in  std_logic;
		 LastPositionInRow        : in  std_logic;
		 ClearToSendData_ToMaster          : out std_logic;
		 ClearToSend_OfDDR: in std_logic; 
		 WriteBankAddr            : in  ConvEngineDataBankAddr_t;
		 RqstToBank               : out std_logic;
		 AckFromBank              : in  std_logic;
		 MACOutput_GrpOf8Words    : in  MACFinalOutput_InGrpOf8_t;
		 MACOutputIdx_GrpOf8Words : in  MACFinalOutputIdx_InGrpOf8_t;
		 DataOut                  : out ConvEngineDataBank_DataPort_t;
		 IdxOut                   : out ConvEngineDataBank_IdxPort_t;
		 Addr                     : out ConvEngineDataBankAddr_t);
end component ConvEngineOutput_Control_Level1_DataBank;
component ConvEngineOutput_Control_Level1_DDR
	port(clk, rst                         : in  std_logic;
		 LoadData_FromMaster                         : in  std_logic;
		 ClearToSendData_ToMaster                  : out std_logic;
		 ClearToSend_ofBank: in std_logic;
		 GrpOf8WordsLeftInARow            : in  FeatureRowSize_t;
		 FirstPositionOfRowBeingWritten   : in  std_logic;
		 LastFeatureOfSetBeingWritten     : in  std_logic;
		 NumberOfSimultaneousKernel_Final : in  NumberOfSimultaneousKernel_t;
		 TotalGroupsInFeature             : in  DataFeatureSize_InMultipleOf24Words_t;
		 MACOutput_GrpOf8Words            : in  MACFinalOutput_InGrpOf8_t;
		 MACOutputIdx_GrpOf8Words         : in  MACFinalOutputIdx_InGrpOf8_t;
		 DDR_LayerIdx_In                  : in LayerIdx_st;
		 DDR_FeatureIdx_In                : in DataFeatureIdx_st;
		 DDR_GroupIdxInAFeature_In        : in DataFeatureSize_InMultipleOf24Words_t;
		 RqstToDDR                        : out std_logic;
		 DDR_LayerIdx                     : out LayerIdx_st;
		 DDR_FeatureIdx                   : out DataFeatureIdx_st;
		 DDR_GroupIdxInAFeature           : out DataFeatureSize_InMultipleOf24Words_t;
		 DDR_DataOut                      : out DDR_YOut;
		 AckFromDDR                       : in  std_logic);
end component ConvEngineOutput_Control_Level1_DDR;
--#End	 --Component
--#Begin --Type
--#End 	--Type
--#Begin --Signal
signal Latch_Outputs                                    : std_logic;
signal Shift_Row0AndRow1                                :  std_logic;
signal Shift_Row2AndRow3                                :  std_logic;
signal ChooseSetOfRow                                   :  std_logic;
signal FullyConnectedLayer_Out                          :  std_logic;
signal LastPositionBeingLoaded_InOutputFeature          :  std_logic;
signal PipeLine_En_ClrToSend :  std_logic;	
	-- signals between datapath and Level1 blocks
signal MACOutput_GrpOf8Words:  MACFinalOutput_InGrpOf8_t;
signal MACOutputIdx_GrpOf8Words:  MACFinalOutputIdx_InGrpOf8_t;	

	--Signal between control and LEvel1 blocks
		-- Between Main control and Level1 DDR
signal Load8Words_DDR:  std_logic;	  
signal ClearToSendData_DDR:  std_logic;
signal GrpOf8WordsLeftInARow:  FeatureRowSize_t;
signal	FirstPositionOfRowBeingWritten:  std_logic;
signal	LastFeatureOfSetBeingWritten:  std_logic;
signal	NumberOfSimultaneousKernel_Final:  NumberOfSimultaneousKernel_t; 
signal	DDR_LayerIdx_In:  LayerIdx_st;
signal	DDR_FeatureIdx_In:  DataFeatureIdx_st;
signal	DDR_GroupIdxInAFeature_In:  DataFeatureSize_InMultipleOf24Words_t; 
			
		-- Between Main control and Level1 Bank
signal	Load8Words_Bank:  std_logic;	  	
signal	ClearToSendData_Bank:  std_logic;
signal	LastPositionInRow:  std_logic;			
signal	WriteBankAddr:  ConvEngineDataBankAddr_t;
--#End	 --Signal
begin

DataPath: ConvEngineOutput_Datapath_Alternate
	port map(
		clk                                     => clk,
		rst                                     => rst,
		MACUnit0_Output                         => MACUnit0_Output,
		MACUnit1_Output                         => MACUnit1_Output,
		MACUnit2_Output                         => MACUnit2_Output,
		MACUnit3_Output                         => MACUnit3_Output,
		FullyConnectedLayer                     => FullyConnectedLayer_Out,
		FeatureRowSize_OfInputLayer             => FeatureRowSize_OfInputLayer,
		Latch_Outputs                           => Latch_Outputs,
		Shift_Row0AndRow1                       => Shift_Row0AndRow1,
		Shift_Row2AndRow3                       => Shift_Row2AndRow3,
		ChooseSetOfRow                          => ChooseSetOfRow,
		LastPositionBeingLoaded_InOutputFeature => LastPositionBeingLoaded_InOutputFeature,
		PipeLine_En_ClrToSend					=>  PipeLine_En_ClrToSend,
		MACOutput_GrpOf8Words                   => MACOutput_GrpOf8Words,
		MACOutputIdx_GrpOf8Words                => MACOutputIdx_GrpOf8Words
	);

Control: ConvEngineOutput_Control
	port map(
		clk                                              => clk,
		rst                                              => rst,
		LoadOutputs_FromMaster                           => LoadOutputs_FromMaster,
		ClearToSendOutputs_ToMaster                      => ClearToSendOutputs_ToMaster,
		LayerIdx                                         => LayerIdx,
		LayerBase                                        => LayerBase,
		FullyConnectedLayer_In                           => FullyConnectedLayer_In,
		FeatureRowSize                                   => FeatureRowSize,
		TotalFeaturesInLayer                             => TotalFeaturesInLayer,
		TotalNumberOfRowsInAFeature_SizeInTermsOf16Words => TotalNumberOfRowsInAFeature_SizeInTermsOf16Words,
		LastSetOfKernel                                  => LastSetOfKernel,
		NumberOfSimultaneousKernel                       => NumberOfSimultaneousKernel,
		KernelsInLastSet                                 => KernelsInLastSet,
		NetworkFitsInBank                                => NetworkFitsInBank,
		NoFeatureToBeWrittenToBank                       => NoFeatureToBeWrittenToBank,
		LastPositionInRowToBeWrittenToBank               => LastPositionInRowToBeWrittenToBank,
		LastRowToBeWrittenToBank                         => LastRowToBeWrittenToBank,
		LastFeatureToBeWrittenToBank                     => LastFeatureToBeWrittenToBank,
		Latch_Outputs                                    => Latch_Outputs,
		Shift_Row0AndRow1                                => Shift_Row0AndRow1,
		Shift_Row2AndRow3                                => Shift_Row2AndRow3,
		ChooseSetOfRow                                   => ChooseSetOfRow,
		FullyConnectedLayer_Out                          => FullyConnectedLayer_Out,
		LastPositionBeingLoaded_InOutputFeature          => LastPositionBeingLoaded_InOutputFeature,
		PipeLine_En_ClrToSend 							 => PipeLine_En_ClrToSend, 
		Load8Words_DDR                                   => Load8Words_DDR,
		ClearToSendData_DDR                              => ClearToSendData_DDR,
		GrpOf8WordsLeftInARow                            => GrpOf8WordsLeftInARow,
		FirstPositionOfRowBeingWritten                   => FirstPositionOfRowBeingWritten,
		LastFeatureOfSetBeingWritten                     => LastFeatureOfSetBeingWritten,
		NumberOfSimultaneousKernel_Final                 => NumberOfSimultaneousKernel_Final,
		DDR_LayerIdx_In                                  => DDR_LayerIdx_In,
		DDR_FeatureIdx_In                                => DDR_FeatureIdx_In,
		DDR_GroupIdxInAFeature_In                        => DDR_GroupIdxInAFeature_In,
		Load8Words_Bank                                  => Load8Words_Bank,
		ClearToSendData_Bank                             => ClearToSendData_Bank,
		LastPositionInRow                                => LastPositionInRow,
		WriteBankAddr                                    => WriteBankAddr
	);

ToDataBank: ConvEngineOutput_Control_Level1_DataBank
	port map(
		clk                      => clk,
		rst                      => rst,
		LoadData_FromMaster      => Load8Words_Bank,
		LastPositionInRow        => LastPositionInRow,
		ClearToSendData_ToMaster          => ClearToSendData_Bank,
		ClearToSend_OfDDR 		 =>ClearToSendData_DDR,
		WriteBankAddr            => WriteBankAddr,
		RqstToBank               => RqstToBank,
		AckFromBank              => AckFromBank,
		MACOutput_GrpOf8Words    => MACOutput_GrpOf8Words,
		MACOutputIdx_GrpOf8Words => MACOutputIdx_GrpOf8Words,
		DataOut                  => DataOut,
		IdxOut                   => IdxOut,
		Addr                     => WeightBankAddr
	);

ToDDR: ConvEngineOutput_Control_Level1_DDR
	port map(
		clk                              => clk,
		rst                              => rst,
		LoadData_FromMaster              => Load8Words_DDR,
		ClearToSendData_ToMaster         => ClearToSendData_DDR,
		ClearToSend_ofBank				 => ClearToSendData_Bank,
		GrpOf8WordsLeftInARow            => GrpOf8WordsLeftInARow,
		FirstPositionOfRowBeingWritten   => FirstPositionOfRowBeingWritten,
		LastFeatureOfSetBeingWritten     => LastFeatureOfSetBeingWritten,
		NumberOfSimultaneousKernel_Final => NumberOfSimultaneousKernel_Final,
		TotalGroupsInFeature             => TotalGroupsInFeature,
		MACOutput_GrpOf8Words            => MACOutput_GrpOf8Words,
		MACOutputIdx_GrpOf8Words         => MACOutputIdx_GrpOf8Words,
		DDR_LayerIdx_In                  => DDR_LayerIdx_In,
		DDR_FeatureIdx_In                => DDR_FeatureIdx_In,
		DDR_GroupIdxInAFeature_In        => DDR_GroupIdxInAFeature_In,
		RqstToDDR                        => RqstToDDR,
		DDR_LayerIdx                     => DDR_LayerIdx,
		DDR_FeatureIdx                   => DDR_FeatureIdx,
		DDR_GroupIdxInAFeature           => DDR_GroupIdxInAFeature,
		DDR_DataOut                      => DDR_DataOut,
		AckFromDDR                       => AckFromDDR
	);
end Behavioral;
