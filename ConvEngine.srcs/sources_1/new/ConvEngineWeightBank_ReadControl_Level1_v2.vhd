----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.02.2016 11:50:48
-- Design Name: 
-- Module Name: ConvEngineWeightBank_ReadControl_Level1_v2 - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--#Begin --Component
--#End  --Components
--#Begin --Type
--#End	 --Type

entity ConvEngineWeightBank_ReadControl_Level1_v2 is
  Port (clk,rst: in std_logic;
  		-- Input from Master Control
  		Layer_Idx: in LayerIdx_st;
  		Layer_Base: in ConvEngineTotalWeightAddrInTermsOf16Words_t;
  		SetSize_InTermsOf16Words: in SetSize_InTermsOf16Words_t;
		TotalNumberOfSetsInALayer: in KernelIdx_st; -- Max sets possible= MAx kernels in a layer
		NumberOfLoopOverTheSet: in NumberOfLoopOverTheSet_t; --Depends on column size and zero padding in rows
		KernelsInLastSet: in NumberOfSimultaneousKernel_t;
  		SizeOfLastSet_InTermsof16Words: in SetSize_InTermsOf16Words_t;
  		NumberOfSimultaneousKernel: in NumberOfSimultaneousKernel_t; 
  			--TotalNumberOfKernel: in KernelIdx_st;   -- i.e. Total No. of kernels/ no. of simultaneuos Kernels  		
  			--KernelSize_InTermsOf16Words: in KernelSize_InTermsOf16Words_t;
		Rqst_ToStartNextLayer: in std_logic;
		-- Output to Master Control
		DoneWithLayer: out std_logic; 
		DoneWithASingleLoopOnASet: out std_logic;
		ReadingLastLoop: out std_logic;
		-- Input/Output to Write Control
		CurrentSetStartingAddr_ToWriteCntrl: out ConvEngineWeightBankReadAddr_t;
		CurrentWritePtr: in ConvEngineWeightBankReadAddr_t;
		CurrentWriteLayerIdx: in LayerIdx_st;
		CurrentWriteSetIdx: in KernelIdx_st;
		DoneWritingFourthWordOfSet: in std_logic;
		DontCheckWritePtr: in std_logic;
		-- Input from streaming engine
		FlowCtrl_ContinueStreaming_StrmEngineToWeightBank: in std_logic;
		-- Output to streaming engine
		FlowCtrl_ContinueStreaming_WeightBankToStreamEngine: out std_logic;
		-- Control signals to Weight Bank
		ReadAddr: out ConvEngineWeightBankReadAddr_t;
		Port_En: out std_logic

--		-- Tags To Compare
--		Tag1: in ConvEngineWeightBank_Tag_st;
--		Tag2: in ConvEngineWeightBank_Tag_st;
--		Tag3: in ConvEngineWeightBank_Tag_st;
--		Tag1Valid: in std_logic;
--		Tag2Valid: in std_logic;
--		Tag3Valid: in std_logic;
--		Tag1Range_Start: in ConvEngineWeightBankReadAddr_t; -- 
--		Tag1Range_End: in ConvEngineWeightBankReadAddr_t; -- 
--		Tag2Range_Start: in ConvEngineWeightBankReadAddr_t; -- 
--		Tag2Range_End: in ConvEngineWeightBankReadAddr_t; -- 
--		Tag3Range_Start: in ConvEngineWeightBankReadAddr_t; -- It can cover entire Weight bank
--		Tag3Range_End: in ConvEngineWeightBankReadAddr_t; -- It can cover entire Weight bank
		
  );
end ConvEngineWeightBank_ReadControl_Level1_v2;

architecture Behavioral of ConvEngineWeightBank_ReadControl_Level1_v2 is

--#Begin --Type
type StateType is (S_rst, S_Stream, S_WaitForStreamEngineToFinishLoading,
	S_WaitForRqstFromStreamEngine, S_WaitAfterEachLoop_0,
	S_WaitAfterEachLoop_1, S_WaitForBRAMLatency_0, S_WaitForBRAMLatency_1
);
--#End	 --Type

