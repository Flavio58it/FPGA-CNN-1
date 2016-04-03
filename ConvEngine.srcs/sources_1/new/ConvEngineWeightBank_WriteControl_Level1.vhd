----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.02.2016 14:36:47
-- Design Name: 
-- Module Name: ConvEngineWeightBank_WriteControl_Level1 - Behavioral
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

entity ConvEngineWeightBank_WriteControl_Level1 is
	Port ( clk,rst: in std_logic;
			-- Control input from Main control unit
			Layer_base: in ConvEngineTotalWeightAddrInTermsOf16Words_t;
			LayerIdx: in LayerIdx_st;
			SetIdx: in ConvEngineWeightBankReadAddr_t;
			SetSize_InTermsOf16Words: in SetSize_InTermsOf16Words_t;
			SizeOfLastSet_InTermsof16Words : in SetSize_InTermsOf16Words_t;
			NumberOfSimultaneousKernel: in NumberOfSimultaneousKernel_t;
			TotalNumberOfSetsInALayer: in ConvEngineWeightBankReadAddr_t;
			KernelsInLastSet: in NumberOfSimultaneousKernel_t;
			
			KernelSize_InMultipleOf24Weights: in KernelSize_InMultipleOf24Weights_t;
			KernelSize_InMultipleOf16Weights: in KernelSize_InMultipleOf16Weights_t;
			EnableWritingWeight: in std_logic;
			-- Control out to Main control
			DoneLoadingLayer: out std_logic;
			DoneWithFirstSet: out std_logic;

		    -- Details OF Read idx	
			CurrentSetAddress_OfReadingUnit: in ConvEngineWeightBankReadAddr_t;
			Current_ReadPtr: in ConvEngineWeightBankReadAddr_t;
			SetCrossesBankBoundary: in std_logic; -- Unique for a Layer
			-- Output to Read Idx
			Current_WritePtr: out ConvEngineWeightBankReadAddr_t;

			-- Output to Weight Bank
			WriteBankAddr: out ConvEngineWeightBankWriteAddr_t;
			WriteBank_En: out std_logic_vector(0 downto 0);
			DataToWeightBank: out ConvEngineWeightBank_InputSinglePort_t; 			
			-- Output to DDR controller
			DDR_LayerIdx_Rqst: out LayerIdx_st;
			DDR_KernelIdx_Rqst: out ConvEngineWeightBankReadAddr_t;
			DDR_GroupOf24Idx_Rqst: out KernelSize_InMultipleOf24Weights_t;
			RqstToDDR: out std_logic;
			-- Input from DDR controller
			AckFromDDR: in std_logic;
			--- Input to Weight Bank from DDR	
			DataFromDDR: in DDR_DataOut_t 
	);
end ConvEngineWeightBank_WriteControl_Level1;

architecture Behavioral of ConvEngineWeightBank_WriteControl_Level1 is
--#Begin --Component
COMPONENT blk_mem_gen_SDP_Awrite144depth256_Bread144
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(143 DOWNTO 0);
    clkb : IN STD_LOGIC;
    enb : IN STD_LOGIC;
    addrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(143 DOWNTO 0)
  );
END COMPONENT;
component ConvEngineWeightDDRToBank_WriteControl
	port(clk, rst                             : in  std_logic;
		 Write_Rqst                           : in  std_logic;
		 DoneWriting                          : out std_logic;
		 NumberOfSimultaneousKernel           : in  NumberOfSimultaneousKernel_t;
		 NumberOfSimultaneousKernel_InLastSet : in  NumberOfSimultaneousKernel_t;
		 FIFO_WriteAddr                       : out std_logic_vector(7 DOWNTO 0);
		 FIFO_Write_EN                        : out std_logic;
		 DataToFIFO                           : out SingleSetOf8Words_t;
		 LayerIdx                             : in  LayerIdx_st;
		 Set_Done                             : in  std_logic;
		 Last_Set                             : in  std_logic;
		 Set_Idx                              : in  ConvEngineWeightBankReadAddr_t;
		 DDR_LayerIdx_Rqst                    : out LayerIdx_st;
		 DDR_KernelIdx_Rqst                   : out ConvEngineWeightBankReadAddr_t;
		 DDR_GroupOf24Idx_Rqst                : out KernelSize_InMultipleOf24Weights_t;
		 RqstToDDR                            : out std_logic;
		 AckFromDDR                           : in  std_logic;
		 DataFromDDR                          : in  DDR_DataOut_t);
