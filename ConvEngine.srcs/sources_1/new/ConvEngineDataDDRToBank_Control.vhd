----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2016 00:13:58
-- Design Name: 
-- Module Name: ConvEngineDataDDRToBank_Control - Behavioral
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
use work.ConvEngineDataBankPkg.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ConvEngineDataDDRToBank_Control is
	Port ( clk, rst: in std_logic;  
			-- Control to/from Master
		   	RqstFromMainCtrlToLoadLayer: in std_logic;
			RqstToMainCtrl: out std_logic;
		   	AckFromMainCtrl: in std_logic;
			-- Network Details
		   	LayerBase: in ConvEngineDataBankAddr_t;
		   	CurrLayerIdx: in LayerIdx_st;
			TotalFeaturesInLayer: in DataFeatureIdx_st;
			TotalNumberOfRowsInAFeature_SizeInTermsOf16Words: in DataFeatureRowIdx_st; -- -- Where row Size is in terms of 16 words. If actual row size is of 8 words, then row Size Should be halved
			FeatureRowSize: in FeatureRowSize_t; -- In terms of Eight Words
			--TotalGrpOf24WordsInAFeature: in DataFeatureSize_InMultipleOf24Words_t;
			StartingFeatureIdx: in DataFeatureIdx_st;
			StartGrpBase: in DataFeatureSize_InMultipleOf24Words_t;
			--StartingGrpOffset: in DataFeatureSize_InMultipleOf24Words_t; -- We have to make sure 16-word and 24-Word boundary meets here 
			StartRowIdx: in DataFeatureRowIdx_st;
			StartingPositionInRow: in FeatureRowSize_t; -- In terms of 8 words, but must be alligned to 16-word as wellas 24-word boundary
			
--			LastGrpOfRow_Flag: in std_logic; -- Indicates if the requested word is last word of the row
--			LastGrpOfRow_Contains16Words_Flag: in std_logic; -- '1' meaning last group of row has all 16 Words
			LayerDone: out std_logic;

		  	-- Addr to Master
			WriteAddrToMaster: out ConvEngineDataBankAddr_t;

		   -- Control in/out to Slave
		   	LatchDDRData: out std_logic;
			ShiftDDRData: out std_logic;
			WriteFIFO: out std_logic;
			ReadFIFO: out std_logic;
			TempStorage_Set0_Load: out std_logic;
			TempStorage_Set1_Load: out std_logic;
			Set0_Load: out std_logic;
			Set0_LoadZeroes: out std_logic;
			Set1_Load: out std_logic;
			Set1_LoadZeroes: out std_logic;
			Set0_Sel_DDRorFIFOorTemp: out std_logic_vector(1 downto 0); -- Three possible values
			Set1_Sel_DDRorFIFOorTemp: out std_logic_vector(1 downto 0);
	   	    FIFOInSel_DDRorTemp: out std_logic;

		   -- DDR Signals
			RqstToDDR: out std_logic;
			DDR_LayerIdx: out LayerIdx_st;
			DDR_FeatureIdx: out DataFeatureIdx_st;
			DDR_GroupIdxInAFeature: out DataFeatureSize_InMultipleOf24Words_t;
			AckFromDDR: in std_logic	  
	);
end ConvEngineDataDDRToBank_Control;

architecture Behavioral of ConvEngineDataDDRToBank_Control is
--#Begin --Component

--#End	 --Component
--#Begin --Type
type StateType_t is (S_Rst, S_CenterCase, 
					S_Zero_RqstToDDR, S_Zero_LoadFirstSet, S_Zero_LoadSecondSet, S_Zero_LoadSecondSetToFIFO, S_Zero_LoadThirdSetToFIFOorTemp, S_Zero_IdxUpdate,
					S_One_NoDDRRqst_DirectlyLoad, S_One_LoadFromFIFOorTemp, S_One_RqstToDDR, S_One_LoadFirstSetToOutput, S_One_LoadSecondSetToFIFOorTemp, S_One_LoadThirdSetToFIFOorTemp, S_One_IdxUpdate_0,S_One_IdxUpdate_1, 
					S_Two_LoadFromFIFOorTemp, S_Two_LoadSecondWordFromFIFO, S_Two_IdxUpdate,
					S_CenterTail_0, S_CenterTail_1
);
--#End 	--Type

--#Begin --Signal
	--FSM
signal PrState, NxtState: StateType_t;
	-- IDx
signal WriteAddrToMaster_Temp: std_logic_vector(20 downto 0);
signal FeatureRowSize_Modified:  FeatureRowSize_t;
signal RowSize_InMultipleOf16Words: DataFeatureRowSize_InMultipleOf16Words_t;
signal CurrFeatureIdx: DataFeatureIdx_st;
signal CurrFeatureIdx_Load, CurrFeatureIdx_Increament, CurrFeatureIdx_rst: std_logic;
signal CurrPositionInRow,GrpOf8WordsLeftInARow: FeatureRowSize_t;
signal CurrPositionInRow_Load, CurrPositionInRow_ReLoad,CurrPositionInRow_Increament, CurrPositionInRow_Rst: std_logic;
signal StartingPositionInRow_floped:FeatureRowSize_t;
signal StartingPositionInRow_Load: std_logic;
signal PositionInRow_InMultipleof16Words: DataFeatureRowSize_InMultipleOf16Words_t;
signal RowIdx : DataFeatureRowIdx_st;
signal RowIdx_Increament, RowIdx_Rst: std_logic;
signal GrpBase: DataFeatureSize_InMultipleOf24Words_t;
signal GrpBase_Load, GrpBase_MoreIncreament,GrpBase_Increament, GrpBase_Rst: std_logic;
signal CurrGrpOffsetInFeature_InTermOf24Words: DataFeatureSize_InMultipleOf24Words_t;
signal CurrGrpOffsetInFeature_InTermOf24Words_Load, CurrGrpOffsetInFeature_InTermOf24Words_Increament, CurrGrpOffsetInFeature_InTermOf24Words_Rst: std_logic;
	-- FLags
signal FirstPositionInRow,LastPositionInRow: Std_logic;
signal LastRowBeingWritten, LastFeatureBeingWritten: std_logic;
signal FirstRow_Flag, FirstRow_Set, FirstRow_Reset: std_logic;
	-- Extras
signal WordsPresentLocally: unsigned(1 downto 0);
signal WordsOnTemp, WordsOnFIFO: unsigned(1 downto 0); -- Value at Max=2
signal WordsOnTemp_Unfloped, WordsOnFIFO_Unfloped: unsigned(1 downto 0); -- Value at Max=2
--signal GrpOf8WordsToBeLoadedOnFIFO: unsigned(1 downto 0);
signal WordsOnTemp_En,WordsOnTemp_Rst, WordsOnFIFO_En, WordsOnFIFO_Rst: std_logic;
--#End	 --Signal

begin

--#Begin --FSM
PrStateProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			PrState <= S_Rst;
		else
			PrState <= NxtState;
		end if;
	end if;
end process PrStateProc;