--#Begin --Signals
--signal NumberOfSets: KernelIdx_st; -- i.e. Total No. of kernels/ no. of simultaneuos Kernels
signal TotalAddr, CurrentSetStartingAddr_Full_F, CurrentSetStartingAddr_Full: ConvEngineTotalWeightAddrInTermsOf16Words_t;
signal CurrentTag: ConvEngineWeightBank_Tag_st;
signal ReadAddr_Temp: ConvEngineWeightBankReadAddr_t;
signal CurrentOffset, LastOffset: SetSize_InTermsOf16Words_t;
signal CurrentSetIdx: KernelIdx_st;
	--Flags
signal LastOffset_Rst, LastOffset_Enable: std_logic;
signal CurrentOffset_Rst,CurrentOffset_Enable: std_logic;
signal CurrentSetIdx_Rst, CurrentSetIdx_Enable: std_logic;
signal LoopCount_Rst, LoopCount_Enable: std_logic;
signal Tag_Match, Tag1_Match, Tag2_Match,Tag3_Match : std_logic;
signal SubSet_Done, Loop_Done, Set_done, Layer_Done, Last_Set: std_logic;
signal LoopCount: NumberOfLoopOverTheSet_t;
signal FlowCtrl_ContinueStreaming_WeightBankToStreamEngine_unfloped,FlowCtrl_ContinueStreaming_WeightBankToStreamEngine_floped: std_logic;
signal WordsAvailableToRead, WordsAvailableToRead_Partly: std_logic;
signal WordBankOffset: ConvEngineWeightBankReadAddr_t; 
signal SumOfWritePtrAndWordBankOffset: std_logic_vector(C_ConvEngineWeightBank_ReadAddrLength downto 0);
signal LongReadPtr: std_logic_vector(C_ConvEngineWeightBank_ReadAddrLength downto 0);
signal WritePtrHasProgressedBeyondFouthWord: std_logic;
	--FSM
signal PrState,NxtState: StateType;
signal Count_WaitForStreamEngineToFinishLoading,Count_ToBeCompared: std_logic_vector(5 downto 0); -- Giving extra length
signal Count_WaitForStreamEngineToFinishLoading_Enable:std_logic;
--#End	 --Signals

begin

--#Begin --FSM
PrStateProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			PrState <= S_rst;
		else
			PrState <= NxtState;			
		end if;
	end if;
end process PrStateProc;


