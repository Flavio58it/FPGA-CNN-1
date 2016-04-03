----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.02.2016 22:47:46
-- Design Name: 
-- Module Name: ConvEngineWeightBank_ReadControl_Level1 - Behavioral
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

entity ConvEngineWeightBank_ReadControl_Level1 is -- Contains address translation 
	Port ( clk,rst: in std_logic;
			-- Interface with ConvEngine control Block
			LayerIdx: in LayerIdx_st;
			KernelIdx: in ConvEngineWeightBankReadAddr_t;
			ChannelIdx: in ChannelIdx_st;
			PixelGroupIdx: in PixelGroupIdx_st; -- Group size depends on Output width of Bank 
			RqstFromConvEngine: in std_logic;
			AckToConvEngine: out std_logic;
			--
			-- Tags To Compare
			Tag1: in ConvEngineWeightBank_Tag_st;
			Tag2: in ConvEngineWeightBank_Tag_st;
			Tag3: in ConvEngineWeightBank_Tag_st;
			Tag1Valid: in std_logic;
			Tag2Valid: in std_logic;
			Tag3Valid: in std_logic;
			Tag1Range_Start: in ConvEngineWeightBankReadAddr_t; -- 
			Tag1Range_End: in ConvEngineWeightBankReadAddr_t; -- 
			Tag2Range_Start: in ConvEngineWeightBankReadAddr_t; -- 
			Tag2Range_End: in ConvEngineWeightBankReadAddr_t; -- 
			Tag3Range_Start: in ConvEngineWeightBankReadAddr_t; -- It can cover entire Weight bank
			Tag3Range_End: in ConvEngineWeightBankReadAddr_t; -- It can cover entire Weight bank
			-- Interface with NetworkStructure
			AckFromNetworkStructure: in std_logic;
			LayerBasePtr: in GlobalAddress_st;
			KernelSize: in KernelSize_st;
			ChannelSize: in ChannelSize_st;
			-- Output to weight banks
			ConvEngineWeightBank_ReadAddr: out ConvEngineWeightBank_OutputAddr_st;
			ConvEngine_ReadEnable: out std_logic;
			Tag_Requested_1: out ConvEngineWeightBank_Tag_st
	);
end ConvEngineWeightBank_ReadControl_Level1;

architecture Behavioral of ConvEngineWeightBank_ReadControl_Level1 is
--#Begin --Types
type LayerIdxFSM_StateType is (S_Rst, S_NoMismatch,S_SendRqst, S_TryToAccessWord, S_WordNotInBank);
--#End   --Types

--#Begin --Signals 
	--signals for FSM
signal LayerIdxFSM_PrState,LayerIdxFSM_NxtState: LayerIdxFSM_StateType; 
signal LayerIdxConflictResolved, RqstToNetworkStructure_FSM, LoadSizesAndLayerBasePtr :std_logic;
signal RqstIdxToNetworkStructure_FSM: LayerIdx_st;
constant FSMCounterStages : integer := 8;
signal FSMCounter: std_logic_vector(len(FSMCounterStages-1)-1 downto 0); 
signal FSMCounter_Rst,FSMCounter_Run:std_logic;
	--signals of datapath
signal CompulsoryUpdateOfInitialLayerSizes_Flag:std_logic;
signal LayerIdx_Stored,LayerIdx_Requested : LayerIdx_st;
signal LayerBasePointer_Stored: GlobalAddress_st; 
signal KernelSize_Stored: KernelSize_st;
signal ChannelSize_Stored: ChannelSize_st;

signal KernelProduct:ConvEngineKernelProduct_st;
signal ChannelProduct: ConvEngineChannelProduct_st;
signal TranslatedAddress:GlobalAddress_st;
signal Tag_Requested: ConvEngineWeightBank_Tag_st;
signal WordAddress_Requested: ConvEngineWeightBank_OutputAddr_st;

signal Tag_1: ConvEngineWeightBank_Tag_st;
signal Tag_1_begin: ConvEngineWeightBank_OutputAddr_st;
signal Tag_1_End: ConvEngineWeightBank_OutputAddr_st;
signal Tag_2: ConvEngineWeightBank_Tag_st;
signal Tag_2_begin: ConvEngineWeightBank_OutputAddr_st;
signal Tag_2_End: ConvEngineWeightBank_OutputAddr_st;
signal Tag_3: ConvEngineWeightBank_Tag_st;
signal Tag_3_begin: ConvEngineWeightBank_OutputAddr_st;
signal Tag_3_End: ConvEngineWeightBank_OutputAddr_st;
signal Tag_Match,Range_Match,TagAndRange_Match: std_logic;

