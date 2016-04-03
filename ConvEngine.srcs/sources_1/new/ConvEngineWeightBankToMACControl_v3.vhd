----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.02.2016 19:55:31
-- Design Name: 
-- Module Name: ConvEngineWeightBankToMACControl_v3 - Behavioral
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

use work.ConvPackage.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ConvEngineWeightBankToMACControl_v3 is
	Port ( clk,rst: in std_logic;
		-- Control Signals to Datapath
		LoadFlipFlopRow: out std_logic_vector(0 to 7);
		ShiftFlipFlopRow: out std_logic_vector(0 to 7);
		DirectlyFromBank: out std_logic_vector(0 to 31);
		WriteEnable: out WriteEnable_t;
		ThirtyTwoMuxSelect: out ThirtyTwoMuxSelect_t;
		WriteAddr: out StreamBRAMWriteAddr_t;
		ReadAddr: out StreamBRAMReadAddr_t;
		-- Controls to and from master
		FeatureRowSize: in unsigned(4 downto 0); -- In multiples of 8 words
		EnabelLoadingWeightsFromBank: in std_logic; 
		EnableStreamingWeightsToMAC: in std_logic;
  		TellMACToWait:out std_logic;
        RqstToSendWeightsFromWeightBank: out std_logic
        -- TimePass
--        Counter: out unsigned(5 downto 0);
--        DoneLoading:out std_logic;
--        Enable: out std_logic_vector(31 downto 0);
--        PrevFirstIdxOut: out unsigned(5 downto 0);
--  		PrevLastIdxOut: out unsigned(5 downto 0)
  );
end ConvEngineWeightBankToMACControl_v3;

architecture Behavioral of ConvEngineWeightBankToMACControl_v3 is
--#Begin --Type
type StateType is (S_Rst, S_Initialize, S_WriteBank0_ReadBank1, S_Bank0Written_Bank1NotYetRead, S_Bank0NotYetWritten_Bank1Read, S_WriteBank1_ReadBank0, S_Bank1Written_Bank0NotYetRead, S_Bank1NotYetWritten_Bank0Read);
type Mod32Counter_StateType is (S_0,S_1,S_2,S_3,S_4,S_5,S_6,S_7,S_8,S_9,S_10,S_11
								,S_12,S_13,S_14,S_15,S_16,S_17,S_18,S_19,S_20,S_21,
								S_22,S_23,S_24,S_25,S_26,S_27,S_28,S_29,S_30,S_31,S_32);
type WriteAddr_Offset_t is array (0 to 31) of std_logic_vector(2 downto 0); 
--#End --Type

--#Begin --Signals
--signal WritingCounter: unsigned(4 downto 0);
--signal WritingCounterMod4 : unsigned (1 downto 0);
signal PrState, NxtState: StateType;
signal LoadFlipFlopRow_Flop, LoadFlipFlopRow_Combinational: std_logic_vector(0 to 7);
signal LoadFlipFlopRow_Flop_rst: std_logic;
signal SixteenBitWriteEnablePattern: std_logic_vector(0 to 15); -- First 16 bits for Bank0, last 16 for BAnk1 
signal ThirtyTwoBitWriteEnablePattern: std_logic_vector(0 to 31);
signal Mod33Counter: unsigned(5 downto 0);
signal Mod32CounterState: Mod32Counter_StateType;
signal PrevFirstIdx, PrevFirstIdx_F : unsigned(5 downto 0);
signal DoneReading,DoneLoading: std_logic;
--signal WriteAddr: StreamBRAMWriteAddr_t;
signal WriteAddr_Base: StreamBRAMWriteAddr_st;
signal ReadAddr_Base: StreamBRAMReadAddr_t; -- One for each BRAM
signal ReadAddr_Offset: std_logic_vector(3 downto 0);-- Max Value :15
signal WriteAddr_Offset: WriteAddr_Offset_t; --Max Value: 7;
signal RstWriteAddr_Offset, RstReadAddr_Offset: std_logic;
signal BankSelectToWrite, BankSelectToRead:std_logic; -- 0 when UpperHalf of BRAM has to be written, 1 when Lower Half has to be written
signal WriteEnable_Flag,ReadEnable_Flag: std_logic;
signal TellMACToWait_unfloped, TellMACToWait_floped_1,TellMACToWait_floped_2,TellMACToWait_floped_3 : std_logic;
--signal FeatureRowSize: unsigned(4 downto 0); -- In multiples of 8 words
--signal DoneLoading: std_logic;
--#End --Signals

