----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.03.2016 19:59:51
-- Design Name: 
-- Module Name: ConvEngineOutput_Datapath_Alternate - Behavioral
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

entity ConvEngineOutput_Datapath_Alternate is
  Port ( clk,rst: in std_logic;
  		  -- Data In From DSP
		  MACUnit0_Output,MACUnit1_Output,MACUnit2_Output,MACUnit3_Output: in MACUnitRawOutput_t;
		 
		 -- Network Details
		  FullyConnectedLayer: in std_logic;		  
		  FeatureRowSize_OfInputLayer: in FeatureRowSize_t;

		  -- Control Signals
		  Latch_Outputs: in std_logic;
  		  Shift_Row0AndRow1: in std_logic;
  		  Shift_Row2AndRow3: in std_logic;
		  ChooseSetOfRow: in std_logic;	  
		  LastPositionBeingLoaded_InOutputFeature: in std_logic;
		  PipeLine_En_ClrToSend:in std_logic; -- "Clear To Send" signal of control 
  		
  		-- Output
		  MACOutput_GrpOf8Words: out MACFinalOutput_InGrpOf8_t;
		  MACOutputIdx_GrpOf8Words: out MACFinalOutputIdx_InGrpOf8_t
  );
end ConvEngineOutput_Datapath_Alternate;

architecture Behavioral of ConvEngineOutput_Datapath_Alternate is
--#Begin --Type
type OutputOfChosenSet_Row_t is array (0 to 15) of std_logic_vector(C_RawMACOutputWidth-1 downto 0);
type ComparisonResult_Row_t is array (0 to 7) of std_logic_vector(C_RawMACOutputWidth-1 downto 0);
type PoolingIdxLevel1_RowWise_t is array (0 to 1) of std_logic_vector(0 to 7);
--#End 	--Type
--#Begin --Signal
signal FF_Row0, FF_Row1,FF_Row2,FF_Row3: MACUnitRawOutput_t;
	--Comparison
signal OutputOfChosenSet_Row0,OutputOfChosenSet_Row1: OutputOfChosenSet_Row_t;
signal ComparisonResult_Row0,ComparisonResult_Row1: ComparisonResult_Row_t; 
signal PoolingIdxLevel1_RowWise: PoolingIdxLevel1_RowWise_t;
signal PoolingIdxFinal, PoolingIdxFinal_floped_1,PoolingIdxFinal_Floped_2: MACFinalOutputIdx_InGrpOf8_t;
signal Output_Raw_Unfloped, Output_Raw_floped: ComparisonResult_Row_t;
signal OutputTrimmed_Floped: MACFinalOutput_InGrpOf8_t;
	-- Flag
signal ShiftByEight: std_logic;
--#End	 --Signal
begin

--#Begin	-- FlipFlop Rows
FF_RowProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			FF_Row0 <= (others => std_logic_vector(to_signed(0,C_RawMACOutputWidth)));
			FF_Row1 <= (others => std_logic_vector(to_signed(0,C_RawMACOutputWidth)));
			FF_Row2 <= (others => std_logic_vector(to_signed(0,C_RawMACOutputWidth)));			
			FF_Row3 <= (others => std_logic_vector(to_signed(0,C_RawMACOutputWidth)));
		elsif (Latch_Outputs='1') then
			FF_Row0<= MACUnit0_Output;			
			FF_Row1<= MACUnit1_Output;			
			FF_Row2<= MACUnit2_Output;			
			FF_Row3<= MACUnit3_Output;			
		else
			if (Shift_Row0AndRow1='1') then
				if (ShiftByEight='0') then
					for i in 0 to (C_NumberofMACunits-1)-16 loop
						FF_Row0(i)<= FF_Row0(i+16);
						FF_Row1(i)<= FF_Row1(i+16);
					end loop;
					for i in (C_NumberofMACunits-1)-15 to (C_NumberofMACunits-1) loop
						FF_Row0(i) <= std_logic_vector(to_signed(0,C_RawMACOutputWidth));
						FF_Row1(i) <= std_logic_vector(to_signed(0,C_RawMACOutputWidth));
					end loop;
				else
					for i in 0 to (C_NumberofMACunits-1)-8 loop
						FF_Row0(i)<= FF_Row0(i+8);							
						FF_Row1(i)<= FF_Row1(i+8);
					end loop;
				end if;
			end if;
			if (Shift_Row2AndRow3='1') then
				if ShiftByEight='0' then
					for i in 0 to (C_NumberofMACunits-1)-16 loop
						FF_Row2(i)<= FF_Row2(i+16);
						FF_Row3(i)<= FF_Row3(i+16);
					end loop;
					for i in (C_NumberofMACunits-1)-15 to (C_NumberofMACunits-1) loop
						FF_Row2(i) <= std_logic_vector(to_signed(0,C_RawMACOutputWidth));
						FF_Row3(i) <= std_logic_vector(to_signed(0,C_RawMACOutputWidth));
					end loop;
				else
					for i in 0 to (C_NumberofMACunits-1)-8 loop
						FF_Row2(i)<= FF_Row2(i+8);							
						FF_Row3(i)<= FF_Row3(i+8);
					end loop;
				end if;
			end if;			
		end if;
	end if;
