----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.03.2016 11:25:09
-- Design Name: 
-- Module Name: ConvEngineOutput_Datapath - Behavioral
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


entity ConvEngineOutput_Datapath is --34,00 LUTs and 8704 FFs used in this entity, More resources will go if we do overflow-underflow analysis instead of pooling
  	Port (clk,rst: in std_logic;
  		  -- Data In From DSP
		  MACUnit0_Output,MACUnit1_Output,MACUnit2_Output,MACUnit3_Output: in MACUnitRawOutput_t;
		  
		  -- Control Signals
		  Latch_Outputs: in std_logic;
  		
  		  -- Output
  		  FF_Row0, FF_Row1: out MaxPooledOutput_t
  	);
end ConvEngineOutput_Datapath;

architecture Behavioral of ConvEngineOutput_Datapath is

--#Begin --Type
--type MaxPooledOutput_st is array (0 to C_ShiftUnitSize-1) of std_logic_vector(C_RawMACOutputWidth-1 downto 0);
--type MaxPooledOutput_t is array (0 to (C_NumberofMACunits/2)-1) of std_logic_vector(C_RawMACOutputWidth-1 downto 0);
--#End 	--Type

--#Begin --Signal
signal FF_Row0_unfloped, FF_Row1_unfloped: MaxPooledOutput_t;
signal FF_Row0_floped, FF_Row1_floped: MaxPooledOutput_t;
signal ComparisonResult_Row0,ComparisonResult_Row1,ComparisonResult_Row2,ComparisonResult_Row3: MaxPooledOutput_t;
--#End	 --Signal

begin
RowComparisonProc : process (MACUnit0_Output, MACUnit1_Output, MACUnit2_Output, MACUnit3_Output)
begin
	for i in 0 to (C_NumberofMACunits/2)-1 loop
		if ( signed(MACUnit0_Output(i*2)) > signed(MACUnit0_Output(i*2 +1 ))) then
			ComparisonResult_Row0(i) <= MACUnit0_Output(i*2);
		else
			ComparisonResult_Row0(i) <= MACUnit0_Output(i*2 + 1);
		end if;
		------
		if ( signed(MACUnit1_Output(i*2)) > signed(MACUnit1_Output(i*2 +1 ))) then
			ComparisonResult_Row1(i) <= MACUnit1_Output(i*2);
		else
			ComparisonResult_Row1(i) <= MACUnit1_Output(i*2 + 1);
		end if;
		--------
		if ( signed(MACUnit2_Output(i*2)) > signed(MACUnit2_Output(i*2 +1 ))) then
			ComparisonResult_Row2(i) <= MACUnit2_Output(i*2);
		else
			ComparisonResult_Row2(i) <= MACUnit2_Output(i*2 + 1);
		end if;
		--------
		if ( signed(MACUnit3_Output(i*2)) > signed(MACUnit3_Output(i*2 +1 ))) then
			ComparisonResult_Row3(i) <= MACUnit3_Output(i*2);
		else
			ComparisonResult_Row3(i) <= MACUnit3_Output(i*2 + 1);
		end if;
	end loop;
end process RowComparisonProc;

FinalPoolingProc : process (ComparisonResult_Row0, ComparisonResult_Row1, ComparisonResult_Row2, ComparisonResult_Row3)
begin
	for i in 0 to (C_NumberofMACunits/2)-1 loop
		if (signed(ComparisonResult_Row0(i)) > signed(ComparisonResult_Row1(i))) then
			FF_Row0_unfloped(i) <= ComparisonResult_Row0(i);
		else
			FF_Row0_unfloped(i) <= ComparisonResult_Row1(i);
		end if;
		----
		if (signed(ComparisonResult_Row2(i)) > signed(ComparisonResult_Row3(i))) then
			FF_Row1_unfloped(i) <= ComparisonResult_Row2(i);
		else
			FF_Row1_unfloped(i) <= ComparisonResult_Row3(i);
		end if;
	end loop;
end process FinalPoolingProc;

PooledFFProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			FF_Row0_floped<= (others => std_logic_vector(to_unsigned(0,C_RawMACOutputWidth)));
			FF_Row1_floped<= (others => std_logic_vector(to_unsigned(0,C_RawMACOutputWidth)));
		elsif (Latch_Outputs='1') then
			FF_Row0_floped<= FF_Row0_unfloped;			
			FF_Row1_floped<= FF_Row1_unfloped;
		end if;
	end if;
end process PooledFFProc;

FF_Row0<= FF_Row0_floped;
FF_Row1<= FF_Row1_floped;
end Behavioral;
