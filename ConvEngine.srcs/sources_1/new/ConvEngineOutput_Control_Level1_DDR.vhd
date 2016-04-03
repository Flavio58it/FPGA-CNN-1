----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.03.2016 10:28:06
-- Design Name: 
-- Module Name: ConvEngineOutput_Control_Level1_DDR - Behavioral
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

--#Begin --Component
--#End	 --Component
--#Begin --Type
--#End 	--Type
--#Begin --Signal
--#End	 --Signal

entity ConvEngineOutput_Control_Level1_DDR is
  Port ( clk,rst: in std_logic;
	  	-- Hand Shake With Master
		LoadData_FromMaster: in std_logic;	  
	  	ClearToSendData_ToMaster: out std_logic;
  		ClearToSend_ofBank: in std_logic;
  		GrpOf8WordsLeftInARow: in FeatureRowSize_t;
		FirstPositionOfRowBeingWritten: in std_logic;
		LastFeatureOfSetBeingWritten: in std_logic;
		NumberOfSimultaneousKernel_Final: in NumberOfSimultaneousKernel_t; 
  		-- Netwprk Details
		TotalGroupsInFeature: in DataFeatureSize_InMultipleOf24Words_t; 
  		
	  	-- Data from Output Flops
		MACOutput_GrpOf8Words: in MACFinalOutput_InGrpOf8_t;
   	    MACOutputIdx_GrpOf8Words: in MACFinalOutputIdx_InGrpOf8_t;
  		
  		-- DDR Specific input from master
		DDR_LayerIdx_In: in LayerIdx_st;
		DDR_FeatureIdx_In: in DataFeatureIdx_st;
		DDR_GroupIdxInAFeature_In: in DataFeatureSize_InMultipleOf24Words_t; 
  
	    -- DDR Signals
		RqstToDDR: out std_logic;
		DDR_LayerIdx: out LayerIdx_st;
		DDR_FeatureIdx: out DataFeatureIdx_st;
		DDR_GroupIdxInAFeature: out DataFeatureSize_InMultipleOf24Words_t;
		DDR_DataOut: out DDR_YOut;
		AckFromDDR: in std_logic	   
  );
end ConvEngineOutput_Control_Level1_DDR;

architecture Behavioral of ConvEngineOutput_Control_Level1_DDR is
--#Begin --Component
component fifo_generator_Width480_Depth16_DistRAM
	port(clk   : IN  STD_LOGIC;
		 din   : IN  STD_LOGIC_VECTOR(479 DOWNTO 0);
		 wr_en : IN  STD_LOGIC;
		 rd_en : IN  STD_LOGIC;
		 dout  : OUT STD_LOGIC_VECTOR(479 DOWNTO 0);
		 full  : OUT STD_LOGIC;
		 empty : OUT STD_LOGIC);
end component fifo_generator_Width480_Depth16_DistRAM;
component fifo_generator_Width160_Depth512
	port(clk   : IN  STD_LOGIC;
		 din   : IN  STD_LOGIC_VECTOR(159 DOWNTO 0);
		 wr_en : IN  STD_LOGIC;
		 rd_en : IN  STD_LOGIC;
		 dout  : OUT STD_LOGIC_VECTOR(159 DOWNTO 0);
		 full  : OUT STD_LOGIC;
		 empty : OUT STD_LOGIC);
end component fifo_generator_Width160_Depth512;
component fifo_generator_Width28_Depth16_DistRAM
	port(clk   : IN  STD_LOGIC;
		 din   : IN  STD_LOGIC_VECTOR(27 DOWNTO 0);
		 wr_en : IN  STD_LOGIC;
		 rd_en : IN  STD_LOGIC;
		 dout  : OUT STD_LOGIC_VECTOR(27 DOWNTO 0);
		 full  : OUT STD_LOGIC;
		 empty : OUT STD_LOGIC);
end component fifo_generator_Width28_Depth16_DistRAM;
--#End	 --Component
--#Begin --Type
type SideFIFOWrite_StateType_t is (S_Rst, S_LoadFIFO_One);
type MainFIFOWrite_StateType_t is (S_Rst, S_Write_0, S_Write_1, S_Write_FromFIFO_1 , S_Write_2, S_Load);
type MainFIFORead_StateType_t is (S_Rst, S_SendDataToDDR, S_WaitForNewData);
--#End 	--Type
--#Begin --Signal
	--FSM