NxtAndOutputProc : process (PrState, AckFromDDR, AckFromMainCtrl, FirstPositionInRow, GrpOf8WordsLeftInARow, LastFeatureBeingWritten, LastPositionInRow, LastRowBeingWritten, RqstFromMainCtrlToLoadLayer, WordsPresentLocally, FirstRow_Flag) is
begin
	case PrState is 
		when S_Rst =>
			RqstToDDR<='0';
			GrpBase_Increament<='0'; GrpBase_MoreIncreament<='0';
			CurrFeatureIdx_Increament<='0'; 
			CurrGrpOffsetInFeature_InTermOf24Words_Increament<= '0';
			RowIdx_Increament<='0';
			CurrPositionInRow_Increament<='0'; CurrPositionInRow_ReLoad<='0';
			WordsOnTemp_Rst<='1'; WordsOnFIFO_Rst<='1';
			WordsOnTemp_En<='0'; WordsOnFIFO_En<='0';
			WordsOnTemp_Unfloped<= "00"; WordsOnFIFO_Unfloped<="00";			
			FirstRow_Reset<='0'; FirstRow_Set<='1';
			-- Signals to DataPath
			LatchDDRData<= '0';	ShiftDDRData<='0';	
			WriteFIFO<='0';	ReadFIFO<='0';
			TempStorage_Set0_Load<='0';	TempStorage_Set1_Load<='0';
			Set0_Load<= '0'; Set0_LoadZeroes<='0';
			Set1_Load<='0';  Set1_LoadZeroes<='0';
			Set0_Sel_DDRorFIFOorTemp<= "00";
			Set1_Sel_DDRorFIFOorTemp<="00";
			FIFOInSel_DDRorTemp<='0';

			if (RqstFromMainCtrlToLoadLayer='1') then
				RqstToMainCtrl<= '0'; LayerDone<='0';
				NxtState<= S_CenterCase;
				GrpBase_Rst<='0';
				GrpBase_Load<='1';
				CurrGrpOffsetInFeature_InTermOf24Words_Rst<='0';						
				CurrGrpOffsetInFeature_InTermOf24Words_Load<='1';
				CurrFeatureIdx_rst<= '0'; 
				CurrFeatureIdx_Load<= '1';
				RowIdx_Rst<= '0'; 
				CurrPositionInRow_Rst<='0';
				CurrPositionInRow_Load<='1';
			else
				RqstToMainCtrl<= '1'; LayerDone<='1';
				NxtState<= S_Rst;
				GrpBase_Rst<='1';
				GrpBase_Load<='0';
				CurrGrpOffsetInFeature_InTermOf24Words_Rst<='1';		
				CurrGrpOffsetInFeature_InTermOf24Words_Load<='0';
				CurrFeatureIdx_rst<= '1'; 
				CurrFeatureIdx_Load<= '0';
				RowIdx_Rst<= '1'; 
				CurrPositionInRow_Rst<='1';
				CurrPositionInRow_Load<='0';
			end if;
		when S_CenterCase =>
			RqstToMainCtrl<= '0'; LayerDone<='0';
			RqstToDDR<='0';
			CurrFeatureIdx_rst<= '0'; CurrFeatureIdx_Increament<='0'; 
			CurrFeatureIdx_Load<= '0';			
			GrpBase_Rst<='0'; GrpBase_Increament<='0';
			GrpBase_Load<='0'; GrpBase_MoreIncreament<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Rst<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Load<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Increament<= '0';
			RowIdx_Rst<= '0'; RowIdx_Increament<='0';
			CurrPositionInRow_Rst<='0';
			CurrPositionInRow_Load<='0'; CurrPositionInRow_ReLoad<='0';
			CurrPositionInRow_Increament<='0';
			WordsOnTemp_Rst<='0'; WordsOnFIFO_Rst<='0';
			WordsOnTemp_En<='0'; WordsOnFIFO_En<='0';
			WordsOnTemp_Unfloped<= "00"; WordsOnFIFO_Unfloped<="00";			
			FirstRow_Reset<='0'; FirstRow_Set<='0';
			-- Signals to DataPath
			LatchDDRData<= '0';	ShiftDDRData<='0';	
			WriteFIFO<='0';	ReadFIFO<='0';
			TempStorage_Set0_Load<='0';	TempStorage_Set1_Load<='0';
			Set0_Load<= '0'; Set0_LoadZeroes<='0';
			Set1_Load<='0';  Set1_LoadZeroes<='0';
			Set0_Sel_DDRorFIFOorTemp<= "00";
			Set1_Sel_DDRorFIFOorTemp<="00";
			FIFOInSel_DDRorTemp<='0';

			if (WordsPresentLocally= to_unsigned(0,2) ) then
				NxtState<= S_Zero_RqstToDDR;
			elsif (WordsPresentLocally= to_unsigned(1,2) ) then
				if (LastPositionInRow='1' and GrpOf8WordsLeftInARow=std_logic_vector(to_unsigned(1,6))) then
					NxtState <= S_One_NoDDRRqst_DirectlyLoad;
				else
					NxtState <= S_One_LoadFromFIFOorTemp;
				end if;	
			elsif (WordsPresentLocally= to_unsigned(2,2) ) then
				NxtState<= S_Two_LoadFromFIFOorTemp;
			else
				NxtState<= S_CenterCase;
			end if;
		--#Begin	Zero Word Locally -----------
		when S_Zero_RqstToDDR =>
			RqstToMainCtrl<= '0'; LayerDone<='0';
			CurrFeatureIdx_rst<= '0'; CurrFeatureIdx_Increament<='0'; 
			CurrFeatureIdx_Load<= '0';			
			GrpBase_Rst<='0'; GrpBase_Increament<='0';
			GrpBase_Load<='0'; GrpBase_MoreIncreament<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Rst<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Load<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Increament<= '0';
			RowIdx_Rst<= '0'; RowIdx_Increament<='0';
			CurrPositionInRow_Rst<='0';
			CurrPositionInRow_Load<='0'; CurrPositionInRow_ReLoad<='0';
			CurrPositionInRow_Increament<='0';
			WordsOnTemp_Rst<='0'; WordsOnFIFO_Rst<='0';
			WordsOnTemp_En<='0'; WordsOnFIFO_En<='0';
			WordsOnTemp_Unfloped<= "00"; WordsOnFIFO_Unfloped<="00";				
			FirstRow_Reset<='0'; FirstRow_Set<='0';
			-- Signals to DataPath
			ShiftDDRData<='0';	
			WriteFIFO<='0';	ReadFIFO<='0';
			TempStorage_Set0_Load<='0';	TempStorage_Set1_Load<='0';
			Set0_Load<= '0'; Set0_LoadZeroes<='0';
			Set1_Load<='0';  Set1_LoadZeroes<='0';
			Set0_Sel_DDRorFIFOorTemp<= "00";
			Set1_Sel_DDRorFIFOorTemp<="00";
			FIFOInSel_DDRorTemp<='0';

			if (AckFromDDR='1') then
				RqstToDDR<= '0';
				LatchDDRData<= '1';
				NxtState<= S_Zero_LoadFirstSet;
			else
				RqstToDDR<= '1';
				LatchDDRData<= '0';
				NxtState<= S_Zero_RqstToDDR;
			end if;	
		when S_Zero_LoadFirstSet=>
			RqstToDDR<= '0';
			RqstToMainCtrl<= '0'; LayerDone<='0';
			CurrFeatureIdx_rst<= '0'; CurrFeatureIdx_Increament<='0'; 
			CurrFeatureIdx_Load<= '0';			
			GrpBase_Rst<='0'; GrpBase_Increament<='0';
			GrpBase_Load<='0';GrpBase_MoreIncreament<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Rst<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Load<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Increament<= '0';
			RowIdx_Rst<= '0'; RowIdx_Increament<='0';
			CurrPositionInRow_Rst<='0';
			CurrPositionInRow_Load<='0'; CurrPositionInRow_ReLoad<='0';
			CurrPositionInRow_Increament<='0';
			WordsOnTemp_Rst<='0'; WordsOnFIFO_Rst<='0';
			WordsOnTemp_En<='0'; WordsOnFIFO_En<='0';
			WordsOnTemp_Unfloped<= "00"; WordsOnFIFO_Unfloped<="00";			
			FirstRow_Reset<='0'; FirstRow_Set<='0';
			-- Signals to DataPath
			LatchDDRData<= '0';	ShiftDDRData<='1';	
			WriteFIFO<='0';	ReadFIFO<='0';
			TempStorage_Set0_Load<='0';	TempStorage_Set1_Load<='0';
			Set0_Load<= '1'; Set0_LoadZeroes<='0'; -- Surely Load Set0
			Set1_Load<='0';  Set1_LoadZeroes<='0';
			Set0_Sel_DDRorFIFOorTemp<= "00";
			Set1_Sel_DDRorFIFOorTemp<="00";
			FIFOInSel_DDRorTemp<='0';
			NxtState<= S_Zero_LoadSecondSet;			
		when S_Zero_LoadSecondSet => 
			RqstToDDR<= '0';
			RqstToMainCtrl<= '0'; LayerDone<='0';
			CurrFeatureIdx_rst<= '0'; CurrFeatureIdx_Increament<='0'; 
			CurrFeatureIdx_Load<= '0';			
			GrpBase_Rst<='0'; GrpBase_Increament<='0';
			GrpBase_Load<='0'; GrpBase_MoreIncreament<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Rst<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Load<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Increament<= '0';
			RowIdx_Rst<= '0'; RowIdx_Increament<='0';
			CurrPositionInRow_Rst<='0';
			CurrPositionInRow_Load<='0'; CurrPositionInRow_ReLoad<='0';
			CurrPositionInRow_Increament<='0';
			WordsOnTemp_Rst<='0'; WordsOnFIFO_Rst<='0';
			WordsOnTemp_En<='0'; WordsOnFIFO_En<='0';
			WordsOnTemp_Unfloped<= "00"; WordsOnFIFO_Unfloped<="00";			
			FirstRow_Reset<='0'; FirstRow_Set<='0';
			-- Signals to DataPath
			LatchDDRData<= '0';		
			WriteFIFO<='0';	ReadFIFO<='0';
			TempStorage_Set0_Load<='0';	TempStorage_Set1_Load<='0';
			Set0_Load<= '0'; Set0_LoadZeroes<='0';
			Set0_Sel_DDRorFIFOorTemp<= "00";
			Set1_Sel_DDRorFIFOorTemp<="00";
			FIFOInSel_DDRorTemp<='0';
			if (LastPositionInRow='1' and GrpOf8WordsLeftInARow=std_logic_vector(to_unsigned(1,6))) then
				ShiftDDRData<='0';
				Set1_Load<='0';  Set1_LoadZeroes<='1';
				NxtState<= S_Zero_LoadSecondSetToFIFO;
			else
				ShiftDDRData<='1';
				Set1_Load<='1';  Set1_LoadZeroes<='0';
				NxtState<= S_Zero_LoadThirdSetToFIFOorTemp;
			end if;						
		when S_Zero_LoadSecondSetToFIFO =>	
			RqstToDDR<= '0';
			RqstToMainCtrl<= '0'; LayerDone<='0';
			CurrFeatureIdx_rst<= '0'; CurrFeatureIdx_Increament<='0'; 
			CurrFeatureIdx_Load<= '0';			
			GrpBase_Rst<='0'; GrpBase_Increament<='0';
			GrpBase_Load<='0'; GrpBase_MoreIncreament<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Rst<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Load<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Increament<= '0';
			RowIdx_Rst<= '0'; RowIdx_Increament<='0';
			CurrPositionInRow_Rst<='0';
			CurrPositionInRow_Load<='0'; CurrPositionInRow_ReLoad<='0';
			CurrPositionInRow_Increament<='0';
			WordsOnTemp_Rst<='0'; WordsOnFIFO_Rst<='0';
			WordsOnTemp_En<='0'; WordsOnFIFO_En<='0';
			WordsOnTemp_Unfloped<= "00"; WordsOnFIFO_Unfloped<="00";			
			FirstRow_Reset<='0'; FirstRow_Set<='0';
			-- Signals to DataPath
			LatchDDRData<= '0';	ShiftDDRData<='1';
			WriteFIFO<='1';	ReadFIFO<='0';
			TempStorage_Set0_Load<='0';	TempStorage_Set1_Load<='0';
			Set0_Load<= '0'; Set0_LoadZeroes<='0';
			Set1_Load<='0';  Set1_LoadZeroes<='0';
			Set0_Sel_DDRorFIFOorTemp<= "00";
			Set1_Sel_DDRorFIFOorTemp<="00";
			FIFOInSel_DDRorTemp<='0';
			NxtState <= S_Zero_LoadThirdSetToFIFOorTemp;
		when S_Zero_LoadThirdSetToFIFOorTemp=>
			RqstToDDR<= '0';
			RqstToMainCtrl<= '0'; LayerDone<='0';
			CurrFeatureIdx_rst<= '0'; CurrFeatureIdx_Increament<='0'; 
			CurrFeatureIdx_Load<= '0';			
			GrpBase_Rst<='0'; GrpBase_Increament<='0';
			GrpBase_Load<='0'; GrpBase_MoreIncreament<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Rst<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Load<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Increament<= '0';
			RowIdx_Rst<= '0'; RowIdx_Increament<='0';
			CurrPositionInRow_Rst<='0';
			CurrPositionInRow_Load<='0'; CurrPositionInRow_ReLoad<='0';
			CurrPositionInRow_Increament<='0';
			WordsOnTemp_Rst<='0'; WordsOnFIFO_Rst<='0';			
			FirstRow_Reset<='0'; FirstRow_Set<='0';
			-- Signals to DataPath
			LatchDDRData<= '0';	ShiftDDRData<='0';
			ReadFIFO<='0';
			TempStorage_Set1_Load<='0';
			Set0_Load<= '0'; Set0_LoadZeroes<='0';
			Set1_Load<='0';  Set1_LoadZeroes<='0';
			Set0_Sel_DDRorFIFOorTemp<= "00";
			Set1_Sel_DDRorFIFOorTemp<="00";
			FIFOInSel_DDRorTemp<='0';
			if (LastPositionInRow='1') then
				WriteFIFO<='1';	
				TempStorage_Set0_Load<='0';
				WordsOnTemp_Unfloped<= "00"; 
				WordsOnTemp_En<='0'; 
				if (LastFeatureBeingWritten='1' and GrpOf8WordsLeftInARow=std_logic_vector(to_unsigned(1,6))) then
					WordsOnFIFO_En<='1';
					WordsOnFIFO_Unfloped<="10";
				elsif (LastFeatureBeingWritten='1' and GrpOf8WordsLeftInARow=std_logic_vector(to_unsigned(2,6))) then
					WordsOnFIFO_En<='1';
					WordsOnFIFO_Unfloped<="01";
				else
					WordsOnFIFO_En<='0';
					WordsOnFIFO_Unfloped<="00";					
				end if;
			else
				WriteFIFO<='0';	
				TempStorage_Set0_Load<='1';
				WordsOnTemp_En<='1'; WordsOnFIFO_En<='0'; 
				WordsOnTemp_Unfloped<= "01";
				WordsOnFIFO_Unfloped<="00";		
			end if;
			NxtState<= S_Zero_IdxUpdate;
		when S_Zero_IdxUpdate =>
			RqstToDDR<= '0';
			RqstToMainCtrl<= '0'; LayerDone<='0';
			ReadFIFO<='0';
			GrpBase_Rst<='0'; GrpBase_Load<='0';
			GrpBase_Increament<='0';
			CurrFeatureIdx_Load<= '0';			
			CurrPositionInRow_Load<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Load<='0';
			WordsOnTemp_Rst<='0'; WordsOnFIFO_Rst<='0';
			WordsOnTemp_En<='0'; WordsOnFIFO_En<='0';
			WordsOnTemp_Unfloped<= "00"; WordsOnFIFO_Unfloped<="00";				
			FirstRow_Set<='0';
			-- Signals to DataPath
			LatchDDRData<='0'; ShiftDDRData<='0';	
			WriteFIFO<='0';	ReadFIFO<='0';
			TempStorage_Set0_Load<='0';	TempStorage_Set1_Load<='0';
			Set0_Load<= '0'; Set0_LoadZeroes<='0';
			Set1_Load<='0';  Set1_LoadZeroes<='0';
			Set0_Sel_DDRorFIFOorTemp<= "00";
			Set1_Sel_DDRorFIFOorTemp<="00";
			FIFOInSel_DDRorTemp<='0';
			
			if (LastPositionInRow='1') then
				if (LastFeatureBeingWritten='1') then
					FirstRow_Reset<='1'; 
					CurrPositionInRow_ReLoad<='0';
					if (LastRowBeingWritten='1') then
						CurrPositionInRow_Rst<='1';
						CurrPositionInRow_Increament<='0';
						CurrGrpOffsetInFeature_InTermOf24Words_Rst<='1';
						CurrGrpOffsetInFeature_InTermOf24Words_Increament<= '0';
						RowIdx_Rst<= '1';RowIdx_Increament<='0';
						CurrFeatureIdx_rst<= '1'; CurrFeatureIdx_Increament<='0'; 
						GrpBase_MoreIncreament<='0';												
						NxtState<= S_Rst;
					else
						CurrPositionInRow_Rst<='1';
						CurrPositionInRow_Increament<='0';
						CurrGrpOffsetInFeature_InTermOf24Words_Rst<='1';
						CurrGrpOffsetInFeature_InTermOf24Words_Increament<= '0';
						RowIdx_Rst<= '0';RowIdx_Increament<='1';
						CurrFeatureIdx_rst<= '1'; CurrFeatureIdx_Increament<='0'; 
						GrpBase_MoreIncreament<='1';	
						NxtState<= S_CenterTail_0;
					end if;
				else
					FirstRow_Reset<='0'; 
					if (FirstRow_Flag='1') then
						CurrPositionInRow_Rst<='0';
						CurrPositionInRow_ReLoad<='1';
					else
						CurrPositionInRow_Rst<='1';
						CurrPositionInRow_ReLoad<='0';
					end if;
					CurrPositionInRow_Increament<='0';
					CurrGrpOffsetInFeature_InTermOf24Words_Rst<='1';
					CurrGrpOffsetInFeature_InTermOf24Words_Increament<= '0';
					RowIdx_Rst<= '0';RowIdx_Increament<='0';	
					CurrFeatureIdx_rst<= '0'; CurrFeatureIdx_Increament<='1'; 
					GrpBase_MoreIncreament<='0';
					NxtState <= S_CenterTail_0;
				end if;
			else
				CurrPositionInRow_ReLoad<='0';
				FirstRow_Reset<='0'; 
				CurrPositionInRow_Rst<='0';
				CurrPositionInRow_Increament<='1';
				CurrGrpOffsetInFeature_InTermOf24Words_Rst<='0';
				CurrGrpOffsetInFeature_InTermOf24Words_Increament<= '1';
				RowIdx_Rst<= '0';RowIdx_Increament<='0';
				CurrFeatureIdx_rst<= '0'; CurrFeatureIdx_Increament<='0'; 
				GrpBase_MoreIncreament<='0';
				NxtState <= S_CenterTail_0;
			end if;
		--#End	--Zero Word Locally -----------

		--#Begin --One Word available locally--
		when S_One_NoDDRRqst_DirectlyLoad =>
			RqstToMainCtrl<= '0'; LayerDone<='0';
			RqstToDDR<='0';
			CurrFeatureIdx_rst<= '0'; CurrFeatureIdx_Increament<='0'; 
			CurrFeatureIdx_Load<= '0';			
			GrpBase_Rst<='0'; GrpBase_Increament<='0';
			GrpBase_Load<='0'; GrpBase_MoreIncreament<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Rst<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Load<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Increament<= '0';
			RowIdx_Rst<= '0'; RowIdx_Increament<='0';
			CurrPositionInRow_Rst<='0';
			CurrPositionInRow_Load<='0'; CurrPositionInRow_ReLoad<='0';
			CurrPositionInRow_Increament<='0';
			WordsOnTemp_En<='0'; WordsOnFIFO_En<='0';
			WordsOnTemp_Unfloped<= "00"; WordsOnFIFO_Unfloped<="00";			
			FirstRow_Reset<='0'; FirstRow_Set<='0';
			-- Signals to DataPath
			LatchDDRData<= '0';	ShiftDDRData<='0';	
			WriteFIFO<='0';	
			TempStorage_Set0_Load<='0';	TempStorage_Set1_Load<='0';
			Set0_Load<= '1'; Set0_LoadZeroes<='0';
			Set1_Load<='0';  Set1_LoadZeroes<='1';			
			Set1_Sel_DDRorFIFOorTemp<="00";
			FIFOInSel_DDRorTemp<='0';
			WordsOnTemp_Rst<='1'; 
			if (FirstPositionInRow='1') then
				Set0_Sel_DDRorFIFOorTemp<= "01";
				ReadFIFO<='1';
			else
				ReadFIFO<='0';
				Set0_Sel_DDRorFIFOorTemp<= "10";
				WordsOnFIFO_Rst<='0';
			end if;
			if (LastFeatureBeingWritten='1') then
				WordsOnFIFO_Rst<='1';
			else
				WordsOnFIFO_Rst<='0';
			end if;
			NxtState <= S_One_IdxUpdate_0;
		when S_One_LoadFromFIFOorTemp =>
			RqstToMainCtrl<= '0'; LayerDone<='0';
			RqstToDDR<='0';
			CurrFeatureIdx_rst<= '0'; CurrFeatureIdx_Increament<='0'; 
			CurrFeatureIdx_Load<= '0';			
			GrpBase_Rst<='0'; GrpBase_Increament<='0';
			GrpBase_Load<='0'; GrpBase_MoreIncreament<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Rst<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Load<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Increament<= '0';
			RowIdx_Rst<= '0'; RowIdx_Increament<='0';
			CurrPositionInRow_Rst<='0';
			CurrPositionInRow_Load<='0'; CurrPositionInRow_ReLoad<='0';
			CurrPositionInRow_Increament<='0';
			WordsOnFIFO_Rst<='0';WordsOnTemp_Rst<='0';
			WordsOnTemp_En<='0'; WordsOnFIFO_En<='0';
			WordsOnTemp_Unfloped<= "00"; WordsOnFIFO_Unfloped<="00";			
			FirstRow_Reset<='0'; FirstRow_Set<='0';
			-- Signals to DataPath
			LatchDDRData<= '0';	ShiftDDRData<='0';	
			WriteFIFO<='0';	
			TempStorage_Set0_Load<='0';	TempStorage_Set1_Load<='0';
			Set0_Load<= '1'; Set0_LoadZeroes<='0';
			Set1_Load<='0';  Set1_LoadZeroes<='0';			
			Set1_Sel_DDRorFIFOorTemp<="00"; 
			FIFOInSel_DDRorTemp<='0';
			if (FirstPositionInRow='1') then
				Set0_Sel_DDRorFIFOorTemp<= "01";
				ReadFIFO<='1';
			else
				ReadFIFO<='0';
				Set0_Sel_DDRorFIFOorTemp<= "10";
			end if;
			NxtState <= S_One_RqstToDDR;
		when S_One_RqstToDDR =>
			RqstToMainCtrl<= '0'; LayerDone<='0';
			CurrFeatureIdx_rst<= '0'; CurrFeatureIdx_Increament<='0'; 
			CurrFeatureIdx_Load<= '0';			
			GrpBase_Rst<='0'; GrpBase_Increament<='0';
			GrpBase_Load<='0'; GrpBase_MoreIncreament<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Rst<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Load<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Increament<= '0';
			RowIdx_Rst<= '0'; RowIdx_Increament<='0';
			CurrPositionInRow_Rst<='0';
			CurrPositionInRow_Load<='0'; CurrPositionInRow_ReLoad<='0';
			CurrPositionInRow_Increament<='0';
			WordsOnTemp_Rst<='0'; WordsOnFIFO_Rst<='0';
			WordsOnTemp_En<='0'; WordsOnFIFO_En<='0';
			WordsOnTemp_Unfloped<= "00"; WordsOnFIFO_Unfloped<="00";				
			FirstRow_Reset<='0'; FirstRow_Set<='0';
			-- Signals to DataPath
			ShiftDDRData<='0';	
			WriteFIFO<='0';	ReadFIFO<='0';
			TempStorage_Set0_Load<='0';	TempStorage_Set1_Load<='0';
			Set0_Load<= '0'; Set0_LoadZeroes<='0';
			Set1_Load<='0';  Set1_LoadZeroes<='0';
			Set0_Sel_DDRorFIFOorTemp<= "00";
			Set1_Sel_DDRorFIFOorTemp<="00";
			FIFOInSel_DDRorTemp<='0';
			if (AckFromDDR='1') then
				RqstToDDR<= '0';
				LatchDDRData<= '1';
				NxtState<= S_One_LoadFirstSetToOutput;
			else
				RqstToDDR<= '1';
				LatchDDRData<= '0';
				NxtState<= S_One_RqstToDDR;
			end if;	
		when S_One_LoadFirstSetToOutput =>
			RqstToMainCtrl<= '0'; LayerDone<='0';
			RqstToDDR<= '0';
			CurrFeatureIdx_rst<= '0'; CurrFeatureIdx_Increament<='0'; 
			CurrFeatureIdx_Load<= '0';			
			GrpBase_Rst<='0'; GrpBase_Increament<='0';
			GrpBase_Load<='0'; GrpBase_MoreIncreament<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Rst<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Load<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Increament<= '0';
			RowIdx_Rst<= '0'; RowIdx_Increament<='0';
			CurrPositionInRow_Rst<='0';
			CurrPositionInRow_Load<='0'; CurrPositionInRow_ReLoad<='0';
			CurrPositionInRow_Increament<='0';
			WordsOnTemp_Rst<='0'; WordsOnFIFO_Rst<='0';
			WordsOnTemp_En<='0'; WordsOnFIFO_En<='0';
			WordsOnTemp_Unfloped<= "00"; WordsOnFIFO_Unfloped<="00";				
			FirstRow_Reset<='0'; FirstRow_Set<='0';
			-- Signals to DataPath
			LatchDDRData<= '0';	ShiftDDRData<='1';	
			WriteFIFO<='0';	ReadFIFO<='0';
			TempStorage_Set0_Load<='0';	TempStorage_Set1_Load<='0';
			Set0_Load<= '0'; Set0_LoadZeroes<='0';
			Set1_Load<='1';  Set1_LoadZeroes<='0';
			Set0_Sel_DDRorFIFOorTemp<= "00";
			Set1_Sel_DDRorFIFOorTemp<="00";
			FIFOInSel_DDRorTemp<='0';
			NxtState<= S_One_LoadSecondSetToFIFOorTemp;
		when S_One_LoadSecondSetToFIFOorTemp =>
			RqstToMainCtrl<= '0'; LayerDone<='0';
			RqstToDDR<= '0';
			CurrFeatureIdx_rst<= '0'; CurrFeatureIdx_Increament<='0'; 
			CurrFeatureIdx_Load<= '0';			
			GrpBase_Rst<='0'; GrpBase_Increament<='0';
			GrpBase_Load<='0'; GrpBase_MoreIncreament<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Rst<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Load<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Increament<= '0';
			RowIdx_Rst<= '0'; RowIdx_Increament<='0';
			CurrPositionInRow_Rst<='0';
			CurrPositionInRow_Load<='0'; CurrPositionInRow_ReLoad<='0';
			CurrPositionInRow_Increament<='0';
			WordsOnTemp_Rst<='0'; WordsOnFIFO_Rst<='0';
			WordsOnTemp_En<='0'; WordsOnFIFO_En<='0';
			WordsOnTemp_Unfloped<= "00"; WordsOnFIFO_Unfloped<="00";				
			FirstRow_Reset<='0'; FirstRow_Set<='0';
			-- Signals to DataPath
			LatchDDRData<= '0';	ShiftDDRData<='1';	
			ReadFIFO<='0';
			TempStorage_Set0_Load<='0';	TempStorage_Set1_Load<='0';
			Set0_Load<= '0'; Set0_LoadZeroes<='0';
			Set1_Load<='0';  Set1_LoadZeroes<='0';
			Set0_Sel_DDRorFIFOorTemp<= "00";
			Set1_Sel_DDRorFIFOorTemp<="00";
			FIFOInSel_DDRorTemp<='0';
			if (LastPositionInRow='1') then
				WriteFIFO<='1';
				TempStorage_Set0_Load<='0';
			else
				WriteFIFO<='0';
				TempStorage_Set0_Load<='1';
			end if;
			NxtState<= S_One_LoadThirdSetToFIFOorTemp;	
		when S_One_LoadThirdSetToFIFOorTemp =>
			RqstToDDR<= '0';
			RqstToMainCtrl<= '0'; LayerDone<='0';
			CurrFeatureIdx_rst<= '0'; CurrFeatureIdx_Increament<='0'; 
			CurrFeatureIdx_Load<= '0';			
			GrpBase_Rst<='0'; GrpBase_Increament<='0';
			GrpBase_Load<='0'; GrpBase_MoreIncreament<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Rst<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Load<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Increament<= '0';
			RowIdx_Rst<= '0'; RowIdx_Increament<='0';
			CurrPositionInRow_Rst<='0';
			CurrPositionInRow_Load<='0'; CurrPositionInRow_ReLoad<='0';
			CurrPositionInRow_Increament<='0';
			WordsOnTemp_Rst<='0'; WordsOnFIFO_Rst<='0';			
			FirstRow_Reset<='0'; FirstRow_Set<='0';
			-- Signals to DataPath
			LatchDDRData<= '0';	ShiftDDRData<='0';
			ReadFIFO<='0';
			TempStorage_Set0_Load<='0';
			Set0_Load<= '0'; Set0_LoadZeroes<='0';
			Set1_Load<='0';  Set1_LoadZeroes<='0';
			Set0_Sel_DDRorFIFOorTemp<= "00";
			Set1_Sel_DDRorFIFOorTemp<="00";
			FIFOInSel_DDRorTemp<='0';
			WordsOnTemp_En<='1'; 
			if (LastPositionInRow='1') then
				WriteFIFO<='1';	
				TempStorage_Set1_Load<='0';
				WordsOnTemp_Unfloped<= "00"; 
				if (LastFeatureBeingWritten='1') then
					WordsOnFIFO_En<='1';
					WordsOnFIFO_Unfloped<="10";
				else
					WordsOnFIFO_En<='0';
					WordsOnFIFO_Unfloped<="00";					
				end if;
			else
				WriteFIFO<='0';	
				TempStorage_Set1_Load<='1';
				WordsOnFIFO_En<='0'; 
				WordsOnTemp_Unfloped<= "10";
				WordsOnFIFO_Unfloped<="00";		
			end if;
			NxtState<= S_One_IdxUpdate_1;
		when S_One_IdxUpdate_0 =>
			RqstToDDR<= '0';
			RqstToMainCtrl<= '0'; LayerDone<='0';
			ReadFIFO<='0';
			GrpBase_Rst<='0'; GrpBase_Load<='0';
			GrpBase_MoreIncreament<='0';
			CurrFeatureIdx_Load<= '0';			
			CurrPositionInRow_Load<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Load<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Increament<= '0';
			WordsOnTemp_Rst<='0'; WordsOnFIFO_Rst<='0';
			WordsOnTemp_En<='0'; WordsOnFIFO_En<='0';
			WordsOnTemp_Unfloped<= "00"; WordsOnFIFO_Unfloped<="00";				
			FirstRow_Set<='0';
			-- Signals to DataPath
			LatchDDRData<='0'; ShiftDDRData<='0';	
			WriteFIFO<='0';	ReadFIFO<='0';
			TempStorage_Set0_Load<='0';	TempStorage_Set1_Load<='0';
			Set0_Load<= '0'; Set0_LoadZeroes<='0';
			Set1_Load<='0';  Set1_LoadZeroes<='0';
			Set0_Sel_DDRorFIFOorTemp<= "00";
			Set1_Sel_DDRorFIFOorTemp<="00";
			FIFOInSel_DDRorTemp<='0';
			
			if (LastPositionInRow='1') then
				if (LastFeatureBeingWritten='1') then
					FirstRow_Reset<='1'; 
					CurrPositionInRow_ReLoad<='0';
					if (LastRowBeingWritten='1') then
						CurrPositionInRow_Rst<='1';
						CurrPositionInRow_Increament<='0';
						CurrGrpOffsetInFeature_InTermOf24Words_Rst<='1';
						RowIdx_Rst<= '1';RowIdx_Increament<='0';
						CurrFeatureIdx_rst<= '1'; CurrFeatureIdx_Increament<='0'; 
						GrpBase_Increament<='0';
						NxtState<= S_Rst;
					else
						CurrPositionInRow_Rst<='1';
						CurrPositionInRow_Increament<='0';
						CurrGrpOffsetInFeature_InTermOf24Words_Rst<='1';
						RowIdx_Rst<= '0';RowIdx_Increament<='1';
						CurrFeatureIdx_rst<= '1'; CurrFeatureIdx_Increament<='0'; 
						GrpBase_Increament<='1';
						NxtState<= S_CenterTail_0;
					end if;
				else
					FirstRow_Reset<='0'; 
					if (FirstRow_Flag='1') then
						CurrPositionInRow_Rst<='0';
						CurrPositionInRow_ReLoad<='1';
					else
						CurrPositionInRow_Rst<='1';
						CurrPositionInRow_ReLoad<='0';
					end if;
					CurrPositionInRow_Increament<='0';
					CurrGrpOffsetInFeature_InTermOf24Words_Rst<='1';
					RowIdx_Rst<= '0';RowIdx_Increament<='0';	
					CurrFeatureIdx_rst<= '0'; CurrFeatureIdx_Increament<='1'; 
					GrpBase_Increament<='0';
					NxtState <= S_CenterTail_0;
				end if;
			else
				CurrPositionInRow_ReLoad<='0';
				FirstRow_Reset<='0'; 
				CurrPositionInRow_Rst<='0';
				CurrPositionInRow_Increament<='1';
				CurrGrpOffsetInFeature_InTermOf24Words_Rst<='0';
				RowIdx_Rst<= '0';RowIdx_Increament<='0';
				CurrFeatureIdx_rst<= '0'; CurrFeatureIdx_Increament<='0'; 
				GrpBase_Increament<='0';
				NxtState <= S_CenterTail_0;
			end if;
		when S_One_IdxUpdate_1 =>
			RqstToMainCtrl<= '0'; LayerDone<='0';
			ReadFIFO<='0'; RqstToDDR<= '0';
			GrpBase_Rst<='0'; GrpBase_Load<='0';
			GrpBase_Increament<='0';
			CurrFeatureIdx_Load<= '0';			
			CurrPositionInRow_Load<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Load<='0';
			WordsOnTemp_Rst<='0'; WordsOnFIFO_Rst<='0';
			WordsOnTemp_En<='0'; WordsOnFIFO_En<='0';
			WordsOnTemp_Unfloped<= "00"; WordsOnFIFO_Unfloped<="00";				
			FirstRow_Set<='0';
			-- Signals to DataPath
			LatchDDRData<='0'; ShiftDDRData<='0';	
			WriteFIFO<='0';	ReadFIFO<='0';
			TempStorage_Set0_Load<='0';	TempStorage_Set1_Load<='0';
			Set0_Load<= '0'; Set0_LoadZeroes<='0';
			Set1_Load<='0';  Set1_LoadZeroes<='0';
			Set0_Sel_DDRorFIFOorTemp<= "00";
			Set1_Sel_DDRorFIFOorTemp<="00";
			FIFOInSel_DDRorTemp<='0';
			
			if (LastPositionInRow='1') then
				if (LastFeatureBeingWritten='1') then
					FirstRow_Reset<='1'; 
					CurrPositionInRow_ReLoad<='0';
					if (LastRowBeingWritten='1') then
						CurrPositionInRow_Rst<='1';
						CurrPositionInRow_Increament<='0';
						CurrGrpOffsetInFeature_InTermOf24Words_Rst<='1';
						CurrGrpOffsetInFeature_InTermOf24Words_Increament<= '0';
						RowIdx_Rst<= '1';RowIdx_Increament<='0';
						CurrFeatureIdx_rst<= '1'; CurrFeatureIdx_Increament<='0'; 
						GrpBase_MoreIncreament<='0';												
						NxtState<= S_Rst;
					else
						CurrPositionInRow_Rst<='1';
						CurrPositionInRow_Increament<='0';
						CurrGrpOffsetInFeature_InTermOf24Words_Rst<='1';
						CurrGrpOffsetInFeature_InTermOf24Words_Increament<= '0';
						RowIdx_Rst<= '0';RowIdx_Increament<='1';
						CurrFeatureIdx_rst<= '1'; CurrFeatureIdx_Increament<='0'; 
						GrpBase_MoreIncreament<='1';	
						NxtState<= S_CenterTail_0;
					end if;
				else
					FirstRow_Reset<='0'; 
					if (FirstRow_Flag='1') then
						CurrPositionInRow_Rst<='0';
						CurrPositionInRow_ReLoad<='1';
					else
						CurrPositionInRow_Rst<='1';
						CurrPositionInRow_ReLoad<='0';
					end if;
					CurrPositionInRow_Increament<='0';
					CurrGrpOffsetInFeature_InTermOf24Words_Rst<='1';
					CurrGrpOffsetInFeature_InTermOf24Words_Increament<= '0';
					RowIdx_Rst<= '0';RowIdx_Increament<='0';	
					CurrFeatureIdx_rst<= '0'; CurrFeatureIdx_Increament<='1'; 
					GrpBase_MoreIncreament<='0';
					NxtState <= S_CenterTail_0;
				end if;
			else
				CurrPositionInRow_ReLoad<='0';
				FirstRow_Reset<='0'; 
				CurrPositionInRow_Rst<='0';
				CurrPositionInRow_Increament<='1';
				CurrGrpOffsetInFeature_InTermOf24Words_Rst<='0';
				CurrGrpOffsetInFeature_InTermOf24Words_Increament<= '1';
				RowIdx_Rst<= '0';RowIdx_Increament<='0';
				CurrFeatureIdx_rst<= '0'; CurrFeatureIdx_Increament<='0'; 
				GrpBase_MoreIncreament<='0';
				NxtState <= S_CenterTail_0;
			end if;
		--#End	 --One Word available locally--

		--#Begin --Two Word available locally--
		when S_Two_LoadFromFIFOorTemp =>
			RqstToMainCtrl<= '0'; LayerDone<='0';
			RqstToDDR<= '0'; 
			CurrFeatureIdx_rst<= '0'; CurrFeatureIdx_Increament<='0'; 
			CurrFeatureIdx_Load<= '0';			
			GrpBase_Rst<='0'; GrpBase_Increament<='0';
			GrpBase_Load<='0'; GrpBase_MoreIncreament<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Rst<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Load<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Increament<= '0';
			RowIdx_Rst<= '0'; RowIdx_Increament<='0';
			CurrPositionInRow_Rst<='0';
			CurrPositionInRow_Load<='0'; CurrPositionInRow_ReLoad<='0';
			CurrPositionInRow_Increament<='0';
			WordsOnTemp_Rst<='0'; WordsOnFIFO_Rst<='0';
			WordsOnTemp_En<='1'; 		
			WordsOnTemp_Unfloped<= "00";
			FirstRow_Reset<='0'; FirstRow_Set<='0';
			-- Signals to DataPath
			LatchDDRData<='0';ShiftDDRData<='0';				
			TempStorage_Set0_Load<='0';	TempStorage_Set1_Load<='0';
			Set0_Load<= '1'; Set0_LoadZeroes<='0';
			FIFOInSel_DDRorTemp<='1'; -- Write From Temp
			if (FirstPositionInRow='1') then
				WriteFIFO<='0';	ReadFIFO<='1';				
				Set1_Load<='1';  Set1_LoadZeroes<='0';			
				Set0_Sel_DDRorFIFOorTemp<= "01";
				Set1_Sel_DDRorFIFOorTemp<="01";
				NxtState<= S_Two_LoadSecondWordFromFIFO;
			elsif (LastPositionInRow='1' and GrpOf8WordsLeftInARow=std_logic_vector(to_unsigned(1,6))) then
				WriteFIFO<='1';	ReadFIFO<='0';
				Set1_Load<='0';  Set1_LoadZeroes<='1';			
				Set0_Sel_DDRorFIFOorTemp<= "10";
				Set1_Sel_DDRorFIFOorTemp<="00";
				NxtState<= S_Two_IdxUpdate;
			else
				WriteFIFO<='0';	ReadFIFO<='0';				
				Set1_Load<='1';  Set1_LoadZeroes<='0';			
				Set0_Sel_DDRorFIFOorTemp<= "10";
				Set1_Sel_DDRorFIFOorTemp<="10";
				NxtState<= S_Two_IdxUpdate;
			end if;				
			
			if (LastPositionInRow='1' and GrpOf8WordsLeftInARow=std_logic_vector(to_unsigned(1,6))) then
				if (LastFeatureBeingWritten='1') then
					 WordsOnFIFO_En<='1';
					 WordsOnFIFO_Unfloped<="01";
				else
					 WordsOnFIFO_En<='0';
					 WordsOnFIFO_Unfloped<="00";
				end if;
			elsif (LastPositionInRow='1' and GrpOf8WordsLeftInARow=std_logic_vector(to_unsigned(2,6))) then
				if (LastFeatureBeingWritten='1') then
					 WordsOnFIFO_En<='1';
					 WordsOnFIFO_Unfloped<="00";
				else
					 WordsOnFIFO_En<='0';
					 WordsOnFIFO_Unfloped<="00";
				end if;
			else
				WordsOnFIFO_En<='0';
				WordsOnFIFO_Unfloped<="00";
			end if;
		when S_Two_LoadSecondWordFromFIFO =>
			RqstToMainCtrl<= '0'; LayerDone<='0';
			RqstToDDR<= '0';			
			CurrFeatureIdx_rst<= '0'; CurrFeatureIdx_Increament<='0'; 
			CurrFeatureIdx_Load<= '0';			
			GrpBase_Rst<='0'; GrpBase_Increament<='0';
			GrpBase_Load<='0'; GrpBase_MoreIncreament<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Rst<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Load<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Increament<= '0';
			RowIdx_Rst<= '0'; RowIdx_Increament<='0';
			CurrPositionInRow_Rst<='0';
			CurrPositionInRow_Load<='0'; CurrPositionInRow_ReLoad<='0';
			CurrPositionInRow_Increament<='0';
			WordsOnTemp_Rst<='0'; WordsOnFIFO_Rst<='0';
			WordsOnTemp_En<='0'; WordsOnFIFO_En<='0';
			WordsOnTemp_Unfloped<= "00"; WordsOnFIFO_Unfloped<="00";				
			FirstRow_Reset<='0'; FirstRow_Set<='0';
			-- Signals to DataPath
			LatchDDRData<='0'; ShiftDDRData<='0';	
			WriteFIFO<='0';	ReadFIFO<='1';
			TempStorage_Set0_Load<='0';	TempStorage_Set1_Load<='0';
			Set0_Load<= '0'; Set0_LoadZeroes<='0';
			Set1_Load<='1';  Set1_LoadZeroes<='0';
			Set0_Sel_DDRorFIFOorTemp<= "00";
			Set1_Sel_DDRorFIFOorTemp<="01";
			FIFOInSel_DDRorTemp<='0';
			NxtState<= S_Two_IdxUpdate;
		when S_Two_IdxUpdate =>
			RqstToMainCtrl<= '0'; LayerDone<='0';
			ReadFIFO<='0'; RqstToDDR<= '0';
			GrpBase_Rst<='0'; GrpBase_Load<='0';
			GrpBase_MoreIncreament<='0';
			CurrFeatureIdx_Load<= '0';			
			CurrPositionInRow_Load<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Load<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Increament<= '0';
			WordsOnTemp_Rst<='0'; WordsOnFIFO_Rst<='0';
			WordsOnTemp_En<='0'; WordsOnFIFO_En<='0';
			WordsOnTemp_Unfloped<= "00"; WordsOnFIFO_Unfloped<="00";				
			FirstRow_Set<='0';
			-- Signals to DataPath
			LatchDDRData<='0'; ShiftDDRData<='0';	
			WriteFIFO<='0';	ReadFIFO<='0';
			TempStorage_Set0_Load<='0';	TempStorage_Set1_Load<='0';
			Set0_Load<= '0'; Set0_LoadZeroes<='0';
			Set1_Load<='0';  Set1_LoadZeroes<='0';
			Set0_Sel_DDRorFIFOorTemp<= "00";
			Set1_Sel_DDRorFIFOorTemp<="00";
			FIFOInSel_DDRorTemp<='0';
			
			if (LastPositionInRow='1') then
				if (LastFeatureBeingWritten='1') then
					FirstRow_Reset<='1'; 
					CurrPositionInRow_ReLoad<='0';
					if (LastRowBeingWritten='1') then
						CurrPositionInRow_Rst<='1';
						CurrPositionInRow_Increament<='0';
						CurrGrpOffsetInFeature_InTermOf24Words_Rst<='1';
						RowIdx_Rst<= '1';RowIdx_Increament<='0';
						CurrFeatureIdx_rst<= '1'; CurrFeatureIdx_Increament<='0'; 
						GrpBase_Increament<='0';
						NxtState<= S_Rst;
					else
						CurrPositionInRow_Rst<='1';
						CurrPositionInRow_Increament<='0';
						CurrGrpOffsetInFeature_InTermOf24Words_Rst<='1';
						RowIdx_Rst<= '0';RowIdx_Increament<='1';
						CurrFeatureIdx_rst<= '1'; CurrFeatureIdx_Increament<='0'; 
						GrpBase_Increament<='1';
						NxtState<= S_CenterTail_0;
					end if;
				else
					FirstRow_Reset<='0'; 
					if (FirstRow_Flag='1') then
						CurrPositionInRow_Rst<='0';
						CurrPositionInRow_ReLoad<='1';
					else
						CurrPositionInRow_Rst<='1';
						CurrPositionInRow_ReLoad<='0';
					end if;
					CurrPositionInRow_Increament<='0';
					CurrGrpOffsetInFeature_InTermOf24Words_Rst<='1';
					RowIdx_Rst<= '0';RowIdx_Increament<='0';	
					CurrFeatureIdx_rst<= '0'; CurrFeatureIdx_Increament<='1'; 
					GrpBase_Increament<='0';
					NxtState <= S_CenterTail_0;
				end if;
			else
				CurrPositionInRow_ReLoad<='0';
				FirstRow_Reset<='0'; 
				CurrPositionInRow_Rst<='0';
				CurrPositionInRow_Increament<='1';
				CurrGrpOffsetInFeature_InTermOf24Words_Rst<='0';
				RowIdx_Rst<= '0';RowIdx_Increament<='0';
				CurrFeatureIdx_rst<= '0'; CurrFeatureIdx_Increament<='0'; 
				GrpBase_Increament<='0';
				NxtState <= S_CenterTail_0;
			end if;
		--#End	 --Two Word available locally--

		--#Begin --Common Tail cases
		when S_CenterTail_0 =>
			LayerDone<='0'; RqstToDDR<= '0';			
			CurrFeatureIdx_rst<= '0'; CurrFeatureIdx_Increament<='0'; 
			CurrFeatureIdx_Load<= '0';			
			GrpBase_Rst<='0'; GrpBase_Increament<='0';
			GrpBase_Load<='0'; GrpBase_MoreIncreament<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Rst<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Load<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Increament<= '0';
			RowIdx_Rst<= '0'; RowIdx_Increament<='0';
			CurrPositionInRow_Rst<='0';
			CurrPositionInRow_Load<='0'; CurrPositionInRow_ReLoad<='0';
			CurrPositionInRow_Increament<='0';
			WordsOnTemp_Rst<='0'; WordsOnFIFO_Rst<='0';
			WordsOnTemp_En<='0'; WordsOnFIFO_En<='0';
			WordsOnTemp_Unfloped<= "00"; WordsOnFIFO_Unfloped<="00";				
			FirstRow_Reset<='0'; FirstRow_Set<='0';
			-- Signals to DataPath
			LatchDDRData<='0'; ShiftDDRData<='0';	
			WriteFIFO<='0';	ReadFIFO<='0';
			TempStorage_Set0_Load<='0';	TempStorage_Set1_Load<='0';
			Set0_Load<= '0'; Set0_LoadZeroes<='0';
			Set1_Load<='0';  Set1_LoadZeroes<='0';
			Set0_Sel_DDRorFIFOorTemp<= "00";
			Set1_Sel_DDRorFIFOorTemp<="00";
			FIFOInSel_DDRorTemp<='0';
			if (RqstFromMainCtrlToLoadLayer='1') then
				RqstToMainCtrl<= '0';
				NxtState<= S_CenterCase;
			elsif (AckFromMainCtrl='1') then
				RqstToMainCtrl<= '0';
				NxtState<= S_CenterTail_1;
			else
				RqstToMainCtrl<= '1';
				NxtState<= S_CenterTail_0;
			end if;
		when S_CenterTail_1 =>
			RqstToMainCtrl<= '0'; LayerDone<='0'; 
			RqstToDDR<= '0';			
			CurrFeatureIdx_rst<= '0'; CurrFeatureIdx_Increament<='0'; 
			CurrFeatureIdx_Load<= '0';			
			GrpBase_Rst<='0'; GrpBase_Increament<='0';
			GrpBase_Load<='0'; GrpBase_MoreIncreament<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Rst<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Load<='0';
			CurrGrpOffsetInFeature_InTermOf24Words_Increament<= '0';
			RowIdx_Rst<= '0'; RowIdx_Increament<='0';
			CurrPositionInRow_Rst<='0';
			CurrPositionInRow_Load<='0'; CurrPositionInRow_ReLoad<='0';
			CurrPositionInRow_Increament<='0';
			WordsOnTemp_Rst<='0'; WordsOnFIFO_Rst<='0';
			WordsOnTemp_En<='0'; WordsOnFIFO_En<='0';
			WordsOnTemp_Unfloped<= "00"; WordsOnFIFO_Unfloped<="00";				
			FirstRow_Reset<='0'; FirstRow_Set<='0';
			-- Signals to DataPath
			LatchDDRData<='0'; ShiftDDRData<='0';	
			WriteFIFO<='0';	ReadFIFO<='0';
			TempStorage_Set0_Load<='0';	TempStorage_Set1_Load<='0';
			Set0_Load<= '0'; Set0_LoadZeroes<='0';
			Set1_Load<='0';  Set1_LoadZeroes<='0';
			Set0_Sel_DDRorFIFOorTemp<= "00";
			Set1_Sel_DDRorFIFOorTemp<="00";
			FIFOInSel_DDRorTemp<='0';
			if (RqstFromMainCtrlToLoadLayer='1') then
				NxtState<= S_CenterCase;
			else
				NxtState<= S_CenterTail_1;
			end if;
		--#End	 --Common Tail cases
	end case;