end component ConvEngineWeightDDRToBank_WriteControl;
component ConvEngineWeightDDRToBank_ReadControl
	port(clk, rst                   : in  std_logic;
		 Read_Rqst                  : in  std_logic;
		 DoneReading                : out std_logic;
		 NumberOfSimultaneousKernel : in  NumberOfSimultaneousKernel_t;
		 FIFO_ReadAddr              : out std_logic_vector(7 DOWNTO 0);
		 FIFO_Read_EN               : out std_logic;
		 DataFromFIFO               : out SingleSetOf8Words_t;
		 DataToWeightBank           : out ConvEngineWeightBank_InputSinglePort_t);
end component ConvEngineWeightDDRToBank_ReadControl;
--#End  --Components

--#Begin --Type
type StateType_t is (S_Rst, S_WriteFIFO, S_ReadFIFO,S_WriteBank, S_WriteAndReadFIFO, S_EndOfSet);
--#End	 --Type

--#Begin --Signal	
	-- FIFO
signal FIFO_WriteAddr, FIFO_ReadAddr: std_logic_vector(7 DOWNTO 0);
signal FIFO_DataInput_vector, FIFO_DataOutput_vector: std_logic_vector(287 downto 0);
signal FIFO_Read_En, FIFO_Write_EN: std_logic;
signal DataToFIFO, DataFromFIFO:  SingleSetOf8Words_t;
	-- FIFO Flags
signal FIFO_WritingDone, FIFO_ReadingDone: std_logic;
signal FIFO_RqstWrite, FIFO_RqstRead: std_logic;
	--FSM
signal PrState,NxtState: StateType_t;
	-- Weight Bank Addressing
signal TotalAddr: ConvEngineTotalWeightAddrInTermsOf16Words_t;
signal CurrentTag: ConvEngineWeightBank_Tag_st;
signal WriteAddr_Temp: ConvEngineWeightBankReadAddr_t;
signal CurrentOffset, LastOffset: SetSize_InTermsOf16Words_t;
signal CurrentSetIdx: ConvEngineWeightBankReadAddr_t;
	-- Flags
signal LastOffset_Rst, LastOffset_Enable: std_logic;
signal CurrentOffset_Rst,CurrentOffset_Enable: std_logic;
signal CurrentSetIdx_Rst, CurrentSetIdx_Enable: std_logic;
signal SpaceAvailableToWrite: std_logic;
signal Set_Done, Last_Set,  SecondLastWord_InASet, Layer_Done: std_logic;
--#End	--Signal

begin
---------------------------------------------Begin FSM-----------------------------------
--begin  --FSM 
PrStateProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			PrState<= S_Rst;
		else
			PrState<= NxtState;			
		end if;
	end if;
end process PrStateProc;

