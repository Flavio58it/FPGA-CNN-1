----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.02.2016 10:55:31
-- Design Name: 
-- Module Name: ConvEngineWeightStreaming_WriteControl_Level1 - Behavioral
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

library work;
use work.ConvPackage.all;
use work.NetworkPackage.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ConvEngineWeightStreaming_WriteControl_Level1 is
  Port ( clk,rst: in std_logic;
  		-- Inputs from Master Control
  		DataRowSize_InMultipleOfEight: in DataRowSize_InMultipleOfEight_st; -- In term of 8 pixels -- Don't change this value when DataLoad_Enable is 1
		DataRowSize_Load: in std_logic;
		BaseWritePointer: in WeightStreamingBufferWriteAddr_st;
		EndWritePointer: in WeightStreamingBufferWriteAddr_st;
		Load_BasePointer: in std_logic;
		DataLoad_Enable: in std_logic;
		--- Output to WeightStreaming block
		WeightStreamingBufferWriteAddr: out WeightStreamingBufferWriteAddr_st;
		WeightStreamingBufferBRAMWriteEnable: out WeightStreamingBufferBRAMEnable_st;
        WeightStreamingBufferBRAMByteWrite_Enable: out WeightStreamingBufferByteWriteEnable_st --Word wise write enable
		
  );
end ConvEngineWeightStreaming_WriteControl_Level1;

