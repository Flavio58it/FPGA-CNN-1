----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.03.2016 20:09:37
-- Design Name: 
-- Module Name: ConvEngineOutput_Top_tb - Behavioral
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
entity ConvEngineOutput_Top_tb is
--  Port ( );
end ConvEngineOutput_Top_tb;

architecture Behavioral of ConvEngineOutput_Top_tb is
--#Begin --Component
component ConvEngineOutput_Top
	port(clk, rst                                                           : in  std_logic;
		 MACUnit0_Output, MACUnit1_Output, MACUnit2_Output, MACUnit3_Output : in  MACUnitRawOutput_t;
		 LoadOutputs_FromMaster                                             : in  std_logic;
		 ClearToSendOutputs_ToMaster                                        : out std_logic;
		 LayerIdx                                                           : in  LayerIdx_st;
		 LayerBase                                                          : in  ConvEngineDataBankAddr_t;
		 FullyConnectedLayer_In                                             : in  std_logic;
		 FeatureRowSize                                                     : in  FeatureRowSize_t;
		 TotalFeaturesInLayer                                               : in  DataFeatureIdx_st;
		 TotalNumberOfRowsInAFeature_SizeInTermsOf16Words                   : in  DataFeatureRowIdx_st;
		 LastSetOfKernel                                                    : in  std_logic;
		 NumberOfSimultaneousKernel                                         : in  NumberOfSimultaneousKernel_t;
		 KernelsInLastSet                                                   : in  NumberOfSimultaneousKernel_t;
		 NetworkFitsInBank                                                  : in  std_logic;
		 NoFeatureToBeWrittenToBank                                         : in  std_logic;
		 LastPositionInRowToBeWrittenToBank                                 : in  FeatureRowSize_t;
		 LastRowToBeWrittenToBank                                           : in  DataFeatureRowIdx_st;
		 LastFeatureToBeWrittenToBank                                       : in  DataFeatureIdx_st;
		 TotalGroupsInFeature                                               : in  DataFeatureSize_InMultipleOf24Words_t;
		 FeatureRowSize_OfInputLayer                                        : in  FeatureRowSize_t;
		 RqstToBank                                                         : out std_logic;
		 AckFromBank                                                        : in  std_logic;
		 DataOut                                                            : out ConvEngineDataBank_DataPort_t;
		 IdxOut                                                             : out ConvEngineDataBank_IdxPort_t;
		 WeightBankAddr                                                     : out ConvEngineDataBankAddr_t;
		 RqstToDDR                                                          : out std_logic;
		 DDR_LayerIdx                                                       : out LayerIdx_st;
		 DDR_FeatureIdx                                                     : out DataFeatureIdx_st;
		 DDR_GroupIdxInAFeature                                             : out DataFeatureSize_InMultipleOf24Words_t;
		 DDR_DataOut                                                        : out DDR_YOut;
		 AckFromDDR                                                         : in  std_logic);
end component ConvEngineOutput_Top;
--#End	 --Component
--#Begin --Type
--#End 	--Type
--#Begin --Signal
constant C_NumberOfSimultaneousFeatures : integer := 5;
constant C_NumberOfRows: integer := 20;
constant C_InputFeatureRowSize : integer  := 5;
signal clk, rst:   std_logic;
signal MACUnit0_Output, MACUnit1_Output, MACUnit2_Output, MACUnit3_Output :   MACUnitRawOutput_t;
signal LoadOutputs_FromMaster:std_logic:='0';
signal ClearToSendOutputs_ToMaster:  std_logic;
signal LayerIdx : LayerIdx_st:= (others =>'0');
signal LayerBase:ConvEngineDataBankAddr_t:= (others=>'0');
signal FullyConnectedLayer_In:std_logic:='0';
signal FeatureRowSize:FeatureRowSize_t:= std_logic_vector(to_unsigned(3,6));
signal TotalFeaturesInLayer:DataFeatureIdx_st:= std_logic_vector(to_unsigned(5,len(MaxDataFeatureInALayer - 1)));
signal TotalNumberOfRowsInAFeature_SizeInTermsOf16Words:   DataFeatureRowIdx_st:= std_logic_vector(to_unsigned(C_NumberOfRows,len(MaxDataFeatureColumnSize)));
signal LastSetOfKernel:std_logic:='0';
signal NumberOfSimultaneousKernel:NumberOfSimultaneousKernel_t:= std_logic_vector(to_unsigned(C_NumberOfSimultaneousFeatures,len(C_MaxNuberOfParallelWeightKernels)));
signal KernelsInLastSet:NumberOfSimultaneousKernel_t:= std_logic_vector(to_unsigned(5,len(C_MaxNuberOfParallelWeightKernels)));
signal NetworkFitsInBank:std_logic:='0';
signal NoFeatureToBeWrittenToBank:std_logic:='0';
signal LastPositionInRowToBeWrittenToBank:FeatureRowSize_t:= std_logic_vector(to_unsigned(0,6));
signal LastRowToBeWrittenToBank:DataFeatureRowIdx_st:= std_logic_vector(to_unsigned(C_NumberOfRows,len(MaxDataFeatureColumnSize)));
signal LastFeatureToBeWrittenToBank:DataFeatureIdx_st:= std_logic_vector(to_unsigned(2,len(MaxDataFeatureInALayer - 1)));
signal TotalGroupsInFeature:DataFeatureSize_InMultipleOf24Words_t:= std_logic_vector(to_unsigned(20,DataFeatureSize_InMultipleOf24Words_len));
signal FeatureRowSize_OfInputLayer:FeatureRowSize_t:= std_logic_vector(to_unsigned(C_InputFeatureRowSize,6));
signal RqstToBank : std_logic;
signal AckFromBank : std_logic;
signal DataOut : ConvEngineDataBank_DataPort_t;
signal IdxOut : ConvEngineDataBank_IdxPort_t;
signal WeightBankAddr : ConvEngineDataBankAddr_t;
signal RqstToDDR : std_logic;
signal DDR_LayerIdx : LayerIdx_st;
signal DDR_FeatureIdx : DataFeatureIdx_st;
signal DDR_GroupIdxInAFeature : DataFeatureSize_InMultipleOf24Words_t;
signal DDR_DataOut : DDR_YOut;
signal AckFromDDR : std_logic;


