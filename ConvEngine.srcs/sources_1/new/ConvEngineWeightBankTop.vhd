----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.02.2016 16:54:09
-- Design Name: 
-- Module Name: ConvEngineWeightBankTop - Behavioral
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
use work.ConvEngineWeightBankPkg.all;
use work.ConvPackage.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--#Begin --Component
--#End  --Components
--#Begin --Type
--#End	 --Type
--#Begin --Signals
--#End	 --Signals

entity ConvEngineWeightBankTop is
  Port (clk,rst: in std_logic;
  		-- Primary Read Port ---
		ReadPort_DataOutput: out ConvEngineWeightBank_OutputSinglePort_t;
		ReadPort_DataInput: in ConvEngineWeightBank_InputSinglePort_t;
		-- Data Input --
		WritePort_DataOutput: out ConvEngineWeightBank_OutputSinglePort_t;
		WritePort_DataInput: in ConvEngineWeightBank_InputSinglePort_t;
		-- Addr
		ReadAddr: in ConvEngineWeightBankReadAddr_t;
		WriteAddr: in ConvEngineWeightBankReadAddr_t;
		-- Control
		WritePort_WriteEn: in std_logic_vector(0 downto 0)
  );
end ConvEngineWeightBankTop;

architecture Behavioral of ConvEngineWeightBankTop is
--#Begin --Component
Component ConvEngineWeightBank_v2
	port(clk, rst         : in  std_logic;
		 PortA_DataInput  : in  ConvEngineWeightBank_InputSinglePort_t;
		 PortB_DataInput  : in  ConvEngineWeightBank_InputSinglePort_t;
		 PortA_DataOutput : out ConvEngineWeightBank_OutputSinglePort_t;
		 PortB_DataOutput : out ConvEngineWeightBank_OutputSinglePort_t;
		 PortA_Addr       : in  ConvEngineWeightBankReadAddr_t;
		 PortB_Addr       : in  ConvEngineWeightBankReadAddr_t;
		 PortA_En         : in  std_logic;
		 PortB_En         : in  std_logic;
		 PortA_WriteEn    : in  std_logic_vector(0 downto 0);
		 PortB_WriteEn    : in  std_logic_vector(0 downto 0));
end component ConvEngineWeightBank_v2;

--#End  --Components
--#Begin --Type
--#End	 --Type

--#Begin --Signals
--#End	 --Signals
begin
WeightBank: ConvEngineWeightBank_v2
	port map(
		clk              => clk,
		rst              => rst,
		PortA_DataInput  => WritePort_DataInput,
		PortB_DataInput  => ReadPort_DataInput,
		PortA_DataOutput => WritePort_DataOutput,
		PortB_DataOutput => ReadPort_DataOutput,
		PortA_Addr       => WriteAddr,
		PortB_Addr       => ReadAddr,
		PortA_En         => '1',
		PortB_En         => '1',
		PortA_WriteEn    => WritePort_WriteEn,
		PortB_WriteEn    => "0"
	);
end Behavioral;