signal SideFIFOWrite_PrState, SideFIFOWrite_NxtState: SideFIFOWrite_StateType_t;
signal MainFIFOWrite_PrState, MainFIFOWrite_NxtState: MainFIFOWrite_StateType_t;
signal MainFIFORead_PrState, MainFIFORead_NxtState: MainFIFORead_StateType_t;
signal ClearToSend_ByWriteUnit, LoadToMainFIFO, ExpectingFirstGrp: std_logic;
signal LoadData: std_logic;	  

	--FIFO
signal SideFIFO_Wr,SideFIFO_Rd: std_logic;
signal MainFIFO_Wr, MainFIFO_Rd: std_logic;
signal MainFIFO_Empty, MainFIFO_Full: std_logic;
	-- Intermediate Flops
	--Flags
signal LastGrpBeingRecieved: std_logic;
	-- Extra
signal WordsOnFIFO_Unfloped,WordsOnFIFO: unsigned(1 downto 0); -- Value at Max=2
signal WordsOnFIFO_En: std_logic;
signal ClearToSendData: std_logic;
	-- Datapath -------------------------------
		-- Main FIFO
signal MainFIFO_DataIn:DataWordArray_GrpOf24; 
signal MainFIFO_IdxIn: DataIdxArray_GrpOf24;
signal MainFIFO_In_Vector, MainFIFO_Out_Vector: STD_LOGIC_VECTOR(479 DOWNTO 0);
 		-- Side FIFO
signal SideFIFO_In_Vector, SideFIFO_Out_Vector: STD_LOGIC_VECTOR(159 DOWNTO 0);
signal SideFIFO_DataIn, SideFIFO_DataOut: MACFinalOutput_InGrpOf8_t;
signal SideFIFO_IdxIn, SideFIFO_IdxOut: MACFinalOutputIdx_InGrpOf8_t;
		-- Intermediate flops
signal Data_Set0, Data_Set1, Data_Set2: MACFinalOutput_InGrpOf8_t;
signal Idx_Set0, Idx_Set1, Idx_Set2: MACFinalOutputIdx_InGrpOf8_t;
signal Set0_Wr, Set1_Wr, Set2_Wr: std_logic; 
signal Set1_Rst, Set2_Rst: std_logic;  
		-- Addr FIFO   
signal FIFO_AddrIn_Vector, FIFO_AddrOut_Vector: STD_LOGIC_VECTOR(27 DOWNTO 0);
signal Temp_LayerIdx, FIFO_LayerIdx_Out, FIFO_LayerIdx_In : LayerIdx_st;
signal Temp_FeatureIdx,FIFO_FeatureIdx_Out, FIFO_FeatureIdx_In: DataFeatureIdx_st;
signal Temp_GrpIdx,FIFO_GrpIdx_Out,FIFO_GrpIdx_In: DataFeatureSize_InMultipleOf24Words_t;
--#End	 --Signal
begin

-----------------------------------------#Begin -- Controller ---------------------------------
--#Begin -- Main FIFO Read FSM
FIFOReadPrStateProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			MainFIFORead_PrState <= S_Rst;
		else
			MainFIFORead_PrState <= MainFIFORead_NxtState;
		end if;
	end if;
end process FIFOReadPrStateProc;
FIFOReadNxtAndOutputProc : process (MainFIFORead_PrState, AckFromDDR, MainFIFO_Empty)
begin
	case MainFIFORead_PrState is 
		when S_Rst =>
			MainFIFO_Rd<='0';
			if (MainFIFO_Empty='0') then
				RqstToDDR<='1';
				MainFIFORead_NxtState<= S_SendDataToDDR;
			else
				MainFIFORead_NxtState<= S_Rst;
				RqstToDDR<='0';
			end if;
		when S_SendDataToDDR =>
			if (AckFromDDR='1') then
				MainFIFO_Rd<='1';
				RqstToDDR<='0';
				MainFIFORead_NxtState<= S_WaitForNewData;
			else
				MainFIFO_Rd<='0';
				RqstToDDR<='1';
				MainFIFORead_NxtState<= S_SendDataToDDR;				
			end if;
		when S_WaitForNewData =>
			MainFIFO_Rd<='0';
			if (MainFIFO_Empty='0') then								
				RqstToDDR<='1';
				MainFIFORead_NxtState<= S_SendDataToDDR;
			else
				MainFIFORead_NxtState<= S_Rst;
				RqstToDDR<='0';
			end if;
	end case;