signal ClkPeriod: time := 5 ns;
signal ClkTick,ClkHalfTick: integer:= -1;
	--Extras
signal FileData_vector,FileData_vector_delayed: std_logic_vector(2*34*C_InputFeatureRowSize*8*C_NumberOfSimultaneousFeatures-1 downto 0);	
signal ReadFileRqst:std_logic:= '0';
signal ClearToSendOutputs_ToMaster_delayed: std_logic;
signal AckFromBank_1, AckFromBank_2: std_logic;
signal AckFromDDR_1, AckFromDDR_2, AckFromDDR_3, AckFromDDR_4, AckFromDDR_5, AckFromDDR_6 : std_logic;

	-- Golden
signal GoldenOutputVector: std_logic_vector(16*18-1 downto 0);
signal GoldenOutput: ConvEngineDataBank_DataPort_t;
signal GoldenRqst, GoldenRqstTemp: std_logic;
signal WeightBankAddr_delayed: ConvEngineDataBankAddr_t;
signal Error,Error_BankData: std_logic;
signal Error_EveryWord: unsigned(0 to 15);
--#End	 --Signal
begin
uut: ConvEngineOutput_Top
	port map(
		clk                                              => clk,
		rst                                              => rst,
		MACUnit0_Output                                  => MACUnit0_Output,
		MACUnit1_Output                                  => MACUnit1_Output,
		MACUnit2_Output                                  => MACUnit2_Output,
		MACUnit3_Output                                  => MACUnit3_Output,
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
		TotalGroupsInFeature                             => TotalGroupsInFeature,
		FeatureRowSize_OfInputLayer                      => FeatureRowSize_OfInputLayer,
		RqstToBank                                       => RqstToBank,
		AckFromBank                                      => AckFromBank,
		DataOut                                          => DataOut,
		IdxOut                                           => IdxOut,
		WeightBankAddr                                   => WeightBankAddr,
		RqstToDDR                                        => RqstToDDR,
		DDR_LayerIdx                                     => DDR_LayerIdx,
		DDR_FeatureIdx                                   => DDR_FeatureIdx,
		DDR_GroupIdxInAFeature                           => DDR_GroupIdxInAFeature,
		DDR_DataOut                                      => DDR_DataOut,
		AckFromDDR                                       => AckFromDDR
	);
-----#Begin ** Data read from File----------
ReadTextFile (
		"/home/edcn103/Desktop/Link_to_M.tech/Project/Hardware_Implementation/PythonScripts/ConvEngineOutput_Top_tb.txt", 
		2*34*(C_InputFeatureRowSize*8)*C_NumberOfSimultaneousFeatures,
		clk,
		rst,
		ReadFileRqst,
		FileData_vector
);
FileData_vector_delayed<= FileData_vector after ClkPeriod/2;
VectorToWords : process (FileData_vector_delayed)
begin
	for i in 0 to C_InputFeatureRowSize*8*C_NumberOfSimultaneousFeatures-1  loop
		MACUnit0_Output(i)<= FileData_vector_delayed(2*34*C_InputFeatureRowSize*8*C_NumberOfSimultaneousFeatures-34*(i)-1 downto 2*34*C_InputFeatureRowSize*8*C_NumberOfSimultaneousFeatures-34*(i+1)); 		
		MACUnit3_Output(i)<= FileData_vector_delayed(34*C_InputFeatureRowSize*8*C_NumberOfSimultaneousFeatures-34*(i)-1 downto 34*C_InputFeatureRowSize*8*C_NumberOfSimultaneousFeatures-34*(i+1));
	end loop;
	for i in C_InputFeatureRowSize*8*C_NumberOfSimultaneousFeatures to 255 loop
		MACUnit0_Output(i)<= (others =>'0');
		MACUnit3_Output(i)<= (others =>'0');
	end loop;