NxtAndOutputLogic : process (PrState, FlowCtrl_ContinueStreaming_StrmEngineToWeightBank, Layer_Done, Loop_Done, SubSet_Done, Set_done, Count_WaitForStreamEngineToFinishLoading, Count_ToBeCompared, Rqst_ToStartNextLayer, WordsAvailableToRead)
begin
	case PrState is 
		when S_rst =>
			DoneWithLayer <= '1'; DoneWithASingleLoopOnASet<='1';
			FlowCtrl_ContinueStreaming_WeightBankToStreamEngine_unfloped <= '0';
			LastOffset_Rst <= '1'; LastOffset_Enable <= '0';
			CurrentOffset_Rst <= '1'; CurrentOffset_Enable <= '0';
			CurrentSetIdx_Rst<= '1'; CurrentSetIdx_Enable<= '0';
			LoopCount_Rst<= '1'; LoopCount_Enable<='0';
			Count_WaitForStreamEngineToFinishLoading_Enable<='0';
			if (Rqst_ToStartNextLayer = '1') then
				NxtState <= S_WaitForRqstFromStreamEngine;
			else
				NxtState <= S_rst;
			end if;
		when S_Stream =>
			DoneWithLayer <= '0'; DoneWithASingleLoopOnASet<='0';
			if (WordsAvailableToRead='1') then
				FlowCtrl_ContinueStreaming_WeightBankToStreamEngine_unfloped <= '1';
				CurrentOffset_Enable <= '1';
			else
				FlowCtrl_ContinueStreaming_WeightBankToStreamEngine_unfloped <= '0';
				CurrentOffset_Enable <= '0';
			end if;
			LastOffset_Rst <= '0'; LastOffset_Enable <= '0';
			CurrentOffset_Rst <= '0'; 
			CurrentSetIdx_Rst<= '0'; CurrentSetIdx_Enable<= '0';
			LoopCount_Rst<= '0'; LoopCount_Enable<='0';
			if (SubSet_Done='1' and WordsAvailableToRead='1') then -- As CurrentOffset has to be increamented before going to next stage
				NxtState <= S_WaitForStreamEngineToFinishLoading;
				Count_WaitForStreamEngineToFinishLoading_Enable<='1';
			else
				Count_WaitForStreamEngineToFinishLoading_Enable<='0';
				NxtState <= S_Stream;
			end if;
		when S_WaitForStreamEngineToFinishLoading =>
			DoneWithLayer <= '0'; DoneWithASingleLoopOnASet<='0';
			LastOffset_Rst <= '0'; LastOffset_Enable <= '0';
			CurrentOffset_Rst <= '0'; CurrentOffset_Enable <= '0';
			CurrentSetIdx_Rst<= '0'; CurrentSetIdx_Enable<= '0';
			LoopCount_Rst<= '0'; LoopCount_Enable<='0';
			Count_WaitForStreamEngineToFinishLoading_Enable<='1';
			if Count_WaitForStreamEngineToFinishLoading= Count_ToBeCompared then
				FlowCtrl_ContinueStreaming_WeightBankToStreamEngine_unfloped <= '0';
				NxtState<= S_WaitForBRAMLatency_0;	
			else
				FlowCtrl_ContinueStreaming_WeightBankToStreamEngine_unfloped <= '1';
				NxtState<= S_WaitForStreamEngineToFinishLoading;
			end if;
		when S_WaitForBRAMLatency_0 => 
			DoneWithLayer <= '0'; DoneWithASingleLoopOnASet<='0';
			FlowCtrl_ContinueStreaming_WeightBankToStreamEngine_unfloped <= '0';
			LastOffset_Rst <= '0'; LastOffset_Enable <= '0';
			CurrentOffset_Rst <= '0'; CurrentOffset_Enable <= '0';
			CurrentSetIdx_Rst<= '0'; CurrentSetIdx_Enable<= '0';
			LoopCount_Rst<= '0'; LoopCount_Enable<='0';
			Count_WaitForStreamEngineToFinishLoading_Enable<='0';
			NxtState<= S_WaitForBRAMLatency_1;
		when S_WaitForBRAMLatency_1 => 
			DoneWithLayer <= '0'; DoneWithASingleLoopOnASet<='0';
			FlowCtrl_ContinueStreaming_WeightBankToStreamEngine_unfloped <= '0';
			LastOffset_Rst <= '0'; LastOffset_Enable <= '0';
			CurrentOffset_Rst <= '0'; CurrentOffset_Enable <= '0';
			CurrentSetIdx_Rst<= '0'; CurrentSetIdx_Enable<= '0';
			LoopCount_Rst<= '0'; LoopCount_Enable<='0';
			Count_WaitForStreamEngineToFinishLoading_Enable<='0';
			NxtState<= S_WaitForRqstFromStreamEngine;
		when S_WaitForRqstFromStreamEngine =>
			DoneWithLayer <= '0'; DoneWithASingleLoopOnASet<='0';
			Count_WaitForStreamEngineToFinishLoading_Enable<='0';
			if (Loop_Done='1') then
				LastOffset_Rst <= '1'; LastOffset_Enable <= '0';
				CurrentOffset_Rst <= '1';  		
				LoopCount_Enable<='1';
			else
				LastOffset_Rst <= '0'; LastOffset_Enable <= '1';
				CurrentOffset_Rst <= '0';	
				LoopCount_Enable<='0';
			end if;
			
			if (Set_done='1') then
				CurrentSetIdx_Enable<= '1';
				LoopCount_Rst<= '1';
			else
				CurrentSetIdx_Enable<= '0';
				LoopCount_Rst<= '0';
			end if;				
			
			if (Layer_Done='1') then
				FlowCtrl_ContinueStreaming_WeightBankToStreamEngine_unfloped <= '0';
				CurrentOffset_Enable <= '0';
				CurrentSetIdx_Rst<= '1';
				NxtState<= S_rst;						
			elsif (Loop_Done='1') then
				FlowCtrl_ContinueStreaming_WeightBankToStreamEngine_unfloped <= '0';
				CurrentOffset_Enable <= '0';
				CurrentSetIdx_Rst<= '0';
				NxtState<= S_WaitAfterEachLoop_0;	
			elsif (FlowCtrl_ContinueStreaming_StrmEngineToWeightBank = '1' ) then
				FlowCtrl_ContinueStreaming_WeightBankToStreamEngine_unfloped <= '0';				
				CurrentOffset_Enable <= '0';
				NxtState <= S_Stream;
				CurrentSetIdx_Rst<= '0';
			else
				FlowCtrl_ContinueStreaming_WeightBankToStreamEngine_unfloped <= '0';
				CurrentOffset_Enable <= '0';
				NxtState <= S_WaitForRqstFromStreamEngine;
				CurrentSetIdx_Rst<= '0';
			end if;
		when S_WaitAfterEachLoop_0 => -- this state is added when Multiplication of CurrentSetIdx and SetSize was pipelined. This state is required to accomodate the latency of that path
			DoneWithLayer <= '0'; DoneWithASingleLoopOnASet<='0';
			Count_WaitForStreamEngineToFinishLoading_Enable<='0';			
			FlowCtrl_ContinueStreaming_WeightBankToStreamEngine_unfloped <= '0';
			LastOffset_Rst <= '1'; LastOffset_Enable <= '0';
			CurrentOffset_Rst <= '1'; CurrentOffset_Enable <= '0';
			CurrentSetIdx_Rst<= '0'; CurrentSetIdx_Enable<= '0';
			LoopCount_Rst<= '0';LoopCount_Enable<='0';
			Count_WaitForStreamEngineToFinishLoading_Enable<='0';
			NxtState <= S_WaitAfterEachLoop_1;
		when S_WaitAfterEachLoop_1 => -- Actually not waiting after loops, contorl logic has been changed
			DoneWithLayer <= '0'; DoneWithASingleLoopOnASet<='1';
			FlowCtrl_ContinueStreaming_WeightBankToStreamEngine_unfloped <= '0';
			LastOffset_Rst <= '1'; LastOffset_Enable <= '0';
			CurrentOffset_Rst <= '1'; CurrentOffset_Enable <= '0';
			CurrentSetIdx_Rst<= '0'; CurrentSetIdx_Enable<= '0';
			LoopCount_Rst<= '0'; LoopCount_Enable<='0';
			Count_WaitForStreamEngineToFinishLoading_Enable<='0';
			NxtState <= S_WaitForRqstFromStreamEngine;