end process FIFOReadNxtAndOutputProc; 
--#End	 -- Main FIFO Read FSM

--#Begin -- Main FIFO Write FSM
MainFIFOPrStateProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			MainFIFOWrite_PrState <= S_Rst;
		else
			MainFIFOWrite_PrState <= MainFIFOWrite_NxtState;
		end if;
	end if;
end process MainFIFOPrStateProc;
MainFIFONxtAndOutputProc : process (MainFIFOWrite_PrState, FirstPositionOfRowBeingWritten, GrpOf8WordsLeftInARow, LastGrpBeingRecieved, LoadToMainFIFO, WordsOnFIFO, MainFIFO_Full)
begin
	case MainFIFOWrite_PrState is 
		when S_Rst =>
			ExpectingFirstGrp<='0'; SideFIFO_Rd<='0';
			MainFIFO_Wr<='0'; ClearToSend_ByWriteUnit<='1';
			Set0_Wr<='0'; Set1_Wr<='0'; Set2_Wr<='0';
			Set1_Rst<='1'; Set2_Rst<='1';
			MainFIFOWrite_NxtState<= S_Write_0;
		when S_Write_0 =>
			ExpectingFirstGrp<='1';
			Set1_Wr<='0'; Set2_Wr<='0';
			MainFIFO_Wr<='0';
			if (FirstPositionOfRowBeingWritten='1') then
				if (WordsOnFIFO= "10") then
					SideFIFO_Rd<='1';
					Set0_Wr<='1'; ClearToSend_ByWriteUnit<='0';
					Set1_Rst<='0'; Set2_Rst<='0';
					MainFIFOWrite_NxtState<= S_Write_FromFIFO_1;
				elsif (WordsOnFIFO= "01") then
					SideFIFO_Rd<='1';
					Set0_Wr<='1'; ClearToSend_ByWriteUnit<='0';
					Set1_Rst<='0'; Set2_Rst<='0';
					MainFIFOWrite_NxtState<= S_Write_1; 
				else
					if (LoadToMainFIFO='1') then
						Set0_Wr<='1'; SideFIFO_Rd<='0';
						ClearToSend_ByWriteUnit<='1';
						if (LastGrpBeingRecieved='1' and GrpOf8WordsLeftInARow= std_logic_vector(to_unsigned(1,6))) then
							Set1_Rst<='1'; Set2_Rst<='1';
							MainFIFOWrite_NxtState<= S_Load; 
						else
							Set1_Rst<='0'; Set2_Rst<='0';
							MainFIFOWrite_NxtState<= S_Write_1; 
						end if;
					else
						Set0_Wr<='0'; SideFIFO_Rd<='0';
						ClearToSend_ByWriteUnit<='1';
						Set1_Rst<='0'; Set2_Rst<='0';
						MainFIFOWrite_NxtState<= S_Write_0;
					end if;
				end if;
			else
				if (LoadToMainFIFO='1') then
					Set0_Wr<='1'; SideFIFO_Rd<='0';
					ClearToSend_ByWriteUnit<='1';
					if (LastGrpBeingRecieved='1' and GrpOf8WordsLeftInARow= std_logic_vector(to_unsigned(1,6))) then
						Set1_Rst<='1'; Set2_Rst<='1';
						MainFIFOWrite_NxtState<= S_Load; 
					else
						Set1_Rst<='0'; Set2_Rst<='0';
						MainFIFOWrite_NxtState<= S_Write_1; 
					end if;
				else
					Set0_Wr<='0'; SideFIFO_Rd<='0';
					ClearToSend_ByWriteUnit<='1';
					Set1_Rst<='0'; Set2_Rst<='0';
					MainFIFOWrite_NxtState<= S_Write_0;
				end if;
			end if;
		when S_Write_1 =>
			ExpectingFirstGrp<='0';
			Set0_Wr<='0'; Set2_Wr<='0';
			MainFIFO_Wr<='0'; Set1_Rst<='0'; 
			SideFIFO_Rd<='0';
			ClearToSend_ByWriteUnit<='1';
			if (LoadToMainFIFO='1') then
				Set1_Wr<='1'; 
				if (LastGrpBeingRecieved='1' and GrpOf8WordsLeftInARow= std_logic_vector(to_unsigned(1,6))) then
					Set2_Rst<='1';
					MainFIFOWrite_NxtState<= S_Load; 
				else
					Set2_Rst<='0';
					MainFIFOWrite_NxtState<= S_Write_2; 
				end if;
			else
				Set1_Wr<='0'; 	Set2_Rst<='0';
				MainFIFOWrite_NxtState<= S_Write_1;
			end if;		
		when S_Write_2 =>
			ExpectingFirstGrp<='0';
			Set0_Wr<='0'; Set1_Wr<='0';
			MainFIFO_Wr<='0'; 
			Set1_Rst<='0'; Set2_Rst<='0'; 
			SideFIFO_Rd<='0';
			ClearToSend_ByWriteUnit<='1';
			if (LoadToMainFIFO='1') then
				Set2_Wr<='1'; 
				MainFIFOWrite_NxtState<= S_Load;
			else
				Set2_Wr<='0'; 	
				MainFIFOWrite_NxtState<= S_Write_2;
			end if;
		when S_Write_FromFIFO_1 =>
			SideFIFO_Rd<='1';
			ExpectingFirstGrp<='0';
			MainFIFO_Wr<='0'; 
			Set0_Wr<='0'; Set1_Wr<='1'; Set2_Wr<='0';
			Set1_Rst<='0'; Set2_Rst<='0';
			ClearToSend_ByWriteUnit<='0';
			MainFIFOWrite_NxtState<= S_Write_2;
		when S_Load =>
			ExpectingFirstGrp<='1';
			Set1_Wr<='0'; Set2_Wr<='0';
			if (MainFIFO_Full='0') then
				MainFIFO_Wr<='1';
				if (FirstPositionOfRowBeingWritten='1') then
					if (WordsOnFIFO= "10") then
						SideFIFO_Rd<='1';
						Set0_Wr<='1'; ClearToSend_ByWriteUnit<='0';
						Set1_Rst<='0'; Set2_Rst<='0';
						MainFIFOWrite_NxtState<= S_Write_FromFIFO_1;
					elsif (WordsOnFIFO= "01") then
						SideFIFO_Rd<='1';
						Set0_Wr<='1'; ClearToSend_ByWriteUnit<='0';
						Set1_Rst<='0'; Set2_Rst<='0';
						MainFIFOWrite_NxtState<= S_Write_1; 
					else
						if (LoadToMainFIFO='1') then
							Set0_Wr<='1'; SideFIFO_Rd<='0';
							ClearToSend_ByWriteUnit<='1';
							if (LastGrpBeingRecieved='1' and GrpOf8WordsLeftInARow= std_logic_vector(to_unsigned(1,6))) then
								Set1_Rst<='1'; Set2_Rst<='1';
								MainFIFOWrite_NxtState<= S_Load; 
							else
								Set1_Rst<='0'; Set2_Rst<='0';
								MainFIFOWrite_NxtState<= S_Write_1; 
							end if;
						else
							Set0_Wr<='0'; SideFIFO_Rd<='0';
							ClearToSend_ByWriteUnit<='1';
							Set1_Rst<='0'; Set2_Rst<='0';
							MainFIFOWrite_NxtState<= S_Write_0;
						end if;
					end if;
				else
					if (LoadToMainFIFO='1') then
						Set0_Wr<='1'; SideFIFO_Rd<='0';
						ClearToSend_ByWriteUnit<='1';
						if (LastGrpBeingRecieved='1' and GrpOf8WordsLeftInARow= std_logic_vector(to_unsigned(1,6))) then
							Set1_Rst<='1'; Set2_Rst<='1';
							MainFIFOWrite_NxtState<= S_Load; 
						else
							Set1_Rst<='0'; Set2_Rst<='0';
							MainFIFOWrite_NxtState<= S_Write_1; 
						end if;
					else
						Set0_Wr<='0'; SideFIFO_Rd<='0';
						ClearToSend_ByWriteUnit<='1';
						Set1_Rst<='0'; Set2_Rst<='0';
						MainFIFOWrite_NxtState<= S_Write_0;
					end if;
				end if;
			else
				MainFIFO_Wr<='0';
				Set0_Wr<='0'; SideFIFO_Rd<='0';
				ClearToSend_ByWriteUnit<='0';
				Set1_Rst<='0'; Set2_Rst<='0';
				MainFIFOWrite_NxtState<= S_Load;
			end if;
	end case;
