----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2016 19:25:06
-- Design Name: 
-- Module Name: ConvEngineDataDDRToBank_Top_tb - Behavioral
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
use work.ReadTextFileLibrary.all;

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

entity ConvEngineDataDDRToBank_Top_tb is
--  Port ( );
end ConvEngineDataDDRToBank_Top_tb;

architecture Behavioral of ConvEngineDataDDRToBank_Top_tb is
--#Begin --Component
component ConvEngineDataDDRToBank_Top
	port(clk, rst                                         : in  std_logic;
		 DataFromDDR                                      : in  DDR_YOut;
		 RqstToDDR                                        : out std_logic;
		 DDR_LayerIdx                                     : out LayerIdx_st;
		 DDR_FeatureIdx                                   : out DataFeatureIdx_st;
		 DDR_GroupIdxInAFeature                           : out DataFeatureSize_InMultipleOf24Words_t;
		 AckFromDDR                                       : in  std_logic;
		 DataToDataBank                                   : out ConvEngineDataBank_DataPort_t;
		 IdxToDataBank                                    : out ConvEngineDataBank_IdxPort_t;
		 WriteAddrToMaster                                : out ConvEngineDataBankAddr_t;
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
		 StartingGrpOffset                                : in  DataFeatureSize_InMultipleOf24Words_t;
		 StartRowIdx                                      : in  DataFeatureRowIdx_st;
		 StartingPositionInRow                            : in  FeatureRowSize_t;
		 LayerDone                                        : out std_logic);
end component ConvEngineDataDDRToBank_Top;
--#End	 --Component
--#Begin --Type
--#End 	--Type

--#Begin --Signal
signal clk, rst                                         :   std_logic:= '0';
signal DataFromDDR                                      :   DDR_YOut;
signal RqstToDDR                                        :  std_logic;
signal DDR_LayerIdx                                     :  LayerIdx_st;
signal DDR_FeatureIdx                                   :  DataFeatureIdx_st;
signal DDR_GroupIdxInAFeature                           :  DataFeatureSize_InMultipleOf24Words_t;
signal AckFromDDR                                       :   std_logic;
signal DataToDataBank                                   :  ConvEngineDataBank_DataPort_t;
signal IdxToDataBank                                    :  ConvEngineDataBank_IdxPort_t;
signal RqstFromMainCtrlToLoadLayer                                 :   std_logic:='0';
signal RqstToMainCtrl                                    :  std_logic;
signal AckFromMainCtrl                            :   std_logic;
signal LayerBase										:  ConvEngineDataBankAddr_t:= std_logic_vector(to_unsigned(0,C_ConvEngineDataBank_AddrLength));
signal CurrLayerIdx                                     :   LayerIdx_st:=std_logic_vector(to_unsigned(3,len(MaxLayers - 1)));
signal TotalFeaturesInLayer                             :   DataFeatureIdx_st:= std_logic_vector(to_unsigned(5,len(MaxDataFeatureInALayer - 1)));
signal TotalNumberOfRowsInAFeature_SizeInTermsOf16Words :   DataFeatureRowIdx_st:= std_logic_vector(to_unsigned(9,len(MaxDataFeatureColumnSize - 1)));
signal FeatureRowSize                                   :   FeatureRowSize_t:= std_logic_vector(to_unsigned(9,6));
signal StartingFeatureIdx                               :   DataFeatureIdx_st:= std_logic_vector(to_unsigned(0,len(MaxDataFeatureInALayer - 1)));
signal StartGrpBase                                     :   DataFeatureSize_InMultipleOf24Words_t:= std_logic_vector(to_unsigned(2,len(MaxDataFeatureSize / 24 - 1)));
signal StartingGrpOffset                                :   DataFeatureSize_InMultipleOf24Words_t:= std_logic_vector(to_unsigned(0,len(MaxDataFeatureSize / 24 - 1)));
signal StartRowIdx                                      :   DataFeatureRowIdx_st:= std_logic_vector(to_unsigned(0,len(MaxDataFeatureColumnSize - 1)));
signal StartingPositionInRow                            :   FeatureRowSize_t:= std_logic_vector(to_unsigned(6,6));
signal LayerDone                                        :  std_logic;
signal WriteAddrToMaster                                :  ConvEngineDataBankAddr_t;
signal ClkPeriod: time := 5 ns;
signal ClkTick,ClkHalfTick: integer:= -1;

