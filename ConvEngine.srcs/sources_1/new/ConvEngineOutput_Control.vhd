----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.03.2016 11:13:23
-- Design Name: 
-- Module Name: ConvEngineOutput_Control - Behavioral
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

entity ConvEngineOutput_Control is
	  Port ( clk,rst: in std_logic;
	  		---HandShake to/from Master Control
	  		LoadOutputs_FromMaster: in std_logic;
			ClearToSendOutputs_ToMaster: out std_logic;	  		
			LayerIdx: in LayerIdx_st;

			--- Network Details
			LayerBase: in ConvEngineDataBankAddr_t;
			FullyConnectedLayer_In: in std_logic;
			--NumberOfOutputsInFullyConnectedLayer: in FeatureRowSize_t;			
			FeatureRowSize: in FeatureRowSize_t; -- In multiple of 8 Words
			TotalFeaturesInLayer: in DataFeatureIdx_st;
			--TotalNumberOfActualRowsInAFeature_SizeInTermsOf8Words: in DataFeatureRowIdx_st; -- -- Actual number of rows
			TotalNumberOfRowsInAFeature_SizeInTermsOf16Words: in DataFeatureRowIdx_st; -- -- Where row Size is in terms of 16 words. If actual row size is of 8 words, then row Size Should be halved
			LastSetOfKernel: in std_logic;
			NumberOfSimultaneousKernel: in NumberOfSimultaneousKernel_t;
			KernelsInLastSet: in NumberOfSimultaneousKernel_t;						
				-- TO decide whether to write in DDR
			NetworkFitsInBank: in std_logic; -- If it doesn't fit, Everything has to be written to DDR, no matter what
				-- To decide whether to write in bank
			NoFeatureToBeWrittenToBank: in std_logic; 
			LastPositionInRowToBeWrittenToBank: in FeatureRowSize_t; -- In terms of 8 words, but must be alligned to 16-word as well as 24-word boundary 
			LastRowToBeWrittenToBank: in DataFeatureRowIdx_st;
			LastFeatureToBeWrittenToBank: in DataFeatureIdx_st;
				-- Size Details			

	  		-- Control Out
		  		-- Out Control To Alternate Datapath
		  	Latch_Outputs: out std_logic;
			Shift_Row0AndRow1: out std_logic;
  		  	Shift_Row2AndRow3: out std_logic;
		  	ChooseSetOfRow: out std_logic;	  
  		  	FullyConnectedLayer_Out: out std_logic;
			LastPositionBeingLoaded_InOutputFeature: out std_logic;
			PipeLine_En_ClrToSend : out std_logic; 
				-- Output control to DDR
			Load8Words_DDR: out std_logic;	  
		  	ClearToSendData_DDR: in std_logic;
	  		GrpOf8WordsLeftInARow: out FeatureRowSize_t;
			FirstPositionOfRowBeingWritten: out std_logic;
			LastFeatureOfSetBeingWritten: out std_logic;
			NumberOfSimultaneousKernel_Final: out NumberOfSimultaneousKernel_t; 
			DDR_LayerIdx_In: out LayerIdx_st;
			DDR_FeatureIdx_In: out DataFeatureIdx_st;
			DDR_GroupIdxInAFeature_In: out DataFeatureSize_InMultipleOf24Words_t; 
			
				-- Output control to Bank
			Load8Words_Bank: out std_logic;	  	
			ClearToSendData_Bank: in std_logic;
			LastPositionInRow: out std_logic;			
			WriteBankAddr: out ConvEngineDataBankAddr_t


				-- Out Control to Bank Write Unit
--			FIFO_RdEn,FIFO_WrEn: out std_logic;
--			InputSEL_FromFIFOorMACUnit: out std_logic;
--			DDRGroup_LatchEn: out std_logic_vector(0 to 5);		
--			BankGroup_LatchEn: in std_logic_vector(0 to 5);			
--					-- Select lines
--			DDRGrpSel: out std_logic;
--			BankGrpSel: out std_logic_vector(1 downto 0); -- choose between 3 sets				  		

	  );
end ConvEngineOutput_Control;

architecture Behavioral of ConvEngineOutput_Control is
--#Begin --Component
--#End	 --Component
--#Begin --Type
type StateType_t is (S_Rst, S_Normal_Write,S_FullyConnectedLayer_Write_0, S_RowSizeOf8_Write, S_DoneWithAllOutputs);
--#End 	--Type

