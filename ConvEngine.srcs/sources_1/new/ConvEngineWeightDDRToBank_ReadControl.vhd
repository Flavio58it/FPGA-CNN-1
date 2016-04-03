----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.03.2016 11:07:43
-- Design Name: 
-- Module Name: ConvEngineWeightDDRToBank_ReadControl - Behavioral
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

entity ConvEngineWeightDDRToBank_ReadControl is
	Port ( clk,rst: in std_logic;
   		--- Contol I/O with master
		Read_Rqst: in std_logic;
   		DoneReading: out std_logic;		
		NumberOfSimultaneousKernel: in NumberOfSimultaneousKernel_t;
		-- Contorl and ADDR to FIFO
   		FIFO_ReadAddr: out std_logic_vector(7 DOWNTO 0);
		FIFO_Read_EN: out std_logic;
		--Data From FIFO--
		DataFromFIFO: in SingleSetOf8Words_t;
		-- Data To Weight bank
		DataToWeightBank: out ConvEngineWeightBank_InputSinglePort_t
	);
end ConvEngineWeightDDRToBank_ReadControl;

architecture Behavioral of ConvEngineWeightDDRToBank_ReadControl is
-- Type
type StateType_t is (S_Rst,S_ArrangeWord_1, S_ArrangeWord_2,S_ArrangeWord_3,S_WaitForRqst);

--#Begin --signals
signal TempWordsFromFIFOToBank: ConvEngineWeightBank_InputSinglePort_t;
signal TempWordsFromFIFOToBank_LowerEn, TempWordsFromFIFOToBank_HigherEn: std_logic;
	--FIFO
signal FIFO_AddrTagBasedOnKernelIdx: NumberOfSimultaneousKernel_t;
signal FIFO_ReadPtr: std_logic_vector(2 downto 0);
signal FIFO_AddrTag_Rst, FIFO_AddrTag_Increament: std_logic;
signal FIFO_ReadPtr_Rst, FIFO_ReadPtr_Increament: std_logic;
	--FSM
signal FIFO_Read_EN_NoLongerUsed:std_logic;
signal PrState,NxtState: StateType_t;
signal SubSet_Done: std_logic;
--#End	--signals

begin

--#Begin --FSM
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