-- Extras
signal AckRecievedByMainCtrl_Dummy: std_logic;
-- Read File signals
signal DummyDDRDataOut: DDR_DataOut_t;
signal ReadFileRqst,ReadFileRqst_1,ReadFileRqst_2: std_logic;	
signal FileData_vector,FileData_vector_delayed: std_logic_vector(431 downto 0);
signal AckFromDDR_1, AckFromDDR_2, AckFromDDR_3,
		 AckFromDDR_6,AckFromDDR_5,AckFromDDR_4,
		 AckFromDDR_7,AckFromDDR_8,AckFromDDR_9,
		 AckFromDDR_10,AckFromDDR_11,AckFromDDR_temp: std_logic;
-- Golden output
signal GoldenDataToDataBank: ConvEngineDataBank_DataPort_t;
signal ReadGoldenRqst, ReadGoldenRqst_1: std_logic;
signal GO_Vector: std_logic_vector(287 downto 0);
-- Error
signal Error,ErrorEnable,ErrorEnable_Dummy: std_logic;
signal Error_EveryWord: std_logic_vector(0 to 15);

--#End	 --Signal

begin
 uut: ConvEngineDataDDRToBank_Top
 	port map(
 		clk                                              => clk,
 		rst                                              => rst,
 		DataFromDDR                                      => DataFromDDR,
 		RqstToDDR                                        => RqstToDDR,
 		DDR_LayerIdx                                     => DDR_LayerIdx,
 		DDR_FeatureIdx                                   => DDR_FeatureIdx,
 		DDR_GroupIdxInAFeature                           => DDR_GroupIdxInAFeature,
 		AckFromDDR                                       => AckFromDDR,
 		DataToDataBank                                   => DataToDataBank,
 		IdxToDataBank                                    => IdxToDataBank,
 		WriteAddrToMaster                                => WriteAddrToMaster,
 		RqstFromMainCtrlToLoadLayer                      => RqstFromMainCtrlToLoadLayer,
 		RqstToMainCtrl                                   => RqstToMainCtrl,
 		AckFromMainCtrl                                  => AckFromMainCtrl,
 		LayerBase                                        => LayerBase,
 		CurrLayerIdx                                     => CurrLayerIdx,
 		TotalFeaturesInLayer                             => TotalFeaturesInLayer,
 		TotalNumberOfRowsInAFeature_SizeInTermsOf16Words => TotalNumberOfRowsInAFeature_SizeInTermsOf16Words,
 		FeatureRowSize                                   => FeatureRowSize,
 		StartingFeatureIdx                               => StartingFeatureIdx,
 		StartGrpBase                                     => StartGrpBase,
 		StartingGrpOffset                                => StartingGrpOffset,
 		StartRowIdx                                      => StartRowIdx,
 		StartingPositionInRow                            => StartingPositionInRow,
 		LayerDone                                        => LayerDone
 	);
-----#Begin ** Data read from File----------
ReadTextFile (
		"/home/edcn103/Desktop/Link_to_M.tech/Project/Hardware_Implementation/PythonScripts/ConvEngineDataDDRToBank_Top_tb.txt", 
		432,
		clk,
		rst,
		ReadFileRqst,
		FileData_vector
);
ReadFileRqst_1<= RqstToDDR;
ReadFileRqst_2<= RqstToDDR after 2*ClkPeriod;
ReadFileRqst<= ReadFileRqst_1 and not ReadFileRqst_2;
AckProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			AckFromDDR_1<= '0';
			AckFromDDR_2<= '0';
			AckFromDDR_3<= '0';
			AckFromDDR_4<= '0';
			AckFromDDR_5<= '0';
			AckFromDDR_6<= '0';
			AckFromDDR_7<= '0';
			AckFromDDR_8<= '0';
			AckFromDDR_9<= '0';
			AckFromDDR_10<= '0';
			AckFromDDR_11<= '0';
		else
			AckFromDDR_1<= ReadFileRqst;
			AckFromDDR_2<= AckFromDDR_1;
			AckFromDDR_3<= AckFromDDR_2;
			AckFromDDR_4<= AckFromDDR_3;
			AckFromDDR_5<= AckFromDDR_4;
			AckFromDDR_6<= AckFromDDR_5;
			AckFromDDR_7<= AckFromDDR_6;
			AckFromDDR_8<= AckFromDDR_7;
			AckFromDDR_9<= AckFromDDR_8;
			AckFromDDR_10<= AckFromDDR_9;
			AckFromDDR_11<= AckFromDDR_10;
			AckFromDDR<= AckFromDDR_10 and (not AckFromDDR_11);
		end if;
	end if;
