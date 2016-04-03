----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.03.2016 11:41:37
-- Design Name: 
-- Module Name: ConvEngineDataDDRTOBank_DataPath - Behavioral
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
--#End  --Components
--#Begin --Type
--#End	 --Type
--#Begin --Signals
--#End	 --Signals

entity ConvEngineDataDDRTOBank_DataPath is
	  Port ( clk, rst: in std_logic; 
			---- Data -In from DDR
		  	DataFromDDR: in DDR_YOut;
			
			-- Control 
			LatchDDRData: in std_logic;
			ShiftDDRData: in std_logic;
			WriteFIFO: in std_logic;
			ReadFIFO: in std_logic;
			TempStorage_Set0_Load: in std_logic;
			TempStorage_Set1_Load: in std_logic;
			Set0_Load: in std_logic;
			Set0_LoadZeroes: in std_logic;
			Set1_Load: in std_logic;
			Set1_LoadZeroes: in std_logic;
			Set0_Sel_DDRorFIFOorTemp: in std_logic_vector(1 downto 0); -- Three possible values
			Set1_Sel_DDRorFIFOorTemp: in std_logic_vector(1 downto 0);
			FIFOInSel_DDRorTemp: in std_logic;
			-- Data Out to Bank			
	  		DataToDataBank: out ConvEngineDataBank_DataPort_t; 
	  		IdxToDataBank: out ConvEngineDataBank_IdxPort_t
	  );
end ConvEngineDataDDRTOBank_DataPath;

architecture Behavioral of ConvEngineDataDDRTOBank_DataPath is
--#Begin --Component
component fifo_generator_Width160_Depth512
	port(clk   : IN  STD_LOGIC;
		 din   : IN  STD_LOGIC_VECTOR(159 DOWNTO 0);
		 wr_en : IN  STD_LOGIC;
		 rd_en : IN  STD_LOGIC;
		 dout  : OUT STD_LOGIC_VECTOR(159 DOWNTO 0);
		 full  : OUT STD_LOGIC;
		 empty : OUT STD_LOGIC);
end component fifo_generator_Width160_Depth512;
--#End  --Components

--#Begin --Type

--#End	 --Type
--#Begin --Signals
	--FIFO
signal FIFOIn_Vector, FIFOOut_Vector: STD_LOGIC_VECTOR(159 DOWNTO 0);
signal FIFODataIn, FIFODataOut: DataWordArray_GrpOf8;
signal FIFOIdxIn, FIFOIdxOut: DataIdxArray_GrpOf8;
	-- Temp Storage
signal TempStorageData_0,TempStorageData_1: DataWordArray_GrpOf8;	
signal TempStorageIdx_0, TempStorageIdx_1: DataIdxArray_GrpOf8;
	-- DDR Data
signal DDRData_Floped: DataWordArray_GrpOf24;
signal DDRIdx_Floped: DataIdxArray_GrpOf24;
signal DDR_FirstSetOf8DataWords:DataWordArray_GrpOf8;
signal DDR_FirstSetOf8IdxWords:DataIdxArray_GrpOf8;

	-- Output
signal OutputData_Set0_Floped, OutputData_Set1_Floped: DataWordArray_GrpOf8;
signal OutputIdx_Set0_Floped, OutputIdx_Set1_Floped: DataIdxArray_GrpOf8;
--#End	 --Signals
begin


--#Begin --FIFO POrt Map and Conversion
DDRToDataBankFIFO: fifo_generator_Width160_Depth512
	port map(
		clk   => clk,
		din   => FIFOIn_Vector,
		wr_en => WriteFIFO,
		rd_en => ReadFIFO,
		dout  => FIFOOut_Vector,
		full  => open,
		empty => open
	);
FIFODataIn<= DDR_FirstSetOf8DataWords when FIFOInSel_DDRorTemp='0' else
			 TempStorageData_1;
FIFOIdxIn<= DDR_FirstSetOf8IdxWords when FIFOInSel_DDRorTemp='0' else
			TempStorageIdx_1;
	--#Begin --VectorConversion 
FIFOVectConvertProc : process (FIFOOut_Vector, FIFODataIn, FIFOIdxIn)
begin
	-- Input
	for i in 0 to 143 loop
		FIFOIn_Vector(i)<= FIFODataIn(i/18)(i mod 18);
	end loop;	
	for i in 144 to 159 loop
		FIFOIn_Vector(i)<= FIFOIdxIn((i-144)/2)((i-144) mod 2);
	end loop;
	-- Output
	for i in 0 to 7 loop
		FIFODataOut(i)<= FIFOOut_Vector(18*(i+1)-1 downto 18*i);
		FIFOIdxOut(i)<= FIFOOut_Vector(144+2*(i+1)-1 downto 144+2*i);
	end loop;
end process FIFOVectConvertProc;
	--#End	 --VectorConversion 
--#End	 --FIFO POrt Map and Conversion