begin
--#Begin --Common signals like Load, Shift and Directlyfrom BAnk
LoadRingCounter : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or DoneLoading='1' then
			LoadFlipFlopRow_Flop <= "10000000";
		elsif (WriteEnable_Flag='1') then
			LoadFlipFlopRow_Flop<= LoadFlipFlopRow_Combinational;
		end if;
	end if;
end process LoadRingCounter;
LoadFlipFlopRow_Combinational(0) <= LoadFlipFlopRow_Flop(7); 
LoadFlipFlopRow_Combinational(7) <= LoadFlipFlopRow_Flop(6); 
LoadFlipFlopRow_Combinational(6) <= LoadFlipFlopRow_Flop(5); 
LoadFlipFlopRow_Combinational(5) <= LoadFlipFlopRow_Flop(4); 
LoadFlipFlopRow_Combinational(4) <= LoadFlipFlopRow_Flop(3); 
LoadFlipFlopRow_Combinational(3) <= LoadFlipFlopRow_Flop(2); 
LoadFlipFlopRow_Combinational(2) <= LoadFlipFlopRow_Flop(1); 
LoadFlipFlopRow_Combinational(1) <= LoadFlipFlopRow_Flop(0); 

LoadFlipFlopRow <= LoadFlipFlopRow_Flop when WriteEnable_Flag='1' else
					(others => '0');
ShiftFlipFlopRow <= not LoadFlipFlopRow_Flop when WriteEnable_Flag='1' else
					(others => '0');
--#End	 --Common signals like Load, Shift and Directlyfrom BAnk

--#Begin --Address Generation
ReadAddr<= std_logic_vector(unsigned(ReadAddr_base) + unsigned(ReadAddr_Offset));
DoneReading<= '1' when ReadAddr_Offset = std_logic_vector(to_unsigned(15,4)) else
				'0';
WriteAddr_Base<= (others => '0') when BankSelectToWrite='0' else
				 std_logic_vector(to_unsigned(8,9));
ReadAddr_Base<= (others => '0') when BankSelectToRead='0' else
				 std_logic_vector(to_unsigned(16,10));
ReadOffsetProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or RstReadAddr_Offset='1' then
			ReadAddr_Offset<=(others=>'0');
		elsif (ReadEnable_Flag='1') then
			ReadAddr_Offset<= std_logic_vector(unsigned(ReadAddr_Offset)+1);			
		end if;
	end if;
end process ReadOffsetProc;

WriteOffsetProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or RstWriteAddr_Offset='1' then
			WriteAddr_Offset<= (others=>"000");
		elsif(WriteEnable_Flag='1') then
			for i in 0 to 31 loop
				if(ThirtyTwoBitWriteEnablePattern(i) = '1') then
					WriteAddr_Offset(i)<= std_logic_vector(unsigned(WriteAddr_Offset(i))+1);							
				end if;
			end loop;
		end if;
	end if;
end process WriteOffsetProc;

WriteAddProc : process (WriteAddr_Base, WriteAddr_Offset)
begin
	for i in 0 to 31 loop
		WriteAddr(i)<= std_logic_vector(unsigned(WriteAddr_Base) + unsigned(WriteAddr_Offset(i)));
	end loop;
end process WriteAddProc;
--#End	 --Address Generation

--#Begin --Mod 32 Count
Mod32Count : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or DoneLoading ='1' then
			Mod33Counter <= to_unsigned(1,6);
		elsif (WriteEnable_Flag='1')then
			Mod33Counter <= Mod33Counter+1;
		end if;
	end if;
end process Mod32Count;
--#End --Mod 32 Count

