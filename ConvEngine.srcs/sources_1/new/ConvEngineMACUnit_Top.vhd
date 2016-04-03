----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.03.2016 19:22:00
-- Design Name: 
-- Module Name: ConvEngineMACUnit_Top - Behavioral
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

entity ConvEngineMACUnit_Top is
	Port ( 	  clk,rst: in std_logic;	  
	  	--TimePass
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
	  
		  -- Control Signals
			  Latch_Outputs: in std_logic;
			  Shift_Row0AndRow1: in std_logic;
	  		  Shift_Row2AndRow3: in std_logic;
			  ChooseSetOfRow: in std_logic;		  
		 -- Output
			  MACOutput_GrpOf8Words: out MACFinalOutput_InGrpOf8_t;
			  MACOutputIdx_GrpOf8Words: out MACFinalOutputIdx_InGrpOf8_t
	   );
end ConvEngineMACUnit_Top;

architecture Behavioral of ConvEngineMACUnit_Top is
--#Begin --Component
Component ConvEngineMACunits_DataPath
	port(clk, rst                                                                                   : in  std_logic;
		 MACRow_ClkEnable                                                                           : std_logic_vector(0 to 3);
		 MACRow_SCLRP                                                                               : std_logic;
		 MACRow_RandomPCINBit                                                                       : std_logic_vector(0 to 3);
		 MAC_FunctionSEL                                                                            : STD_LOGIC_VECTOR(0 to 0);
		 FIFO_WriteEn                                                                               : std_logic_vector(1 to 3);
		 FIFO_ReadEn                                                                                : std_logic_vector(1 to 3);
		 WeighInput                                                                                 : in  ConvUnitWeightPort_t;
		 Wait_FrmWeightStream                                                                       : in  std_logic;
		 Enable_StreamingWeight                                                                     : out std_logic;
		 DataInput                                                                                  : in  ConvUnitDataPort_t;
		 Wait_FromDataSream                                                                         : in  std_logic;
		 Enable_StreamingData                                                                       : in  std_logic;
		 MACUnitRawOutput_Row0, MACUnitRawOutput_Row1, MACUnitRawOutput_Row2, MACUnitRawOutput_Row3 : out MACUnitRawOutput_t);
end component ConvEngineMACunits_DataPath;
component ConvEngineOutput_Datapath_Alternate
	port(clk, rst                                                           : in  std_logic;
		 MACUnit0_Output, MACUnit1_Output, MACUnit2_Output, MACUnit3_Output : in  MACUnitRawOutput_t;
		 Latch_Outputs                                                      : in  std_logic;
		 Shift_Row0AndRow1                                                  : in  std_logic;
		 Shift_Row2AndRow3                                                  : in  std_logic;
		 ChooseSetOfRow                                                     : in  std_logic;
		 MACOutput_GrpOf8Words                                              : out MACFinalOutput_InGrpOf8_t;
		 MACOutputIdx_GrpOf8Words                                           : out MACFinalOutputIdx_InGrpOf8_t);
end component ConvEngineOutput_Datapath_Alternate;
--#End	 --Component
--#Begin --Type
--#End 	--Type
--#Begin --Signal
signal MACUnitRawOutput_Row0, MACUnitRawOutput_Row1, MACUnitRawOutput_Row2, MACUnitRawOutput_Row3 : MACUnitRawOutput_t;
--#End	 --Signal
begin
MACUnit_FourRows: ConvEngineMACunits_DataPath
	port map(
		clk                    => clk,
		rst                    => rst,
		MACRow_ClkEnable       => MACRow_ClkEnable,
		MACRow_SCLRP           => MACRow_SCLRP,
		MACRow_RandomPCINBit   => MACRow_RandomPCINBit,
		MAC_FunctionSEL        => MAC_FunctionSEL,
		FIFO_WriteEn           => FIFO_WriteEn,
		FIFO_ReadEn            => FIFO_ReadEn,
		WeighInput             => WeighInput,
		Wait_FrmWeightStream   => Wait_FrmWeightStream,
		Enable_StreamingWeight => Enable_StreamingWeight,
		DataInput              => DataInput,
		Wait_FromDataSream     => Wait_FromDataSream,
		Enable_StreamingData   => Enable_StreamingData,
		MACUnitRawOutput_Row0  => MACUnitRawOutput_Row0,
		MACUnitRawOutput_Row1  => MACUnitRawOutput_Row1,
		MACUnitRawOutput_Row2  => MACUnitRawOutput_Row2,
		MACUnitRawOutput_Row3  => MACUnitRawOutput_Row3
	);
MACUnit_OutputDataPath: ConvEngineOutput_Datapath_Alternate
	port map(
		clk               => clk,
		rst               => rst,
		MACUnit0_Output   => MACUnitRawOutput_Row0,
		MACUnit1_Output   => MACUnitRawOutput_Row1,
		MACUnit2_Output   => MACUnitRawOutput_Row2,
		MACUnit3_Output   => MACUnitRawOutput_Row3,
		Latch_Outputs     => Latch_Outputs,
		Shift_Row0AndRow1 => Shift_Row0AndRow1,
		Shift_Row2AndRow3 => Shift_Row2AndRow3,
		ChooseSetOfRow    => ChooseSetOfRow,
		MACOutput_GrpOf8Words =>MACOutput_GrpOf8Words,
		MACOutputIdx_GrpOf8Words => MACOutputIdx_GrpOf8Words
	);
end Behavioral;