end process NxtAndOutputProc;
--#End	 --FSM

--#Begin --Flags
FeatureRowSize_Modified <= std_logic_vector(to_unsigned(2,6)) when FeatureRowSize=std_logic_vector(to_unsigned(1,6)) else
							FeatureRowSize;
RowSize_InMultipleOf16Words<= std_logic_vector(unsigned(FeatureRowSize_Modified (len(MaxDataFeatureRowSize/8)-1 downto 1)) + unsigned(FeatureRowSize_Modified(0 downto 0)));
GrpOf8WordsLeftInARow<= std_logic_vector(unsigned(FeatureRowSize_Modified)- unsigned(CurrPositionInRow));
--GrpOf8WordsToBeLoadedOnFIFO<= (to_unsigned(3,2) - unsigned(GrpOf8WordsLeftInARow)); 
LastPositionInRow <= '1' when (GrpOf8WordsLeftInARow=std_logic_vector(to_unsigned(1,6))) or 
								(GrpOf8WordsLeftInARow=std_logic_vector(to_unsigned(2,6))) else
					 '0';
FirstPositionInRow <= '1' when CurrPositionInRow = std_logic_vector(to_unsigned(0,6)) else
					  '0';
WordsPresentLocally<= WordsOnTemp when FirstPositionInRow='0' else
						 WordsOnFIFO;