--#Begin --Output Flops
OutputFlops_Set0_Proc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or Set0_LoadZeroes='1' then
			OutputData_Set0_Floped<= (others => std_logic_vector(to_signed(0,C_DataBitWidth)));
			OutputIdx_Set0_Floped<= (others => std_logic_vector(to_signed(0,2)));
		elsif (Set0_Load='1') then
			if (Set0_Sel_DDRorFIFOorTemp="00") then
				OutputData_Set0_Floped<= DDR_FirstSetOf8DataWords;
				OutputIdx_Set0_Floped<= DDR_FirstSetOf8IdxWords;
			elsif (Set0_Sel_DDRorFIFOorTemp="01") then
				OutputData_Set0_Floped<= FIFODataOut;
				OutputIdx_Set0_Floped<= FIFOIdxOut;
			else
				OutputData_Set0_Floped<= TempStorageData_0;
				OutputIdx_Set0_Floped<= TempStorageIdx_0;
			end if;
		end if;
	end if;
end process OutputFlops_Set0_Proc;
OutputFlops_Set1_Proc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or Set1_LoadZeroes='1' then
			OutputData_Set1_Floped<= (others => std_logic_vector(to_signed(0,C_DataBitWidth)));
			OutputIdx_Set1_Floped<= (others => std_logic_vector(to_signed(0,2)));
		elsif (Set1_Load='1') then
			if (Set1_Sel_DDRorFIFOorTemp="00") then
				OutputData_Set1_Floped<= DDR_FirstSetOf8DataWords;
				OutputIdx_Set1_Floped<= DDR_FirstSetOf8IdxWords;
			elsif (Set1_Sel_DDRorFIFOorTemp="01") then
				OutputData_Set1_Floped<= FIFODataOut;
				OutputIdx_Set1_Floped<= FIFOIdxOut;
			else
				OutputData_Set1_Floped<= TempStorageData_1;
				OutputIdx_Set1_Floped<= TempStorageIdx_1;
			end if;
		end if;
	end if;
end process OutputFlops_Set1_Proc;
--#End --Output Flops

--#Begin --Temp Storage
TempStorageSet0Proc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			TempStorageData_0<= (others => std_logic_vector(to_signed(0,C_DataBitWidth)));
			TempStorageIdx_0<= (others => std_logic_vector(to_signed(0,2)));
		elsif (TempStorage_Set0_Load='1') then
			TempStorageData_0<= DDR_FirstSetOf8DataWords;			
			TempStorageIdx_0<= DDR_FirstSetOf8IdxWords;
		end if;
	end if;
end process TempStorageSet0Proc;
TempStorageSet1Proc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			TempStorageData_1<= (others => std_logic_vector(to_signed(0,C_DataBitWidth)));
			TempStorageIdx_1<= (others => std_logic_vector(to_signed(0,2)));
		elsif (TempStorage_Set1_Load='1') then
			TempStorageData_1<= DDR_FirstSetOf8DataWords;			
			TempStorageIdx_1<= DDR_FirstSetOf8IdxWords;
		end if;
	end if;
end process TempStorageSet1Proc;
--#End	 -- Temp Storage

--#Begin --DDR Flops
DDRFlopsProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			DDRData_Floped <= (others => std_logic_vector(to_signed(0,C_DataBitWidth)));
			DDRIdx_Floped<= (others => std_logic_vector(to_signed(0,2)));
		elsif(LatchDDRData='1') then
			for i in 0 to 23 loop
				DDRData_Floped(i) <= DataFromDDR(18*(i+1)-1 downto 18*i);
				DDRIdx_Floped(i) <= DataFromDDR(432+2*(i+1)-1 downto 432+2*i);
			end loop;			
		elsif (ShiftDDRData='1') then
			for i in 0 to 15 loop
				DDRData_Floped(i)<= DDRData_Floped(i+8);
				DDRIdx_Floped(i) <= DDRIdx_Floped(i+8);
			end loop;			
		end if;
	end if;
end process DDRFlopsProc;
DDRFirstSetProc : process (DDRData_Floped, DDRIdx_Floped)
begin
	for i in 0 to 7 loop
		DDR_FirstSetOf8DataWords(i)<= DDRData_Floped(i);		
		DDR_FirstSetOf8IdxWords(i) <= DDRIdx_Floped(i);
	end loop;
end process DDRFirstSetProc;
--#End	 --DDR Flops

--#Begin --Output
OutputProc : process (OutputData_Set0_Floped, OutputData_Set1_Floped, OutputIdx_Set0_Floped, OutputIdx_Set1_Floped)
begin
	for i in 0 to 7 loop
		DataToDataBank(i)<= OutputData_Set0_Floped(i);
		IdxToDataBank(i)<= OutputIdx_Set0_Floped(i);
	end loop;
	for i in 8 to 15 loop
		DataToDataBank(i)<= OutputData_Set1_Floped(i-8);
		IdxToDataBank(i) <= OutputIdx_Set1_Floped(i-8);
	end loop;	
end process OutputProc;

--#End	 --Output
end Behavioral;