--#Begin --Signal
	--Flags
signal WriteInDDR, WriteInBank,WriteInBank_0: std_logic;
	-- Ptrs and their Flags
signal FeatureRowSize_Modified: FeatureRowSize_t; 
signal FeatureIdx, FeatureIdx_Base: DataFeatureIdx_st;
signal FeatureIdx_Base_Rst, FeatureIdx_Base_Load: std_logic;
signal FeatureIdx_Offset: NumberOfSimultaneousKernel_t;
signal FeatureIdx_Offset_Rst,FeatureIdx_Offset_Increament: std_logic; 
signal RowIdx: DataFeatureRowIdx_st;
signal RowIdx_Rst, RowIdx_Increament: std_logic;
signal GrpIdx_unfloped,GrpIdx_Base, GrpIdx_Offset: DataFeatureSize_InMultipleOf24Words_t; -- for DDR control
signal GrpIdx_Base_Rst, GrpIdx_Base_Load: std_logic;
signal GrpIdx_Temp: std_logic_vector(14 downto 0);
signal PositionInRow: FeatureRowSize_t; -- In Multiple of Eight Words
signal PositionInRow_Rst, PositionInRow_Increament: std_logic;
signal PositionInRow_InMultipleof16Words: DataFeatureRowSize_InMultipleOf16Words_t;
signal NumberOfSimultaneousKernel_Final_unfloped: NumberOfSimultaneousKernel_t;
	-- Addrs
signal WriteBankAddr_Unfloped: ConvEngineDataBankAddr_t;
signal WriteBankAddr_Temp: std_logic_vector(21 downto 0);
signal RowSize_InMultipleOf16Words: DataFeatureRowSize_InMultipleOf16Words_t;
	-- Flags
signal GrpOf8WordsLeftInARow_unfloped: FeatureRowSize_t;
signal FirstPositionOfRowBeingWritten_unfloped, LastPositionInRow_unfloped, LastFeatureOfSetBeingWritten_unfloped, LastRowBeingWritten: std_logic;
signal LastFeature_OfLayer_BeingWritten: std_logic;
signal InitialRowIdx_FullyConnectedLayer: DataFeatureRowIdx_st;
signal InitialRowIdx_load: std_logic;
signal ThirtyTwoKernelsDone_FullyConnectedLayer: std_logic;
	-- Handshakes with slaves
signal ClearToSend : std_logic; 
signal Load8Words_Bank_unfloped: std_logic;
signal MakeLastEightWordZeroes: std_logic;
signal Load8Words_DDR_unfloped: std_logic;
	-- Pipelining
signal WriteBankAddr_floped1,WriteBankAddr_floped2 : ConvEngineDataBankAddr_t;
signal Load8Words_Bank_floped1,Load8Words_Bank_floped2: std_logic;
signal LastPositionInRow_floped1, LastPositionInRow_floped2: std_logic;
signal Load8Words_DDR_floped1,Load8Words_DDR_floped2: std_logic;
signal FirstPositionOfRowBeingWritten_floped1, FirstPositionOfRowBeingWritten_floped2: std_logic;
signal LastFeatureOfSetBeingWritten_floped1, LastFeatureOfSetBeingWritten_floped2: std_logic;
signal NumberOfSimultaneousKernel_Final_floped1, NumberOfSimultaneousKernel_Final_floped2: NumberOfSimultaneousKernel_t;
signal LayerIdx_floped1, LayerIdx_floped2: LayerIdx_st;
signal FeatureIdx_floped1, FeatureIdx_floped2: DataFeatureIdx_st;
signal GrpIdx_floped1,GrpIdx_floped2: DataFeatureSize_InMultipleOf24Words_t;
signal GrpOf8WordsLeftInARow_floped1,GrpOf8WordsLeftInARow_floped2: FeatureRowSize_t;
	--FSM
signal PrState, NxtState: StateType_t;
signal Load8Words: std_logic;

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

