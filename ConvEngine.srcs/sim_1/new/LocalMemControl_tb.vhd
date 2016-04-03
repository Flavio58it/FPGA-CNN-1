----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.02.2016 15:49:50
-- Design Name: 
-- Module Name: LocalMemControl_tb - Behavioral
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

use work.ConvPackage.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LocalMemControl_tb is
--  Port ( );
end LocalMemControl_tb;

architecture Behavioral of LocalMemControl_tb is
--#Begin --Component
Component ConvEngineWeightLocalMemory_ReadControl_Level1
	Port (clk,rst:in std_logic;
  		--Inputs from Master control--
		BaseReadPointer: in LocalMemoryReadAddr_st;
  		EndReadPointer: in LocalMemoryReadAddr_st;
  		Load_Pointers: in std_logic;
  		IncreamentReadAdress_Enable: in std_logic;
		-- Output to Local Memort BRAMs		--
		SingleLocalMemoryReadEnable: out std_logic; 
		SingleLocalMemoryReadAddr: out LocalMemoryReadAddr_st;
		-- Output to Master Controller
		StreamingFinished_Flag: out std_logic
  );
end component;
--#End 	 --Component

--#Begin --Signal
signal  clk,rst: std_logic:= '0';
signal	BaseReadPointer:  LocalMemoryReadAddr_st := (others => '0');
signal	EndReadPointer:  LocalMemoryReadAddr_st := (others => '0');
signal	Load_BasePointer:  std_logic:= '0';
signal	IncreamentReadAdress_Enable:  std_logic:= '0';
signal	SingleLocalMemoryReadEnable: std_logic; 
signal	SingleLocalMemoryReadAddr: LocalMemoryReadAddr_st;
signal	StreamingFinished_Flag: std_logic;

signal ClkPeriod: time := 5ns;
signal ClkTick,ClkHalfTick: integer:= 0;

constant C_AddrLength:integer := 13;
--#End	 --Signal
begin
uut: ConvEngineWeightLocalMemory_ReadControl_Level1
	port map(
		clk                         => clk,
		rst                         => rst,
		BaseReadPointer             => BaseReadPointer,
		EndReadPointer              => EndReadPointer,
		Load_Pointers            => Load_BasePointer,
		IncreamentReadAdress_Enable => IncreamentReadAdress_Enable,
		SingleLocalMemoryReadEnable => SingleLocalMemoryReadEnable,
		SingleLocalMemoryReadAddr   => SingleLocalMemoryReadAddr,
		StreamingFinished_Flag      => StreamingFinished_Flag
	);

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
	wait for 20*ClkPeriod;
	rst <= '1'; wait for 5*ClkPeriod;
	rst <= '0'; wait;
end process;

process (ClkHalfTick)
begin
	if (ClkHalfTick=35) then
		BaseReadPointer <= std_logic_vector(to_unsigned(12,C_AddrLength));
		EndReadPointer <= std_logic_vector(to_unsigned(22,C_AddrLength));
	elsif (ClkHalfTick=38) then
		Load_BasePointer<='1';
	elsif (ClkHalfTick=39) then	
		Load_BasePointer<='0';
	elsif (ClkHalfTick=45) then
		IncreamentReadAdress_Enable <= '1';
	elsif (ClkHalfTick=47) then		
		IncreamentReadAdress_Enable <= '0';
	elsif (ClkHalfTick=50) then
		IncreamentReadAdress_Enable <= '1';
	end if;
end process;

end Behavioral;