LastFeatureBeingWritten<= '1' when CurrFeatureIdx= std_logic_vector(unsigned(TotalFeaturesInLayer)-1) else
 						  '0';
LastRowBeingWritten <= '1' when RowIdx= std_logic_vector(unsigned(TotalNumberOfRowsInAFeature_SizeInTermsOf16Words)-1) else
						'0';
PositionInRow_InMultipleof16Words<= CurrPositionInRow(len(MaxDataFeatureRowSize/8)-1 downto 1); -- Last bit removed, which is always zero
WriteAddrToMaster_Temp<= std_logic_vector(unsigned(LayerBase)+unsigned(RowIdx)*unsigned(TotalFeaturesInLayer) 
								* unsigned(RowSize_InMultipleOf16Words)
				 + unsigned(CurrFeatureIdx)* unsigned(RowSize_InMultipleOf16Words)
				 + unsigned(PositionInRow_InMultipleof16Words) );
WriteAddrToMaster<= WriteAddrToMaster_Temp(C_ConvEngineDataBank_AddrLength - 1 DOWNTO 0);
	--First Row Flag
FirstRowFlag : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or FirstRow_Reset='1' then
			FirstRow_Flag<='0';
		elsif FirstRow_Set='1' then
			FirstRow_Flag<='1';			
		end if;
	end if;
