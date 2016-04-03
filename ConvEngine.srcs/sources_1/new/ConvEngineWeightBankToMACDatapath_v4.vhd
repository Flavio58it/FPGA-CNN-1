----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.02.2016 00:45:23
-- Design Name: 
-- Module Name: ConvEngineWeightBankToMACDatapath_v3 - Behavioral
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
use work.ConvPackage.all;
use work.ConvEngineWeightBankPkg.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ConvEngineWeightBankToMACDatapath_v4 is
	Port ( clk,rst:in std_logic;
  			-- Input from Weight Bank
  			WeightBank_OuputPort: in ConvEngineWeightBank_OutputSinglePort_t;
			-- Output to MAC unit
			OutputToMACunits: out ConvUnitWeightPort_t;
			-- Control Signals From Main Control
			RowMuxSelect: ThirtyTwoMuxSelect_t;
			DirectlyFromBank :in std_logic_vector(0 to 31); -- One bit for each row in FlipFlopBank
			--BankSelect:in std_logic;	-- BankSelect =1 when Bank0 is selected for writing
			WriteAddr :in StreamBRAMWriteAddr_t;	-- Common to all BRAM of Bank which is bieng written.
			ReadAddr :in StreamBRAMReadAddr_t; -- Common to all BRAM of bank which is bieng read
			WriteEnable: in WriteEnable_t; -- Individual to each BRAM. Most tricky part 
			LoadFlipFlopRow:in  std_logic_vector(0 to 7); -- One bit for each row in FlipFLopBank
			ShiftFlipFlopRow: in std_logic_vector(0 to 7) -- One bit for each row in FlipFLopBank
			-- To main control
			
		);
end ConvEngineWeightBankToMACDatapath_v4;

architecture Behavioral of ConvEngineWeightBankToMACDatapath_v4 is
--#Begin --Components
COMPONENT blk_mem_gen_SDP_18KRAM_Awrite36depth512_Bread18
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(35 DOWNTO 0);
    clkb : IN STD_LOGIC;
    enb : IN STD_LOGIC;
    addrb : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
  );
END COMPONENT;
--#End  --Components

--#Begin --Type
type TwoWordChunk_t is array (0 to 1) of WeightWord_st; 
type FourteenWordChuck_t is array (0 to 6) of TwoWordChunk_t; 
type EightRowsOf14Words_t is array (0 to 7) of FourteenWordChuck_t;
type BRAMInput_t is array (0 to 31) of TwoWordChunk_t;
--#End	 --Type

--#Begin --Signals
signal FlipFlops: EightRowsOf14Words_t;
signal BRAMinput: BRAMInput_t;
signal Output : ConvUnitWeightPort_t;

--#End	 --Signals
begin
StreamBRAMloop: for i in 0 to 31 generate
	StreamBRAM:blk_mem_gen_SDP_18KRAM_Awrite36depth512_Bread18
	  PORT MAP (
    clka => clk,
    ena => '1',
    wea => WriteEnable(i),
    addra => WriteAddr(i),
    dina => BRAMinput(i)(1) & BRAMinput(i)(0), --Big Endian
    clkb => clk,
    enb => '1',
    addrb => ReadAddr,
    doutb => OutputToMACunits(i)
  );
	end generate;

--#Begin -- Input to BRAM from
InputToStreamBank : process (WeightBank_OuputPort,FlipFlops,DirectlyFromBank,RowMuxSelect)
begin
	for i in 0 to 31 loop
		if (DirectlyFromBank(i) = '1') then 
			BRAMInput(i)(0) <= WeightBank_OuputPort(0);
			BRAMInput(i)(1) <= WeightBank_OuputPort(1);									  
		else
			BRAMInput(i) <= FlipFlops(to_integer(unsigned(RowMuxSelect(i))))(0);
		end if;
	end loop;
end process InputToStreamBank;
--#End	-- Input to BRAM

--#Begin --FLipFlop Loading and Shifting
FlipFlopLoadingAndShifting : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			for j in 0 to 7 loop -- Row loop
				for k in 0 to 6 loop -- Loop in a single row
					for l in 0 to 1 loop -- Loop in four Words
						FlipFlops(j)(k)(l) <= (others => '0');
					end loop;
				end loop;
			end loop;
		else
			for j in 0 to 7 loop -- Loop on rows
				if (LoadFlipFlopRow(j) = '1') then
					for k in 0 to 6 loop -- Loop in a single row
						for l in 0 to 1 loop -- Loop in four Words
							FlipFlops(j)(k)(l) <= WeightBank_OuputPort((k+1)*2+l);
							--FlipFlopBanks(1)(j)(k)(l) <= WeightBank_OuputPort(1)(k*4+l+4);
						end loop;
					end loop;
				elsif (ShiftFlipFlopRow(j) = '1')then
					for k in 0 to 5 loop -- Loop in a single row
						FlipFlops(j)(k)<= FlipFlops(j)(k+1);
						--FlipFlopBanks(1)(j)(k)<= FlipFlopBanks(1)(j)(k+1);
					end loop;
					FlipFlops (j)(6)<= (others => std_logic_vector(to_unsigned(0,C_WeightBitWidth)));
					--FlipFlopBanks (1)(j)(2)<= (others => std_logic_vector(to_unsigned(0,C_WeightBitWidth)));
				end if;		
			end loop; 			
		end if;
	end if;
end process FlipFlopLoadingAndShifting;
--#End --FLipFlop Loading and Shifting
end Behavioral; 