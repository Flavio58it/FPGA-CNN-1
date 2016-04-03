----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.01.2016 19:20:38
-- Design Name: 
-- Module Name: WeightBankPkg - Behavioral
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
use work.NetworkPackage.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

package ConvEngineWeightBankPkg is
	constant C_NumberofWeightBRAMs:   integer     := 128;
	constant C_WeightBankInputWidth: integer	:= 16;--In terms of words
	constant C_NumberOfConvEngineWeightBankOutputPort: integer := 2;
	constant C_WeightBankSinglePortOutputWidth: integer	:= 16; --in term of words

	constant C_NumberOfConvEngineWeightBankInputPort: integer := 2;
	constant C_WeightBankSinglePortInputWidth: integer := 16;
	constant C_ConvEngineWeightBank_ReadAddrLength : integer := 14;
	constant C_ConvEngineWeightBank_WriteAddrLength : integer := 14;
	
	--#Begin --Version 3
	type ConvEngineWeightBank_OutputSinglePort_t is array (0 to C_WeightBankSinglePortOutputWidth-1) of WeightWord_st;
	type ConvEngineWeightBank_OutputAllPorts_t is array (0 to C_NumberOfConvEngineWeightBankOutputPort-1) of ConvEngineWeightBank_OutputSinglePort_t; 
	
	type ConvEngineWeightBank_InputSinglePort_t is array (0 to C_WeightBankSinglePortOutputWidth-1) of WeightWord_st;
    type ConvEngineWeightBank_InputAllPorts_t is array (0 to C_NumberOfConvEngineWeightBankOutputPort-1) of ConvEngineWeightBank_OutputSinglePort_t; 

	subtype ConvEngineWeightBankReadAddr_t is STD_LOGIC_VECTOR(C_ConvEngineWeightBank_ReadAddrLength-1 DOWNTO 0); 
	subtype ConvEngineWeightBankWriteAddr_t is STD_LOGIC_VECTOR(C_ConvEngineWeightBank_WriteAddrLength-1 DOWNTO 0);
	--#End	 --Version 3
	
	--#Begin --Version 2
--	constant C_NumberofWeightBRAMs:   integer     := 128;
--	constant C_WeightBankInputWidth: integer	:= 4;--In terms of words
--	constant C_WeightBankOutputWidth: integer	:= 4; --in term of words
--	constant C_ConvEngineWeightBank_OutputAddrLength : integer := 16;
--	constant C_ConvEngineWeightBank_InputAddrLength : integer := 16;
--	type ConvEngineWeightBank_Output_t is array(0 to C_WeightBankOutputWidth-1) of DataWord_st;
--	type ConvEngineWeightBank_Input_t is array(0 to C_WeightBankInputWidth-1) of DataWord_st;
--
--	subtype ConvEngineWeightBank_OutputAddr_st is std_logic_vector(C_ConvEngineWeightBank_OutputAddrLength-1 downto 0);
--	subtype ConvEngineWeightBank_InputAddr_st is std_logic_vector(C_ConvEngineWeightBank_InputAddrLength-1 downto 0);
--	
--	subtype PixelGroupIdx_st is std_logic_vector(len(MaxPixelsInAFilter/C_WeightBankOutputWidth -1)-1 downto 0); ---- Group size depends on Output width of Bank 
--  type ConvEngineWeightBank_InputAddr_t
	--#End	 --Version 2	
	
	
	--#Begin --Version 1
--	--Interface to single bank  
--	type WeightBankUnitOutput_t is array (0 to C_WeightBankReadWidth-1) of DataWord_st; 
--	type WeightBankUnitInput_t is array (0 to C_WeightBankWriteWidth-1) of DataWord_st; 
--	
--	-- Interface to entire collection of Bank
--	type WeightBankOutput_t is array (0 to (C_WeightBankReadWidth*C_NumberofWeightBanks)-1) of DataWord_st; --Bank output is always in terms of 18-bit units
--	type WeightBankInput_t is array (0 to  C_NumberofWeightBanks-1) of WeightBankUnitInput_t;
--
--	-- Bank Addressing
--	type WeightBankWriteAddr_t is array (0 to C_NumberofWeightBanks-1) of STD_LOGIC_VECTOR(8 DOWNTO 0);
--	type WeightBankReadAddr_t is array (0 to C_NumberofWeightBanks-1) of STD_LOGIC_VECTOR(10 DOWNTO 0);
	--#End  --Version 1
	
	

end ConvEngineWeightBankPkg;
