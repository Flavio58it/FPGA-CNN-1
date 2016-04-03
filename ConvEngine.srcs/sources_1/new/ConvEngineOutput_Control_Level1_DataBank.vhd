----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.03.2016 10:28:06
-- Design Name: 
-- Module Name: ConvEngineOutput_Control_Level1_DataBank - Behavioral
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
entity ConvEngineOutput_Control_Level1_DataBank is
	  Port (	clk,rst: in std_logic;
	  	-- Hand Shake With Master
			LoadData_FromMaster: in std_logic;	  	
			LastPositionInRow: in std_logic;
			ClearToSendData_ToMaster: out std_logic;
			ClearToSend_OfDDR: in std_logic;
			WriteBankAddr: in ConvEngineDataBankAddr_t;
			
	  	-- HandShake With Bank
			RqstToBank:	out std_logic;
			AckFromBank:in std_logic;	
					  		
	  	-- Data from Output Flops
			MACOutput_GrpOf8Words: in MACFinalOutput_InGrpOf8_t;
	   	    MACOutputIdx_GrpOf8Words: in MACFinalOutputIdx_InGrpOf8_t;
	  
	  	-- Data Towards Bank
	  		DataOut: out ConvEngineDataBank_DataPort_t;
			IdxOut: out ConvEngineDataBank_IdxPort_t;	
	  		Addr: out ConvEngineDataBankAddr_t

	  );
end ConvEngineOutput_Control_Level1_DataBank;

architecture Behavioral of ConvEngineOutput_Control_Level1_DataBank is
--#Begin --Component
component fifo_generator_Width320_Depth16_DistRAM
	port(clk   : in  STD_LOGIC;
		 din   : in  STD_LOGIC_VECTOR(319 downto 0);
		 wr_en : in  STD_LOGIC;
		 rd_en : in  STD_LOGIC;
		 dout  : out STD_LOGIC_VECTOR(319 downto 0);
		 full  : out STD_LOGIC;
		 empty : out STD_LOGIC);
end component fifo_generator_Width320_Depth16_DistRAM;
component fifo_generator_Width16_Depth16_DistRAM
	port(clk   : IN  STD_LOGIC;
		 din   : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		 wr_en : IN  STD_LOGIC;
		 rd_en : IN  STD_LOGIC;
		 dout  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 full  : OUT STD_LOGIC;
		 empty : OUT STD_LOGIC);
end component fifo_generator_Width16_Depth16_DistRAM;
--#End	 --Component

--#Begin --Type
type StateType_t is (S_Rst, S_Write_0, S_Write_1, S_Load);
type ReadStateType_t is (S_Rst, S_RqstBank, S_WaitForNewData);
--#End 	--Type

--#Begin --Signal
	-- FIFO
signal Write_En, Read_En: std_logic;
signal FIFO_full,FIFO_Empty: std_logic;
signal FIFO_AddrIn_Vector, FIFO_AddrOut_Vector: STD_LOGIC_VECTOR(15 DOWNTO 0);
signal FIFO_AddrOut: ConvEngineDataBankAddr_t;
signal FIFO_DataIn_Vector, FIFO_DataOut_Vector: STD_LOGIC_VECTOR(319 downto 0);
signal FIFO_DataIn, FIFO_DataOut: ConvEngineDataBank_DataPort_t;
signal FIFO_IdxIn, FIFO_IdxOut: ConvEngineDataBank_IdxPort_t;
	-- Flags
signal LoadData,ClearToSendData: std_logic;
	-- Intermedtiate FF
signal DataTempWord_0, DataTempWord_1: MACFinalOutput_InGrpOf8_t;
signal IdxTempWord_0, IdxTempWord_1: MACFinalOutputIdx_InGrpOf8_t;
signal RstTemp_1, LoadTemp_0, LoadTemp_1: std_logic;
signal AddrTempWord: ConvEngineDataBankAddr_t;
	-- Write FSM
signal PrState, NxtState: StateType_t;
	-- Read FSM
signal PrState_Read, NxtState_Read: ReadStateType_t;
--#End --Signals
begin
--#begin -- Write FSM
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

