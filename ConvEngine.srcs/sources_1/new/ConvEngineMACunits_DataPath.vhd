----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.03.2016 01:42:06
-- Design Name: 
-- Module Name: ConvEngineMACunits_DataPath - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--#Begin --Component
--#End	 --Component
--#Begin --Type
--#End 	--Type
--#Begin --Signal
--#End	 --Signal

entity ConvEngineMACunits_DataPath is
	  Port ( clk,rst: in std_logic;
	  		-- Control I/O
			MACRow_ClkEnable:in std_logic_vector(0 to 3); -- One bit for each row
 			MACRow_SCLRP: in std_logic; -- To clear P
 			MACRow_RandomPCINBit:in std_logic_vector(0 to 3);
 			MAC_FunctionSEL: in STD_LOGIC_VECTOR(0 to 0); -- To select function of DSP
 			FIFO_WriteEn: in std_logic_vector(1 to 3);
 			FIFO_ReadEn: in std_logic_vector(1 to 3);
			
			-- Data and Control I/o from/to Weight Bank
			WeighInput: in ConvUnitWeightPort_t; 
			Wait_FrmWeightStream: in std_logic;
			Enable_StreamingWeight: out std_logic;

			-- Data and Control I/o from/to Feature Bank
			DataInput: in ConvUnitDataPort_t;
			Wait_FromDataSream: in std_logic;
			Enable_StreamingData:in std_logic;
	  
	  		--Time Pass
			MACUnitRawOutput_Row0,MACUnitRawOutput_Row1,MACUnitRawOutput_Row2,MACUnitRawOutput_Row3: out MACUnitRawOutput_t
	  );
end ConvEngineMACunits_DataPath;

architecture Behavioral of ConvEngineMACunits_DataPath is
--#Begin --Component
component xbip_dsp48_macro_A18_B18_Output34_SimpleRoundingOf14Bits
	port(CLK   : in  STD_LOGIC;
		 CE    : in  STD_LOGIC;
		 SEL   : in  STD_LOGIC_VECTOR(0 to 0);
		 PCIN  : in  STD_LOGIC_VECTOR(47 downto 0);
		 A     : in  STD_LOGIC_VECTOR(17 downto 0);
		 B     : in  STD_LOGIC_VECTOR(17 downto 0);
		 PCOUT : out STD_LOGIC_VECTOR(47 downto 0);
		 P     : out STD_LOGIC_VECTOR(33 downto 0);
		 SCLRP : in  STD_LOGIC);
end component xbip_dsp48_macro_A18_B18_Output34_SimpleRoundingOf14Bits;
component fifo_generator_Width576bit_Depth512
	port(clk   : in  STD_LOGIC;
		 rst   : in  STD_LOGIC;
		 din   : in  STD_LOGIC_VECTOR(575 downto 0);
		 wr_en : in  STD_LOGIC;
		 rd_en : in  STD_LOGIC;
		 dout  : out STD_LOGIC_VECTOR(575 downto 0);
		 full  : out STD_LOGIC;
		 empty : out STD_LOGIC);
end component fifo_generator_Width576bit_Depth512;
--#End	 --Component

--#Begin --Type
type WeightInputTo4DSPRows_t is array (0 to 3) of ConvUnitWeightPort_t;
type MACUnitRawOutput_OfAllRows_t is array (0 to 3) of MACUnitRawOutput_t;
type PCIN_OfAllRows_t is array (0 to 3) of std_logic_vector(47 downto 0);
--#End 	--Type

--#Begin --Signal
	--DSP signals
signal WeightInputToRow0,WeightInputToRow1,WeightInputToRow2,WeightInputToRow3: ConvUnitWeightPort_t;
signal WeightInputTo4DSPRows: WeightInputTo4DSPRows_t; 
signal PCIN_OfAllRows: PCIN_OfAllRows_t;

--signal MACUnit0_Output,MACUnit1_Output,MACUnit2_Output,MACUnit3_Output: MACUnitOutput_t;
signal MACUnitRawOutput_OfAllRows: MACUnitRawOutput_OfAllRows_t;
	--FIFO signals
signal FIFO_Vector_WeightInputToRow0, FIFO_Vector_WeightInputToRow1,
		 FIFO_Vector_WeightInputToRow2, FIFO_Vector_WeightInputToRow3: std_logic_vector(575 downto 0);


