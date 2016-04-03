----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.02.2016 11:35:14
-- Design Name: 
-- Module Name: ConvEngineWeightBankToMACTop - Behavioral
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
use work.NetworkPackage.all;
use work.ConvEngineWeightBankPkg.all;
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

entity ConvEngineWeightBankToMACTop is
  Port (clk,rst: in std_logic; 
  		-- Control From Master
  		FeatureRowSize: in unsigned(4 downto 0); -- In multiples of 8 words
		EnabelLoadingWeightsFromBank: in std_logic; 
		EnableStreamingWeightsToMAC: in std_logic;
  		-- Control To Master
  		TellMACToWait:out std_logic;
        RqstToSendWeightsFromWeightBank: out std_logic;
         -- Data From Weight bank
        WeightBank_OuputPort: in ConvEngineWeightBank_OutputSinglePort_t;
		-- Data To MAC
		OutputToMACunits: out ConvUnitWeightPort_t
        );
end ConvEngineWeightBankToMACTop;

architecture Behavioral of ConvEngineWeightBankToMACTop is
--#Begin --Component
component ConvEngineWeightBankToMACDatapath_v4
	port(clk, rst             : in  std_logic;
		 WeightBank_OuputPort : in  ConvEngineWeightBank_OutputSinglePort_t;
		 OutputToMACunits     : out ConvUnitWeightPort_t;
		 RowMuxSelect         : ThirtyTwoMuxSelect_t;
		 DirectlyFromBank     : in  std_logic_vector(0 to 31);
		 WriteAddr            : in  StreamBRAMWriteAddr_t;
		 ReadAddr             : in  StreamBRAMReadAddr_t;
		 WriteEnable          : in  WriteEnable_t;
		 LoadFlipFlopRow      : in  std_logic_vector(0 to 7);
		 ShiftFlipFlopRow     : in  std_logic_vector(0 to 7));
end component ConvEngineWeightBankToMACDatapath_v4;
component ConvEngineWeightBankToMACControl_v3
	port(clk, rst                        : in  std_logic;
		 LoadFlipFlopRow                 : out std_logic_vector(0 to 7);
		 ShiftFlipFlopRow                : out std_logic_vector(0 to 7);
		 DirectlyFromBank                : out std_logic_vector(0 to 31);
		 WriteEnable                     : out WriteEnable_t;
		 ThirtyTwoMuxSelect              : out ThirtyTwoMuxSelect_t;
		 WriteAddr                       : out StreamBRAMWriteAddr_t;
		 ReadAddr                        : out StreamBRAMReadAddr_t;
		 FeatureRowSize                  : in  unsigned(4 downto 0);
		 EnabelLoadingWeightsFromBank    : in  std_logic;
		 EnableStreamingWeightsToMAC     : in  std_logic;
		 TellMACToWait                   : out std_logic;
		 RqstToSendWeightsFromWeightBank : out std_logic);
end component ConvEngineWeightBankToMACControl_v3;
--#End  --Components

--#Begin --Type
--#End	 --Type

--#Begin --Signals
signal RowMuxSelect: ThirtyTwoMuxSelect_t;
signal DirectlyFromBank :std_logic_vector(0 to 31); -- One bit for each row in FlipFlopBank
signal WriteAddr : StreamBRAMWriteAddr_t;	-- Common to all BRAM of Bank which is bieng written.
signal ReadAddr : StreamBRAMReadAddr_t; -- Common to all BRAM of bank which is bieng read
signal WriteEnable:  WriteEnable_t; -- Individual to each BRAM. Most tricky part 
signal LoadFlipFlopRow: std_logic_vector(0 to 7); -- One bit for each row in FlipFLopBank
signal ShiftFlipFlopRow:  std_logic_vector(0 to 7);
-- Flopped version of Signal
signal RowMuxSelect_F: ThirtyTwoMuxSelect_t;
signal DirectlyFromBank_F :std_logic_vector(0 to 31); -- One bit for each row in FlipFlopBank
signal WriteAddr_F : StreamBRAMWriteAddr_t;	-- Common to all BRAM of Bank which is bieng written.
signal ReadAddr_F : StreamBRAMReadAddr_t; -- Common to all BRAM of bank which is bieng read
signal WriteEnable_F: WriteEnable_t; -- Individual to each BRAM. Most tricky part 
signal LoadFlipFlopRow_F: std_logic_vector(0 to 7); -- One bit for each row in FlipFLopBank
signal ShiftFlipFlopRow_F:  std_logic_vector(0 to 7);
signal WeightBank_OuputPort_F: ConvEngineWeightBank_OutputSinglePort_t;
--#End	 --Signals

begin
Datapath: ConvEngineWeightBankToMACDatapath_v4
	port map(
		clk                  => clk,
		rst                  => rst,
		WeightBank_OuputPort => WeightBank_OuputPort_F,
		OutputToMACunits     => OutputToMACunits,
		RowMuxSelect         => RowMuxSelect_F,
		DirectlyFromBank     => DirectlyFromBank_F,
		WriteAddr            => WriteAddr_F,
		ReadAddr             => ReadAddr_F,
		WriteEnable          => WriteEnable_F,
		LoadFlipFlopRow      => LoadFlipFlopRow_F,
		ShiftFlipFlopRow     => ShiftFlipFlopRow_F
	);

Control: ConvEngineWeightBankToMACControl_v3
	port map(
		clk                             => clk,
		rst                             => rst,
		LoadFlipFlopRow                 => LoadFlipFlopRow,
		ShiftFlipFlopRow                => ShiftFlipFlopRow,
		DirectlyFromBank                => DirectlyFromBank,
		WriteEnable                     => WriteEnable,
		ThirtyTwoMuxSelect              => RowMuxSelect,
		WriteAddr                       => WriteAddr,
		ReadAddr                        => ReadAddr,
		FeatureRowSize                  => FeatureRowSize,
		EnabelLoadingWeightsFromBank    => EnabelLoadingWeightsFromBank,
		EnableStreamingWeightsToMAC     => EnableStreamingWeightsToMAC,
		TellMACToWait                   => TellMACToWait,
		RqstToSendWeightsFromWeightBank => RqstToSendWeightsFromWeightBank
	);
	
Flopped : process (clk) is
begin
	if rising_edge(clk) then
		if rst ='1' then
			RowMuxSelect_F<= (others => "000");
			ShiftFlipFlopRow_F <= (others => '0');
			LoadFlipFlopRow_F<=  (others =>'0');
			DirectlyFromBank_F <= (others=> '0');
			WriteEnable_F <= (others => std_logic_vector(to_unsigned(0,1)));
			ReadAddr_F<= (others => '0');
			WeightBank_OuputPort_F<= (others => std_logic_vector(to_unsigned(0,18)));
		else
			RowMuxSelect_F<= RowMuxSelect;
			ShiftFlipFlopRow_F<= ShiftFlipFlopRow;
			LoadFlipFlopRow_F<= LoadFlipFlopRow;
			DirectlyFromBank_F<= DirectlyFromBank;
			WriteEnable_F<= WriteEnable;
			WriteAddr_F<= WriteAddr;
			ReadAddr_F<= ReadAddr;
			WeightBank_OuputPort_F<= WeightBank_OuputPort;
		end if;
	end if;

end process Flopped;

end Behavioral;