NxtAndOutputProc : process (PrState, FIFO_full, LastPositionInRow, LoadData)
begin
	case PrState is 
		when S_Rst =>
			ClearToSendData<='1';
			LoadTemp_0<='0'; LoadTemp_1<='0';
			RstTemp_1<='1';
			Write_En<='0';
			NxtState<= S_Write_0;
		when S_Write_0 =>
			ClearToSendData<= not FIFO_full;
			Write_En<='0'; LoadTemp_1<='0';			
			if (LoadData='1') then
				LoadTemp_0<='1';
				if LastPositionInRow='1' then
					RstTemp_1<='1';
					NxtState<= S_Load;
				else
					RstTemp_1<='0';
					NxtState<= S_Write_1;
				end if;
			else
				LoadTemp_0<='0';
				RstTemp_1<='0';
				NxtState<= S_Write_0;
			end if;
		when S_Write_1 =>
			ClearToSendData<= not FIFO_full;
			Write_En<='0'; LoadTemp_0<='0';
			RstTemp_1<='0';
			if (LoadData='1') then
				LoadTemp_1<='1';
				NxtState<= S_Load;
			else
				LoadTemp_1<='1';				
				NxtState<= S_Write_1;
			end if;
		when S_Load =>
			ClearToSendData<= not FIFO_full;
			LoadTemp_1<='0';
			if (LoadData='1') then -- LoadData can only be one if FIFO is not full
				Write_En<='1'; 
				LoadTemp_0<='1';
				if LastPositionInRow='1' then
					RstTemp_1<='1';
					NxtState<= S_Load;
				else
					RstTemp_1<='0';
					NxtState<= S_Write_1;
				end if;
			elsif (FIFO_full='1') then -- Meaning new data has not been loaded but FIFO is full
				Write_En<='0';
				LoadTemp_0<='0';
				RstTemp_1<='0';
				NxtState<= S_Load;
			else
				Write_En<='1';
				LoadTemp_0<='0';
				RstTemp_1<='0';
				NxtState<= S_Write_0;
			end if;
	end case;
end process NxtAndOutputProc;
--#End	--Write FSM

--#Begin 	--Read FSM
ReadPrStateProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			PrState_Read <= S_Rst;
		else
			PrState_Read <= NxtState_Read;
		end if;
	end if;
end process ReadPrStateProc;
ReadNxtAndOutputProc : process (PrState_Read, AckFromBank, FIFO_Empty)
begin
	case PrState_Read is 
		when S_Rst =>
			Read_En<='0';
			if (FIFO_Empty='0') then
				RqstToBank<='1';
				NxtState_Read<= S_RqstBank;
			else
				NxtState_Read<= S_Rst;
				RqstToBank<='0';
			end if;
		when S_RqstBank =>
			if (AckFromBank='1') then
				Read_En<='1';
				NxtState_Read<= S_WaitForNewData;
				RqstToBank<='0';
			else
				Read_En<='0';				
				NxtState_Read<= S_RqstBank;				
				RqstToBank<='1';
			end if;
		when S_WaitForNewData =>
			Read_En<='0';
			if (FIFO_Empty='0') then
				RqstToBank<='1';
				NxtState_Read<= S_RqstBank;
			else
				NxtState_Read<= S_WaitForNewData;
				RqstToBank<='0';
			end if;
	end case;
end process ReadNxtAndOutputProc;	
--#End	 	--Read FSM

-- # Flags
LoadData<= LoadData_FromMaster and (not FIFO_full) and ClearToSend_OfDDR;
-- # Flags

--#Begin -- Intermediate FFs
TempWordAndIdx_0_Proc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			DataTempWord_0<= (others => std_logic_vector(to_signed(0,C_DataBitWidth)));
			IdxTempWord_0<= (others => std_logic_vector(to_signed(0,2)));
		elsif (LoadTemp_0='1') then
			DataTempWord_0<= MACOutput_GrpOf8Words;
			IdxTempWord_0<= MACOutputIdx_GrpOf8Words;
		end if;
	end if;