end process MainFIFONxtAndOutputProc;
--#End	 -- Main FIFO Write FSM

--#Begin --Side FIFO Write FSM
SideFIFOPrStateProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			SideFIFOWrite_PrState <= S_Rst;
		else
			SideFIFOWrite_PrState <= SideFIFOWrite_NxtState;
		end if;
	end if;
end process SideFIFOPrStateProc;
SideFIFONxtAndOutputProc : process (SideFIFOWrite_PrState, ExpectingFirstGrp, GrpOf8WordsLeftInARow, LastFeatureOfSetBeingWritten, LastGrpBeingRecieved, LoadData, NumberOfSimultaneousKernel_Final)
begin
	case SideFIFOWrite_PrState is 
		when S_Rst =>
			if (LoadData='1') then
				if (NumberOfSimultaneousKernel_Final/=std_logic_vector(to_unsigned(1,len(C_MaxNuberOfParallelWeightKernels))) and LastGrpBeingRecieved='0' and ExpectingFirstGrp='1' and (GrpOf8WordsLeftInARow= std_logic_vector(to_unsigned(1,6)) or GrpOf8WordsLeftInARow= std_logic_vector(to_unsigned(2,6)) )) then
					LoadToMainFIFO<='0'; 
					SideFIFO_Wr<='1';
					if (GrpOf8WordsLeftInARow= std_logic_vector(to_unsigned(1,6))) then
						SideFIFOWrite_NxtState<= S_Rst;
						if (LastFeatureOfSetBeingWritten='1') then
							WordsOnFIFO_Unfloped<= "01";
							WordsOnFIFO_En<='1';
						else
							WordsOnFIFO_Unfloped<= "00";
							WordsOnFIFO_En<='0';
						end if;						
					else
						WordsOnFIFO_Unfloped<= "00";
						WordsOnFIFO_En<='0';
						SideFIFOWrite_NxtState<= S_LoadFIFO_One;
					end if;
				else
					LoadToMainFIFO<='1'; 
					SideFIFO_Wr<='0';
					SideFIFOWrite_NxtState<= S_Rst;
					if (LastFeatureOfSetBeingWritten='1' and GrpOf8WordsLeftInARow=std_logic_vector(to_unsigned(1,6))) then
						WordsOnFIFO_Unfloped<= "00";
						WordsOnFIFO_En<='1';
					else
						WordsOnFIFO_Unfloped<= "00";
						WordsOnFIFO_En<='0';
					end if;
				end if;
			else
				WordsOnFIFO_Unfloped<= "00";
				WordsOnFIFO_En<='0';
				LoadToMainFIFO<='0'; 
				SideFIFO_Wr<='0';
				SideFIFOWrite_NxtState<= S_Rst;
			end if;
		when S_LoadFIFO_One =>
			if (LoadData='1') then
				LoadToMainFIFO<='0'; 
				SideFIFO_Wr<='1';
				if (LastFeatureOfSetBeingWritten='1') then
					WordsOnFIFO_Unfloped<= "10";
					WordsOnFIFO_En<='1';
				else
					WordsOnFIFO_Unfloped<= "00";
					WordsOnFIFO_En<='0';
				end if;
				SideFIFOWrite_NxtState<= S_Rst;
			else
				WordsOnFIFO_Unfloped<= "00";
				WordsOnFIFO_En<='0';
				LoadToMainFIFO<='0'; 
				SideFIFO_Wr<='0';
				SideFIFOWrite_NxtState<= S_LoadFIFO_One;
			end if;
	end case;
