----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.02.2016 14:59:47
-- Design Name: 
-- Module Name: ReadTextFileLibrary - Behavioral
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
use STD.TEXTIO.all;
use IEEE.STD_LOGIC_TEXTIO.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

package ReadTextFileLibrary is
	procedure ReadTextFile
		(FileName : in string;
		 LineWidth : in integer;
		 signal clk : in std_logic;
		 signal rst : in std_logic;
		 signal ReadRqst: in std_logic;
		 signal ReadData  : out std_logic_vector
		);
end package ReadTextFileLibrary;

package body ReadTextFileLibrary is
	procedure ReadTextFile
		(FileName : in string;
		 LineWidth : in integer;
		 signal clk : in std_logic;
		 signal rst : in std_logic;
		 signal ReadRqst: in std_logic;
		 signal ReadData  : out std_logic_vector
		) is
		file FilePointer : text open read_mode is FileName;
		variable l : line;
		variable s : std_logic_vector ((LineWidth - 1) downto 0);
	begin
		wait until rst = '1';
		wait until rst = '0';
		while not endfile(FilePointer) loop
			wait until (rising_edge(clk) and  ReadRqst='1');
			readline(FilePointer,l);
			read(l,s);
			ReadData <= s;
		end loop;
		wait;
	end procedure ReadTextFile;
	
end package body ReadTextFileLibrary;


