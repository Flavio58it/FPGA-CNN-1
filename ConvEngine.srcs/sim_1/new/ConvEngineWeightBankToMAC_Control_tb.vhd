----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.02.2016 00:21:54
-- Design Name: 
-- Module Name: ConvEngineWeightBankToMAC_Control_tb - Behavioral
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

use work.ConvPackage.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ConvEngineWeightBankToMAC_Control_tb is
end ConvEngineWeightBankToMAC_Control_tb;

architecture Behavioral of ConvEngineWeightBankToMAC_Control_tb is
component ConvEngineWeightBankToMACControl_v3
	Port (  clk,rst: in std_logic;
		-- Control Signals to Datapath
		LoadFlipFlopRow: out std_logic_vector(0 to 7);
		ShiftFlipFlopRow: out std_logic_vector(0 to 7);
		DirectlyFromBank: out std_logic_vector(0 to 31);
		WriteEnable: out WriteEnable_t;
		ThirtyTwoMuxSelect: out ThirtyTwoMuxSelect_t;
		
		-- Controls from master
		FeatureRowSize: in unsigned(4 downto 0); -- In multiples of 8 words
		EnableLoading: in std_logic;
  		TellMACToWait:out std_logic;
        -- TimePass
        Counter: out unsigned(5 downto 0);
        DoneLoading:out std_logic;
        Enable: out std_logic_vector(31 downto 0);
        PrevFirstIdxOut: out unsigned(5 downto 0);
  		PrevLastIdxOut: out unsigned(5 downto 0)
  );
end component;
signal clk,rst:  std_logic;
signal LoadFlipFlopRow: std_logic_vector(0 to 7);
signal ShiftFlipFlopRow: std_logic_vector(0 to 7);
signal DirectlyFromBank: std_logic_vector(0 to 31);
signal WriteEnable: WriteEnable_t;
signal EnableLoading: std_logic;
signal InvalidData: std_logic;
signal Counter: unsigned(5 downto 0);
signal Enable: std_logic_vector(31 downto 0);
signal FeatureRowSize: unsigned(4 downto 0);
signal DoneLoading: std_logic;
signal PrevFirstIdxOut: unsigned(5 downto 0);
signal PrevLastIdxOut: unsigned(5 downto 0);
signal ThirtyTwoMuxSelect: ThirtyTwoMuxSelect_t;


signal ClkPeriod: time := 5ns;
signal ClkTick,ClkHalfTick: integer:= 0;

begin
uut: ConvEngineWeightBankToMACControl_v3
    port map(
    	clk                => clk,
    	rst                => rst,
    	LoadFlipFlopRow    => LoadFlipFlopRow,
    	ShiftFlipFlopRow   => ShiftFlipFlopRow,
    	DirectlyFromBank   => DirectlyFromBank,
    	WriteEnable        => WriteEnable,
    	ThirtyTwoMuxSelect => ThirtyTwoMuxSelect,
    	FeatureRowSize     => FeatureRowSize,
    	EnableLoading      => EnableLoading,
    	TellMACToWait        => InvalidData,
    	Counter            => Counter,
    	DoneLoading        => DoneLoading,
    	Enable             => Enable,
    	PrevFirstIdxOut    => PrevFirstIdxOut,
    	PrevLastIdxOut     => PrevLastIdxOut
    );

process is
begin
  for i in 0 to 2000 loop
	ClkTick <= i;
    clk<= '1'; wait for ClkPeriod/2;
	ClkHalfTick <=i;
    clk<= '0'; wait for ClkPeriod/2;
  end loop;
end process;

--process is
--begin
--	wait for 20*ClkPeriod;
--	rst <= '1'; wait for 5*ClkPeriod;
--	rst <= '0'; wait;
--end process;

process (ClkHalfTick)
begin
	if (ClkHalfTick=1) then
		FeatureRowSize <= to_unsigned(1,5);
		rst <= '0';
	elsif (ClkHalfTick=20) then
		rst <= '1';
	elsif (ClkHalfTick=26) then
		rst <= '0';
	elsif (ClkHalfTick=73) then
		rst <= '1';
	elsif (ClkHalfTick=75) then
		FeatureRowSize <= to_unsigned(2,5);
		rst<= '0';
	elsif (ClkHalfTick=99) then
		rst <= '1';
	elsif (ClkHalfTick=100) then
		FeatureRowSize <= to_unsigned(3,5);
		rst <= '0';
	elsif (ClkHalfTick=119) then
		rst <= '1';
	elsif (ClkHalfTick=120) then
		FeatureRowSize <= to_unsigned(28,5);		
		rst <= '0';
	end if;
end process;

EnableLoading <= '1';

end Behavioral;