--			if (Rqst_ToStartNextLoop = '1' ) then
--				
--			else
--				NxtState <= S_WaitAfterEachLoop_0;
--			end if;
	end case;
end process NxtAndOutputLogic;
--#End	 --FSM

--#Begin --Addressing
TotalAddr <= std_logic_vector(unsigned(CurrentSetStartingAddr_Full_F)
				+ unsigned(CurrentOffset));
ReadAddr_Temp <= TotalAddr (C_ConvEngineWeightBank_ReadAddrLength-1 downto 0);
CurrentTag <= TotalAddr ((C_AddressLengthForSingleWordAddressing-4)-1 downto C_ConvEngineWeightBank_ReadAddrLength);
CurrentSetStartingAddr_Full<= std_logic_vector(unsigned(Layer_Base) 
				+ unsigned(CurrentSetIdx)*unsigned(SetSize_InTermsOf16Words));
CurrentSetStartingAddr_ToWriteCntrl<= CurrentSetStartingAddr_Full_F (C_ConvEngineWeightBank_ReadAddrLength-1 downto 0);
--#End --Addressing

--#Begin --Flags for end of subset, set, layer
SubSet_Done<= 	'1' when (Last_Set='1') and ((unsigned(CurrentOffset)- unsigned(LastOffset))= (unsigned(KernelsInLastSet) -1))  else
				'1' when ((unsigned(CurrentOffset)- unsigned(LastOffset))= (unsigned(NumberOfSimultaneousKernel)-1)) else
				'0';	  