--#Begin --Prev First Idx
PrevIdxProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			PrevFirstIdx_F <= (others => '0');
		elsif (WriteEnable_Flag = '1') then
			PrevFirstIdx_F<= PrevFirstIdx;			
		end if;
	end if;
end process PrevIdxProc;

--#End	 --Prev First Idx
PrStateAssignement : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			PrState<= S_Rst;
		else
			PrState<= NxtState;
		end if;
	end if;
end process PrStateAssignement;

NxAndOlLogic : process (PrState, DoneLoading, DoneReading, EnabelLoadingWeightsFromBank, EnableStreamingWeightsToMAC)
begin
case PrState is 
		when S_Rst =>
			BankSelectToWrite <= '0';
			BankSelectToRead <= '1';
			RstReadAddr_Offset <= '1'; RstWriteAddr_Offset<= '1';
			TellMACToWait_unfloped<= '1';
			RqstToSendWeightsFromWeightBank <= '0';
			WriteEnable_Flag<= '0'; ReadEnable_Flag<='0';
			NxtState<= S_Initialize;
		when S_Initialize => 
			BankSelectToWrite <= '0';
			BankSelectToRead <= '1';
			RstReadAddr_Offset <= '1'; 
			TellMACToWait_unfloped<= '1';
			WriteEnable_Flag <= EnabelLoadingWeightsFromBank; ReadEnable_Flag<='0';		
			if (DoneLoading = '1') then -- Upper Half Loaded
				RstWriteAddr_Offset<= '1';
				RqstToSendWeightsFromWeightBank <= '0';
				NxtState<= S_WriteBank1_ReadBank0;
			else
				RstWriteAddr_Offset<= '0';
				RqstToSendWeightsFromWeightBank <= '1';
				NxtState<= S_Initialize;
			end if;			
	
		when S_WriteBank0_ReadBank1 =>
			WriteEnable_Flag <= EnabelLoadingWeightsFromBank;
			ReadEnable_Flag<=EnableStreamingWeightsToMAC;
			BankSelectToWrite <= '0';
			BankSelectToRead <= '1';
			if (DoneReading = '1' and DoneLoading='1') then
				TellMACToWait_unfloped<= '0';
				RqstToSendWeightsFromWeightBank <= '0';
				RstReadAddr_Offset <= '1'; RstWriteAddr_Offset<= '1';
				NxtState<= S_WriteBank1_ReadBank0;
--				BankSelectToWrite <= '1';
--				BankSelectToRead <= '0';
			elsif (DoneReading = '1' and DoneLoading='0') then
				TellMACToWait_unfloped<= '0';
				RqstToSendWeightsFromWeightBank <= '1';
				RstReadAddr_Offset <= '1'; RstWriteAddr_Offset<= '0';
				NxtState<=S_Bank0NotYetWritten_Bank1Read;
--				BankSelectToWrite <= '0';
--				BankSelectToRead <= '1';
			elsif (DoneReading = '0' and DoneLoading='1') then
				TellMACToWait_unfloped<= '0';
				RqstToSendWeightsFromWeightBank <= '0';
				RstReadAddr_Offset <= '0'; RstWriteAddr_Offset<= '1';
				NxtState<= S_Bank0Written_Bank1NotYetRead;
--				BankSelectToWrite <= '0';
--				BankSelectToRead <= '1';
			else
				TellMACToWait_unfloped<= '0';
				RqstToSendWeightsFromWeightBank <= '1';
				RstReadAddr_Offset <= '0'; RstWriteAddr_Offset<= '0';
				NxtState<= S_WriteBank0_ReadBank1;
--				BankSelectToWrite <= '0';
--				BankSelectToRead <= '1';
			end if;
		
		when S_Bank0Written_Bank1NotYetRead =>
			WriteEnable_Flag <= '0';
			ReadEnable_Flag<=EnableStreamingWeightsToMAC;
			RqstToSendWeightsFromWeightBank <= '0';
			RstWriteAddr_Offset<= '1';
			TellMACToWait_unfloped<= '0';
			BankSelectToWrite <= '0';
			BankSelectToRead <= '1';
			if (DoneReading = '1') then
				RstReadAddr_Offset <= '1'; 
				NxtState<= S_WriteBank1_ReadBank0;
