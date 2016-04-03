----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2016 19:07:59
-- Design Name: 
-- Module Name: ConvEngineDataDDRToBank_Top - Behavioral
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

entity ConvEngineDataDDRToBank_Top is
	  Port (clk, rst: in std_logic; 
			---- Data -In from DDR
		  	DataFromDDR: in DDR_YOut;
			-- DDR Signals
			RqstToDDR: out std_logic;
			DDR_LayerIdx: out LayerIdx_st;
			DDR_FeatureIdx: out DataFeatureIdx_st;
			DDR_GroupIdxInAFeature: out DataFeatureSize_InMultipleOf24Words_t;
			AckFromDDR: in std_logic;	  
			-- Data Out to Bank			
	  		DataToDataBank: out ConvEngineDataBank_DataPort_t; 
	  		IdxToDataBank: out ConvEngineDataBank_IdxPort_t;
	 		-- Addr To bank
	 		WriteAddrToMaster :out ConvEngineDataBankAddr_t;

			 -- Control to/from Master
		   	LayerBase: in ConvEngineDataBankAddr_t;
		   	RqstFromMainCtrlToLoadLayer: in std_logic;
			RqstToMainCtrl: out std_logic;
		   	AckFromMainCtrl: in std_logic;
		   	CurrLayerIdx: in LayerIdx_st;
			TotalFeaturesInLayer: in DataFeatureIdx_st;
			TotalNumberOfRowsInAFeature_SizeInTermsOf16Words: in DataFeatureRowIdx_st; -- Where row Size is in terms of 16 words. If actual row size is of 8 words, then row Size Should be halved
			FeatureRowSize: in FeatureRowSize_t; -- In terms of Eight Words
			StartingFeatureIdx: in DataFeatureIdx_st;
			StartGrpBase: in DataFeatureSize_InMultipleOf24Words_t;
			StartingGrpOffset: in DataFeatureSize_InMultipleOf24Words_t; -- We have to make sure 16-word and 24-Word boundary meets here 
			StartRowIdx: in DataFeatureRowIdx_st;
			StartingPositionInRow: in FeatureRowSize_t; -- In terms of 8 words, but must be alligned to 16-word boundary
		    LayerDone: out std_logic
	 
	 );
end ConvEngineDataDDRToBank_Top;

architecture Behavioral of ConvEngineDataDDRToBank_Top is
--#Begin --Component
component ConvEngineDataDDRTOBank_DataPath
	port(clk, rst                 : in  std_logic;
		 DataFromDDR              : in  DDR_YOut;
		 LatchDDRData             : in  std_logic;
		 ShiftDDRData             : in  std_logic;
		 WriteFIFO                : in  std_logic;
		 ReadFIFO                 : in  std_logic;
		 TempStorage_Set0_Load    : in  std_logic;
		 TempStorage_Set1_Load    : in  std_logic;
		 Set0_Load                : in  std_logic;
		 Set0_LoadZeroes          : in  std_logic;
		 Set1_Load                : in  std_logic;
		 Set1_LoadZeroes          : in  std_logic;
		 Set0_Sel_DDRorFIFOorTemp : in  std_logic_vector(1 downto 0);
		 Set1_Sel_DDRorFIFOorTemp : in  std_logic_vector(1 downto 0);
		 FIFOInSel_DDRorTemp      : in  std_logic;
		 DataToDataBank           : out ConvEngineDataBank_DataPort_t;
		 IdxToDataBank            : out ConvEngineDataBank_IdxPort_t);
end component ConvEngineDataDDRTOBank_DataPath;
component ConvEngineDataDDRToBank_Control
	port(clk, rst                                         : in  std_logic;
		 RqstFromMainCtrlToLoadLayer                      : in  std_logic;
		 RqstToMainCtrl                                   : out std_logic;
		 AckFromMainCtrl                                  : in  std_logic;
		 LayerBase										  : in ConvEngineDataBankAddr_t;
		 CurrLayerIdx                                     : in  LayerIdx_st;
		 TotalFeaturesInLayer                             : in  DataFeatureIdx_st;
		 TotalNumberOfRowsInAFeature_SizeInTermsOf16Words : in  DataFeatureRowIdx_st;
		 FeatureRowSize                                   : in  FeatureRowSize_t;
		 StartingFeatureIdx                               : in  DataFeatureIdx_st;
		 StartGrpBase                                     : in  DataFeatureSize_InMultipleOf24Words_t;
		 StartRowIdx                                      : in  DataFeatureRowIdx_st;
		 StartingPositionInRow                            : in  FeatureRowSize_t;
		 LayerDone                                        : out std_logic;
		 WriteAddrToMaster                                : out ConvEngineDataBankAddr_t;
		 LatchDDRData                                     : out std_logic;
		 ShiftDDRData                                     : out std_logic;
		 WriteFIFO                                        : out std_logic;
		 ReadFIFO                                         : out std_logic;
		 TempStorage_Set0_Load                            : out std_logic;
		 TempStorage_Set1_Load                            : out std_logic;
		 Set0_Load                                        : out std_logic;
		 Set0_LoadZeroes                                  : out std_logic;
		 Set1_Load                                        : out std_logic;
		 Set1_LoadZeroes                                  : out std_logic;
		 Set0_Sel_DDRorFIFOorTemp                         : out std_logic_vector(1 downto 0);
		 Set1_Sel_DDRorFIFOorTemp                         : out std_logic_vector(1 downto 0);
		 FIFOInSel_DDRorTemp                              : out std_logic;
		 RqstToDDR                                        : out std_logic;
		 DDR_LayerIdx                                     : out LayerIdx_st;
		 DDR_FeatureIdx                                   : out DataFeatureIdx_st;
		 DDR_GroupIdxInAFeature                           : out DataFeatureSize_InMultipleOf24Words_t;
		 AckFromDDR                                       : in  std_logic);