end process SideFIFONxtAndOutputProc;
--#End  --Side FIFO Write FSM

--#BEgin --Flags
LastGrpBeingRecieved<= '1' when DDR_GroupIdxInAFeature_In = std_logic_vector(unsigned(TotalGroupsInFeature)-1) else
						'0';
--#End	 --Flags

--#Begin	 --Words On fifo
WordsOnFIFONxtProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			WordsOnFIFO<= to_unsigned(0,2);
		elsif WordsOnFIFO_En='1' then
			WordsOnFIFO<= WordsOnFIFO_Unfloped;
		end if;
	end if;
end process WordsOnFIFONxtProc;
--#End	 --Words On fifo
-----------------------------------------#End	 -- Controller---------------------------------

-----------------------------------------#Begin -- Datapath ---------------------------------
--#Begin -- Main FSM and conversion of vector conversion
MainFSM: fifo_generator_Width480_Depth16_DistRAM
	port map(
		clk   => clk,
		din   => MainFIFO_In_Vector,
		wr_en => MainFIFO_Wr,
		rd_en => MainFIFO_Rd,
		dout  => MainFIFO_Out_Vector,
		full  => MainFIFO_Full,
		empty => MainFIFO_Empty
	);

	--#Begin --Vector conversion
FIFOConvProc : process (MainFIFO_DataIn, MainFIFO_IdxIn)
begin
	for i in 0 to 431 loop
		MainFIFO_In_Vector(i)<= MainFIFO_DataIn(i/18)(i mod 18);
	end loop;	
	for i in 432 to 479 loop
		MainFIFO_In_Vector(i)<= MainFIFO_IdxIn((i-432)/2)((i-432) mod 2);
	end loop;