NxtAndOutputProc : process (PrState, LoadOutputs_FromMaster, FullyConnectedLayer_In, ClearToSend, FeatureRowSize, LastFeatureOfSetBeingWritten_unfloped, LastFeature_OfLayer_BeingWritten, LastPositionInRow_unfloped, LastRowBeingWritten, PositionInRow(0), PositionInRow(1), RowIdx(0), ThirtyTwoKernelsDone_FullyConnectedLayer)
begin
	case PrState is 
		when S_Rst =>
			ClearToSendOutputs_ToMaster <= '1';
			Shift_Row0AndRow1 <= '0'; Shift_Row2AndRow3<='0';
		  	ChooseSetOfRow<= '0';	  
			RowIdx_Rst<= '1'; RowIdx_Increament<='0';
			FeatureIdx_Base_Rst<='1'; FeatureIdx_Base_Load<='0';
			FeatureIdx_Offset_Rst<='1'; FeatureIdx_Offset_Increament<='0';
			PositionInRow_Rst<='1'; PositionInRow_Increament<='0';
			Load8Words<='0';
			if(LoadOutputs_FromMaster='1') then
			  	Latch_Outputs<= '1';
				if (FullyConnectedLayer_In='1') then
					NxtState <= S_FullyConnectedLayer_Write_0;
					InitialRowIdx_load<='1';
				elsif (FeatureRowSize= std_logic_vector(to_unsigned(1,len(MaxDataFeatureRowSize/8)))) then
					NxtState<= S_RowSizeOf8_Write;
					InitialRowIdx_load<='0';
				else
					NxtState<= S_Normal_Write;
					InitialRowIdx_load<='0';
				end if;
			else
			  	Latch_Outputs<= '0';
				NxtState<= S_Rst;				
				InitialRowIdx_load<='0';
			end if;
		when S_Normal_Write => 
			ClearToSendOutputs_ToMaster <= '0'; Latch_Outputs<='0';
		  	ChooseSetOfRow<= RowIdx(0);	  
			FeatureIdx_Base_Rst<='0';
			InitialRowIdx_load<='0';
			If (ClearToSend='1') then
				Load8Words<='1';
				if (RowIdx(0) = '0') then
					Shift_Row0AndRow1 <= '1'; Shift_Row2AndRow3<='0';
				else
					Shift_Row0AndRow1 <= '0'; Shift_Row2AndRow3<='1';
				end if;
				-- Modify Idxs
				if (LastPositionInRow_unfloped='1') then
					PositionInRow_Rst<='1';	PositionInRow_Increament<='0';
					if (LastFeatureOfSetBeingWritten_unfloped='1') then
						FeatureIdx_Offset_Rst <= '1'; FeatureIdx_Offset_Increament <= '0';
						if (LastRowBeingWritten='1') then
							RowIdx_Rst<= '1';RowIdx_Increament<='0';
							FeatureIdx_Base_Load<= '1'; 
						else
							RowIdx_Rst<= '0';RowIdx_Increament<='1';
							FeatureIdx_Base_Load<= '0'; 							
						end if;
					else
						FeatureIdx_Offset_Rst <= '0'; FeatureIdx_Offset_Increament <= '1';
						RowIdx_Rst<= '0';RowIdx_Increament<='0';
						FeatureIdx_Base_Load<= '0'; 							
					end if;
				else
					PositionInRow_Rst<='0';	PositionInRow_Increament<='1';
					FeatureIdx_Offset_Rst <= '0'; FeatureIdx_Offset_Increament <= '0';
					RowIdx_Rst<= '0';RowIdx_Increament<='0';
					FeatureIdx_Base_Load<= '0'; 
				end if;			
				--- To check if all the outputs are done
				if (LastPositionInRow_unfloped='1') then
					if LastFeatureOfSetBeingWritten_unfloped='1' then
						if (RowIdx(0)='1' or LastRowBeingWritten='1')then
							if (LastFeature_OfLayer_BeingWritten='1') then
								NxtState<= S_Rst;
							else
								NxtState<= S_DoneWithAllOutputs;
							end if;
						else
							NxtState<= S_Normal_Write;
						end if;
					else	
						NxtState<= S_Normal_Write;
					end if;					
				else
					NxtState<= S_Normal_Write;
				end if;	
			else
				Load8Words<='0';							
				Shift_Row0AndRow1 <= '0'; Shift_Row2AndRow3<='0';
				PositionInRow_Rst<='0';	PositionInRow_Increament<='0';
				FeatureIdx_Offset_Rst <= '0'; FeatureIdx_Offset_Increament <= '0';
				RowIdx_Rst<= '0';RowIdx_Increament<='0';
				FeatureIdx_Base_Load<= '0'; 
				NxtState<= S_Normal_Write;
			end if;
		-----		
		when S_RowSizeOf8_Write =>
			ClearToSendOutputs_ToMaster <= '0';
		  	ChooseSetOfRow<= PositionInRow(0); Latch_Outputs<='0';
			FeatureIdx_Base_Rst<='0';
			InitialRowIdx_load<='0';
			if (ClearToSend='1') then
				Load8Words<='1';
				if (PositionInRow(0)='1') then
					Shift_Row0AndRow1 <= '0'; Shift_Row2AndRow3<='1';
				else
					Shift_Row0AndRow1 <= '1'; Shift_Row2AndRow3<='0';
				end if;
				-- Modify Idxs
				if (PositionInRow(0)='1') then
					PositionInRow_Rst<='1';	PositionInRow_Increament<='0';
					if (LastFeatureOfSetBeingWritten_unfloped='1') then
						FeatureIdx_Offset_Rst <= '1'; FeatureIdx_Offset_Increament <= '0';
						if (LastRowBeingWritten='1') then
							RowIdx_Rst<= '1';RowIdx_Increament<='0';
							FeatureIdx_Base_Load<= '1'; 
						else
							RowIdx_Rst<= '0';RowIdx_Increament<='1';
							FeatureIdx_Base_Load<= '0'; 							
						end if;
					else
						FeatureIdx_Offset_Rst <= '0'; FeatureIdx_Offset_Increament <= '1';
						RowIdx_Rst<= '0';RowIdx_Increament<='0';
						FeatureIdx_Base_Load<= '0'; 							
					end if;
				else
					PositionInRow_Rst<='0';	PositionInRow_Increament<='1';
					FeatureIdx_Offset_Rst <= '0'; FeatureIdx_Offset_Increament <= '0';
					RowIdx_Rst<= '0';RowIdx_Increament<='0';
					FeatureIdx_Base_Load<= '0'; 
				end if;	
			--- To check if all the outputs are done
				if (PositionInRow(0)='1') then
					if LastFeatureOfSetBeingWritten_unfloped='1' then
						if (LastRowBeingWritten='1' and LastFeature_OfLayer_BeingWritten='1') then
							NxtState<= S_Rst;
						else
							NxtState<= S_DoneWithAllOutputs;
						end if;
					else	
						NxtState<= S_RowSizeOf8_Write;
					end if;					
				else
					NxtState<= S_RowSizeOf8_Write;
				end if;	
			else
				Load8Words<='0';							
				Shift_Row0AndRow1 <= '0'; Shift_Row2AndRow3<='0';
				PositionInRow_Rst<='0';	PositionInRow_Increament<='0';
				FeatureIdx_Offset_Rst <= '0'; FeatureIdx_Offset_Increament <= '0';
				RowIdx_Rst<= '0';RowIdx_Increament<='0';
				FeatureIdx_Base_Load<= '0'; 
				NxtState<= S_RowSizeOf8_Write;
			end if;		
		-------
		when S_FullyConnectedLayer_Write_0 =>
			ClearToSendOutputs_ToMaster <= '0'; Latch_Outputs<='0';
			Shift_Row2AndRow3<='0';
		  	ChooseSetOfRow<= '0';	  			
			FeatureIdx_Base_Rst<='1'; FeatureIdx_Base_Load<='0'; -- Single Feature in Fully connected layer
			FeatureIdx_Offset_Rst<='1'; FeatureIdx_Offset_Increament<='0';
			RowIdx_Rst<= '0';
			InitialRowIdx_load<='0';
			if (ClearToSend='1') then
				Load8Words<='1';
				Shift_Row0AndRow1 <= '1';				
				if (PositionInRow(0)='1') then
					PositionInRow_Rst<='1';	PositionInRow_Increament<='0';
					RowIdx_Increament<='1';
				else
					PositionInRow_Rst<='0';	PositionInRow_Increament<='1';
					RowIdx_Increament<='0';					
				end if;
				-- Check if done
				if (PositionInRow(0)='1') then
				 	if (LastRowBeingWritten='1') then
						NxtState<= S_Rst;
				 	elsif (ThirtyTwoKernelsDone_FullyConnectedLayer='1')then
						NxtState<= S_DoneWithAllOutputs;
					else
						NxtState<= S_FullyConnectedLayer_Write_0;
					end if;	
				else
					NxtState<= S_FullyConnectedLayer_Write_0;
				end if;
			else
				Load8Words<='0';
				Shift_Row0AndRow1 <= '0';
				PositionInRow_Rst<='0';	PositionInRow_Increament<='0';
				RowIdx_Increament<='0';	
				NxtState<= S_FullyConnectedLayer_Write_0;
			end if;	
				
		-----------
		when S_DoneWithAllOutputs =>
			ClearToSendOutputs_ToMaster <= '1';
			Shift_Row0AndRow1 <= '0'; Shift_Row2AndRow3<='0';
		  	ChooseSetOfRow<= '0';	  
			RowIdx_Rst<= '0'; RowIdx_Increament<='0';
			FeatureIdx_Base_Rst<='0'; FeatureIdx_Base_Load<='0';
			FeatureIdx_Offset_Rst<='0'; FeatureIdx_Offset_Increament<='0';
			PositionInRow_Rst<='1'; PositionInRow_Increament<='0';
			Load8Words<='0';
			if(LoadOutputs_FromMaster='1') then
			  	Latch_Outputs<= '1';
				if (FullyConnectedLayer_In='1') then
					NxtState <= S_FullyConnectedLayer_Write_0;
					InitialRowIdx_load<='1';
				elsif (FeatureRowSize= std_logic_vector(to_unsigned(1,len(MaxDataFeatureRowSize/8)))) then
					NxtState<= S_RowSizeOf8_Write;
					InitialRowIdx_load<='0';
				else
					NxtState<= S_Normal_Write;
					InitialRowIdx_load<='0';
				end if;
			else
			  	Latch_Outputs<= '0';
				NxtState<= S_DoneWithAllOutputs;				
				InitialRowIdx_load<='0';
			end if; 
	end case;
