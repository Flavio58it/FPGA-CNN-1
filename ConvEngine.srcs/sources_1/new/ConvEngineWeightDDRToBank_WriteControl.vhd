----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.03.2016 11:07:43
-- Design Name: 
-- Module Name: ConvEngineWeightDDRToBank_WriteControl - Behavioral
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

entity ConvEngineWeightDDRToBank_WriteControl is
   Port (clk,rst: in std_logic;
   		--- Contol I/O with master
		Write_Rqst: in std_logic;
   		DoneWriting: out std_logic;		
		-- Contorl and ADDR to FIFO
   		FIFO_WriteAddr: out std_logic_vector(7 DOWNTO 0);
		FIFO_Write_EN: out std_logic;
		--Data To FIFO--
		DataToFIFO: out SingleSetOf8Words_t;
		-- Input From Master Control
		LayerIdx: in LayerIdx_st;
		Set_Done: in std_logic;
		Last_Set: in std_logic;
		Set_Idx: in KernelIdx_st;
		NumberOfSimultaneousKernel: in NumberOfSimultaneousKernel_t;
		NumberOfSimultaneousKernel_InLastSet: in NumberOfSimultaneousKernel_t;
		-- Output to DDR controller
		DDR_LayerIdx_Rqst: out LayerIdx_st;
		DDR_KernelIdx_Rqst: out KernelIdx_st;
		DDR_GroupOf24Idx_Rqst: out KernelSize_InMultipleOf24Weights_t;
		RqstToDDR: out std_logic;
		-- Input control from DDR controller
		AckFromDDR: in std_logic;
		-- Data from DDR
		DataFromDDR: in DDR_DataOut_t 
   );
end ConvEngineWeightDDRToBank_WriteControl;

architecture Behavioral of ConvEngineWeightDDRToBank_WriteControl is

type ThreeSetOf8Words_t is array (0 to 2) of SingleSetOf8Words_t;
type StateType_t is (S_Rst, S_SendRqst, S_WriteInFIFO_0,S_WriteInFIFO_1,S_WriteInFIFO_2, S_WaitForNextRqst, S_WaitForNextRqst_Dummy);

--#Begin --Signal
signal FIFO_AddrTagBasedOnKernelIdx: NumberOfSimultaneousKernel_t;
signal FIFO_WritePtr: std_logic_vector(2 downto 0);
signal FIFO_AddrTag_Rst, FIFO_AddrTag_Increament: std_logic;
signal FIFO_WritePtr_Rst, FIFO_WritePtr_Increament: std_logic;
	-- from DRAM To FIFO
signal ThreeSetOf8Words: ThreeSetOf8Words_t;
signal ThreeSetOf8Words_Shift, ThreeSetOf8Words_Load: std_logic;
signal GroupIdx: KernelSize_InMultipleOf24Weights_t;
signal GroupIdx_Rst, GroupIdx_Increament: std_logic;
	-- FSM
signal PrState,NxtState: StateType_t;
signal SubSet_Done: std_logic;
--#End	 --Signal

begin

DataToFIFO <= ThreeSetOf8Words(0);
SubSet_Done<= '1' when (Last_Set='0' and FIFO_AddrTagBasedOnKernelIdx = std_logic_vector(unsigned(NumberOfSimultaneousKernel)-1)) else
			  '1' when (Last_Set='1' and FIFO_AddrTagBasedOnKernelIdx = std_logic_vector(unsigned(NumberOfSimultaneousKernel_InLastSet)-1)) else
			  '0';
DDR_LayerIdx_Rqst <= LayerIdx;
DDR_KernelIdx_Rqst <= std_logic_vector(resize(((unsigned(Set_Idx) * unsigned(NumberOfSimultaneousKernel)) + unsigned(FIFO_AddrTagBasedOnKernelIdx)), len(MaxKernelsInALayer-1)));--(len(MaxKernelsInALayer-1)-1);
DDR_GroupOf24Idx_Rqst <= GroupIdx;

--#Begin --FSM
PRStateProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			PrState<= S_Rst;
		else
			PrState<= NxtState;
		end if;
	end if;
