----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.01.2016 19:51:38
-- Design Name: 
-- Module Name: DataBRAM_ShiftUnitInterface - Behavioral
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
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.NetworkPackage.all;
use work.ConvPackage.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DataBRAM_ConvUnitInterface is
  Port (BRAMWord: in DataBRAMPort_t;
        clk,rst: in std_logic;
        LoadEnable: in std_logic_vector(0 to C_NumberofParallelShiftUnits-1);
        MuxSelect: in DataBRAM_ConvUnitInterfaceMuxSelect_t;
        TowardsConvUnit: out ConvUnitDataPort_t
        );
  begin
    assert (C_DataBRAMWidth < 2) report "Error:DataBRAMWidth in ConvEngine is less than 2";
end DataBRAM_ConvUnitInterface;

architecture Behavioral of DataBRAM_ConvUnitInterface is
constant     C_MuxSelectLen: integer    := len(C_DataBRAMWidth-1);
---------signals -------
signal TowardsConvUnit_FF: ConvUnitDataPort_t;
----------
begin
--------- f
  process(clk)
  begin
    if (clk'EVENT and clk = '1') then
      if(rst='0') then
        for i in 0 to  C_NumberofParallelShiftUnits-1 loop
          for j in 0 to C_ShiftUnitSize-1 loop
            TowardsConvUnit_FF(i)(j)<= (others=>'0');
          end loop;
        end loop;

      else
        for i in 0 to  C_NumberofParallelShiftUnits-1 loop
          if (LoadEnable(i)='1') then
            TowardsConvUnit_FF(i)<= BRAMWord(to_integer(Unsigned(MuxSelect(i mod C_DataBRAMWidth))));
          end if;
        end loop;
      end if;          
    end if;
  end process;
-----Combinational assignments
  TowardsConvUnit<= TowardsConvUnit_FF;
end Behavioral;