end process NxtAndOutputProc;
--#End	 --FSM

--#Begin 	--Flags, Addr and Sizes
WriteInBank<= WriteInBank_0 and (not NoFeatureToBeWrittenToBank);
WriteInDDR <= (not WriteInBank) or (not NetworkFitsInBank); 
ClearToSend<= (ClearToSendData_Bank or not WriteInBank) and
    		  (ClearToSendData_DDR or not WriteInDDR); 

FeatureRowSize_Modified <= std_logic_vector(to_unsigned(2,6)) when FeatureRowSize=std_logic_vector(to_unsigned(1,6)) else
							FeatureRowSize;
FirstPositionOfRowBeingWritten_unfloped<= '1' when PositionInRow=std_logic_vector(to_unsigned(0,6)) else
								'0';
GrpOf8WordsLeftInARow_unfloped<= std_logic_vector(unsigned(FeatureRowSize_Modified)- unsigned(PositionInRow));
LastPositionInRow_unfloped <= '1' when (GrpOf8WordsLeftInARow_unfloped=std_logic_vector(to_unsigned(1,6))) else 
					 '0';
LastFeatureOfSetBeingWritten_unfloped<= '1' when FeatureIdx_Offset= std_logic_vector(unsigned(NumberOfSimultaneousKernel_Final_unfloped)-1) else
	 						  '0';