end process PRStateProc;
NxtAndOOuputPorc : process (PrState, AckFromDDR, Write_Rqst, SubSet_Done, FIFO_AddrTagBasedOnKernelIdx, FIFO_WritePtr, GroupIdx, GroupIdx(0))
begin
	case PrState is 
		when S_Rst =>
			FIFO_WriteAddr <= FIFO_AddrTagBasedOnKernelIdx & FIFO_WritePtr;
			FIFO_WritePtr_Rst<= '1'; FIFO_WritePtr_Increament<= '0';
			GroupIdx_Rst<='1'; GroupIdx_Increament<='0';
			FIFO_AddrTag_Rst<='1'; FIFO_AddrTag_Increament<='0';
			FIFO_Write_EN<= '0';
			ThreeSetOf8Words_Load<='0';
			ThreeSetOf8Words_Shift<='0';
			DoneWriting<='1';
			
			if(Write_Rqst='1') then
				NxtState<= S_SendRqst;
				RqstToDDR<= '1';
			else
				RqstToDDR<= '0';
				NxtState<= S_Rst;
			end if;

		when S_SendRqst =>
			FIFO_WriteAddr <= FIFO_AddrTagBasedOnKernelIdx & FIFO_WritePtr;
			FIFO_WritePtr_Rst<= '0'; FIFO_WritePtr_Increament<= '0';
			GroupIdx_Rst<='0'; GroupIdx_Increament<='0';
			FIFO_AddrTag_Rst<='0'; FIFO_AddrTag_Increament<='0';
			FIFO_Write_EN<= '0';
			ThreeSetOf8Words_Shift<='0';
			DoneWriting<='0';
			if(AckFromDDR='1') then	--Waiting for data from DDR
				NxtState<= S_WriteInFIFO_0;
				RqstToDDR<= '0';
				ThreeSetOf8Words_Load<='1';
			else
				ThreeSetOf8Words_Load<='0';
				RqstToDDR<= '1';	-- Keep the rqst high until DDR accepts it
				NxtState<= S_SendRqst;
			end if;
		
		
		when S_WriteInFIFO_0 =>
			FIFO_WriteAddr <= FIFO_AddrTagBasedOnKernelIdx & FIFO_WritePtr;
			FIFO_WritePtr_Rst<= '0'; FIFO_WritePtr_Increament<= '0';
			GroupIdx_Rst<='0'; GroupIdx_Increament<='0';
			FIFO_AddrTag_Rst<='0'; FIFO_AddrTag_Increament<='0';
			FIFO_Write_EN<= '1';
			ThreeSetOf8Words_Load<='0';
			ThreeSetOf8Words_Shift<='1';
			DoneWriting<='0';
			RqstToDDR<= '0';
			NxtState <= S_WriteInFIFO_1;

		when S_WriteInFIFO_1 =>
			FIFO_WriteAddr <= FIFO_AddrTagBasedOnKernelIdx & std_logic_vector(unsigned(FIFO_WritePtr) +1);
			FIFO_WritePtr_Rst<= '0'; FIFO_WritePtr_Increament<= '0';
			GroupIdx_Rst<='0'; GroupIdx_Increament<='0';
			FIFO_AddrTag_Rst<='0'; FIFO_AddrTag_Increament<='0';
			FIFO_Write_EN<= '1';
			ThreeSetOf8Words_Load<='0';
			ThreeSetOf8Words_Shift<='1';
			DoneWriting<='0';
			RqstToDDR<= '0';
			NxtState <= S_WriteInFIFO_2;

		when S_WriteInFIFO_2 =>
			FIFO_WriteAddr <= FIFO_AddrTagBasedOnKernelIdx & std_logic_vector(unsigned(FIFO_WritePtr) +2);
			FIFO_WritePtr_Rst<= '0'; 	-- Write Ptr finally points to an empty location, where data has to be put in next cycle
			GroupIdx_Rst<='0'; 
			FIFO_AddrTag_Rst<='0'; FIFO_AddrTag_Increament<='0';
			
			FIFO_Write_EN<= '1';
			ThreeSetOf8Words_Load<='0';
			ThreeSetOf8Words_Shift<='0';
			DoneWriting<='0';
			RqstToDDR<= '0';
			if(SubSet_Done='1') then
				FIFO_AddrTag_Rst<='1';
				FIFO_AddrTag_Increament<='0';
				FIFO_WritePtr_Increament<= '1';
				GroupIdx_Increament<='1';
			else			
				FIFO_AddrTag_Rst<='0';
				FIFO_AddrTag_Increament<='1';
				FIFO_WritePtr_Increament<= '0';
				GroupIdx_Increament<='0';
			end if;
			if(GroupIdx(0)='0' and (GroupIdx /= std_logic_vector(to_unsigned(0,len(MaxKernelSize/24-1))))) then
				NxtState <= S_WaitForNextRqst_Dummy;
			else
				NxtState <= S_WaitForNextRqst;
			end if;
		when S_WaitForNextRqst =>
			FIFO_WriteAddr <= FIFO_AddrTagBasedOnKernelIdx & FIFO_WritePtr;
			FIFO_WritePtr_Rst<= '0'; FIFO_WritePtr_Increament<= '0';	
			GroupIdx_Rst<='0'; GroupIdx_Increament<='0';
			FIFO_AddrTag_Rst<='0';
			FIFO_AddrTag_Increament<='0';
			FIFO_Write_EN<= '0';
			ThreeSetOf8Words_Load<='0';
			ThreeSetOf8Words_Shift<='0';
			DoneWriting<='1';
			RqstToDDR<= '0';			
			if (Write_Rqst='1')then
				NxtState <= S_SendRqst;				
			else
				NxtState <= S_WaitForNextRqst;
			end if;
		when S_WaitForNextRqst_Dummy => -- Don't write every third group Idx
			FIFO_WriteAddr <= FIFO_AddrTagBasedOnKernelIdx & FIFO_WritePtr;
			FIFO_WritePtr_Rst<= '0'; FIFO_WritePtr_Increament<= '0';	
			GroupIdx_Rst<='0'; GroupIdx_Increament<='0';
			FIFO_AddrTag_Rst<='0';
			FIFO_AddrTag_Increament<='0';
			FIFO_Write_EN<= '0';
			ThreeSetOf8Words_Load<='0';
			ThreeSetOf8Words_Shift<='0';
			DoneWriting<='1';
			RqstToDDR<= '0';			
			if (Write_Rqst='1')then
			-- Stay in this state for cycles= Number of simultaneous kernels, use a counter for that
				NxtState <= S_WaitForNextRqst;				
			else
				NxtState <= S_WaitForNextRqst_Dummy;
			end if;
	end case;