--#End   --Signals

begin

--#Begin --FSM
LayerIdxFSM_FF : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			LayerIdxFSM_PrState <= S_Rst;
		else
			LayerIdxFSM_PrState <= LayerIdxFSM_NxtState;
		end if;
	end if;
end process LayerIdxFSM_FF;

LayerIdxFSM : process (LayerIdxFSM_PrState,AckFromNetworkStructure,LayerIdx_Stored,LayerIdx_Requested)
begin
	case LayerIdxFSM_PrState is 
		when S_Rst => 
			LayerIdxConflictResolved <= '0'; RqstToNetworkStructure_FSM<='1';
			RqstIdxToNetworkStructure_FSM<= (others => '0'); --Always request details of Zeroeth Layer
			LoadSizesAndLayerBasePtr<= AckFromNetworkStructure;
			FSMCounter_Rst<='1'; FSMCounter_Run<= '0';
			AckToConvEngine<= '0';
			if(AckFromNetworkStructure='0') then
				LayerIdxFSM_NxtState<= S_Rst; --LoopBack
			else
				LayerIdxFSM_NxtState<= S_NoMismatch;
			end if; 
		when S_NoMismatch => -- Check if Layer information is already available
			LayerIdxConflictResolved <= '1'; RqstToNetworkStructure_FSM<='0';
			RqstIdxToNetworkStructure_FSM<= LayerIdx_Requested; 
			LoadSizesAndLayerBasePtr<= '0';
			FSMCounter_Rst<='0'; 
			AckToConvEngine<= '0';
			if ((RqstFromConvEngine='1') and (LayerIdx_Requested=LayerIdx_Stored) ) then -- NoMisMatch and Rqst recieved
				LayerIdxFSM_NxtState<= S_TryToAccessWord;
				FSMCounter_Run<= '1';
			elsif ((RqstFromConvEngine='1') and (LayerIdx_Requested/=LayerIdx_Stored) ) then --Rqst recieved but LayerIdxMismatch
				LayerIdxFSM_NxtState <= S_SendRqst;
				FSMCounter_Run<= '0';
			else
				LayerIdxFSM_NxtState <= S_NoMismatch;
				FSMCounter_Run<= '0';
			end if; 
		when S_SendRqst =>	-- Send Request to know size of Layer, Kernel, etc.
			LayerIdxConflictResolved <= '0'; RqstToNetworkStructure_FSM<='1';
			RqstIdxToNetworkStructure_FSM<= LayerIdx_Requested; 
			LoadSizesAndLayerBasePtr<= AckFromNetworkStructure;
			FSMCounter_Rst<='0'; FSMCounter_Run<= '0';
			AckToConvEngine<= '0';
			if(AckFromNetworkStructure='0') then
				LayerIdxFSM_NxtState<= S_SendRqst; --LoopBack
			else
				LayerIdxFSM_NxtState<= S_NoMismatch;
			end if; 	
		when S_TryToAccessWord=> -- Access Word
			LayerIdxConflictResolved <= '1'; RqstToNetworkStructure_FSM<='0';
			RqstIdxToNetworkStructure_FSM<= LayerIdx_Requested; 
			LoadSizesAndLayerBasePtr<= '0';
			FSMCounter_Rst<='0'; FSMCounter_Run<= '1';
			if(FSMCounter=std_logic_vector(unsigned(2)) and TagAndRange_Match='0') then
				LayerIdxFSM_NxtState<= S_WordNotInBank;
				FSMCounter_Rst<='1';
				AckToConvEngine<= '0';
			elsif (FSMCounter=std_logic_vector(unsigned(5))) then --Wait for BRAM Latency
				LayerIdxFSM_NxtState<= S_NoMismatch;
				FSMCounter_Rst<='1';
				AckToConvEngine<= '1';
			else
				LayerIdxFSM_NxtState<= S_TryToAccessWord;
				FSMCounter_Rst<='0';
				AckToConvEngine<= '0';
			end if;
				