NxAndOutputProc : process (PrState, Read_Rqst, FIFO_AddrTagBasedOnKernelIdx, FIFO_ReadPtr, SubSet_Done)
begin
	case PrState is 
		when S_Rst =>
			FIFO_ReadAddr <= FIFO_AddrTagBasedOnKernelIdx & FIFO_ReadPtr;
			DoneReading<='1';
			FIFO_AddrTag_Rst<='1';FIFO_AddrTag_Increament<='0';
			FIFO_ReadPtr_Rst<='1';	FIFO_ReadPtr_Increament<='0';
			TempWordsFromFIFOToBank_LowerEn<= '0';			
			TempWordsFromFIFOToBank_HigherEn<= '0';
			if (Read_Rqst='1') then
				NxtState<= S_ArrangeWord_1;
				FIFO_Read_EN_NoLongerUsed<='1';
			else
				NxtState<= S_Rst;
				FIFO_Read_EN_NoLongerUsed<='0';
			end if;
			
		when S_ArrangeWord_1 =>
			FIFO_ReadAddr <= FIFO_AddrTagBasedOnKernelIdx & std_logic_vector(unsigned(FIFO_ReadPtr) +1);
			DoneReading<='0';
			FIFO_AddrTag_Rst<='0';FIFO_AddrTag_Increament<='0';
			FIFO_ReadPtr_Rst<='0';	FIFO_ReadPtr_Increament<='0';
			FIFO_Read_EN_NoLongerUsed<= '1';
			TempWordsFromFIFOToBank_LowerEn<= '0';
			TempWordsFromFIFOToBank_HigherEn<= '0';
			NxtState<= S_ArrangeWord_2;			
		when S_ArrangeWord_2 =>
			FIFO_ReadAddr <= FIFO_AddrTagBasedOnKernelIdx & std_logic_vector(unsigned(FIFO_ReadPtr) +1);
			DoneReading<='0';
			FIFO_AddrTag_Rst<='0';FIFO_AddrTag_Increament<='0';
			FIFO_ReadPtr_Rst<='0';	FIFO_ReadPtr_Increament<='0';
			FIFO_Read_EN_NoLongerUsed<= '1';
			TempWordsFromFIFOToBank_LowerEn<= '1';
			TempWordsFromFIFOToBank_HigherEn<= '0';
			NxtState<= S_ArrangeWord_3;		

		when S_ArrangeWord_3 =>
			FIFO_ReadAddr <= FIFO_AddrTagBasedOnKernelIdx & std_logic_vector(unsigned(FIFO_ReadPtr) +1);
			DoneReading<='0';
			FIFO_ReadPtr_Rst<='0';
			FIFO_Read_EN_NoLongerUsed<= '0';
			if SubSet_Done='1' then
				FIFO_AddrTag_Rst<='1';
				FIFO_AddrTag_Increament<='0';
				FIFO_ReadPtr_Increament<= '1';
			else
				FIFO_AddrTag_Rst<='0';
				FIFO_AddrTag_Increament<='1';
				FIFO_ReadPtr_Increament<= '0';
			end if;
			TempWordsFromFIFOToBank_LowerEn<= '0';
			TempWordsFromFIFOToBank_HigherEn<= '1';
			NxtState<= S_WaitForRqst;
		when S_WaitForRqst =>
			FIFO_ReadAddr <= FIFO_AddrTagBasedOnKernelIdx & FIFO_ReadPtr;
			DoneReading<='1';
			FIFO_AddrTag_Rst<='0';FIFO_AddrTag_Increament<='0';
			FIFO_ReadPtr_Rst<='0';	FIFO_ReadPtr_Increament<='0';
			TempWordsFromFIFOToBank_LowerEn<= '0';
			TempWordsFromFIFOToBank_HigherEn<= '0';
			If(Read_Rqst='1') then
				NxtState<= S_ArrangeWord_1;	
				FIFO_Read_EN_NoLongerUsed<='1';
			else
				NxtState<= S_WaitForRqst;
				FIFO_Read_EN_NoLongerUsed<='0';
			end if;
				
	end case;
end process NxAndOutputProc;
--#End	 --FSM


--#BEgin --Temp Word Proc
TempWordProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			TempWordsFromFIFOToBank<= (others => std_logic_vector(to_unsigned(0,18)));
		elsif TempWordsFromFIFOToBank_LowerEn ='1' then
			for i in 0 to 7 loop
				TempWordsFromFIFOToBank(i) <=  DataFromFIFO(i);
			end loop;
		elsif TempWordsFromFIFOToBank_HigherEn ='1' then	
			for i in 8 to 15 loop
				TempWordsFromFIFOToBank(i) <=  DataFromFIFO(i-8);
			end loop;
		end if;
	end if;
end process TempWordProc;
--#End   --Temp Word Proc

--#Begins --FIFO Addr TAg and Offset
AddrTagProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or FIFO_AddrTag_Rst='1' then
			FIFO_AddrTagBasedOnKernelIdx<= (others=>'0');
		elsif(FIFO_AddrTag_Increament='1') then
			FIFO_AddrTagBasedOnKernelIdx<= std_logic_vector(unsigned(FIFO_AddrTagBasedOnKernelIdx)+1);			
		end if;
	end if;
end process AddrTagProc;
WritePtrProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' and FIFO_ReadPtr_Rst='1' then
			FIFO_ReadPtr<= (others=>'0');
		elsif (FIFO_ReadPtr_Increament='1')then
			FIFO_ReadPtr<= std_logic_vector(unsigned(FIFO_ReadPtr)+2);
		end if;
	end if;
end process WritePtrProc;
--#Ends   --FIFO Addr TAg and Offset

SubSet_Done<= '1' when FIFO_AddrTagBasedOnKernelIdx = std_logic_vector(unsigned(NumberOfSimultaneousKernel)-1) else
			  '0';
DataToWeightBank<= TempWordsFromFIFOToBank;
FIFO_Read_EN<= '1';
end Behavioral;