end process AckProc;
FileData_vector_delayed<= FileData_vector after ClkPeriod/2;

DDRproc : process (DummyDDRDataOut)
begin
	for i in 0 to 431 loop
		DataFromDDR(i) <= DummyDDRDataOut(i/18)(i mod 18);
	end loop;	
	for i in 432 to 479 loop
		DataFromDDR(i) <= '0';
	end loop;
end process DDRproc;
DummyProc : process (FileData_vector_delayed)
begin
	for i in 0 to 23 loop
		DummyDDRDataOut(i) <= FileData_vector_delayed(432-18*(i)-1 downto 432-18*(i+1)); 
	end loop;
end process DummyProc;
-----#End ** Data read from File----------

--#Begin --Golden Output ---
ReadTextFile (
		"/home/edcn103/Desktop/Link_to_M.tech/Project/Hardware_Implementation/PythonScripts/ConvEngineDataDDRToBank_Top_tb_GoldenOutput.txt", 
		288,
		clk,
		rst,
		ReadGoldenRqst,
		GO_Vector
);
ReadGoldenRqst<= RqstToMainCtrl and not ReadGoldenRqst_1;
ReadGoldenRqst_1<= RqstToMainCtrl after 2*ClkPeriod;
ErrorEnable_Dummy<= ReadGoldenRqst after ClkPeriod;
ErrorEnable<= ErrorEnable_Dummy after ClkPeriod;
GoldenProc : process (GO_Vector)
begin
	for i in 0 to 15 loop
		GoldenDataToDataBank(i) <= GO_Vector(288-18*(i)-1 downto 288-18*(i+1)); 
	end loop;
end process GoldenProc;
ErrorEveryWords : process (GoldenDataToDataBank,DataToDataBank) is
begin
	for i in 0 to 15 loop
		if (unsigned(GoldenDataToDataBank(i))= unsigned(DataToDataBank(i))) then 
			Error_EveryWord(i)<='0';
		else
			Error_EveryWord(i)<='1';
		END IF;
	end loop;
end process ErrorEveryWords;
ErrorPorc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			Error <= '0';
		elsif (ErrorEnable='1') then
			if unsigned(Error_EveryWord)=0 then
				Error<='0';
			else
				Error<='1';
			end if;
		end if;
	end if;
end process ErrorPorc;
--#End	 --Golden Output ---

--#Begin -- CLk and reset
process is
begin
  for i in 0 to 2000 loop
	ClkTick <= i;
    clk<= '1'; wait for ClkPeriod/2;
	ClkHalfTick <=i;
    clk<= '0'; wait for ClkPeriod/2;
  end loop;
end process;

process is
begin
	wait for 0.5*ClkPeriod;
	rst <= '1'; wait for 5*ClkPeriod;
	rst <= '0'; wait;
end process;
--#End -- CLk and reset

--#Begin -- Dynamic signals
process (ClkHalfTick)
begin
	if (ClkHalfTick=30) then
		--RqstFromMainCtrl<='1';
	elsif (ClkHalfTick=31) then
		--RqstFromMainCtrl<='0';
	end if;
end process;
AckRecievedByMainCtrl_Dummy<= RqstToMainCtrl after ClkPeriod;
AckAgainBack : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			AckFromMainCtrl<='0';
		else
			AckFromMainCtrl<= AckRecievedByMainCtrl_Dummy;
		end if;
	end if;
end process AckAgainBack;

RqstProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			RqstFromMainCtrlToLoadLayer<='0';
		else
			RqstFromMainCtrlToLoadLayer <= AckFromMainCtrl;
		end if;
	end if;
end process RqstProc;
--#End -- Dynamic signals

end Behavioral;