end process FirstRowFlag;

--#End	 --Flags

--#Begin	--Idx
CurrFeatureIdxProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or CurrFeatureIdx_rst='1' then
			CurrFeatureIdx<= (others => '0');
		elsif (CurrFeatureIdx_Load='1') then
			CurrFeatureIdx<= StartingFeatureIdx;
		elsif (CurrFeatureIdx_Increament='1') then
			CurrFeatureIdx <= std_logic_vector(unsigned(CurrFeatureIdx)+1);
		end if;
	end if;
end process CurrFeatureIdxProc;
GrpbaseProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or GrpBase_Rst='1' then
			GrpBase<= (Others => '0');
		elsif (GrpBase_Load='1') then
			GrpBase<= StartGrpBase;
		elsif (GrpBase_Increament='1') then
			GrpBase<= std_logic_vector(unsigned(GrpBase)+unsigned(CurrGrpOffsetInFeature_InTermOf24Words));
		elsif (GrpBase_MoreIncreament='1') then
			GrpBase<= std_logic_vector(unsigned(GrpBase)+unsigned(CurrGrpOffsetInFeature_InTermOf24Words)+1);
		end if;
	end if;
end process GrpbaseProc;
RowIdxProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or RowIdx_Rst='1' then
			RowIdx <= (others=>'0');
		elsif (CurrPositionInRow_Load='1') then 
			RowIdx<= StartRowIdx;
		elsif (RowIdx_Increament='1') then
			RowIdx <= std_logic_vector(unsigned(RowIdx)+1);
		end if;
	end if;
