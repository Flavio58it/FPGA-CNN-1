----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.03.2016 10:54:01
-- Design Name: 
-- Module Name: FIFO_tb - Behavioral
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

entity FIFO_tb is
--  Port ( );
end FIFO_tb;

architecture Behavioral of FIFO_tb is
--#Begin --Component
component fifo_generator_Width160_Depth16_ProgrammedFullFlagatDepth6_DistributedRAM
	port(clk       : IN  STD_LOGIC;
		 din       : IN  STD_LOGIC_VECTOR(159 DOWNTO 0);
		 wr_en     : IN  STD_LOGIC;
		 rd_en     : IN  STD_LOGIC;
		 dout      : OUT STD_LOGIC_VECTOR(159 DOWNTO 0);
		 full      : OUT STD_LOGIC;
		 empty     : OUT STD_LOGIC;
		 prog_full : OUT STD_LOGIC);
end component fifo_generator_Width160_Depth16_ProgrammedFullFlagatDepth6_DistributedRAM;
--#End	 --Component
--#Begin --Type
--#End 	--Type
--#Begin --Signal
signal clk   :   STD_LOGIC;
signal din   :   STD_LOGIC_VECTOR(159 DOWNTO 0):= std_logic_vector(to_unsigned(0,160));
signal wr_en :   STD_LOGIC:='0';
signal rd_en :   STD_LOGIC:='0';
signal dout  :  STD_LOGIC_VECTOR(159 DOWNTO 0);
signal full  :  STD_LOGIC;
signal empty :  STD_LOGIC;
signal Prog_full: std_logic;

signal ClkPeriod: time := 5 ns;
signal ClkTick,ClkHalfTick: integer:= -1;
--#End	 --Signal
begin
uut: fifo_generator_Width160_Depth16_ProgrammedFullFlagatDepth6_DistributedRAM
	port map(
		clk       => clk,
		din       => din,
		wr_en     => wr_en,
		rd_en     => rd_en,
		dout      => dout,
		full      => full,
		empty     => empty,
		prog_full => prog_full
	);
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
--#End -- CLk and reset

din<= std_logic_vector(to_unsigned(ClkHalfTick,160));
process (ClkHalfTick)
begin
	if (ClkHalfTick=30) then
		wr_en<= '1';
	elsif (ClkHalfTick=48) then
		wr_en<= '0';
	elsif (ClkHalfTick=55) then
		rd_en<= '1';
	end if;
end process;
end Behavioral;
