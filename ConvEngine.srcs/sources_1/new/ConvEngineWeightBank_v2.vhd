----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.02.2016 14:49:02
-- Design Name: 
-- Module Name: ConvEngineWeightBank_v2 - Behavioral
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

use work.ConvEngineWeightBankPkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ConvEngineWeightBank_v2 is
  Port ( clk,rst: in std_logic;
  		-- Data Input --		
		PortA_DataInput: in ConvEngineWeightBank_InputSinglePort_t;
		PortB_DataInput: in ConvEngineWeightBank_InputSinglePort_t;
		-- Data Out --
		PortA_DataOutput: out ConvEngineWeightBank_OutputSinglePort_t;
		PortB_DataOutput: out ConvEngineWeightBank_OutputSinglePort_t;
		-- Control--
		PortA_Addr: in ConvEngineWeightBankReadAddr_t;
		PortB_Addr: in ConvEngineWeightBankReadAddr_t;
		PortA_En: in std_logic;
		PortB_En: in std_logic;
		PortA_WriteEn: in std_logic_vector(0 downto 0);
		PortB_WriteEn: in std_logic_vector(0 downto 0)
  );
end ConvEngineWeightBank_v2;

architecture Behavioral of ConvEngineWeightBank_v2 is
--#Begin --Component
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
--#End  --Components

--#Begin --Type
--#End	 --Type
--#Begin --Signals
signal dina: std_logic_vector(287 downto 0);
signal dinb: std_logic_vector(287 downto 0);
signal douta: std_logic_vector(287 downto 0);
signal doutb: std_logic_vector(287 downto 0);

--#End	 --Signals

begin

ConvEngineWeightBankUnit : blk_mem_gen_TDP_Awrite288read288depth16384_BsimilarToA_128BRAM
  PORT MAP (
    clka => clk,
    ena => PortA_En,
    wea => PortA_WriteEn,
    addra => PortA_Addr,
    dina => dina,
    douta => douta,
    clkb => clk,
    enb => PortB_En,
    web => PortB_WriteEn,
    addrb => PortB_Addr,
    dinb => dinb,
    doutb => doutb
  );

IOporc : process (PortA_DataInput,PortB_DataInput,douta,doutb)
begin
	for i in 0 to 15 loop
		--PortA_DataOutput(i) <= douta( (288-i*16)-1 downto (288-i*16)-16 ); -- Little Endian
		--PortB_DataOutput(i) <= doutb( (288-i*16)-1 downto (288-i*16)-16 );
		----Big Endian
		PortA_DataOutput(i) <= douta((i+1)*18-1 downto i*18);
		PortB_DataOutput(i) <= doutb((i+1)*18-1 downto i*18);
	end loop;
	for i in 0 to 287 loop
		dina(i) <= PortA_DataInput(i/18)( i mod 18);
		dinb(i) <= PortB_DataInput(i/18)( i mod 18);
	end loop;	
end process IOporc;

end Behavioral;
