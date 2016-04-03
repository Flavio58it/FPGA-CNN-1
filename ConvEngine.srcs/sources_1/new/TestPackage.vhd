----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.02.2016 11:05:47
-- Design Name: 
-- Module Name: TestPackage - Behavioral
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
use work.NetworkPackage.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

package TestPackage is
	type SixteenWordChuck_t is array (0 to 15) of WeightWord_st; 
	type SixtyFourRowsOf16Words_t is array (0 to 63) of SixteenWordChuck_t;
	type DSPOutput_t is array (0 to 31) of std_logic_vector(47 downto 0);
	type DSPInput_t is array (0 to 31) of std_logic_vector(17 downto 0);
end package;