Loop_Done<= '1' when  (Last_Set='1' and CurrentOffset = SizeOfLastSet_InTermsof16Words) else -- Not 
			'1' when CurrentOffset = SetSize_InTermsOf16Words else -- Not CurrentOffset=SetSize_InTermsOf16Words-1, because Current Offset points to the word to be read. It has not been read yet
		   '0';
ReadingLastLoop<= '1' when LoopCount= std_logic_vector(unsigned(NumberOfLoopOverTheSet)-1) else
			 '0';
Set_Done <= '1' when LoopCount= std_logic_vector(unsigned(NumberOfLoopOverTheSet)-1) and Loop_done='1' else
			 '0';
Layer_Done<= '1' when (CurrentSetIdx=std_logic_vector(unsigned(TotalNumberOfSetsInALayer)-1) and Set_Done='1') else
			'0';
Last_Set<= '1' when (CurrentSetIdx = std_logic_vector((unsigned(TotalNumberOfSetsInALayer)-1))) else
				'0';
WritePtrHasProgressedBeyondFouthWord<= '0' when (DontCheckWritePtr='0' and Layer_Idx=CurrentWriteLayerIdx and
												 CurrentSetIdx= CurrentWriteSetIdx and
												 DoneWritingFourthWordOfSet='0') else
										'1';
--#End   --Flags for end of subset, set, layer

--#BEgin -- Check if words are available to read
WordBankOffset<= (others => '1');
SumOfWritePtrAndWordBankOffset <= std_logic_vector(resize(unsigned(CurrentWritePtr),C_ConvEngineWeightBank_ReadAddrLength+1) + resize(unsigned(WordBankOffset),C_ConvEngineWeightBank_ReadAddrLength+1) + 1);
LongReadPtr <= '0' & ReadAddr_Temp;
CheckSpace : process (CurrentWritePtr, ReadAddr_Temp, LongReadPtr, SumOfWritePtrAndWordBankOffset, DontCheckWritePtr)
begin
	if (DontCheckWritePtr='0') then
		if (CurrentWritePtr> ReadAddr_Temp) then
			if (CurrentWritePtr> std_logic_vector(unsigned(ReadAddr_Temp)+4)) then
				WordsAvailableToRead_Partly<='1';
			else
				WordsAvailableToRead_Partly<='0';
			end if;
		else 
			if (SumOfWritePtrAndWordBankOffset > std_logic_vector(unsigned(LongReadPtr)+4)) then
				WordsAvailableToRead_Partly<='1';
			else
				WordsAvailableToRead_Partly<='0';
			end if;
		end if;
	else
		WordsAvailableToRead_Partly<='1';
	end if;	
end process CheckSpace;

WordsAvailableToRead<= WordsAvailableToRead_Partly and WritePtrHasProgressedBeyondFouthWord when DontCheckWritePtr='0' else
					'1';
--#End	 -- Check if words are available to read


--#Begin --Flop of Current Set IDx
SetIdxProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or CurrentSetIdx_Rst='1' then
			CurrentSetIdx <= (others=>'0');			
		elsif (CurrentSetIdx_Enable='1') then
			CurrentSetIdx <= std_logic_vector(unsigned(CurrentSetIdx)+1);
		end if;
	end if;
end process SetIdxProc;
LoopCountProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or LoopCount_Rst='1' then
			LoopCount<= (others=>'0');
		elsif LoopCount_Enable='1' then
			LoopCount <= std_logic_vector(unsigned(LoopCount)+1);
		end if;
	end if;
end process LoopCountProc;

--#End   --Flop of Current Set IDx

