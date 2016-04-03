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

entity ConvEngineWeightBankToMACDatapath_v3 is
	Port ( clk,rst:in std_logic;
  			-- Input from Weight Bank
  			WeightBank_OuputPort: in ConvEngineWeightBank_OutputAllPorts_t;
			-- Output to MAC unit
			OuputToMACunits: out ConvUnitWeightPort_t;
			-- Control Signals From Main Control
			DirectlyFromBank :in std_logic_vector(0 to 3); -- One bit for each row in FlipFlopBank
			BankSelect:in std_logic;	-- BankSelect =1 when Bank0 is selected for writing
			WriteAddr_PortA :in StreamBRAMAddr_t;	-- Common to all BRAM of Bank which is bieng written. WriteAddr_PortB <= WriteAddr_PortA +1
			ReadAddr_PortA :in StreamBRAMAddr_t; -- Common to all BRAM of bank which is bieng read
			ReadAddr_PortB :in StreamBRAMAddr_t; --Common to all BRAM of bank that is being read
			WriteEnable: in WriteEnable_t; -- Individual to each BRAM. Most tricky part 
			LoadFlipFlopRow:in  std_logic_vector(0 to 3); -- One bit for each row in FlipFLopBank
			ShiftFlipFlopRow: in std_logic_vector(0 to 3) -- One bit for each row in FlipFLopBank
			-- To main control
			
		);
end ConvEngineWeightBankToMACDatapath_v3;

architecture Behavioral of ConvEngineWeightBankToMACDatapath_v3 is
--#Begin --Components
COMPONENT blk_mem_gen_TDP_Awrite36read18depth1024_BsameasA_1BRAM
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(35 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    clkb : IN STD_LOGIC;
    enb : IN STD_LOGIC;
    web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addrb : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    dinb : IN STD_LOGIC_VECTOR(35 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
  );
END COMPONENT;
--#End  --Components

--#Begin --Type
type Addr_type is array(0 to 1) of StreamBRAMAddr_t;
type FourWordChunk_t is array (0 to 3) of WeightWord_st; 
type TwelveWordChuck_t is array (0 to 2) of FourWordChunk_t; 
type FourRowsOf12Words_t is array (0 to 3) of TwelveWordChuck_t;
type TwoSetOfFlipFlop_t is array (0 to 1) of FourRowsOf12Words_t;

--type BRAMInput_st is array (0 to 7) of FourWordChunk_t;
type BRAMInput_t is array (0 to 3) of FourWordChunk_t; -- Common to both weight bank
type BankOutputs_t is array (0 to 1) of ConvUnitWeightPort_t;
--#End	 --Type

--#Begin --Signals
signal Addr_PortA : Addr_type;
signal Addr_PortB : Addr_type;
signal FlipFlopBanks: TwoSetOfFlipFlop_t;
signal BRAMInput_Set0: BRAMInput_t; -- Common to both weight bank
signal BRAMInput_Set1: BRAMInput_t; 
signal BankOutputs: BankOutputs_t;
--#End	 --Signals
begin

StreamBRAMs_level2 : for i in 0 to 1 generate
	StreamBRAMs_level1: for j in 0 to 15 generate
		StreamBRAM: blk_mem_gen_TDP_Awrite36read18depth1024_BsameasA_1BRAM
--		  
			PORT map(
				clka  => clk,
				ena   => '1',
				wea   => wea,
				addra => addra,
				dina  => dina,
				douta => douta,
				clkb  => clkb,
				enb   => enb,
				web   => web,
				addrb => addrb,
				dinb  => dinb,
				doutb => doutb
			);
--		    clka => clk,
--		    ena => '1',
--		    wea => std_logic_vector(WriteEnable(i)(j)),
--		    addra => Addr_PortA(i/2),
--		    dina => BRAMInput_Set0(j mod 4)(0) & BRAMInput_Set0(j mod 4)(1),
--		    douta => BankOutputs(i/2)(j),
--		    clkb => clk,
--		    enb => '1',
--		    web => std_logic_vector(WriteEnable(i)(j)),
--		    addrb => Addr_PortB(i/2),
--		    dinb => BRAMInput_Set0(j mod 4)(2) & BRAMInput_Set0(j mod 4)(3),
--		    doutb => BankOutputs(i/2)(j+8)
--		  ); 

