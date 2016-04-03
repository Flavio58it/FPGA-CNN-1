----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.01.2016 19:01:40
-- Design Name: 
-- Module Name: WeightBank - Behavioral
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
--use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.NetworkPackage.all;
use work.ConvEngineWeightBankPkg.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ConvEngineWeightBank is
	Port ( WeightBankWriteAddr: in  WeightBankWriteAddr_t;
		WeightBankReadAddr: in WeightBankReadAddr_t;
 	  	WeightBankInput: in WeightBankInput_t;
 	  	BankWriteEnable: in std_logic_vector(0 to C_NumberofWeightBanks-1);
 	  	BankReadEnable: in std_logic_vector(0 to C_NumberofWeightBanks-1);
 	  	clk,rst: in std_logic;
  		WeightBankOutput: out WeightBankOutput_t
  );
end ConvEngineWeightBank;

architecture Behavioral of ConvEngineWeightBank is
--------components----------
COMPONENT blk_mem_gen_SDP_Awrite72_Bread18
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(71 DOWNTO 0);
    clkb : IN STD_LOGIC;
    rstb : IN STD_LOGIC;
    enb : IN STD_LOGIC;
    addrb : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
  );
END COMPONENT;


-------types-------
--signal WeightBankInterface_ff: WeightBankInterface_t;
--type IntermediateOuput_st is array (0 to C_WeightBankReadWidth-1) of DataWord_st;
type IntermediateOuput_t is array (0 to C_NumberofWeightBanks-1) of std_logic_vector(C_WeightBankReadWidth*C_WeightBitWidth-1 downto 0);
type IntermediateInput_t is array (0 to C_NumberofWeightBanks-1) of std_logic_vector(C_WeightBankWriteWidth*C_WeightBitWidth-1 downto 0);

----------signals--------
signal IntermediateOuput: IntermediateOuput_t;
signal IntermediateInput: IntermediateInput_t;
signal wea: std_logic_vector(0 downto 0);

---------Begin begins!!-------
begin
  wea<= (others => '1');
	Banks:
		for i in 0 to C_NumberofWeightBanks-1 generate
			Bank: blk_mem_gen_SDP_Awrite72_Bread18 
				port map (
				    clka => clk,
				    ena => BankWriteEnable(i),
				    wea => wea,
				    addra => WeightBankWriteAddr(i),
				    --dina => WeightBankInput(i),
				    dina => IntermediateInput(i),
				    clkb => clk,
				    rstb => rst,
				    enb => BankReadEnable(i),
				    addrb => WeightBankReadAddr(i),
				    doutb => IntermediateOuput(i)
				  );
		end generate Banks;

	OutputProcess:
	process
	begin
		for i in 0 to C_NumberofWeightBanks-1 loop
			for j in 1 to C_WeightBankReadWidth	loop
              --WeightBankOutput(0)<= IntermediateOuput(0)(71 downto 53)
              --WeightBankOutput(3)<= IntermediateOuput(0)(17 downto 0)
              WeightBankOutput(i*C_WeightBankReadWidth + (4-j)) <= IntermediateOuput(i)(C_WeightBitWidth*j-1 downto C_WeightBitWidth*j-18);
			end loop;
		end loop;
	end process OutputProcess;
	
	InputProcess:
	process
	begin
		for i in 0 to C_NumberofWeightBanks-1 loop
			-- Converting array of std_logic_vector into a single std_logic_vector
			-- Array of 0 to 3 is mapped to std_logic_vector(71 downto 0)
			IntermediateInput(i)<= WeightBankInput(i)(0) & WeightBankInput(i)(1) & WeightBankInput(i)(2) & WeightBankInput(i)(3);
		end loop;
	end process InputProcess;
	
end Behavioral;