end component ConvEngineDataDDRToBank_Control;
--#End	 --Component

--#Begin --Type
--#End 	--Type

--#Begin --Signal
signal LatchDDRData:  std_logic;
signal ShiftDDRData:  std_logic;
signal WriteFIFO:  std_logic;
signal ReadFIFO:  std_logic;
signal TempStorage_Set0_Load:  std_logic;
signal TempStorage_Set1_Load:  std_logic;
signal Set0_Load:  std_logic;
signal Set0_LoadZeroes:  std_logic;
signal Set1_Load:  std_logic;
signal Set1_LoadZeroes:  std_logic;
signal Set0_Sel_DDRorFIFOorTemp:  std_logic_vector(1 downto 0); -- Three possible values
signal Set1_Sel_DDRorFIFOorTemp:  std_logic_vector(1 downto 0);
signal FIFOInSel_DDRorTemp:  std_logic;
--#End	 --Signal
begin

--#BEgin --Port Map
DataPath: ConvEngineDataDDRTOBank_DataPath
	port map(
		clk                      => clk,
		rst                      => rst,
		DataFromDDR              => DataFromDDR,
		LatchDDRData             => LatchDDRData,
		ShiftDDRData             => ShiftDDRData,
		WriteFIFO                => WriteFIFO,
		ReadFIFO                 => ReadFIFO,
		TempStorage_Set0_Load    => TempStorage_Set0_Load,
		TempStorage_Set1_Load    => TempStorage_Set1_Load,
		Set0_Load                => Set0_Load,
		Set0_LoadZeroes          => Set0_LoadZeroes,
		Set1_Load                => Set1_Load,
		Set1_LoadZeroes          => Set1_LoadZeroes,
		Set0_Sel_DDRorFIFOorTemp => Set0_Sel_DDRorFIFOorTemp,
		Set1_Sel_DDRorFIFOorTemp => Set1_Sel_DDRorFIFOorTemp,
		FIFOInSel_DDRorTemp      => FIFOInSel_DDRorTemp,
		DataToDataBank           => DataToDataBank,
		IdxToDataBank            => IdxToDataBank
	);
Control: ConvEngineDataDDRToBank_Control
	port map(
		clk                                              => clk,
		rst                                              => rst,
		RqstFromMainCtrlToLoadLayer                      => RqstFromMainCtrlToLoadLayer,
		RqstToMainCtrl                                   => RqstToMainCtrl,
		AckFromMainCtrl                     			 => AckFromMainCtrl,
		LayerBase										 => LayerBase,
		CurrLayerIdx                                     => CurrLayerIdx,
		TotalFeaturesInLayer                             => TotalFeaturesInLayer,
		TotalNumberOfRowsInAFeature_SizeInTermsOf16Words => TotalNumberOfRowsInAFeature_SizeInTermsOf16Words,
		FeatureRowSize                                   => FeatureRowSize,
		StartingFeatureIdx                               => StartingFeatureIdx,
		StartGrpBase                                     => StartGrpBase,
		StartRowIdx                                      => StartRowIdx,
		StartingPositionInRow                            => StartingPositionInRow,
		LayerDone                                        => LayerDone,
		WriteAddrToMaster								 => WriteAddrToMaster,
		LatchDDRData                                     => LatchDDRData,
		ShiftDDRData                                     => ShiftDDRData,
		WriteFIFO                                        => WriteFIFO,
		ReadFIFO                                         => ReadFIFO,
		TempStorage_Set0_Load                            => TempStorage_Set0_Load,
		TempStorage_Set1_Load                            => TempStorage_Set1_Load,
		Set0_Load                                        => Set0_Load,
		Set0_LoadZeroes                                  => Set0_LoadZeroes,
		Set1_Load                                        => Set1_Load,
		Set1_LoadZeroes                                  => Set1_LoadZeroes,
		Set0_Sel_DDRorFIFOorTemp                         => Set0_Sel_DDRorFIFOorTemp,
		Set1_Sel_DDRorFIFOorTemp                         => Set1_Sel_DDRorFIFOorTemp,
		FIFOInSel_DDRorTemp                              => FIFOInSel_DDRorTemp,
		RqstToDDR                                        => RqstToDDR,
		DDR_LayerIdx                                     => DDR_LayerIdx,
		DDR_FeatureIdx                                   => DDR_FeatureIdx,
		DDR_GroupIdxInAFeature                           => DDR_GroupIdxInAFeature,
		AckFromDDR                                       => AckFromDDR
	);
--#End	 --Port Map

end Behavioral;
