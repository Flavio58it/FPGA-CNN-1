----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.02.2016 12:12:07
-- Design Name: 
-- Module Name: ConvEngineWeightStreaming_Control - Behavioral
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
use work.ConvPackage.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values


-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ConvEngineWeightStreaming_ReadControl_Level1 is
	Port ( 	
			clk,rst: in std_logic;
			------------Inputs from Master Control-----------
			Load_Pointers: in std_logic; ---- Should be high only when pointer has to be loaded
			IncreamentReadAdress_Enable: in std_logic; --Tells if we should increament the read address 
			BaseReadPointer: in  WeightStreamingBufferReadAddr_st;
			EndReadPointer: in WeightStreamingBufferReadAddr_st;
			-----Output to Master Control-----------
			StreamFinishFlag: out std_logic;			
			--------Outputs to Weight Streaming block------
			WeightStreamingBufferReadAddr: out WeightStreamingBufferReadAddr_st;
	     	
         	WeightStreamingBufferBRAMRead_Enable: out WeightStreamingBufferBRAMEnable_st
         	 
         	);
end ConvEngineWeightStreaming_ReadControl_Level1;

architecture Behavioral of ConvEngineWeightStreaming_ReadControl_Level1 is
------signals---------
signal FinalAdress: WeightStreamingBufferReadAddr_st;
signal FlagToIndicateFinish: std_logic;
signal EndReadPointer_Registered: LocalMemoryReadAddr_st;

------begins!!!-------------
begin
	ReadAdressGeneration: process (clk)
	begin
		if (clk'EVENT and clk = '1') then
        	if(rst='1') then
    			FinalAdress<= (others => '0');
    		elsif (Load_Pointers='1') then
    			FinalAdress <= BaseReadPointer;
        	elsif ( IncreamentReadAdress_Enable = '1' and FlagToIndicateFinish='0') then
				FinalAdress <=  std_logic_vector(unsigned(FinalAdress) + 1);
			end if;	
        end if; 
	end process ReadAdressGeneration;
	
EndPointer : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			EndReadPointer_Registered<= (others => '0');
		elsif (Load_Pointers='1') then
			EndReadPointer_Registered<= EndReadPointer;
		end if;
	end if;
end process EndPointer;	
	----------Combinational	----------
	FlagToIndicateFinish <= '1' when (EndReadPointer_Registered = FinalAdress) else
							'0';
	StreamFinishFlag<= FlagToIndicateFinish;
	WeightStreamingBufferReadAddr <= FinalAdress;
	WeightStreamingBufferBRAMRead_Enable <= (others => '1'); --Reading from all the bank always enabled
end Behavioral;
