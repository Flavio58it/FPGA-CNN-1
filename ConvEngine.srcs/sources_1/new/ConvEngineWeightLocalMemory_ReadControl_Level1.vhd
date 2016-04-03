----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.02.2016 09:00:06
-- Design Name: 
-- Module Name: ConvEngineWeightLocalMemory_Control - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ConvEngineWeightLocalMemory_ReadControl_Level1 is	-- Tested on 13thFeb2016
  Port (clk,rst:in std_logic;
  		--Inputs from Master control--
		BaseReadPointer: in LocalMemoryReadAddr_st;
  		EndReadPointer: in LocalMemoryReadAddr_st;
  		Load_Pointers: in std_logic;	-- Should be high only when pointer has to be loaded
  		IncreamentReadAdress_Enable: in std_logic;
		LastTwoBitsOfWeightKernelIndex: in Level1_BankMuxSelect_st; --MuxSelect  
		-- Output to Local Memory BRAMs		--
		SingleLocalMemoryReadEnable: out std_logic; 
		SingleLocalMemoryReadAddr: out LocalMemoryReadAddr_st;
		-- Output to Mux that choose required LocalMem
		LocalMemtoStream_MuxSelect: out  Level1_BankMuxSelect_st;
		-- Output to Master Controller
		StreamingFinished_Flag: out std_logic
  );
end ConvEngineWeightLocalMemory_ReadControl_Level1;

architecture Behavioral of ConvEngineWeightLocalMemory_ReadControl_Level1 is
--#Begin - signals
signal FinalAdress:LocalMemoryReadAddr_st;
signal EndReadPointer_Registered: LocalMemoryReadAddr_st;
signal FlagToIndicateFinish: std_logic;
--#End - signals

begin

--#Begin -- Address Generation From Base to End--------- 
ReadAdressGeneration: process (clk)
	begin
		if (clk'EVENT and clk = '1') then
        	if(rst='1') then
    			FinalAdress <= (others => '0');
    		elsif (Load_Pointers='1') then
    			FinalAdress <= BaseReadPointer;
        	elsif ( IncreamentReadAdress_Enable = '1' and FlagToIndicateFinish='0') then
				FinalAdress <=  std_logic_vector(unsigned(FinalAdress) + 1);
			end if;	
        end if; 
	end process ReadAdressGeneration;
--#End -- Address Generation From Base to End------------

--#begin --Check if reached End Pointer
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

FlagToIndicateFinish <= '1' when (EndReadPointer_Registered = FinalAdress) else
						'0';
--#end	 --Check if reached End Pointer

--#Begin --Output Assignments
	StreamingFinished_Flag<= FlagToIndicateFinish;
	SingleLocalMemoryReadAddr<= FinalAdress;
	SingleLocalMemoryReadEnable<= '1';
	LocalMemtoStream_MuxSelect<= LastTwoBitsOfWeightKernelIndex;
--#End	 --Output Assignments

end Behavioral;