end process VectorToWords;
MACUnit1_Output<= (others => std_logic_vector(to_unsigned(0,34)));
MACUnit2_Output<= (others => std_logic_vector(to_unsigned(0,34)));
-----#End ** Data read from File----------

--#Begin ----- ** Golden Output----------
ReadTextFile (
		"/home/edcn103/Desktop/Link_to_M.tech/Project/Hardware_Implementation/PythonScripts/ConvEngineOutput_Top_tb_GoldenOutput.txt", 
		16*18,
		clk,
		rst,
		GoldenRqst,
		GoldenOutputVector
);
GoldRequest : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			GoldenRqstTemp<='0';
			GoldenRqst<='0';
		else
			GoldenRqstTemp<= RqstToBank;
			GoldenRqst<= RqstToBank and not GoldenRqstTemp;	
		end if;
	end if;
end process GoldRequest;


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
process (ClkHalfTick, ClearToSendOutputs_ToMaster, ClearToSendOutputs_ToMaster_delayed, ClkPeriod)
begin
	if (ClkHalfTick=30) then
		ReadFileRqst<='1';
	elsif (ClkHalfTick=31) then
		ReadFileRqst<='0';
	elsif (ClkHalfTick=36) then
		LoadOutputs_FromMaster<='1';
	elsif (ClkHalfTick=37) then
		LoadOutputs_FromMaster<='0';
	elsif (ClkHalfTick>38) then
		ReadFileRqst<= ClearToSendOutputs_ToMaster and not ClearToSendOutputs_ToMaster_delayed;
		LoadOutputs_FromMaster<= ClearToSendOutputs_ToMaster after 2*ClkPeriod;
	end if;
end process;
ClearToSendOutputs_ToMaster_delayed<= ClearToSendOutputs_ToMaster after 2*ClkPeriod;
--#Begin --Extra FF
ExtraFFProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			AckFromBank_1 <= '0';
			AckFromBank_2 <= '0';
			AckFromDDR_1 <= '0';
			AckFromDDR_2 <= '0';
			AckFromDDR_3 <= '0';
			AckFromDDR_4 <= '0';
			AckFromDDR_5 <= '0';
			AckFromDDR_6 <= '0';
		else
			AckFromBank_1 <= GoldenRqst;
			AckFromBank_2 <= AckFromBank_1;
			AckFromBank<= AckFromBank_2;
			AckFromDDR_1 <= RqstToDDR;
			AckFromDDR_2 <= AckFromDDR_1;
			AckFromDDR_3 <= AckFromDDR_2;
			AckFromDDR_4 <= AckFromDDR_3;
			AckFromDDR_5 <= AckFromDDR_4;
			AckFromDDR_6 <=AckFromDDR_5;
			AckFromDDR<= AckFromDDR_6;
		end if;
	end if;
end process ExtraFFProc;

TP : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			WeightBankAddr_delayed<= (others=>'0');
			Error<='0';
		elsif (RqstToBank='1') then
			WeightBankAddr_delayed<= WeightBankAddr;
			if (WeightBankAddr /= std_logic_vector(unsigned(WeightBankAddr_delayed)+1)) then
				Error<='1';
			else
				Error<='0';
			end if;
		end if;
	end if;
end process TP;
--#End	 --Extra FF
ErrorProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
	
		elsif (AckFromBank_1='1') then
			for i in 0 to 15 loop
				GoldenOutput(i) <= GoldenOutputVector(288-18*(i)-1 downto 288-18*(i+1)); 
			end loop;
		end if;
	end if;
end process ErrorProc;
Erro_1Proc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			
		elsif (AckFromBank_2='1') then
			for i in 0 to 15 loop
				if (DataOut(i)/= GoldenOutput(i) ) then
					if (DataOut(15)= std_logic_vector(to_unsigned(0,18)) and i>3) then
						Error_EveryWord(i)<='0';
					else
						Error_EveryWord(i)<='1';
					end if;
				else
					Error_EveryWord(i)<='0';
				end if;
			end loop;
		end if;
	end if;
end process Erro_1Proc;
Error_BankData<= '1' when AckFromBank_2='1' and  Error_EveryWord/=0 else
				'0';

end Behavioral;