NumberOfSimultaneousKernel_Final_unfloped<= NumberOfSimultaneousKernel when LastSetOfKernel='0' else
									KernelsInLastSet;

LastFeature_OfLayer_BeingWritten<= '1' when FeatureIdx= TotalFeaturesInLayer else
									'0';
LastRowBeingWritten <= '1' when RowIdx= std_logic_vector(unsigned(TotalNumberOfRowsInAFeature_SizeInTermsOf16Words)-1) else
						'0';
FeatureIdx<= std_logic_vector(unsigned(FeatureIdx_Base) + unsigned(FeatureIdx_Offset));
PositionInRow_InMultipleof16Words<= PositionInRow(5 downto 1);
GrpIdx_Temp<= std_logic_vector( ((unsigned(RowIdx)*unsigned(FeatureRowSize))+ unsigned(PositionInRow) )/3 );
GrpIdx_unfloped<= GrpIdx_Temp(len(MaxDataFeatureSize / 24 - 1)-1 downto 0);
ThirtyTwoKernelsDone_FullyConnectedLayer<= '1' when unsigned(RowIdx)-unsigned(InitialRowIdx_FullyConnectedLayer)= to_unsigned(15,len(MaxDataFeatureColumnSize)) else
											'0';
RowSize_InMultipleOf16Words<= std_logic_vector(unsigned(FeatureRowSize (len(MaxDataFeatureRowSize/8)-1 downto 1)) + unsigned(FeatureRowSize(0 downto 0)));
	--Addrs
