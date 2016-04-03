----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.03.2016 19:11:01
-- Design Name: 
-- Module Name: DSP_UsingLUT - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DSP_UsingLUT is
  Port ( clk   : IN  STD_LOGIC;
		 rst	: in std_logic;
		 CE_unfloped    : IN  STD_LOGIC;
		 SEL_unfloped   : IN  STD_LOGIC_VECTOR(0 DOWNTO 0);
		 PCIN_unfloped  : IN  STD_LOGIC_VECTOR(47 DOWNTO 0);
		 A_unfloped    : IN  STD_LOGIC_VECTOR(17 DOWNTO 0);
		 B_unfloped   : IN  STD_LOGIC_VECTOR(17 DOWNTO 0);
		 P     : OUT STD_LOGIC_VECTOR(47 DOWNTO 0);
		 SCLRP_unfloped : IN  STD_LOGIC);
end DSP_UsingLUT;

architecture Behavioral of DSP_UsingLUT is
component xbip_dsp48_macro_Test
	port(CLK   : IN  STD_LOGIC;
		 CE    : IN  STD_LOGIC;
		 SEL   : IN  STD_LOGIC_VECTOR(0 DOWNTO 0);
		 PCIN  : IN  STD_LOGIC_VECTOR(47 DOWNTO 0);
		 A     : IN  STD_LOGIC_VECTOR(17 DOWNTO 0);
		 B     : IN  STD_LOGIC_VECTOR(17 DOWNTO 0);
		 P     : OUT STD_LOGIC_VECTOR(47 DOWNTO 0);
		 SCLRP : IN  STD_LOGIC);
end component xbip_dsp48_macro_Test;
signal 		 CE    :   STD_LOGIC;
signal		 SEL   :   STD_LOGIC_VECTOR(0 DOWNTO 0);
signal		 PCIN  :   STD_LOGIC_VECTOR(47 DOWNTO 0);
signal		 A     :   STD_LOGIC_VECTOR(17 DOWNTO 0);
signal		 B     :   STD_LOGIC_VECTOR(17 DOWNTO 0);
signal		 SCLRP :   STD_LOGIC;
begin
dsp: xbip_dsp48_macro_Test
	port map(
		CLK   => clk,
		CE    => CE,
		SEL   => SEL,
		PCIN  => PCIN,
		A     => A,
		B     => B,
		P     => P,
		SCLRP => SCLRP
	);

proc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			CE<= '0';
			SEL <= "0";
			PCIN <= (others => '0');
			A <= (others => '0');
			B <= (others => '0');
			SCLRP <= '0';		
		else
			CE<= CE_unfloped;
			SEL <= SEL_unfloped; 
			PCIN <= PCIN_unfloped;
			A <= A_unfloped;
			B <= B_unfloped;
			SCLRP <= SCLRP_unfloped;
		end if;
	end if;
end process proc;

end Behavioral;