end process NxtAndOOuputPorc;
--#End	 --FSM

--#Begins --Three Sets of 16 Words
ThreeSets : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			for i in 0 to 2 loop
				ThreeSetOf8Words(i)<= (others => std_logic_vector(to_unsigned(0,18)));
			end loop;
		elsif (ThreeSetOf8Words_Load='1') then
			for i in 0 to 2 loop
				for j in 0 to 7 loop
					ThreeSetOf8Words(i)(j)<= DataFromDDR(i*8+j);
				end loop;
			end loop;
		elsif (ThreeSetOf8Words_Shift='1') then	
			ThreeSetOf8Words(0) <= ThreeSetOf8Words(1);
			ThreeSetOf8Words(1) <= ThreeSetOf8Words(2);
		end if;
	end if;
end process ThreeSets;
--#Ends --Three Sets of 16 Words

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
		if rst = '1' and FIFO_WritePtr_Rst='1' then
			FIFO_WritePtr<= (others=>'0');
		elsif (FIFO_WritePtr_Increament='1')then
			FIFO_WritePtr<= std_logic_vector(unsigned(FIFO_WritePtr)+3);
		end if;
	end if;
end process WritePtrProc;
--#Ends   --FIFO Addr TAg and Offset

--#Begin --Kernel Offset and Grp Idx
GrpIdxProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or GroupIdx_Rst='1' or Set_Done='1' then
			GroupIdx<= (others=>'0');
		elsif (GroupIdx_Increament='1') then
			GroupIdx <= std_logic_vector(unsigned( GroupIdx) +1);
		end if;
	end if;
end process GrpIdxProc;


--#End   --Kernel Offset and Grp Idx

end Behavioral;