WriteBankAddr_Temp<= std_logic_vector(unsigned(LayerBase)+unsigned(RowIdx)*unsigned(TotalFeaturesInLayer) 
								* unsigned(RowSize_InMultipleOf16Words)
				 + unsigned(FeatureIdx)* unsigned(RowSize_InMultipleOf16Words)
				 + unsigned(PositionInRow_InMultipleof16Words) );
WriteBankAddr_Unfloped<= WriteBankAddr_Temp(C_ConvEngineDataBank_AddrLength - 1 DOWNTO 0);
	--Write In Bank Flag
WriteInDDR_FlagProc : process (RowIdx, LastPositionInRowToBeWrittenToBank, LastRowToBeWrittenToBank, PositionInRow)
begin
	if (RowIdx< LastRowToBeWrittenToBank) then
		WriteInBank_0 <= '1';
	elsif (RowIdx = LastRowToBeWrittenToBank) then
		if (PositionInRow<= LastPositionInRowToBeWrittenToBank) then
			WriteInBank_0<='1';
		else
			WriteInBank_0<='0';
		end if;
	else
		WriteInBank_0<='0';
	end if;
end process WriteInDDR_FlagProc;
--#End		--Flags

--#Begin	--Idx flops 
RowIdxProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or RowIdx_Rst='1' then
			RowIdx<= (others => '0');
		elsif (RowIdx_Increament='1') then
			RowIdx<= std_logic_vector(unsigned(RowIdx)+1);
		end if;
	end if;
end process RowIdxProc;
FeatureBaseProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or FeatureIdx_Base_Rst='1' then
			FeatureIdx_Base<= (others=>'0');
		elsif (FeatureIdx_Base_Load='1') then
			FeatureIdx_Base<= std_logic_vector(unsigned(FeatureIdx_Base)+ unsigned(FeatureIdx_Offset)+1);
		end if;
	end if;
end process FeatureBaseProc;
FeatureOffsetProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or FeatureIdx_Offset_Rst='1' then
			FeatureIdx_Offset<= (others => '0');
		elsif (FeatureIdx_Offset_Increament='1') then
			FeatureIdx_Offset<= std_logic_vector(unsigned(FeatureIdx_Offset)+1);
		end if;
	end if;
end process FeatureOffsetProc;
CurrPositionInRowProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or PositionInRow_rst='1' then
			PositionInRow <= (others=> '0');
		elsif (PositionInRow_Increament='1') then
			PositionInRow<= std_logic_vector(unsigned(PositionInRow)+1);
		end if;
	end if;
end process CurrPositionInRowProc;
InitialRowIdxPRoc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			InitialRowIdx_FullyConnectedLayer<= (others => '0');
		elsif (InitialRowIdx_load='1') then
			InitialRowIdx_FullyConnectedLayer<= RowIdx;
		end if;
	end if;
end process InitialRowIdxPRoc;
--#End		--Idx flops 