architecture Behavioral of ConvEngineWeightStreaming_WriteControl_Level1 is
-----type--
--type statetype is ( S_Wait, S_1, S_SampleADC
type ValueOfCountToEnableWordWrite_t is array (C_NumberofParallelWeightChannels to C_NumberofParallelShiftUnits-1) of std_logic_vector(len(C_NumberofParallelShiftUnits/C_NumberofParallelWeightChannels-1)-1 downto 0);

-- #Begin --------signals----
signal FinalWriteAddr: WeightStreamingBufferWriteAddr_st;
signal IncreamentAddr: std_logic;
signal FinishFlag: std_logic;

signal DataRowSize,ModifiedDataRowSize: DataRowSize_InMultipleOfEight_st;
signal DataRowSizeChange_Flag: std_logic;
--signal DivisionResult: std_logic_vector(len(C_NumberofParallelShiftUnits/C_NumberofParallelWeightChannels)-1 downto 0);
signal DataRowSizeChange_Count: std_logic_vector(len(C_NumberofParallelShiftUnits-1)-1 downto 0); 
signal DataRowSizeChange_Count_Rst: std_logic;
signal ValueOfCountToEnableWordWrite: ValueOfCountToEnableWordWrite_t;

signal Count,Count_Final: std_logic_vector(len(C_NumberofParallelShiftUnits/C_NumberofParallelWeightChannels-1)-1 downto 0); -- for 32 words, count is 4 downto 0
signal Count_Rst, Count_Enable: std_logic;

signal IndexReached,IncreamentedIndexReached: std_logic_vector(len(C_NumberofParallelShiftUnits)-1 downto 0); -- Can store double the value of C_NumberofParallelShiftUnits

-- #End ------------signals-------------


begin
DataWrite : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			FinalWriteAddr <= (others => '0');
		elsif (Load_BasePointer = '1') then
			FinalWriteAddr <= BaseWritePointer;
		elsif (Count_Rst = '1' and FinishFlag='0') then
			FinalWriteAddr <= std_logic_vector(unsigned(FinalWriteAddr) + 1);			
		end if;
	end if;
end process DataWrite;

 
CycleCounter : process (clk) is
begin
	if rising_edge(clk) then
		if (rst = '1' or Count_Rst = '1') then
			Count<= (others => '0');
		elsif (Count_Enable = '1' and FinishFlag='0') then
			Count<= std_logic_vector(unsigned(Count) + 1);
		end if;		
	end if;
end process CycleCounter;

LoadingDataRowSize : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			DataRowSize<= (others => '0');
			DataRowSize(0) <= '1';
			ModifiedDataRowSize<= std_logic_vector(to_unsigned(C_NumberofParallelWeightChannels,len(C_NumberofParallelShiftUnits))); -- Keep it atlest equal to 4
		elsif (DataRowSize_Load = '1') then
			DataRowSize <= DataRowSize_InMultipleOfEight;
			if (DataRowSize_InMultipleOfEight > std_logic_vector(to_unsigned(C_NumberofParallelWeightChannels,len(C_NumberofParallelShiftUnits)))) then
				ModifiedDataRowSize <= std_logic_vector(to_unsigned(C_NumberofParallelWeightChannels,len(C_NumberofParallelShiftUnits)));
			else
				ModifiedDataRowSize <= DataRowSize_InMultipleOfEight;
			end if;
		end if;
	end if;
end process LoadingDataRowSize;

---#Begin -- Logic to insert cycle index as soon as Row size change
FlagforDataRowChange : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or DataRowSizeChange_Count_Rst='1' then
			DataRowSizeChange_Flag <= '0';
		elsif (DataRowSize_Load = '1' and DataRowSize /= DataRowSize_InMultipleOfEight) then
			DataRowSizeChange_Flag<= '1';			
		end if;
	end if;
end process FlagforDataRowChange;

StartCountToLoadAtRowSizeChange : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or  DataRowSizeChange_Count_Rst='1' then
			DataRowSizeChange_Count <= std_logic_vector(to_unsigned(C_NumberofParallelWeightChannels,len(C_NumberofParallelShiftUnits)));
		elsif (DataRowSizeChange_Flag= '1') then
			DataRowSizeChange_Count <= std_logic_vector(unsigned(DataRowSizeChange_Count) + 1);
		end if;
	end if;
end process StartCountToLoadAtRowSizeChange;

DataRowSizeChange_Count_Rst <= '1' when DataRowSizeChange_Count= std_logic_vector(to_unsigned(C_NumberofParallelShiftUnits,len(C_NumberofParallelShiftUnits)) -1) else
							   '0';
FlopsToCompareWithCount : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			ValueOfCountToEnableWordWrite <= (others => (std_logic_vector(to_unsigned(0,len(C_NumberofParallelShiftUnits/C_NumberofParallelWeightChannels))))); -- Making every bit of array 0
		elsif(DataRowSizeChange_Flag= '1') then
			for i in C_NumberofParallelWeightChannels+1 to C_NumberofParallelShiftUnits-1 loop
				ValueOfCountToEnableWordWrite(i) <= ValueOfCountToEnableWordWrite(i-1); 	
			end loop;
			ValueOfCountToEnableWordWrite(C_NumberofParallelWeightChannels) <= std_logic_vector( (unsigned(DataRowSizeChange_Count)/ unsigned(ModifiedDataRowSize)));
		end if;
	end if;
end process FlopsToCompareWithCount;


---#End -- Logic to insert cycle index as soon as Row size change


FinalIndexReached : process (clk) is
begin
	if rising_edge(clk) then
		if (rst = '1' or Count_Rst= '1') then
			IndexReached <= (others => '0');
		elsif (DataLoad_Enable='1' and FinishFlag='0') then
--			if (unsigned(DataRowSize) > C_NumberofParallelWeightChannels) then
--				IndexReached <= std_logic_vector(unsigned(IndexReached) + unsigned(DataRowSize));
--			else
--				IndexReached <= std_logic_vector(unsigned(IndexReached) + C_NumberofParallelWeightChannels);
--			end if;
			IndexReached <= std_logic_vector(unsigned(IndexReached) + unsigned(ModifiedDataRowSize));
		end if;
	end if;
end process FinalIndexReached;

FinishFlagFlop : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or Load_BasePointer='1' then
			FinishFlag <= '0';
		elsif (FinalWriteAddr = EndWritePointer and Count_Rst='1') then
			FinishFlag <= '1';
		end if;
	end if;
end process FinishFlagFlop;

--WordWriting : process is
--begin
--	for i in 0 to C_NumberofParallelShiftUnits/C_NumberofParallelWeightChannels-1 loop
--		for j in 0 to C_NumberofParallelWeightChannels-1 loop
--			if (i <)
--			WeightStreamingBufferBRAMByteWrite_Enable(i) <= '1' when (Count_Final = Count) else
--		end loop;												'0';	
--	end loop;
--end process WordWriting;


--Count_Final <= std_logic_vector(C_NumberofParallelShiftUnits/unsigned(DataRowSize)) when unsigned(DataRowSize) > C_NumberofParallelWeightChannels else
--			   std_logic_vector(C_NumberofParallelShiftUnits/C_NumberofParallelWeightChannels);
--Count_Rst <= '1' when (Count= std_logic_vector(unsigned(Count_Final)-1) ) else

--FinishFlag <= '1' when FinalWriteAddr = EndWritePointer and Count_Rst='1' else
--	 		  '0';

--IncreamentAddr<= '0' when FinalWriteAddr = EndWritePointer else
--				 Count_Rst; 


Count_Rst <= '1' when unsigned(IndexReached) > C_NumberofParallelShiftUnits-C_NumberofParallelWeightChannels else --Here Index Reached > 28
			 '0';
IncreamentedIndexReached<= std_logic_vector(unsigned(IndexReached) + unsigned(DataRowSize) - 1);
WordWriteEnable: process (Count,ValueOfCountToEnableWordWrite,DataLoad_Enable)
begin
--	if (unsigned(IndexReached) < C_NumberofParallelShiftUnits-C_NumberofParallelWeightChannels) then
--		if (unsigned(DataRowSize) > C_NumberofParallelWeightChannels) then
--			WeightStreamingBufferBRAMByteWrite_Enable(to_integer(unsigned(IndexReached)) to to_integer(unsigned(IncreamentedIndexReached)) ) <= (others => '1');
--		else
--			WeightStreamingBufferBRAMByteWrite_Enable(to_integer(unsigned(IndexReached)) to to_integer(unsigned(IncreamentedIndexReached))+3 )<= (others => '1');
--		end if;
--	end if;
	for i in 0 to C_NumberofParallelWeightChannels-1 loop
		if (Count = std_logic_vector(to_unsigned(0,len(C_NumberofParallelShiftUnits/C_NumberofParallelWeightChannels)))) then
			WeightStreamingBufferBRAMByteWrite_Enable(i) <= '1';
		else
			WeightStreamingBufferBRAMByteWrite_Enable(i) <= '0';
		end if;
	end loop;	
	
	for i in C_NumberofParallelWeightChannels to C_NumberofParallelShiftUnits-1 loop
		if (Count = ValueOfCountToEnableWordWrite(i)) then
			WeightStreamingBufferBRAMByteWrite_Enable(i) <= '1';
		else
			WeightStreamingBufferBRAMByteWrite_Enable(i) <= '0';
		end if;
	end loop;
end process;

WeightStreamingBufferBRAMWriteEnable <= (others => '1') when DataLoad_Enable='1' else
										 (others => '0');


WeightStreamingBufferWriteAddr <= FinalWriteAddr;
end Behavioral;