--				BankSelectToWrite <= '1';
--				BankSelectToRead <= '0';
			else
				RstReadAddr_Offset <= '0'; 
				NxtState<= S_Bank0Written_Bank1NotYetRead;
--				BankSelectToWrite <= '0';
--				BankSelectToRead <= '1';
			end if;
		
		when S_Bank0NotYetWritten_Bank1Read =>
			WriteEnable_Flag <= EnabelLoadingWeightsFromBank;
			ReadEnable_Flag<='0';
			RstReadAddr_Offset <= '1'; 
			TellMACToWait_unfloped<= '1';
			BankSelectToWrite <= '0';
			BankSelectToRead <= '1';
			if (DoneLoading='1') then
				RqstToSendWeightsFromWeightBank <= '0';
				RstWriteAddr_Offset<= '1';
				NxtState<= S_WriteBank1_ReadBank0;
--				BankSelectToWrite <= '1';
--				BankSelectToRead <= '0';
			else
				RqstToSendWeightsFromWeightBank <= '1';
				RstWriteAddr_Offset<= '0';
				NxtState<= S_Bank0NotYetWritten_Bank1Read;				
			end if;
		
		when S_WriteBank1_ReadBank0 =>
			WriteEnable_Flag <= EnabelLoadingWeightsFromBank;
			ReadEnable_Flag<=EnableStreamingWeightsToMAC;
			BankSelectToWrite <= '1';
			BankSelectToRead <= '0';
			if (DoneReading = '1' and DoneLoading='1') then
				TellMACToWait_unfloped<= '0';
				RqstToSendWeightsFromWeightBank <= '0';
				RstReadAddr_Offset <= '1'; RstWriteAddr_Offset<= '1';
				NxtState<= S_WriteBank0_ReadBank1;
--				BankSelectToWrite <= '0';
--				BankSelectToRead <= '1';
			elsif (DoneReading = '1' and DoneLoading='0') then
				TellMACToWait_unfloped<= '0';
				RqstToSendWeightsFromWeightBank <= '1';
				RstReadAddr_Offset <= '1'; RstWriteAddr_Offset<= '0';
				NxtState<=S_Bank1NotYetWritten_Bank0Read;
--				BankSelectToWrite <= '1';
--				BankSelectToRead <= '0';
			elsif (DoneReading = '0' and DoneLoading='1') then
				TellMACToWait_unfloped<= '0';
				RqstToSendWeightsFromWeightBank <= '0';
				RstReadAddr_Offset <= '0'; RstWriteAddr_Offset<= '1';
				NxtState<= S_Bank1Written_Bank0NotYetRead;
--				BankSelectToWrite <= '1';
--				BankSelectToRead <= '0';
			else
				TellMACToWait_unfloped<= '0';
				RqstToSendWeightsFromWeightBank <= '1';
				RstReadAddr_Offset <= '0'; RstWriteAddr_Offset<= '0';
				NxtState<= S_WriteBank1_ReadBank0;			
			end if;
				
		when S_Bank1Written_Bank0NotYetRead =>
			WriteEnable_Flag <= '0';
			ReadEnable_Flag<=EnableStreamingWeightsToMAC;
			RqstToSendWeightsFromWeightBank <= '0';
			RstWriteAddr_Offset<= '1';
			TellMACToWait_unfloped<= '0';
			BankSelectToWrite <= '1';
			BankSelectToRead <= '0';
			if (DoneReading = '1') then
				RstReadAddr_Offset <= '1'; 
				NxtState<= S_WriteBank0_ReadBank1;