--#BEgin --COntrol Signals Proc
PipeLineProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			Load8Words_Bank_floped1<= '0';
			Load8Words_Bank_floped2<= '0';
			Load8Words_DDR_floped1<='0';
			Load8Words_DDR_floped2<='0';
			WriteBankAddr_floped1<= (others=>'0');
			WriteBankAddr_floped2<= (others=>'0');
			LastPositionInRow_floped1<= '0';
			LastPositionInRow_floped2<= '0';
			FirstPositionOfRowBeingWritten_floped1 <= '0'; 
			FirstPositionOfRowBeingWritten_floped2 <= '0';
			LastFeatureOfSetBeingWritten_floped1 <= '0';
			LastFeatureOfSetBeingWritten_floped2 <= '0';
			NumberOfSimultaneousKernel_Final_floped1 <= (others=>'0');
			NumberOfSimultaneousKernel_Final_floped2 <= (others=>'0');
			LayerIdx_floped1 <= (others=>'0');
			LayerIdx_floped2 <= (others=>'0');
			FeatureIdx_floped1 <= (others=>'0');
			FeatureIdx_floped2 <= (others=>'0');
			GrpIdx_floped1 <= (others=>'0');
			GrpIdx_floped2 <= (others=>'0');
			GrpOf8WordsLeftInARow_floped1<= (others => '0');
			GrpOf8WordsLeftInARow_floped2<= (others => '0');
		elsif (ClearToSend='1') then
			Load8Words_Bank_floped1<= Load8Words_Bank_unfloped;
			Load8Words_Bank_floped2<= Load8Words_Bank_floped1;
			Load8Words_DDR_floped1<= Load8Words_DDR_unfloped;
			Load8Words_DDR_floped2<= Load8Words_DDR_floped1;
			WriteBankAddr_floped1<= WriteBankAddr_Unfloped;
			WriteBankAddr_floped2<= WriteBankAddr_floped1;
			LastPositionInRow_floped1<= LastPositionInRow_unfloped;
			LastPositionInRow_floped2<= LastPositionInRow_floped1;
			FirstPositionOfRowBeingWritten_floped1 <= FirstPositionOfRowBeingWritten_unfloped;
			FirstPositionOfRowBeingWritten_floped2 <= FirstPositionOfRowBeingWritten_floped1;
			LastFeatureOfSetBeingWritten_floped1 <= LastFeatureOfSetBeingWritten_unfloped;
			LastFeatureOfSetBeingWritten_floped2 <= LastFeatureOfSetBeingWritten_floped1;
			NumberOfSimultaneousKernel_Final_floped1 <= NumberOfSimultaneousKernel_Final_unfloped;
			NumberOfSimultaneousKernel_Final_floped2 <= NumberOfSimultaneousKernel_Final_floped1;
			LayerIdx_floped1 <= LayerIdx;
			LayerIdx_floped2 <= LayerIdx_floped1;
			FeatureIdx_floped1 <= FeatureIdx;
			FeatureIdx_floped2 <= FeatureIdx_floped1;
			GrpIdx_floped1 <= GrpIdx_unfloped;
			GrpIdx_floped2 <= GrpIdx_floped1;
			GrpOf8WordsLeftInARow_floped1<= GrpOf8WordsLeftInARow_unfloped;
			GrpOf8WordsLeftInARow_floped2<= GrpOf8WordsLeftInARow_floped1;
		
		end if;
	end if;
end process PipeLineProc;

--#End	 --COntrol Signals Proc

--#Begin --Assign Outputs
FullyConnectedLayer_Out<= FullyConnectedLayer_In;
Load8Words_Bank_unfloped<= Load8Words and WriteInBank;
Load8Words_DDR_unfloped<= Load8Words and WriteInDDR;
LastPositionBeingLoaded_InOutputFeature<= '1' when (GrpOf8WordsLeftInARow_unfloped=std_logic_vector(to_unsigned(1,6))) else
										 '0';

	-- TO DataPath
PipeLine_En_ClrToSend<= ClearToSend;
	-- To DDR
Load8Words_DDR<= Load8Words_DDR_floped2;
GrpOf8WordsLeftInARow <=  GrpOf8WordsLeftInARow_floped2;
FirstPositionOfRowBeingWritten <= FirstPositionOfRowBeingWritten_floped2;
LastFeatureOfSetBeingWritten <= LastFeatureOfSetBeingWritten_floped2;
NumberOfSimultaneousKernel_Final <= NumberOfSimultaneousKernel_Final_floped2;
DDR_LayerIdx_In <= LayerIdx_floped2;
DDR_FeatureIdx_In <= FeatureIdx_floped2;
DDR_GroupIdxInAFeature_In  <= GrpIdx_floped2;
	-- To Bank
Load8Words_Bank <= Load8Words_Bank_floped2;
LastPositionInRow <= LastPositionInRow_floped2;		
WriteBankAddr <= WriteBankAddr_floped2;		
--#End --Assign Outputs

end Behavioral;