end process FF_RowProc;
--#End		-- FlipFlop Rows

--#Begin -- Choose Set
ChooseSetProc : process (ChooseSetOfRow, FF_Row0, FF_Row1, FF_Row2, FF_Row3)
begin
	for i in 0 to 15 loop
		if(ChooseSetOfRow='0') then
			OutputOfChosenSet_Row0(i)<= FF_Row0(i);
			OutputOfChosenSet_Row1(i)<= FF_Row1(i);
		else
			OutputOfChosenSet_Row0(i)<= FF_Row2(i);
			OutputOfChosenSet_Row1(i)<= FF_Row3(i);
		end if;
	end loop;
end process ChooseSetProc;
--#End	 -- Choose Set

--#End	--Comparison Level-1
RowComparisonProc : process (OutputOfChosenSet_Row0, OutputOfChosenSet_Row1, FeatureRowSize_OfInputLayer)
begin
	for i in 0 to 3 loop
		if ( signed(OutputOfChosenSet_Row0(i*2)) > signed(OutputOfChosenSet_Row0(i*2 +1 ))) then
			ComparisonResult_Row0(i) <= OutputOfChosenSet_Row0(i*2);
			PoolingIdxLevel1_RowWise(0)(i) <= '0';
		else
			ComparisonResult_Row0(i) <= OutputOfChosenSet_Row0(i*2 + 1);
			PoolingIdxLevel1_RowWise(0)(i) <= '1';
		end if;
		------
		if ( signed(OutputOfChosenSet_Row1(i*2)) > signed(OutputOfChosenSet_Row1(i*2 +1 ))) then
			ComparisonResult_Row1(i) <= OutputOfChosenSet_Row1(i*2);
			PoolingIdxLevel1_RowWise(1)(i) <= '0';		
		else
			ComparisonResult_Row1(i) <= OutputOfChosenSet_Row1(i*2 + 1);
			PoolingIdxLevel1_RowWise(1)(i) <= '1';
		end if;
	end loop;
	for i in 4 to 7 loop
		if FeatureRowSize_OfInputLayer > std_logic_vector(to_unsigned(1,len(MaxDataFeatureRowSize/8))) then
			if ( signed(OutputOfChosenSet_Row0(i*2)) > signed(OutputOfChosenSet_Row0(i*2 +1 ))) then
				ComparisonResult_Row0(i) <= OutputOfChosenSet_Row0(i*2);
				PoolingIdxLevel1_RowWise(0)(i) <= '0';
			else
				ComparisonResult_Row0(i) <= OutputOfChosenSet_Row0(i*2 + 1);
				PoolingIdxLevel1_RowWise(0)(i) <= '1';
			end if;
			------
			if ( signed(OutputOfChosenSet_Row1(i*2)) > signed(OutputOfChosenSet_Row1(i*2 +1 ))) then
				ComparisonResult_Row1(i) <= OutputOfChosenSet_Row1(i*2);
				PoolingIdxLevel1_RowWise(1)(i) <= '0';		
			else
				ComparisonResult_Row1(i) <= OutputOfChosenSet_Row1(i*2 + 1);
				PoolingIdxLevel1_RowWise(1)(i) <= '1';
			end if;
		else
			ComparisonResult_Row0(i)<= std_logic_vector(to_signed(0,C_RawMACOutputWidth));
			ComparisonResult_Row1(i)<= std_logic_vector(to_signed(0,C_RawMACOutputWidth));
			PoolingIdxLevel1_RowWise(0)(i) <= '0';
			PoolingIdxLevel1_RowWise(1)(i) <= '0';
		end if;
	end loop;