end process RowIdxProc;
CurrGrpIdxProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or CurrGrpOffsetInFeature_InTermOf24Words_Rst='1' then
			CurrGrpOffsetInFeature_InTermOf24Words<= (Others => '0');
		elsif (CurrGrpOffsetInFeature_InTermOf24Words_Load='1') then
			--CurrGrpOffsetInFeature_InTermOf24Words <= StartingGrpOffset;
			CurrGrpOffsetInFeature_InTermOf24Words<= (Others => '0');
		elsif (CurrGrpOffsetInFeature_InTermOf24Words_Increament='1') then
			CurrGrpOffsetInFeature_InTermOf24Words<= std_logic_vector(unsigned(CurrGrpOffsetInFeature_InTermOf24Words)+1);
		end if;
	end if;
end process CurrGrpIdxProc;
CurrPositionProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or CurrPositionInRow_Rst='1' then
			CurrPositionInRow <= (others=> '0');
		elsif (CurrPositionInRow_Load='1') then
			CurrPositionInRow <= StartingPositionInRow;			
		elsif (CurrPositionInRow_ReLoad='1') then
			CurrPositionInRow<= StartingPositionInRow_floped;
		elsif (CurrPositionInRow_Increament='1') then
			CurrPositionInRow<= std_logic_vector(unsigned(CurrPositionInRow)+2);
		end if;
	end if;