NxtANDOutputLogic : process (PrState)
begin
	case PrState is 
		when S_Rst =>
			DoneLoadingLayer<='1'; DoneWithFirstSet<='0';
			CurrentOffset_Rst <= '1'; CurrentOffset_Enable <= '0';
			CurrentSetIdx_Rst<= '1'; CurrentSetIdx_Enable<= '0';
			FIFO_RqstRead<='0';
			WriteBank_En<="0";
			if (EnableWritingWeight='1') then
				NxtState <= S_WriteFIFO;
				FIFO_RqstWrite<='1';
			else
				NxtState<= S_Rst;
				FIFO_RqstWrite<='0';
			end if;
		when S_WriteFIFO =>
			DoneLoadingLayer<='0'; DoneWithFirstSet<='0';
			CurrentOffset_Rst <= '0'; CurrentOffset_Enable <= '0';
			CurrentSetIdx_Rst<= '0'; CurrentSetIdx_Enable<= '0';
			WriteBank_En<="0";
			if (FIFO_WritingDone='1') then
				NxtState <= S_WriteAndReadFIFO;
				FIFO_RqstWrite<='1';	-- Request To read Second Word
				FIFO_RqstRead<='1';
			else
				NxtState <= S_WriteFIFO;
				FIFO_RqstWrite<='0';
				FIFO_RqstRead<='0';			
			end if;
		
		when S_WriteAndReadFIFO =>
			DoneLoadingLayer<='0'; DoneWithFirstSet<='0';
			CurrentOffset_Rst <= '0'; CurrentOffset_Enable <= '0';
			CurrentSetIdx_Rst<= '0'; CurrentSetIdx_Enable<= '0';
			FIFO_RqstWrite<='0';
			FIFO_RqstRead<='0';						
			WriteBank_En<="0";		
			if (FIFO_WritingDone='1' and FIFO_ReadingDone='1') then
				NxtState <= S_WriteBank;
			else
				NxtState <= S_WriteAndReadFIFO;
			end if;		
		when S_WriteBank =>
			DoneLoadingLayer<='0'; DoneWithFirstSet<='0';
			CurrentOffset_Rst <= '0'; CurrentOffset_Enable <= '0';
			CurrentSetIdx_Rst<= '0'; CurrentSetIdx_Enable<= '0';
			FIFO_RqstWrite<='0';
			FIFO_RqstRead<='0';						
			if (SpaceAvailableToWrite ='1') then
				WriteBank_En<="1";
				if (SecondLastWord_InASet='1') then
					NxtState <= S_ReadFIFO;
					FIFO_RqstWrite<='0';
					FIFO_RqstRead<='1';	
				elsif (Set_Done='1') then
					NxtState <= S_EndOfSet;
					FIFO_RqstWrite<='0';
					FIFO_RqstRead<='0';
				else
					NxtState <= S_WriteAndReadFIFO;
					FIFO_RqstWrite<='1';
					FIFO_RqstRead<='1';	
				end if;
			else
				WriteBank_En<="0";
				NxtState <= S_WriteBank;
				FIFO_RqstWrite<='0';
				FIFO_RqstRead<='0';	
			end if;
			
		when S_ReadFIFO =>
			DoneLoadingLayer<='0'; DoneWithFirstSet<='0';
			CurrentOffset_Rst <= '0'; CurrentOffset_Enable <= '0';
			CurrentSetIdx_Rst<= '0'; CurrentSetIdx_Enable<= '0';
			WriteBank_En<="0";
			FIFO_RqstWrite<='0';
			FIFO_RqstRead<='0';
			if (FIFO_ReadingDone='1') then
				NxtState <= S_WriteBank;
			else
				NxtState <= S_ReadFIFO;
			end if;
		when S_EndOfSet =>
			if (Layer_Done='1') then
				DoneLoadingLayer<='1';
			else
				DoneLoadingLayer<='0';
			end if;
			
			if (Curren)

			 DoneWithFirstSet<='0';
			CurrentOffset_Rst <= '0'; CurrentOffset_Enable <= '0';
			CurrentSetIdx_Rst<= '0'; CurrentSetIdx_Enable<= '0';
			WriteBank_En<="0";
			FIFO_RqstWrite<='0';
			FIFO_RqstRead<='0';
			if (FIFO_ReadingDone='1') then
				NxtState <= S_WriteBank;
			else
				NxtState <= S_ReadFIFO;
			end if;
		
		
	end case;
end process NxtANDOutputLogic;
--end	 --FSM
--------------------------------------------End FSM-----------------------------------

--#Begin --Addressing
TotalAddr <= std_logic_vector(unsigned(Layer_base) 
				+ unsigned(CurrentSetIdx)*unsigned(SetSize_InTermsOf16Words)
				+ unsigned(CurrentOffset) );
WriteAddr_Temp <= TotalAddr (C_ConvEngineWeightBank_ReadAddrLength-1 downto 0);
CurrentTag <= TotalAddr ((C_AddressLengthForSingleWordAddressing-4)-1 downto C_ConvEngineWeightBank_ReadAddrLength);
WriteBankAddr<= WriteAddr_Temp;
--End --Addressing

--#Begin --Check If writing space available
SpaceAvailableToWrite <= '0' when (SetCrossesBankBoundary='0' and (WriteAddr_Temp = CurrentSetAddress_OfReadingUnit)) 
							or	  (SetCrossesBankBoundary='1' and (WriteAddr_Temp = Current_ReadPtr)) else 
						 '1';					  
--#End   --Check If writing space available