--		when S_AckRecieved =>	-- Not used
--			LayerIdxConflictResolved <= '0'; RqstToNetworkStructure_FSM<='0';
--			RqstIdxToNetworkStructure_FSM<= LayerIdx_Requested; --Always request details of Zeroeth Layer
--			LoadSizesAndLayerBasePtr<= '1';
--			LayerIdxFSM_NxtState <= S_NoMismatch;
		when others=>
			LayerIdxConflictResolved <= '0'; RqstToNetworkStructure_FSM<='1';
			RqstIdxToNetworkStructure_FSM<= (others => '0'); --Always request details of Zeroeth Layer
			LoadSizesAndLayerBasePtr<= AckFromNetworkStructure;
			FSMCounter_Rst<='1'; FSMCounter_Run<= '0';
			LayerIdxFSM_NxtState<= S_Rst;
	end case;	
end process LayerIdxFSM;
FSMCounter_Proc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' or FSMCounter_Rst='1' then
			FSMCounter<= (others=>'0');
		elsif FSMCounter_Run ='1' then
			FSMCounter <= std_logic_vector(unsigned(FSMCounter) +1);			
		end if;
	end if;
end process FSMCounter_Proc;
--#End   --FSM

--#Begin	--Registers to store base_ptr and sizes
SizesAndBasePtr : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			LayerBasePointer_Stored<= (others => '0');
			KernelSize_Stored <= (others => '0');
			ChannelSize_Stored <= (others => '0');
		elsif (LoadSizesAndLayerBasePtr='1') then
			LayerBasePointer_Stored <= LayerBasePtr;
			KernelSize_Stored<= KernelSize;
			ChannelSize_Stored<= ChannelSize;			
		end if;
	end if;
end process SizesAndBasePtr;
--#End		--Registers to store base_ptr and sizes

--#Begin	--Address Translation
AddressTranslation : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			TranslatedAddress <= (others => '0');
		else
			--Addr<= BasePtr+ KernelIdx*KernelSize + ChannelIdx*ChanSize + PixelGrpIdx
			TranslatedAddress <= std_logic_vector(unsigned(LayerBasePointer_Stored) + unsigned(KernelProduct) + 
								 unsigned(ChannelProduct) + unsigned(PixelGroupIdx) );														
		end if;
	end if;
end process AddressTranslation;
KernelProduct_proc : process (clk) is -- Pipelining is requied to seperate Mult and Addition opertation to meet timing
begin
	if rising_edge(clk) then
		if rst = '1' then
			KernelProduct <= (others => '0');
			ChannelProduct<= (others=>'0');
		else
			KernelProduct <= std_logic_vector(unsigned(KernelIdx) * unsigned(KernelSize_Stored));
			ChannelProduct<= std_logic_vector(unsigned(ChannelIdx)*unsigned(ChannelSize_Stored));
		end if;
	end if;
end process KernelProduct_proc;

--#End	--Address Translation

--#Begin	--BreakUp of address
Tag_Requested<= TranslatedAddress( (C_AllowedAddressLength-1) downto C_ConvEngineWeightBank_ReadAddrLength);
Tag_Requested_1<= Tag_Requested;
WordAddress_Requested<= TranslatedAddress(C_ConvEngineWeightBank_ReadAddrLength-1 downto 0);
ConvEngineWeightBank_ReadAddr <= TranslatedAddress(C_ConvEngineWeightBank_ReadAddrLength-1 downto 0);
--#End		--BreakUp of address

--#Begin	--Tag and Range Check
Tag_Match<= '1' when (Tag_Requested=Tag_1 or Tag_Requested=Tag_2 or Tag_Requested=Tag_3) else
		 	'0';
Range_Match<= '1' when ( (WordAddress_Requested>=Tag_1_begin and WordAddress_Requested<=Tag_1_End) or
						 (WordAddress_Requested>=Tag_2_begin and WordAddress_Requested<=Tag_2_End) or
						 (WordAddress_Requested>=Tag_3_begin and WordAddress_Requested<=Tag_3_End) ) else
			  '0';	
TagAndRange_Match<= Tag_Match and Range_Match;	 	
--#End	    --Tag and Range Check
end Behavioral;