--		Set1: if (i mod 2 =0) generate ---- Corresponding to 1st port of word bank
--		StreamBRAM: blk_mem_gen_TDP_Awrite36read18depth1024_BsameasA_1BRAM
--		  PORT MAP (
--		    clka => clk,
--		    ena => '1',
--		    wea => std_logic_vector(WriteEnable(i)(j)),
--		    addra => Addr_PortA(i/2),
--		    dina => BRAMInput_Set0(j mod 4)(0) & BRAMInput_Set0(j mod 4)(1),
--		    douta => BankOutputs(i/2)(j),
--		    clkb => clk,
--		    enb => '1',
--		    web => std_logic_vector(WriteEnable(i)(j)),
--		    addrb => Addr_PortB(i/2),
--		    dinb => BRAMInput_Set0(j mod 4)(2) & BRAMInput_Set0(j mod 4)(3),
--		    doutb => BankOutputs(i/2)(j+8)
--		  ); 
--		end generate Set1;
--		Set2: if (i mod 2 =1) generate	-- Corresponding to 2nd port of word bank
--		StreamBRAM: blk_mem_gen_TDP_Awrite36read18depth1024_BsameasA_1BRAM
--		  PORT MAP (
--		    clka => clk,
--		    ena => '1',
--		    wea => std_logic_vector(WriteEnable(i)(j)),
--		    addra => Addr_PortA(i/2),
--		    dina => BRAMInput_Set1(i mod 4)(0) & BRAMInput_Set1(i mod 4)(1),
--		    douta => BankOutputs(i/2)(j+16),
--		    clkb => clk,
--		    enb => '1',
--		    web => std_logic_vector(WriteEnable(i)(j)),
--		    addrb => Addr_PortB(i/2),
--		    dinb => BRAMInput_Set1(i mod 4)(2) & BRAMInput_Set1(i mod 4)(3),
--		    doutb =>BankOutputs(i/2)(j+24)
--		  ); 
--		end generate Set2;
	end generate StreamBRAMs_level1;
end generate StreamBRAMs_level2;

--#Begin --Addressing
Addr_PortA(0) <= WriteAddr_PortA when BankSelect='1' else
				ReadAddr_PortA;
Addr_PortA(1) <= WriteAddr_PortA when BankSelect='0' else
				ReadAddr_PortA;				
Addr_PortB(0)<= std_logic_vector(unsigned(Addr_PortA(0)) +1) when BankSelect='1' else -- Bank0 is being written
			 	ReadAddr_PortB; 
Addr_PortB(1)<= std_logic_vector(unsigned(Addr_PortA(1)) +1) when BankSelect='0' else -- Bank1 is being written 
			 	ReadAddr_PortB; 
--#End	 --Addressing	

	
--#Begin -- Input to BRAM from
InputToStreamBank : process (WeightBank_OuputPort,FlipFlopBanks,DirectlyFromBank)
begin
	for i in 0 to 3 loop
		if (DirectlyFromBank(i) = '1') then 
			BRAMInput_Set0(i)(0) <= WeightBank_OuputPort(0)(0);
			BRAMInput_Set0(i)(1) <= WeightBank_OuputPort(0)(1);
			BRAMInput_Set0(i)(2) <= WeightBank_OuputPort(0)(2);
			BRAMInput_Set0(i)(3) <= WeightBank_OuputPort(0)(3);

			BRAMInput_Set1(i)(0) <= WeightBank_OuputPort(1)(0); 
			BRAMInput_Set1(i)(1) <= WeightBank_OuputPort(1)(1);
			BRAMInput_Set1(i)(2) <= WeightBank_OuputPort(1)(2);
			BRAMInput_Set1(i)(3) <= WeightBank_OuputPort(1)(3);														  
		else
			BRAMInput_Set0(i) <= FlipFlopBanks(0)(i)(0);
			BRAMInput_Set1(i) <= FlipFlopBanks(1)(i)(0);
		end if;
	end loop;
end process InputToStreamBank;
--#End	-- Input to BRAM

--#Begin --FLipFlop Loading and Shifting
FlipFlopLoadingAndShifting : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			for i in 0 to 1 loop -- Set Loop
				for j in 0 to 3 loop -- Row loop
					for k in 0 to 2 loop -- Loop in a single row
						for l in 0 to 3 loop -- Loop in four Words
							FlipFlopBanks(i)(j)(k)(l) <= (others => '0');
						end loop;
					end loop;
				end loop;
			end loop;
		else
			for j in 0 to 3 loop -- Loop on rows of both set 
				if (LoadFlipFlopRow(j) = '1') then
					for k in 0 to 2 loop -- Loop in a single row
						for l in 0 to 3 loop -- Loop in four Words
							FlipFlopBanks(0)(j)(k)(l) <= WeightBank_OuputPort(0)(k*4+l+4);
							FlipFlopBanks(1)(j)(k)(l) <= WeightBank_OuputPort(1)(k*4+l+4);
						end loop;
					end loop;
				elsif (ShiftFlipFlopRow(j) = '1')then
					for k in 0 to 1 loop -- Loop in a single row
						FlipFlopBanks(0)(j)(k)<= FlipFlopBanks(0)(j)(k+1);
						FlipFlopBanks(1)(j)(k)<= FlipFlopBanks(1)(j)(k+1);
					end loop;
					FlipFlopBanks (0)(j)(2)<= (others => std_logic_vector(to_unsigned(0,C_WeightBitWidth)));
					FlipFlopBanks (1)(j)(2)<= (others => std_logic_vector(to_unsigned(0,C_WeightBitWidth)));
				end if;		
			end loop; 			
		end if;
	end if;
end process FlipFlopLoadingAndShifting;
--#End --FLipFlop Loading and Shifting

OuputToMACunits <= BankOutputs(0) when BankSelect ='0' else
				   BankOutputs(1);


end Behavioral;
