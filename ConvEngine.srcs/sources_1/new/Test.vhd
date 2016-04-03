----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.02.2016 19:10:41
-- Design Name: 
-- Module Name: Test - Behavioral
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
use work.TestPackage.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Test is
PORT (
    clk,rst : IN STD_LOGIC;
	load,shift: in std_logic;
    load_Individual : in std_logic_vector(0 to 63);
    --Input:in SixtyFourRowsOf16Words_t;
	Output: out SixtyFourRowsOf16Words_t;
	ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(287 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(287 DOWNTO 0);
--    clkb : IN STD_LOGIC;
    enb : IN STD_LOGIC;
    web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addrb : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    dinb : IN STD_LOGIC_VECTOR(287 DOWNTO 0);
  	DSP_out: out DSPOutput_t
  );
end Test;

architecture Behavioral of Test is
COMPONENT blk_mem_gen_TDP_Awrite288read288depth16384_BsimilarToA_128BRAM
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(287 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(287 DOWNTO 0);
    clkb : IN STD_LOGIC;
    enb : IN STD_LOGIC;
    web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addrb : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    dinb : IN STD_LOGIC_VECTOR(287 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(287 DOWNTO 0)
  );
END COMPONENT;
COMPONENT xbip_dsp48_macro_A18_B18_P48_NoRounding
  PORT (
    CLK : IN STD_LOGIC;
    CE : IN STD_LOGIC;
    SCLR : IN STD_LOGIC;
    A : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    B : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    P : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
  );
END COMPONENT;
signal Temp: SixtyFourRowsOf16Words_t;
signal BRAMOutput: STD_LOGIC_VECTOR(287 DOWNTO 0); 
signal CE,SCLR : std_logic;
signal B_in : DSPInput_t;
signal A_in : DSPInput_t;

begin 
your_instance_name : blk_mem_gen_TDP_Awrite288read288depth16384_BsimilarToA_128BRAM
  PORT MAP (
    clka => clk,
    ena => ena,
    wea => wea,
    addra => addra,
    dina => dina,
    douta => douta,
    clkb => clk,
    enb => enb,
    web => web,
    addrb => addrb,
    dinb => dinb,
    doutb => BRAMOutput
  );

DSP: 
	for i in 0 to 31 generate
		your_instance_name_1 : xbip_dsp48_macro_A18_B18_P48_NoRounding
	  PORT MAP (
    	CLK => CLK,
    	CE => CE,
    	SCLR => SCLR,
    	A => A_in(i),
    	B => B_in(i),
    	P => DSP_out(i)
  	);
	end generate;

Proc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			for i in 0 to 63 loop -- Set Loop
				for j in 0 to 15 loop -- Row loop
					Temp(i)(j) <= (others => '0');
				end loop;
			end loop;
		elsif (shift='1') then
			for i in 0 to 63 loop -- Set Loop
				for j in 0 to 14 loop -- Row loop
					Temp(i)(j) <= Temp(i)(j+1);
				end loop;
				Temp(i)(15)<= (others => '0');
			end loop;			
		elsif (load='1') then
			for i in 0 to 63 loop -- Set Loop
				for j in 0 to 15 loop
					for k in 0 to 17 loop
						if (load_Individual(i)='1')then
							Temp(i)(j)(k) <= BRAMOutput(j*18 + k);
						end if;
					end loop;
				end loop;			
			end loop;
		end if;
	end if;
end process Proc;

OutputProc : process (Temp)
begin
	for i in 0 to 31 loop
		A_in(i) <= Temp(i)(0);
	end loop;
	for i in 32 to 63 loop
		B_in(i-32) <= Temp(i)(0);
	end loop;
	
end process OutputProc;

end Behavioral;