--				BankSelectToWrite <= '0';
--				BankSelectToRead <= '1';
			else
				RstReadAddr_Offset <= '0'; 
				NxtState<= S_Bank1Written_Bank0NotYetRead;
				
			end if;
		
		when S_Bank1NotYetWritten_Bank0Read =>
			WriteEnable_Flag <= EnabelLoadingWeightsFromBank;
			ReadEnable_Flag<='0';
			RstReadAddr_Offset <= '1'; 
			TellMACToWait_unfloped<= '1';
			BankSelectToWrite <= '1';
			BankSelectToRead <= '0';
			if (DoneLoading='1') then
				RqstToSendWeightsFromWeightBank <= '0';
				RstWriteAddr_Offset<= '1';
				NxtState<= S_WriteBank0_ReadBank1;
--				BankSelectToWrite <= '0';
--				BankSelectToRead <= '1';
			else
				RqstToSendWeightsFromWeightBank <= '1';
				RstWriteAddr_Offset<= '0';
				NxtState<= S_Bank1NotYetWritten_Bank0Read;
				
			end if;
	end case;
end process NxAndOlLogic;
----#End	  --FSM


--#Begin --WriteEnabel
WriteEnableProc : process (Mod33Counter,PrevFirstIdx_F,FeatureRowSize, WriteEnable_Flag)
begin
	case Mod33Counter is 
		when to_unsigned(0,6) =>
			ThirtyTwoBitWriteEnablePattern<= (others => '0');
			DoneLoading <= '0';
			PrevFirstIdx <= to_unsigned(0,6);
			ThirtyTwoMuxSelect<= (others => "000");
			DirectlyFromBank <= (others=>'0');
		when to_unsigned(1,6) =>
			if (WriteEnable_Flag='1') then	
				for i in 0 to 31 loop
					if (i >= 0 and i< FeatureRowSize) then
						ThirtyTwoBitWriteEnablePattern(i)<= '1';
						ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(0,3));--std_logic_vector(Mod33Counter(1 downto 0)-1);
						DirectlyFromBank(i) <= '1';
					else
						ThirtyTwoBitWriteEnablePattern(i)<= '0';
						ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(0,3));
						DirectlyFromBank(i) <= '0';
					end if;
				end loop;
				PrevFirstIdx <= to_unsigned(0,6);
				DoneLoading <= '0';
			else
				ThirtyTwoBitWriteEnablePattern<= (others => '0');
				DoneLoading <= '0';
				PrevFirstIdx <= to_unsigned(0,6);
				ThirtyTwoMuxSelect<= (others => "000");
				DirectlyFromBank <= (others=>'0');
			end if;

		when to_unsigned(2,6) =>
			for i in 0 to 31 loop
				if (i >= 0 and i< FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(0,3));--std_logic_vector(Mod33Counter(1 downto 0)-2);
					ThirtyTwoBitWriteEnablePattern(i)<= '1';
					DirectlyFromBank(i) <= '0';
				elsif (i >= FeatureRowSize and i< 2*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(1,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '1';
					DirectlyFromBank(i) <= '1';
				else
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(0,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '0';
					DirectlyFromBank(i) <= '0';
				end if;
			end loop;
--			if (3*FeatureRowSize > 32) then	
--				DoneLoading <= '1';
--				PrevFirstIdx <= to_unsigned(0,5);
--			else
				PrevFirstIdx <= to_unsigned(0,6);
				DoneLoading <= '0';
--			end if;
					
		when to_unsigned(3,6) =>
			for i in 0 to 31 loop
				if (i >= 0 and i< FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(0,3));--std_logic_vector(Mod33Counter(1 downto 0)-2);
					ThirtyTwoBitWriteEnablePattern(i)<= '1';
					DirectlyFromBank(i) <= '0';
				elsif (i >= FeatureRowSize and i< 2*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(1,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '1';				
					DirectlyFromBank(i) <= '0';
				elsif (i >= 2*FeatureRowSize and i< 3*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(2,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '1';
					DirectlyFromBank(i) <= '1';
				else
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(0,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '0';
					DirectlyFromBank(i) <= '0';
				end if;
			end loop;
--			if (4*FeatureRowSize > 32) then	
--				DoneLoading <= '1';
--				PrevFirstIdx <= to_unsigned(0,5);
--			else
				DoneLoading <= '0';
				PrevFirstIdx <= to_unsigned(0,6);
--			end if;
			
		when to_unsigned(4,6) =>
			for i in 0 to 31 loop
				if (i >= 0 and i< FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(0,3));--std_logic_vector(Mod33Counter(1 downto 0)-2);
					ThirtyTwoBitWriteEnablePattern(i)<= '1';
					DirectlyFromBank(i) <= '0';
				elsif (i >= FeatureRowSize and i< 2*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(1,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '1';				
					DirectlyFromBank(i) <= '0';
				elsif (i >= 2*FeatureRowSize and i< 3*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(2,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '1';				
					DirectlyFromBank(i) <= '0';
				elsif (i >= 3*FeatureRowSize and i< 4*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(3,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '1';
					DirectlyFromBank(i) <= '1';
				else
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(0,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '0';
					DirectlyFromBank(i) <= '0';
				end if;
			end loop;
--			if (5*FeatureRowSize > 32) then	
--				DoneLoading <= '1';
--				PrevFirstIdx <= to_unsigned(0,5);
--			else
				DoneLoading <= '0';
				PrevFirstIdx <= to_unsigned(0,6);
--			end if;

		when to_unsigned(5,6) =>
			for i in 0 to 31 loop
				if (i >= 0 and i< FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(0,3));--std_logic_vector(Mod33Counter(1 downto 0)-2);
					ThirtyTwoBitWriteEnablePattern(i)<= '1';
					DirectlyFromBank(i) <= '0';
				elsif (i >= FeatureRowSize and i< 2*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(1,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '1';				
					DirectlyFromBank(i) <= '0';
				elsif (i >= 2*FeatureRowSize and i< 3*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(2,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '1';				
					DirectlyFromBank(i) <= '0';
				elsif (i >= 3*FeatureRowSize and i< 4*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(3,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '1';
					DirectlyFromBank(i) <= '0';
				elsif (i >= 4*FeatureRowSize and i< 5*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(4,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '1';
					DirectlyFromBank(i) <= '1';
				else
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(0,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '0';
					DirectlyFromBank(i) <= '0';
				end if;
			end loop;
				DoneLoading <= '0';
				PrevFirstIdx <= to_unsigned(0,6);
		
		when to_unsigned(6,6) =>
			for i in 0 to 31 loop
				if (i >= 0 and i< FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(0,3));--std_logic_vector(Mod33Counter(1 downto 0)-2);
					ThirtyTwoBitWriteEnablePattern(i)<= '1';
					DirectlyFromBank(i) <= '0';
				elsif (i >= FeatureRowSize and i< 2*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(1,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '1';				
					DirectlyFromBank(i) <= '0';
				elsif (i >= 2*FeatureRowSize and i< 3*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(2,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '1';				
					DirectlyFromBank(i) <= '0';
				elsif (i >= 3*FeatureRowSize and i< 4*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(3,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '1';
					DirectlyFromBank(i) <= '0';
				elsif (i >= 4*FeatureRowSize and i< 5*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(4,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '1';
					DirectlyFromBank(i) <= '0';
				elsif (i >= 5*FeatureRowSize and i< 6*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(5,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '1';
					DirectlyFromBank(i) <= '1';
				else
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(0,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '0';
					DirectlyFromBank(i) <= '0';
				end if;
			end loop;
				DoneLoading <= '0';
				PrevFirstIdx <= to_unsigned(0,6);
		
		when to_unsigned(7,6) =>
			for i in 0 to 31 loop
				if (i >= 0 and i< FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(0,3));--std_logic_vector(Mod33Counter(1 downto 0)-2);
					ThirtyTwoBitWriteEnablePattern(i)<= '1';
					DirectlyFromBank(i) <= '0';
				elsif (i >= FeatureRowSize and i< 2*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(1,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '1';				
					DirectlyFromBank(i) <= '0';
				elsif (i >= 2*FeatureRowSize and i< 3*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(2,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '1';				
					DirectlyFromBank(i) <= '0';
				elsif (i >= 3*FeatureRowSize and i< 4*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(3,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '1';
					DirectlyFromBank(i) <= '0';
				elsif (i >= 4*FeatureRowSize and i< 5*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(4,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '1';
					DirectlyFromBank(i) <= '0';
				elsif (i >= 5*FeatureRowSize and i< 6*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(5,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '1';
					DirectlyFromBank(i) <= '0';
				elsif (i >= 6*FeatureRowSize and i< 7*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(6,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '1';
					DirectlyFromBank(i) <= '1';
				else
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(0,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '0';
					DirectlyFromBank(i) <= '0';
				end if;
			end loop;
				DoneLoading <= '0';
				PrevFirstIdx <= to_unsigned(0,6);

		when to_unsigned(8,6) =>
			for i in 0 to 31 loop
				if (i >= 0 and i< FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(0,3));--std_logic_vector(Mod33Counter(1 downto 0)-2);
					ThirtyTwoBitWriteEnablePattern(i)<= '1';
					DirectlyFromBank(i) <= '0';
				elsif (i >= FeatureRowSize and i< 2*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(1,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '1';				
					DirectlyFromBank(i) <= '0';
				elsif (i >= 2*FeatureRowSize and i< 3*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(2,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '1';				
					DirectlyFromBank(i) <= '0';
				elsif (i >= 3*FeatureRowSize and i< 4*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(3,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '1';
					DirectlyFromBank(i) <= '0';
				elsif (i >= 4*FeatureRowSize and i< 5*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(4,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '1';
					DirectlyFromBank(i) <= '0';
				elsif (i >= 5*FeatureRowSize and i< 6*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(5,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '1';
					DirectlyFromBank(i) <= '0';
				elsif (i >= 6*FeatureRowSize and i< 7*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(6,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '1';
					DirectlyFromBank(i) <= '0';
				elsif (i >= 7*FeatureRowSize and i< 8*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(7,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '1';
					DirectlyFromBank(i) <= '1';
				else
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(0,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '0';
					DirectlyFromBank(i) <= '0';
				end if;
			end loop;
				DoneLoading <= '0';
				PrevFirstIdx <= '0' & FeatureRowSize;
		
		when others =>
			for i in 0 to 31 loop
				if (i >= PrevFirstIdx_F and i< PrevFirstIdx_F+FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(Mod33Counter(2 downto 0));
					ThirtyTwoBitWriteEnablePattern(i)<= '1';
					DirectlyFromBank(i) <= '0';
				elsif (i >= PrevFirstIdx_F+FeatureRowSize and i< PrevFirstIdx_F+2*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(Mod33Counter(2 downto 0)-7);
					ThirtyTwoBitWriteEnablePattern(i)<= '1';				
					DirectlyFromBank(i) <= '0';
				elsif (i >= PrevFirstIdx_F+2*FeatureRowSize and i< PrevFirstIdx_F+3*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(Mod33Counter(2 downto 0)-6);
					ThirtyTwoBitWriteEnablePattern(i)<= '1';				
					DirectlyFromBank(i) <= '0';
				elsif (i >= PrevFirstIdx_F+3*FeatureRowSize and i< PrevFirstIdx_F+4*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(Mod33Counter(2 downto 0)-5);
					ThirtyTwoBitWriteEnablePattern(i)<= '1';
					DirectlyFromBank(i) <= '0';
				elsif (i >= PrevFirstIdx_F+4*FeatureRowSize and i< PrevFirstIdx_F+5*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(Mod33Counter(2 downto 0)-4);
					ThirtyTwoBitWriteEnablePattern(i)<= '1';				
					DirectlyFromBank(i) <= '0';
				elsif (i >= PrevFirstIdx_F+5*FeatureRowSize and i< PrevFirstIdx_F+6*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(Mod33Counter(2 downto 0)-3);
					ThirtyTwoBitWriteEnablePattern(i)<= '1';				
					DirectlyFromBank(i) <= '0';
				elsif (i >= PrevFirstIdx_F+6*FeatureRowSize and i< PrevFirstIdx_F+7*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(Mod33Counter(2 downto 0)-2);
					ThirtyTwoBitWriteEnablePattern(i)<= '1';
					DirectlyFromBank(i) <= '0';
				elsif (i >= PrevFirstIdx_F+7*FeatureRowSize and i< PrevFirstIdx_F+8*FeatureRowSize) then
					ThirtyTwoMuxSelect(i)<= std_logic_vector(Mod33Counter(2 downto 0)-1);
					ThirtyTwoBitWriteEnablePattern(i)<= '1';
					DirectlyFromBank(i) <= '1';
				else
					ThirtyTwoMuxSelect(i)<= std_logic_vector(to_unsigned(0,3));
					ThirtyTwoBitWriteEnablePattern(i)<= '0';
					DirectlyFromBank(i) <= '0';
				end if;
			end loop;
			if ((PrevFirstIdx_F+FeatureRowSize) > 31) then	
				DoneLoading <= '1';
				PrevFirstIdx <= to_unsigned(0,6);
			else
				DoneLoading <= '0';
				PrevFirstIdx <= PrevFirstIdx_F + FeatureRowSize;
			end if;
	end case;
end process WriteEnableProc;

ConvertWriteEnableProc: process (ThirtyTwoBitWriteEnablePattern)
begin
	for i in 0 to 31 loop
		WriteEnable(i)(0) <= ThirtyTwoBitWriteEnablePattern(i);
	end loop;
end process;

TellMacToWaitPipeLineProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			TellMACToWait_floped_1<='1';
			TellMACToWait_floped_2<='1';
			TellMACToWait_floped_3<='1';
		else
			TellMACToWait_floped_1<= TellMACToWait_unfloped;
			TellMACToWait_floped_2<= TellMACToWait_floped_1;
			TellMACToWait_floped_3<= TellMACToWait_floped_2;
		end if;
	end if;
end process TellMacToWaitPipeLineProc;

--#Begin --Output Proc
TellMACToWait<= TellMACToWait_floped_3;
--#End  --Output Proc


--#End --Write Enable Proc
--#Begin --TimePass
--Enable <= ThirtyTwoBitWriteEnablePattern;
--PrevFirstIdxOut <= PrevFirstIdx_F;
----PrevLastIdxOut <= PrevFirstIdx_F + 4*FeatureRowSize; 
--Counter <= Mod33Counter;
--#End --TimePass


--WriteEnableProc : process (clk) is
--begin
--	if rising_edge(clk) then
--		if rst = '1' then
--			SixteenBitWriteEnablePattern <= X"8007"; -- Last Three bits are useless
--		elsif (EnableLoading='1') then
--			for i in 1 to 7 loop
--				SixteenBitWriteEnablePattern(i) <= SixteenBitWriteEnablePattern(i-1); 
--			end loop;
--			for i in 9 to 15 loop
--				SixteenBitWriteEnablePattern(i) <= SixteenBitWriteEnablePattern(i-1); 
--			end loop;
--			if(Mod32Counter=31 or (Mod32Counter<5 and Mod32Counter>=0)) then
--				SixteenBitWriteEnablePattern(0) <= SixteenBitWriteEnablePattern(15);
--			elsif (Mod32Counter>6 and Mod32Counter<12) then
--				SixteenBitWriteEnablePattern(0) <= SixteenBitWriteEnablePattern(7);
--			end if;
--			if(Mod32Counter>14 and Mod32Counter<20) then
--				SixteenBitWriteEnablePattern(8) <= SixteenBitWriteEnablePattern(7);
--			elsif (Mod32Counter> 22 and Mod32Counter<28) then
--				SixteenBitWriteEnablePattern(8) <= SixteenBitWriteEnablePattern(15);
--			end if;
--		end if;
--	end if;
--end process WriteEnableProc;
--WriteEnable(0) <= SixteenBitWriteEnablePattern(0 to 7);
--WriteEnable(1) <= SixteenBitWriteEnablePattern(0 to 7);
--WriteEnable(2) <= SixteenBitWriteEnablePattern(8 to 15);
--WriteEnable(3) <= SixteenBitWriteEnablePattern(8 to 15);
--#End	 --WriteEnabel
----#Begine --FSM


end Behavioral;
