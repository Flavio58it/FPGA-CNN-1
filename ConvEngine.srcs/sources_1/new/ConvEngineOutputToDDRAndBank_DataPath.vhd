----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.03.2016 11:34:47
-- Design Name: 
-- Module Name: ConvEngineOutputToDDRAndBank_DataPath - Behavioral
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

entity ConvEngineOutputToDDRAndBank_DataPath is
	  Port ( clk,rst: in std_logic;
	  		-- Data In --
			  MACOutput_GrpOf8Words: in MACFinalOutput_InGrpOf8_t;
			  MACOutputIdx_GrpOf8Words: in MACFinalOutputIdx_InGrpOf8_t;

			-- Control
			 FIFO_RdEn,FIFO_WrEn: in std_logic;
			 InputSEL_FromFIFOorMACUnit: in std_logic;
			 DDRGroup_LatchEn: in std_logic_vector(0 to 5);
			 BankGroup_LatchEn: in std_logic_vector(0 to 5);
			-- Select lines
			DDRSel: in std_logic;
			BankSel: in std_logic_vector(1 downto 0); -- 3 values possible
			
			-- Data Out
	  		 DataToDDR: out DDR_YOut;
			 DataToDataBank: out ConvEngineDataBank_DataPort_t;
			 DataToIdxBank: out ConvEngineDataBank_IdxPort_t
	  );
end ConvEngineOutputToDDRAndBank_DataPath;

architecture Behavioral of ConvEngineOutputToDDRAndBank_DataPath is
--#Begin --Component
component fifo_generator_Width160_Depth128
	port(clk   : IN  STD_LOGIC;
		 din   : IN  STD_LOGIC_VECTOR(159 DOWNTO 0);
		 wr_en : IN  STD_LOGIC;
		 rd_en : IN  STD_LOGIC;
		 dout  : OUT STD_LOGIC_VECTOR(159 DOWNTO 0);
		 full  : OUT STD_LOGIC;
		 empty : OUT STD_LOGIC);
end component fifo_generator_Width160_Depth128;
--#End  --Components

--#Begin --Type
type SixGroupOf8Words_t is array (0 to 5) of MACFinalOutput_InGrpOf8_t;
type SixGroupOf8Idx_t is array (0 to 5) of MACFinalOutputIdx_InGrpOf8_t;
--#End	 --Type

--#Begin --Signals
	--FIFO
signal FIFO_DataIn_Vector, FIFO_DataOut_Vector: STD_LOGIC_VECTOR(159 DOWNTO 0);
signal FIFO_DataOut: MACFinalOutput_InGrpOf8_t;
signal FIFO_DataIdxOut: MACFinalOutputIdx_InGrpOf8_t;
	-- Set of Six Groups
signal SixGroupOf8Words_DDR, SixGroupOf8Words_Bank: SixGroupOf8Words_t; 
signal SixGroupOf8Idx_DDR, SixGroupOf8Idx_Bank: SixGroupOf8Idx_t;
Signal InputToGroup: MACFinalOutput_InGrpOf8_t;
signal InputIdxToGroup: MACFinalOutputIdx_InGrpOf8_t;
	-- Output
signal DataToDDR_unfloped,DataToDDR_floped:  DDR_YOut;
signal DataToDataBank_unfloped,DataToDataBank_floped:  ConvEngineDataBank_DataPort_t;
signal DataToIdxBank_unfloped,DataToIdxBank_floped:  ConvEngineDataBank_IdxPort_t;
--#End	 --Signals

begin

--#Begin -- Proc
GroupProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			for i in 0 to 5 loop
				SixGroupOf8Words_DDR(i) <= (others => std_logic_vector(to_signed(0,18)));
				SixGroupOf8Idx_DDR(i) <= (others => std_logic_vector(to_signed(0,2)));			
			
			end loop;
		else
			for i in 0 to 5 loop
				if (DDRGroup_LatchEn(i)='1') then
					SixGroupOf8Words_DDR(i) <= InputToGroup;
					SixGroupOf8Idx_DDR(i) <= InputIdxToGroup;
				end if;
			end loop;			
		end if;
	end if;
end process GroupProc;
GroupBankProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			for i in 0 to 5 loop
				SixGroupOf8Words_Bank(i) <= (others => std_logic_vector(to_signed(0,18)));
				SixGroupOf8Idx_Bank(i) <= (others => std_logic_vector(to_signed(0,2)));			
			end loop;
		else
			for i in 0 to 5 loop
				if (BankGroup_LatchEn(i)='1') then
					SixGroupOf8Words_Bank(i) <= MACOutput_GrpOf8Words;
					SixGroupOf8Idx_Bank(i) <= MACOutputIdx_GrpOf8Words;
				end if;
			end loop;			
		end if;
	end if;
end process GroupBankProc;
--#End	 -- Proc

--#Begin	--Multiplexing
InputToGroup<= MACOutput_GrpOf8Words when InputSEL_FromFIFOorMACUnit='0' else
				  FIFO_DataOut;