--#End	 --Signal
begin
PCIN_OfAllRows(0)<= std_logic_vector(to_unsigned(0,C_RawMACOutputWidth)) & MACRow_RandomPCINBit(0) & std_logic_vector(to_unsigned(0,48-C_RawMACOutputWidth-1));
PCIN_OfAllRows(1)<= std_logic_vector(to_unsigned(0,C_RawMACOutputWidth)) & MACRow_RandomPCINBit(1) & std_logic_vector(to_unsigned(0,48-C_RawMACOutputWidth-1));
PCIN_OfAllRows(2)<= std_logic_vector(to_unsigned(0,C_RawMACOutputWidth)) & MACRow_RandomPCINBit(2) & std_logic_vector(to_unsigned(0,48-C_RawMACOutputWidth-1));
PCIN_OfAllRows(3)<= std_logic_vector(to_unsigned(0,C_RawMACOutputWidth)) & MACRow_RandomPCINBit(3) & std_logic_vector(to_unsigned(0,48-C_RawMACOutputWidth-1));

-----------------#Begin -- Genrate Loops-------------
	--#Begin --DSPs
DSPMainLoop: for Row in 0 to 3 generate
	DSPRow0_loop:for i in 0 to 255 generate
			DSPRow0: xbip_dsp48_macro_A18_B18_Output34_SimpleRoundingOf14Bits
				port map(
					CLK   => CLK,
					CE    => MACRow_ClkEnable(Row),
					SEL   => MAC_FunctionSEL,
					PCIN  => PCIN_OfAllRows(Row),
					A     => DataInput(i/8)(i mod 8),
					B     => WeightInputTo4DSPRows(Row)(i/8),
					PCOUT => open,
					P     => MACUnitRawOutput_OfAllRows(Row)(i),
					SCLRP => MACRow_SCLRP
				);
		end generate DSPRow0_loop;
	end generate DSPMainLoop;
	--#End  --DSPs
	--#Begin --FIFO
FIFO_0to1: fifo_generator_Width576bit_Depth512
	port map(
		clk   => clk,
		rst   => rst,
		din   => FIFO_Vector_WeightInputToRow0,
		wr_en => FIFO_WriteEn(1),
		rd_en => FIFO_ReadEn(1),
		dout  => FIFO_Vector_WeightInputToRow1,
		full  => open,
		empty => open
	);
FIFO_1to2: fifo_generator_Width576bit_Depth512
	port map(
		clk   => clk,
		rst   => rst,
		din   => FIFO_Vector_WeightInputToRow1,
		wr_en => FIFO_WriteEn(2),
		rd_en => FIFO_ReadEn(2),
		dout  => FIFO_Vector_WeightInputToRow2,
		full  => open,
		empty => open
	);
FIFO_2to3: fifo_generator_Width576bit_Depth512
	port map(
		clk   => clk,
		rst   => rst,
		din   => FIFO_Vector_WeightInputToRow2,
		wr_en => FIFO_WriteEn(3),
		rd_en => FIFO_ReadEn(3),
		dout  => FIFO_Vector_WeightInputToRow3,
		full  => open,
		empty => open
	);
	--#End   --FIFO
-----------------#End -- Genrate Loops-------------

--#Begin -- Conversion from/to Vector
WeightVectToWordConvProc : process (FIFO_Vector_WeightInputToRow1, FIFO_Vector_WeightInputToRow2, FIFO_Vector_WeightInputToRow3, WeightInputToRow0)
begin
	for i in 0 to 575 loop
		FIFO_Vector_WeightInputToRow0(i)<= WeightInputToRow0(i/18)(i mod 18);
	end loop;
	for i in 0 to 31 loop
		WeightInputToRow1(i)<= FIFO_Vector_WeightInputToRow1(18*(i+1)-1 downto 18*i);
	end loop;
	for i in 0 to 31 loop
		WeightInputToRow2(i)<= FIFO_Vector_WeightInputToRow2(18*(i+1)-1 downto 18*i);
	end loop;
	for i in 0 to 31 loop
		WeightInputToRow3(i)<= FIFO_Vector_WeightInputToRow3(18*(i+1)-1 downto 18*i);
	end loop;
end process WeightVectToWordConvProc;
--#End  -- Conversion from/to Vector

WeightInputToRow0<= WeighInput;
WeightInputTo4DSPRows(0)<= WeightInputToRow0;
WeightInputTo4DSPRows(1)<= WeightInputToRow1;
WeightInputTo4DSPRows(2)<= WeightInputToRow2;
WeightInputTo4DSPRows(3)<= WeightInputToRow3;

-- #Begin --Assign Output
MACUnitRawOutput_Row0 <= MACUnitRawOutput_OfAllRows(0);
MACUnitRawOutput_Row1 <= MACUnitRawOutput_OfAllRows(1);
MACUnitRawOutput_Row2 <= MACUnitRawOutput_OfAllRows(2);
MACUnitRawOutput_Row3 <= MACUnitRawOutput_OfAllRows(3);
-- #End	 --Assign Output

end Behavioral;
