----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.03.2016 10:48:07
-- Design Name: 
-- Module Name: ConvEngineDataBank - Behavioral
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

use work.ConvEngineDataBankPkg.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ConvEngineDataBank is
  	Port (  clk,rst: in std_logic;
  		-- Data --		
  		DataInput: in ConvEngineDataBank_DataPort_t;
  		DataOutput: out ConvEngineDataBank_DataPort_t;
		--Addr
		ReadAddr: in ConvEngineDataBankAddr_t;
		WriteAddr: in ConvEngineDataBankAddr_t;
		-- Enable
		Read_En: in std_logic;
		Write_PortEn: in std_logic;
		Write_ByteWriteEn: in std_logic_vector(0 downto 0)
  	);
end ConvEngineDataBank;

architecture Behavioral of ConvEngineDataBank is
--#Begin --Component
component blk_mem_gen_SDP_Awrite288depth16384_Bread288_128BRAM
	port(clka  : IN  STD_LOGIC;
		 ena   : IN  STD_LOGIC;
		 wea   : IN  STD_LOGIC_VECTOR(0 DOWNTO 0);
		 addra : IN  STD_LOGIC_VECTOR(13 DOWNTO 0);
		 dina  : IN  STD_LOGIC_VECTOR(287 DOWNTO 0);
		 clkb  : IN  STD_LOGIC;
		 enb   : IN  STD_LOGIC;
		 addrb : IN  STD_LOGIC_VECTOR(13 DOWNTO 0);
		 doutb : OUT STD_LOGIC_VECTOR(287 DOWNTO 0));
end component blk_mem_gen_SDP_Awrite288depth16384_Bread288_128BRAM;
--#End  --Components

--#Begin --Type
--#End	 --Type

--#Begin --Signals
signal dina: std_logic_vector(287 downto 0);
signal doutb: std_logic_vector(287 downto 0);
--#End	 --Signals
begin
DataBank: blk_mem_gen_SDP_Awrite288depth16384_Bread288_128BRAM
	port map(
		clka  => clk,
		ena   => Write_PortEn,
		wea   => Write_ByteWriteEn,
		addra => WriteAddr,
		dina  => dina,
		clkb  => clk,
		enb   => Read_En,
		addrb => ReadAddr,
		doutb => doutb
	);
	
IOporc : process (DataInput,doutb)
begin
	for i in 0 to 15 loop
		--PortA_DataOutput(i) <= douta( (288-i*16)-1 downto (288-i*16)-16 ); -- Little Endian
		--PortB_DataOutput(i) <= doutb( (288-i*16)-1 downto (288-i*16)-16 );
		----Big Endian
		DataOutput(i) <= doutb((i+1)*18-1 downto i*18);
	end loop;
	for i in 0 to 287 loop
		dina(i) <= DataInput(i/18)( i mod 18);
	end loop;	
end process IOporc;

end Behavioral;