end process RowComparisonProc;
--#End	--Comparison Level-1

--#Begin	--Comparison Level-2
FinalPoolingProc : process (ComparisonResult_Row0, ComparisonResult_Row1 , PoolingIdxLevel1_RowWise(0), PoolingIdxLevel1_RowWise(1))
begin
	for i in 0 to 7 loop
		if (signed(ComparisonResult_Row0(i)) > signed(ComparisonResult_Row1(i))) then
			Output_Raw_Unfloped(i) <= ComparisonResult_Row0(i);
			PoolingIdxFinal(i)(1)<= '0';
			PoolingIdxFinal(i)(0)<= PoolingIdxLevel1_RowWise(0)(i);
		else
			Output_Raw_Unfloped(i) <= ComparisonResult_Row1(i);
			PoolingIdxFinal(i)(1)<= '1';
			PoolingIdxFinal(i)(0)<= PoolingIdxLevel1_RowWise(1)(i);
		end if;
	end loop;
end process FinalPoolingProc;
--#End	--Comparison Level-2


--#Begin -- UnderFlow-OverFlow Check and Pipelining
TrimmingProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			Output_Raw_floped  <= (others => std_logic_vector(to_signed(0,C_RawMACOutputWidth)));
			PoolingIdxFinal_Floped_1<= (others => "00");
			OutputTrimmed_Floped<= (others => std_logic_vector(to_signed(0,18)));
			PoolingIdxFinal_Floped_2<= (others => "00");
		elsif (PipeLine_En_ClrToSend='1') then
			-----
			if (FullyConnectedLayer='0') then
				Output_Raw_floped<= Output_Raw_Unfloped;
			else
				Output_Raw_floped(0)<= FF_Row0(0);
				for i in 1 to 7 loop
					Output_Raw_floped(i)<= std_logic_vector(to_signed(0,18));
				end loop;
			end if;
			PoolingIdxFinal_floped_1<= PoolingIdxFinal;
			----
			for i in 0 to 7 loop
				if (signed(Output_Raw_floped(i)) > to_signed(131071,C_RawMACOutputWidth)) then
					OutputTrimmed_Floped(i)<= std_logic_vector(to_signed(131071,18));	-- All '1's except MSB
				elsif (signed(Output_Raw_floped(i)) < to_signed(0,C_RawMACOutputWidth)) then -- ReLu
					OutputTrimmed_Floped(i)<= std_logic_vector(to_signed(0,18));
				else
					OutputTrimmed_Floped(i)<= Output_Raw_floped(i)(17 downto 0);
				end if;
			end loop;
			PoolingIdxFinal_Floped_2<= PoolingIdxFinal_floped_1;
			--
		end if;
	end if;
end process TrimmingProc;
--#End -- UnderFlow-OverFlow Check and Floping


--#Begin	-- Flag
ShiftByEight<= '1' when FullyConnectedLayer='1' or FeatureRowSize_OfInputLayer = std_logic_vector(to_unsigned(1,len(MaxDataFeatureRowSize/8))) else
				'1' when FeatureRowSize_OfInputLayer(0)='1' and LastPositionBeingLoaded_InOutputFeature='1' else
				'0';
--#Begin --Assign Outputs
MACOutput_GrpOf8Words<= OutputTrimmed_Floped;
MACOutputIdx_GrpOf8Words<= PoolingIdxFinal_Floped_2;
--#End  --Assign Outputs

end Behavioral;