end process FIFOConvProc;
	--#End	 --Vector conversion

--#End -- Main FSM and conversion of vector conversion

--#Begin -- Intermediate FFs
TempWordAndIdx_0_Proc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			Data_Set0<= (others => std_logic_vector(to_signed(0,C_DataBitWidth)));
			Idx_Set0<= (others => std_logic_vector(to_signed(0,2)));
		elsif (Set0_Wr='1') then
			if (SideFIFO_Rd='0') then
				Data_Set0<= MACOutput_GrpOf8Words;
				Idx_Set0<= MACOutputIdx_GrpOf8Words;
			else
				Data_Set0<= SideFIFO_DataOut;
				Idx_Set0<= SideFIFO_IdxOut;
			end if;

		end if;
	end if;
end process TempWordAndIdx_0_Proc;
TempWordAndIdx_1_Proc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or Set1_Rst='1' then
			Data_Set1<= (others => std_logic_vector(to_signed(0,C_DataBitWidth)));
			Idx_Set1<= (others => std_logic_vector(to_signed(0,2)));
		elsif (Set1_Wr='1') then
			if (SideFIFO_Rd='0') then
				Data_Set1<= MACOutput_GrpOf8Words;
				Idx_Set1<= MACOutputIdx_GrpOf8Words;
			else
				Data_Set1<= SideFIFO_DataOut;
				Idx_Set1<= SideFIFO_IdxOut;
			end if;
		end if;
	end if;
end process TempWordAndIdx_1_Proc;
TempWordAndIdx_2_Proc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or Set2_Rst='1' then
			Data_Set2<= (others => std_logic_vector(to_signed(0,C_DataBitWidth)));
			Idx_Set2<= (others => std_logic_vector(to_signed(0,2)));
		elsif (Set2_Wr='1') then
			Data_Set2<= MACOutput_GrpOf8Words;
			Idx_Set2<= MACOutputIdx_GrpOf8Words;
		end if;
	end if;
end process TempWordAndIdx_2_Proc;
--#End	 -- Intermediate FFs
	--#Begin --FIFO Data-In
FIFO_InProc : process (Data_Set0, Data_Set1, Data_Set2, Idx_Set0, Idx_Set1, Idx_Set2)
begin
	for i in 0 to 7 loop
		MainFIFO_DataIn(i)<= Data_Set0(i);
		MainFIFO_IdxIn(i)<= Idx_Set0(i);
	end loop;
	for i in 8 to 15 loop
		MainFIFO_DataIn(i)<= Data_Set1(i-8);
		MainFIFO_IdxIn(i)<= Idx_Set1(i-8);
	end loop;
	for i in 16 to 23 loop
		MainFIFO_DataIn(i)<= Data_Set2(i-16);
		MainFIFO_IdxIn(i)<= Idx_Set2(i-16);
	end loop;
end process FIFO_InProc;
	--#End	 --FIFO Data-In

--#Begin -- Side FIFO and vector conversion
SideFIFO: fifo_generator_Width160_Depth512
	port map(
		clk   => clk,
		din   => SideFIFO_In_Vector,
		wr_en => SideFIFO_Wr,
		rd_en => SideFIFO_Rd,
		dout  => SideFIFO_Out_Vector,
		full  => open,
		empty => open
	);
	--#Begin --VectorConversion 
FIFOVectConvertProc : process (SideFIFO_Out_Vector, SideFIFO_DataIn, SideFIFO_IdxIn)
begin
	-- Input
	for i in 0 to 143 loop
		SideFIFO_In_Vector(i)<= SideFIFO_DataIn(i/18)(i mod 18);
	end loop;	
	for i in 144 to 159 loop
		SideFIFO_In_Vector(i)<= SideFIFO_IdxIn((i-144)/2)((i-144) mod 2);
	end loop;
	-- Output
	for i in 0 to 7 loop
		SideFIFO_DataOut(i)<= SideFIFO_Out_Vector(18*(i+1)-1 downto 18*i);
		SideFIFO_IdxOut(i)<= SideFIFO_Out_Vector(144+2*(i+1)-1 downto 144+2*i);
	end loop;
