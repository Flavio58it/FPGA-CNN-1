----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.02.2016 10:28:28
-- Design Name: 
-- Module Name: ConvEngineWeightBank_tb - Behavioral
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

use work.ConvEngineWeightBankPkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ConvEngineWeightBank_tb is
--  Port ( );
end ConvEngineWeightBank_tb;

architecture Behavioral of ConvEngineWeightBank_tb is
component ConvEngineWeightBank_v2
	port(clk, rst         : in  std_logic;
		 PortA_DataInput  : in  ConvEngineWeightBank_InputSinglePort_t;
		 PortB_DataInput  : in  ConvEngineWeightBank_InputSinglePort_t;
		 PortA_DataOutput : out ConvEngineWeightBank_OutputSinglePort_t;
		 PortB_DataOutput : out ConvEngineWeightBank_OutputSinglePort_t;
		 PortA_Addr       : in  ConvEngineWeightBankReadAddr_t;
		 PortB_Addr       : in  ConvEngineWeightBankReadAddr_t;
		 PortA_En         : in  std_logic;
		 PortB_En         : in  std_logic;
		 PortA_WriteEn    : in  std_logic_vector(0 downto 0);
		 PortB_WriteEn    : in  std_logic_vector(0 downto 0));
end component ConvEngineWeightBank_v2;

signal clk, rst         :   std_logic;
signal PortA_DataInput  :   ConvEngineWeightBank_InputSinglePort_t:= (others=>std_logic_vector(to_unsigned(0,18)));
signal PortB_DataInput  :   ConvEngineWeightBank_InputSinglePort_t:= (others=>std_logic_vector(to_unsigned(0,18)));
signal PortA_DataOutput :   ConvEngineWeightBank_OutputSinglePort_t;
signal PortB_DataOutput :   ConvEngineWeightBank_OutputSinglePort_t;
signal PortA_Addr       :   ConvEngineWeightBankReadAddr_t:= (others=>'0');
signal PortB_Addr       :   ConvEngineWeightBankReadAddr_t:= (others=>'0');
signal PortA_En         :   std_logic:='0';
signal PortB_En         :   std_logic:='0';
signal PortA_WriteEn    :   std_logic_vector(0 downto 0):="0";
signal PortB_WriteEn    :   std_logic_vector(0 downto 0):="0";

signal ClkPeriod: time := 5 ns;
signal ClkTick,ClkHalfTick: integer:= 0;

begin
uut: ConvEngineWeightBank_v2
	port map(
		clk              => clk,
		rst              => rst,
		PortA_DataInput  => PortA_DataInput,
		PortB_DataInput  => PortB_DataInput,
		PortA_DataOutput => PortA_DataOutput,
		PortB_DataOutput => PortB_DataOutput,
		PortA_Addr       => PortA_Addr,
		PortB_Addr       => PortB_Addr,
		PortA_En         => PortA_En,
		PortB_En         => PortB_En,
		PortA_WriteEn    => PortA_WriteEn,
		PortB_WriteEn    => PortB_WriteEn
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

process (ClkHalfTick, PortA_Addr)
begin
	if (ClkHalfTick=30) then
		PortA_DataInput<= (others=>std_logic_vector(to_unsigned(5,18)));
		PortA_Addr<= std_logic_vector(to_unsigned(5,14));
		PortA_En<= '1';
		PortA_WriteEn<= "1";
	elsif (ClkHalfTick=31) then
		PortA_DataInput<= (others=>std_logic_vector(to_unsigned(5,18)));
		PortA_Addr<= std_logic_vector(to_unsigned(5,14));
		PortA_En<= '0';
		PortA_WriteEn<= "0";
	elsif (ClkHalfTick=39) then
		PortA_En<= '1';
	end if;
end process;

end Behavioral;