end process CurrPositionProc;
StartingPositionProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			StartingPositionInRow_floped <= (others=> '0');
		elsif (CurrPositionInRow_Load='1') then
			StartingPositionInRow_floped <= StartingPositionInRow;			
		end if;
	end if;
end process StartingPositionProc;
--#End		--Idx

--#Begin --Words On fifo
WordsOnFIFOPrstProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or WordsOnTemp_Rst='1' then
			WordsOnTemp<= to_unsigned(0,2);
		elsif WordsOnTemp_En='1' then
			WordsOnTemp<= WordsOnTemp_Unfloped;
		end if;
	end if;
end process WordsOnFIFOPrstProc;
WordsOnFIFONxtProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or WordsOnFIFO_Rst='1' then
			WordsOnFIFO<= to_unsigned(0,2);
		elsif WordsOnFIFO_En='1' then
			WordsOnFIFO<= WordsOnFIFO_Unfloped;
		end if;
	end if;
end process WordsOnFIFONxtProc;
--#End	 --Words On fifo

--#Begin --Outputs
DDR_LayerIdx<= CurrLayerIdx;
DDR_FeatureIdx<= CurrFeatureIdx;
DDR_GroupIdxInAFeature<= std_logic_vector(unsigned(GrpBase) + unsigned(CurrGrpOffsetInFeature_InTermOf24Words));
--#End	 --Outputs
end Behavioral;