end process TempWordAndIdx_0_Proc;
TempWordAndIdx_1_Proc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or RstTemp_1='1' then
			DataTempWord_1<= (others => std_logic_vector(to_signed(0,C_DataBitWidth)));
			IdxTempWord_1<= (others => std_logic_vector(to_signed(0,2)));
		elsif (LoadTemp_1='1') then
			DataTempWord_1<= MACOutput_GrpOf8Words;
			IdxTempWord_1<= MACOutputIdx_GrpOf8Words;
		end if;
	end if;
end process TempWordAndIdx_1_Proc;
TempAddr_Proc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			AddrTempWord<= std_logic_vector(to_signed(0,C_ConvEngineDataBank_AddrLength));
		elsif (LoadTemp_0='1') then
			AddrTempWord<= WriteBankAddr;
		end if;
	end if;
end process TempAddr_Proc;
--#End	 -- Intermediate FFs

--#Begin -- Port Mapping and Vector Translation
FIFO_Data: fifo_generator_Width320_Depth16_DistRAM
	port map(
		clk   => clk,
		din   => FIFO_DataIn_Vector,
		wr_en => Write_En,
		rd_en => Read_En,
		dout  => FIFO_DataOut_Vector,
		full  => FIFO_full,
		empty => FIFO_Empty
	);
FIFO_Addr: fifo_generator_Width16_Depth16_DistRAM
	port map(
		clk   => clk,
		din   => FIFO_AddrIn_Vector,
		wr_en => Write_En,
		rd_en => Read_En,
		dout  => FIFO_AddrOut_Vector,
		full  => open,
		empty => open
	);
	--#Begin --VectorConversion 
FIFOVectConvertProc : process (FIFO_DataOut_Vector, FIFO_DataIn, FIFO_IdxIn)
begin
	-- Input
	for i in 0 to 287 loop
		FIFO_DataIn_Vector(i)<= FIFO_DataIn(i/18)(i mod 18);
	end loop;	
	for i in 288 to 319 loop
		FIFO_DataIn_Vector(i)<= FIFO_IdxIn((i-288)/2)((i-288) mod 2);
	end loop;
	-- Output
	for i in 0 to 15 loop
		FIFO_DataOut(i)<= FIFO_DataOut_Vector(18*(i+1)-1 downto 18*i);
		FIFO_IdxOut(i)<= FIFO_DataOut_Vector(288+2*(i+1)-1 downto 288+2*i);
	end loop;
end process FIFOVectConvertProc;
	--#End	 --VectorConversion 
	--#Begin --FIFO Data-In
FIFO_InProc : process (DataTempWord_0, DataTempWord_1, IdxTempWord_0, IdxTempWord_1)
begin
	for i in 0 to 7 loop
		FIFO_DataIn(i)<= DataTempWord_0(i);
		FIFO_IdxIn(i)<= IdxTempWord_0(i);
	end loop;
	for i in 8 to 15 loop
		FIFO_DataIn(i)<= DataTempWord_1(i-8);
		FIFO_IdxIn(i)<= IdxTempWord_1(i-8);
	end loop;
end process FIFO_InProc;
	--#End	 --FIFO Data-In
	--#Begin --FIFO Addr-In
FIFOAddrInProc : process (AddrTempWord, FIFO_AddrOut_Vector)
begin
	for i in 0 to 15 loop
		if (i<C_ConvEngineDataBank_AddrLength) then
			FIFO_AddrIn_Vector(i) <= AddrTempWord(i); 
		else
			FIFO_AddrIn_Vector(i) <= '0';
		end if;	
	end loop;
	for i in 0 to C_ConvEngineDataBank_AddrLength-1 loop
		FIFO_AddrOut(i)<= FIFO_AddrOut_Vector(i);
	end loop;
end process FIFOAddrInProc;
	--#End	 --FIFO Addr-In
--#End	 -- Port Mapping

--#Begin -- Outputs
DataOut<= FIFO_DataOut;
IdxOut<= FIFO_IdxOut;
Addr<= FIFO_AddrOut;
--#End	 -- Outputs

ClearToSendData_ToMaster<= ClearToSendData or (not LoadData_FromMaster);
end Behavioral;