--#Begin --Flop of Offsets
CurrOffsetProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or CurrentOffset_Rst='1' then
			CurrentOffset <= (others=>'0');
		elsif CurrentOffset_Enable='1' then
			CurrentOffset <= std_logic_vector(unsigned(CurrentOffset)+1);			
		end if;
	end if;
end process CurrOffsetProc;
LastOffsetProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or LastOffset_Rst='1' then
			LastOffset<= (others => '0');
		elsif(LastOffset_Enable ='1') then
			LastOffset<= CurrentOffset;
		end if;
	end if;
end process LastOffsetProc;
--#End   --Flop of Offsets



--#Begin --FlowControl Double Floping To match BRAM latency
FlowCntrlFlop : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			FlowCtrl_ContinueStreaming_WeightBankToStreamEngine<= '0';
			FlowCtrl_ContinueStreaming_WeightBankToStreamEngine_floped<= '0';
		else
			FlowCtrl_ContinueStreaming_WeightBankToStreamEngine<= FlowCtrl_ContinueStreaming_WeightBankToStreamEngine_floped;			
			FlowCtrl_ContinueStreaming_WeightBankToStreamEngine_floped<= FlowCtrl_ContinueStreaming_WeightBankToStreamEngine_unfloped;
		end if;
	end if;
end process FlowCntrlFlop;
--#End 	--FlowControl Double Floping To match BRAM latency

--#Begin --Counter to count intermediate steps in State S_WaitForStreamEngineToFinishLoading
--ExtraWaitForLastSet <= std_logic_vector(unsigned(NumberOfSimultaneousKernel)-unsigned(KernelsInLastSet));
Count_ToBeCompared<= std_logic_vector(to_unsigned(7,6)) when Last_Set='0' else
					 std_logic_vector(resize(unsigned(NumberOfSimultaneousKernel),6)-resize(unsigned(KernelsInLastSet),6) +7);
Count_WaitForIntermediateStepsProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or Count_WaitForStreamEngineToFinishLoading= Count_ToBeCompared then
			Count_WaitForStreamEngineToFinishLoading<= (others =>'0');
		elsif(Count_WaitForStreamEngineToFinishLoading_Enable='1') then
			Count_WaitForStreamEngineToFinishLoading<= std_logic_vector(unsigned(Count_WaitForStreamEngineToFinishLoading)+1);
		end if;
	end if;
end process Count_WaitForIntermediateStepsProc;
--#End	 --Counter to count intermediate steps in State S_WaitForStreamEngineToFinishLoading

--#Begin -- Pipelining multiplication of current set idx and set size
CurrentSetStartingAddrProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			CurrentSetStartingAddr_Full_F<= (others => '0');
		else
			CurrentSetStartingAddr_Full_F<= CurrentSetStartingAddr_Full;
		end if;
	end if;
end process CurrentSetStartingAddrProc;


--#End 	 -- Pipelining multiplication of current set idx and set size

--#BEgin --Assigning Outputs
--#End ----Assigning Outputs

--#Begine --Timepass
ReadAddr <= ReadAddr_Temp;
----#Begin	--Tag and Range Check
--Tag1_Match <= '1' when (CurrentTag = Tag1 and 
--						(ReadAddr_Temp>= Tag1Range_Start and ReadAddr_Temp<= Tag1Range_End) and 
--						Tag1Valid ='1' ) else
--			  '0';
--Tag2_Match <= '1' when (CurrentTag = Tag2 and 
--						(ReadAddr_Temp>= Tag2Range_Start and ReadAddr_Temp<= Tag2Range_End) and 
--						Tag2Valid ='1' ) else
--			  '0';
--Tag3_Match <= '1' when (CurrentTag = Tag3 and 
--						(ReadAddr_Temp>= Tag3Range_Start and ReadAddr_Temp<= Tag3Range_End) and 
--						Tag3Valid ='1' ) else
--			  '0';
--
--
--Tag_Match<= Tag1_Match or Tag2_Match or Tag3_Match;
----#End	    --Tag and Range Check
--#End -- Timepass
end Behavioral;
