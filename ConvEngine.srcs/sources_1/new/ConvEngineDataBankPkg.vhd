----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.03.2016 15:50:56
-- Design Name: 
-- Module Name: ConvEngineDataBankPkg - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

package ConvEngineDataBankPkg is
	constant C_DataBankPortInputWidth: integer	:= 16; --in term of words
	type ConvEngineDataBank_DataPort_t is array (0 to C_DataBankPortInputWidth-1) of DataWord_st;

	constant C_ConvEngineDataBank_AddrLength : integer := 14;
	subtype ConvEngineDataBankAddr_t is STD_LOGIC_VECTOR(C_ConvEngineDataBank_AddrLength-1 DOWNTO 0); 

	constant C_ConvEngineDataBankIdxPortInputWidth: integer	:= 16; --in term of words
	type ConvEngineDataBank_IdxPort_t is array (0 to C_ConvEngineDataBankIdxPortInputWidth-1) of std_logic_vector(1 downto 0);

end package;