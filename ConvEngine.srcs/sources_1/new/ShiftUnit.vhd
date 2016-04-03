----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.01.2016 10:52:41
-- Design Name: 
-- Module Name: ShiftUnit - Behavioral
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

entity ShiftUnit is
  Port ( InputWords: in ShiftPort_t;
         PrevUnit_in: in DataWord_st; 
         clk,rst,ShiftEn: in std_logic;
         OutputWords: out  ShiftPort_t
       );

end ShiftUnit;

architecture Behavioral of ShiftUnit is
----- signals ----------------
signal Dummy: std_logic_vector( (C_DataBitWidth-1) downto 0);

signal OutputWords_FF: ShiftPort_t;
---------------------------
begin 
  process (clk)
    begin
      if (clk'EVENT and clk = '1') then
        if(rst='1') then
          for i in 0 to (C_ShiftUnitSize-1) loop
            OutputWords_FF(i) <=  (others => '0');
          end loop;  

        elsif (ShiftEn='1') then
          for i in 0 to (C_ShiftUnitSize-1) loop
            if (i=(C_ShiftUnitSize-1)) then 
              OutputWords_FF(i)<=PrevUnit_in; 
            else
              OutputWords_FF(i)<= OutputWords_FF(i+1);
            end if;
          end loop; 
   
        elsif (ShiftEn='0') then
          OutputWords_FF<= InputWords;
        end if;  
      end if;
  end process;

-------Combinational signals----------
OutputWords<= OutputWords_FF;
end Behavioral;