InputIdxToGroup<= MACOutputIdx_GrpOf8Words when InputSEL_FromFIFOorMACUnit='0' else
				FIFO_DataIdxOut;

	--#Begin --Data To DDR
DataToDDRProc : process (SixGroupOf8Words_DDR, DDRSel, SixGroupOf8Idx_DDR)
begin
	for i in 0 to 143 loop
		DataToDDR_unfloped(i)<= SixGroupOf8Words_DDR(to_integer(unsigned(DDRSel)*3))(i/18)(i mod 18);
	end loop;
	for i in 144 to 287 loop
		DataToDDR_unfloped(i)<= SixGroupOf8Words_DDR(to_integer(unsigned(DDRSel)*3 +1))( (i-144)/18)( (i-144) mod 18);
	end loop;
	for i in 288 to 431 loop
		DataToDDR_unfloped(i)<= SixGroupOf8Words_DDR(to_integer(unsigned(DDRSel)*3 +2))( (i-288)/18)( (i-288) mod 18);
	end loop;
	--
	for i in 432 to 447 loop
		DataToDDR_unfloped(i)<= SixGroupOf8Idx_DDR(to_integer(unsigned(DDRSel)*3))( (i-432)/2)( (i-432) mod 2);
	end loop;
	for i in 448 to 463 loop
		DataToDDR_unfloped(i)<= SixGroupOf8Idx_DDR(to_integer(unsigned(DDRSel)*3 +1))( (i-448)/2)( (i-448) mod 2);
	end loop;
	for i in 464 to 479 loop
		DataToDDR_unfloped(i)<= SixGroupOf8Idx_DDR(to_integer(unsigned(DDRSel)*3 +2))( (i-464)/2)( (i-464) mod 2);
	end loop;
end process DataToDDRProc;
	--#End	 --Data To DDR

	--#Begin --Data To Bank
DataToBankProc : process (BankSel, SixGroupOf8Idx_Bank, SixGroupOf8Words_Bank)
begin
	for i in 0 to 7 loop
		DataToDataBank_unfloped(i) <= SixGroupOf8Words_Bank(to_integer(unsigned(BankSel)*2))(i);
		DataToIdxBank_unfloped(i) <= SixGroupOf8Idx_Bank(to_integer(unsigned(BankSel)*2))(i);
	end loop;
	for i in 8 to 15 loop
		DataToDataBank_unfloped(i) <= SixGroupOf8Words_Bank(to_integer(unsigned(BankSel)*2 +1))(i-8);
		DataToIdxBank_unfloped(i) <= SixGroupOf8Idx_Bank(to_integer(unsigned(BankSel)*2 +1))(i);
	end loop;
end process DataToBankProc;
	--#End	 --Data To Bank
--#End		--Multiplexing

--#Begin --PortMapping
FIFO: fifo_generator_Width160_Depth128
	port map(
		clk   => clk,
		din   => FIFO_DataIn_Vector,
		wr_en => FIFO_WrEn,
		rd_en => FIFO_RdEn,
		dout  => FIFO_DataOut_Vector,
		full  => open,
		empty => open
	);
	--#Begin --Convert DataWord_st to vector
VectToCustomConvProc : process (MACOutput_GrpOf8Words, MACOutputIdx_GrpOf8Words, FIFO_DataOut_Vector)
begin
	for i in 0 to 143 loop
		FIFO_DataIn_Vector(i) <= MACOutput_GrpOf8Words(i/18)(i mod 18);
	end loop;
	for i in 144 to 159 loop
		FIFO_DataIn_Vector(i) <= MACOutputIdx_GrpOf8Words((i-144)/2)((i-144)mod 2);
	end loop;

	for i in 0 to 7 loop
		FIFO_DataOut(i)<= FIFO_DataOut_Vector(18*(i+1)-1 downto 18*i);
		FIFO_DataIdxOut(i)<= FIFO_DataOut_Vector(144+ 2*(i+1)-1 downto 144+ 2*i);
	end loop;
end process VectToCustomConvProc;
	--#End   --Convert DataWord_st to vector
--#End	 --PortMapping

--#Begin --Output Flops 
OutputPipeLineFlops : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			DataToDDR_floped<= (others => '0');
			DataToDataBank_floped<= (others => std_logic_vector(to_signed(0,18)));
			DataToIdxBank_floped<= (others => std_logic_vector(to_signed(0,2)));
		else
			DataToDDR_floped<= DataToDDR_unfloped;			
			DataToDataBank_floped<= DataToDataBank_unfloped;
			DataToIdxBank_floped<= DataToIdxBank_unfloped;
		end if;
	end if;
end process OutputPipeLineFlops;
--#End	 --Output Flops 


--#Begin --Output Proc
DataToDDR<= DataToDDR_floped;
DataToDataBank<= DataToDataBank_floped;
DataToIdxBank<= DataToIdxBank_floped;
--#End	 --Output Proc
end Behavioral;
