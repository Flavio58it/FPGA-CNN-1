----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.02.2016 09:03:50
-- Design Name: 
-- Module Name: ConvEngineWeightLocalMemory - Behavioral
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

library work;
use work.ConvPackage.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ConvEngineWeightLocalMemory is
  Port (clk,rst: std_logic;
		--- Input From Control---
		LocalMemoryReadAddr: in LocalMemoryReadAddr_t;
		LocalMemoryWriteAddr: in LocalMemoryWriteAddr_t;
		LocalMemoryReadEnable: in LocalMemoryEnable_st; 	
  		LocalMemoryWriteEnable: in LocalMemoryEnable_st;
  		----Input from Common Weight Bank
  		LocalMemoryInputPort: in LocalMemoryInputPort_t;
  		--- Output to Stream Engine--
  		LocalMemoryOutputPort: out LocalMemoryOutputPort_t  		
  );
end ConvEngineWeightLocalMemory;

architecture Behavioral of ConvEngineWeightLocalMemory is
-- #Begin --Component--------
COMPONENT blk_mem_gen_SDP_Awrite18depth8192_Bread18
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    clkb : IN STD_LOGIC;
    rstb : IN STD_LOGIC;
    enb : IN STD_LOGIC;
    addrb : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
  );
END COMPONENT;
-- #End --Component--------

-- #Begin --signal----------

-- #End --signal----------


begin
	
LocalBanks:
for i in 0 to C_NumberofParallelWeightChannels-1 generate
	LocalBank: blk_mem_gen_SDP_Awrite18depth8192_Bread18
  PORT MAP (
    clka => clk,
    ena => LocalMemoryWriteEnable(i),
    wea => "1",
    addra => LocalMemoryWriteAddr(i),
    dina => LocalMemoryInputPort(i),
    clkb => clk,
    rstb => rst,
    enb => LocalMemoryReadEnable(i),
    addrb => LocalMemoryReadAddr(i),
    doutb => LocalMemoryOutputPort(i)
  ); 
end generate LocalBanks;

end Behavioral;