--#Begin --Flags for end of subset, set, layer
Set_Done<= '1' when  (Last_Set='1' and CurrentOffset = std_logic_vector(unsigned(SizeOfLastSet_InTermsof16Words)-1) ) else 
			'1' when CurrentOffset = std_logic_vector(unsigned(SetSize_InTermsOf16Words)-1) else
		   '0';
SecondLastWord_InASet<= '1' when  (Last_Set='1' and CurrentOffset = std_logic_vector(unsigned(SizeOfLastSet_InTermsof16Words)-2) ) else 
			'1' when CurrentOffset = std_logic_vector(unsigned(SetSize_InTermsOf16Words)-2) else
		   '0'; 
Last_Set<= '1' when (CurrentSetIdx = std_logic_vector((unsigned(TotalNumberOfSetsInALayer)-1))) else
				'0';
Layer_Done<= '1' when (CurrentSetIdx=std_logic_vector(unsigned(TotalNumberOfSetsInALayer)-1) and Set_Done='1') else
			'0';
--#End   --Flags for end of subset, set, layer


--#Begin --Current Offset
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
--#End	 --Current Offset
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
--#End --Flop of Current Set IDx

--------------------------------Begin Port Mapping ---------------------------------------
--#begin -- FIFO
DRAMtoBankFIFO: blk_mem_gen_SDP_Awrite144depth256_Bread144
	port map(
		clka => clk,
	    ena => FIFO_Write_EN,
	    wea => "1",
	    addra => FIFO_WriteAddr,
	    dina => FIFO_DataInput_vector,
	    clkb => clk,
	    enb => FIFO_Read_En,
	    addrb => FIFO_ReadAddr,
	    doutb => FIFO_DataOutput_vector 	
	);
ConversionProc : process (DataToFIFO,FIFO_DataOutput_vector)
begin
	for i in 0 to 7 loop
		DataFromFIFO(i)<= FIFO_DataOutput_vector((i+1)*18-1 downto i*18);
	end loop;
	for i in 0 to 143 loop
		FIFO_DataInput_vector(i)<= DataToFIFO(i/18)(i mod 18);
	end loop;	
end process ConversionProc;
--#End --FIFO
--#Begin --FIFO Write and Read Control
FIFOWriteCtrl: ConvEngineWeightDDRToBank_WriteControl
	port map(
		clk                                  => clk,
		rst                                  => rst,
		Write_Rqst                           => FIFO_RqstWrite,
		DoneWriting                          => FIFO_WritingDone,
		NumberOfSimultaneousKernel           => NumberOfSimultaneousKernel,
		NumberOfSimultaneousKernel_InLastSet => KernelsInLastSet,
		FIFO_WriteAddr                       => FIFO_WriteAddr,
		FIFO_Write_EN                        => FIFO_Write_EN,
		DataToFIFO                           => DataToFIFO,
		LayerIdx                             => LayerIdx,
		Set_Done                             => Set_Done,
		Last_Set                             => Last_Set,
		Set_Idx                              => Set_Idx,
		DDR_LayerIdx_Rqst                    => DDR_LayerIdx_Rqst,
		DDR_KernelIdx_Rqst                   => DDR_KernelIdx_Rqst,
		DDR_GroupOf24Idx_Rqst                => DDR_GroupOf24Idx_Rqst,
		RqstToDDR                            => RqstToDDR,
		AckFromDDR                           => AckFromDDR,
		DataFromDDR                          => DataFromDDR
	);
FIFOReadCtrl: ConvEngineWeightDDRToBank_ReadControl
	port map(
		clk                        => clk,
		rst                        => rst,
		Read_Rqst                  => FIFO_RqstRead,
		DoneReading                => FIFO_ReadingDone,
		NumberOfSimultaneousKernel => NumberOfSimultaneousKernel,
		FIFO_ReadAddr              => FIFO_ReadAddr,
		FIFO_Read_EN               => FIFO_Read_EN,
		DataFromFIFO               => DataFromFIFO,
		DataToWeightBank           => DataToWeightBank
	);
--#End    --FIFO Write and Read Control

--#BEgin --Output Assignment
DDR_LayerIdx_Rqst <= LayerIdx;
--#End  --Output Assignment
end Behavioral;