end process FIFOVectConvertProc;
SideFIFO_DataIn<= MACOutput_GrpOf8Words;
SideFIFO_IdxIn<= MACOutputIdx_GrpOf8Words;
	--#End	 --VectorConversion 
--#Begin -- Side FIFO and vector conversion

--#Begin -- Addr FIFO
AddrFIFO: fifo_generator_Width28_Depth16_DistRAM
	port map(
		clk   => clk,
		din   => FIFO_AddrIn_Vector,
		wr_en => MainFIFO_Wr,
		rd_en => MainFIFO_Rd,
		dout  => FIFO_AddrOut_Vector,
		full  => open,
		empty => open
	);
--#End -- Addr FIFO
	--#Begin --FIFO Addr-In
FIFOAddrInProc : process ( FIFO_FeatureIdx_In, FIFO_GrpIdx_In, FIFO_LayerIdx_In)
begin
	for i in 0 to 27 loop
		if (i< LayerIdx_len ) then
			FIFO_AddrIn_Vector(i) <= FIFO_LayerIdx_In(i); 
		elsif (i>= LayerIdx_len and i< (LayerIdx_len+DataFeatureIdx_len)) then
			FIFO_AddrIn_Vector(i) <= FIFO_FeatureIdx_In(i- LayerIdx_len);
		elsif (i>= (LayerIdx_len+DataFeatureIdx_len) and i< (LayerIdx_len+DataFeatureIdx_len+DataFeatureSize_InMultipleOf24Words_len)) then
			FIFO_AddrIn_Vector(i) <= FIFO_GrpIdx_In(i- LayerIdx_len-DataFeatureIdx_len);
		else
			FIFO_AddrIn_Vector(i)<= '0';
		end if;	
	end loop;
end process FIFOAddrInProc;
FIFO_LayerIdx_In<= Temp_LayerIdx;
FIFO_FeatureIdx_In <= Temp_FeatureIdx;
FIFO_GrpIdx_In <= Temp_GrpIdx;
FIFO_LayerIdx_Out<=  FIFO_AddrOut_Vector(LayerIdx_len-1 downto 0);
FIFO_FeatureIdx_Out<= FIFO_AddrOut_Vector(LayerIdx_len+DataFeatureIdx_len-1 downto LayerIdx_len);
FIFO_GrpIdx_Out<= FIFO_AddrOut_Vector(LayerIdx_len+DataFeatureIdx_len+DataFeatureSize_InMultipleOf24Words_len-1 downto LayerIdx_len+DataFeatureIdx_len);
	--#End	 --FIFO Addr-In

--#Begin --Intermediate Flops for Addr
AddrIntermediateFlopProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			Temp_LayerIdx<= (others =>'0');
			Temp_FeatureIdx <= (others =>'0');
			Temp_GrpIdx <= (others =>'0');
		elsif (Set0_Wr='1' or Set1_Wr='1' or Set2_Wr='1') then
			Temp_LayerIdx<= DDR_LayerIdx_In;
			Temp_FeatureIdx<= DDR_FeatureIdx_In;
			Temp_GrpIdx<= DDR_GroupIdxInAFeature_In;
		end if;
	end if;
end process AddrIntermediateFlopProc;

--#End	 --Intermediate Flops for Addr

--#End 	 -- Addr FIFO

-----------------------------------------#End	 -- Datapath ---------------------------------


--#Begin -- Assign outputs
ClearToSendData <= ClearToSend_ByWriteUnit and (not MainFIFO_Full); 
ClearToSendData_ToMaster<= ClearToSendData or (not LoadData_FromMaster);
LoadData<= LoadData_FromMaster and (not MainFIFO_Full) and ClearToSend_ofBank; 
DDR_LayerIdx<= FIFO_LayerIdx_Out;
DDR_FeatureIdx<= FIFO_FeatureIdx_Out;
DDR_GroupIdxInAFeature<= FIFO_GrpIdx_Out;
DDR_DataOut<= MainFIFO_Out_Vector;
--#End	 -- Assign outputs

end Behavioral;
