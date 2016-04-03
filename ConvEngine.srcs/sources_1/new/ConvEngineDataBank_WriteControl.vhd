----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.03.2016 14:42:01
-- Design Name: 
-- Module Name: ConvEngineDataBank_WriteControl - Behavioral
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
--#End  --Components
--#Begin --Type
--#End	 --Type
--#Begin --Signals
--#End	 --Signals

entity ConvEngineDataBank_WriteControl is
  	Port ( clk, rst: in std_logic; 
			-- Control To/From Main Control
			WriteNxtLayer: in std_logic;
			DoneWritinglayer: out std_logic;

			-- Network Details
				-- HandShake
			Rqst_ToNetworkArchitectureBank: out std_logic;
			Ack_FromNetworkArchitectureBank: in std_logic;
			LayerIdxToNetworkArchitectureBank: out LayerIdx_st;
				-- General
			LayerBase_unfloped: in ConvEngineDataBankAddr_t;
			NoNeedToTalkToDDR_unfloped: in std_logic;
			InitialLocalWriteAddr_unfloped: in ConvEngineDataBankAddr_t;			
			TotalFeaturesInLayer_unfloped: in DataFeatureIdx_st;
			TotalNumberOfRowsInAFeature_SizeInTermsOf16Words_unfloped: in DataFeatureRowIdx_st; -- Where row Size is in terms of 16 words. If actual row size is of 8 words, then row Size Should be halved
			FeatureRowSize_unfloped: in FeatureRowSize_t; -- In terms of Eight Words
			FeatureLayerFitsInDataBank_unfloped: in std_logic;
				-- For DDR Unit
			StartingFeatureIdx_ForDDRUnit_unfloped: in DataFeatureIdx_st;
			StartGrpBase_ForDDRUnit_unfloped: in DataFeatureSize_InMultipleOf24Words_t;
			StartingGrpOffset_ForDDRUnit_unfloped: in DataFeatureSize_InMultipleOf24Words_t; -- We have to make sure 16-word and 24-Word boundary meets here 
			StartRowIdx_ForDDRUnit_unfloped: in DataFeatureRowIdx_st;
			StartingPositionInRow_ForDDRUnit_unfloped: in FeatureRowSize_t; -- In terms of 8 words, but must be alligned to 16-word boundary

			-- Network Details Output to slaves
				--To DDR Unit
			CurrLayerIdx_ForDDRUnit: out LayerIdx_st;
			TotalFeaturesInLayer_ForDDRUnit: out DataFeatureIdx_st;
			TotalNumberOfRowsInAFeature_SizeInTermsOf16Words_ForDDRUnit: out DataFeatureRowIdx_st; -- Where row Size is in terms of 16 words. If actual row size is of 8 words, then row Size Should be halved
			FeatureRowSize_ForDDRUnit: out FeatureRowSize_t; -- In terms of Eight Words
			StartingFeatureIdx_ForDDRUnit: out DataFeatureIdx_st;
			StartGrpBase_ForDDRUnit: out DataFeatureSize_InMultipleOf24Words_t;
			StartingGrpOffset_ForDDRUnit: out DataFeatureSize_InMultipleOf24Words_t; -- We have to make sure 16-word and 24-Word boundary meets here 
			StartRowIdx_ForDDRUnit: out DataFeatureRowIdx_st;
			StartingPositionInRow_ForDDRUnit: out FeatureRowSize_t; -- In terms of 8 words, but must be alligned to 16-word boundary
				-- TO MAC unit

			-- Signals TO Bank
  				-- Data/Idx To Data Bank
  			DataToBank: out ConvEngineDataBank_DataPort_t; 
	  		IdxToBank: out ConvEngineDataBank_IdxPort_t;
				-- Addr to bank
			WriteAddr: out ConvEngineDataBankAddr_t;
				--Write Enable
			Write_En: out std_logic;
  		
			-- HandShaking Signals from Read Unit
			BaseReadAddr:in ConvEngineDataBankAddr_t;
			CurrWriteAddr: out ConvEngineDataBankAddr_t;
			DoneWritingFiveWords: out std_logic;

			-- Signals To/From DDRToBank unit
				--HandShaking
			RqstToLoadLayerToDDRUnit: out std_logic;
			LayerDoneFromDDRUnit: in std_logic;
			RqstFromDDRUnit: in std_logic;
		   	AckToDDRUnit: out std_logic;			
				-- Data			
			DataFromDDRUnit: in ConvEngineDataBank_DataPort_t; 
			IdxFromDDRUnit: in ConvEngineDataBank_IdxPort_t;

			-- Signals To/From MACOutput Unit
				--HandShaking
			RqstFromMACOutput: in std_logic;			
			AckToMACOutput: out std_logic;
				-- Data And Addr
			DataFromMACOutput: in ConvEngineDataBank_DataPort_t; 
			IdxFromMACOutput: in ConvEngineDataBank_IdxPort_t;
			AddrFromMACOutput: in ConvEngineDataBankAddr_t;
  	);
end ConvEngineDataBank_WriteControl;

architecture Behavioral of ConvEngineDataBank_WriteControl is
--#Begin --Component
--#End  --Components
--#Begin --Type
type StateType_t is (S_Rst);
--#End	 --Type

--#Begin --Signals
	-- Network Details
signal LoadNetworkDetails: std_logic;
signal LayerBase_floped: ConvEngineDataBankAddr_t;
signal NoNeedToTalkToDDR_floped: std_logic;
signal InitialLocalWriteAddr_floped: ConvEngineDataBankAddr_t;
signal TotalFeaturesInLayer_floped:  DataFeatureIdx_st;
signal TotalNumberOfRowsInAFeature_SizeInTermsOf16Words_floped:  DataFeatureRowIdx_st; -- Where row Size is in terms of 16 words. If actual row size is of 8 words, then row Size Should be halved
signal FeatureRowSize_floped:  FeatureRowSize_t; -- In terms of Eight Words
signal FeatureLayerFitsInDataBank_floped: std_logic;
signal StartingFeatureIdx_ForDDRUnit_floped:  DataFeatureIdx_st;
signal StartGrpBase_ForDDRUnit_floped:  DataFeatureSize_InMultipleOf24Words_t;
signal StartingGrpOffset_ForDDRUnit_floped:  DataFeatureSize_InMultipleOf24Words_t; -- We have to make sure 16-word and 24-Word boundary meets here 
signal StartRowIdx_ForDDRUnit_floped:  DataFeatureRowIdx_st;
signal StartingPositionInRow_ForDDRUnit_floped:  FeatureRowSize_t;
	-- Signals
signal LocalWriteAddr, CurrOffset: ConvEngineDataBankAddr_t;
	--FSM
signal PrState, NxtState: StateType_t;
	-- Flags
signal Sel_BetweenDDRAndMAC: std_logic;
--#End	 --Signals
begin

------------------------------------------------#begin -- Main FSM
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

NxtAndOutputProc : process (PrState)
begin
	case PrState is 
		when S_Rst =>
			null;
	end case;
end process NxtAndOutputProc;
--#End	--FSM

--#Begin 	--Addr and Flags
LocalWriteAddr<= std_logic_vector(unsigned(LayerBase_floped)+ 
			unsigned(InitialLocalWriteAddr_floped)+ unsigned(CurrOffset));
--#End	 	--Addr and Flags

--#Begin 	--Network Details
NetworkDetailProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			LayerBase_floped <= (others => '0');
			NoNeedToTalkToDDR_floped<= '0';
			InitialLocalWriteAddr_floped<= (others  => '0');
			TotalFeaturesInLayer_floped<= (others => '0');
 			TotalNumberOfRowsInAFeature_SizeInTermsOf16Words_floped<= (others => '0');
 			FeatureRowSize_floped<= (others => '0');
			FeatureLayerFitsInDataBank_floped<= '0';
			StartingFeatureIdx_ForDDRUnit_floped<= (others => '0');
 			StartGrpBase_ForDDRUnit_floped<= (others => '0');
 			StartingGrpOffset_ForDDRUnit_floped <= (others => '0');
 			StartRowIdx_ForDDRUnit_floped<= (others => '0');
 			StartingPositionInRow_ForDDRUnit_floped<= (others => '0');
		elsif LoadNetworkDetails='1' then
			LayerBase_floped<= LayerBase_unfloped;
			NoNeedToTalkToDDR_floped<= NoNeedToTalkToDDR_unfloped;
			InitialLocalWriteAddr_floped<= InitialLocalWriteAddr_unfloped;
			TotalFeaturesInLayer_floped<= TotalFeaturesInLayer_unfloped;
 			TotalNumberOfRowsInAFeature_SizeInTermsOf16Words_floped<= TotalNumberOfRowsInAFeature_SizeInTermsOf16Words_unfloped;
 			FeatureRowSize_floped<= FeatureRowSize_unfloped;
			FeatureLayerFitsInDataBank_floped<= FeatureLayerFitsInDataBank_unfloped;
			StartingFeatureIdx_ForDDRUnit_floped<=StartingFeatureIdx_ForDDRUnit_unfloped;
 			StartGrpBase_ForDDRUnit_floped<=StartGrpBase_ForDDRUnit_unfloped;
 			StartingGrpOffset_ForDDRUnit_floped <=StartingGrpOffset_ForDDRUnit_unfloped;
 			StartRowIdx_ForDDRUnit_floped <=  StartRowIdx_ForDDRUnit_unfloped;
 			StartingPositionInRow_ForDDRUnit_floped <= StartingPositionInRow_ForDDRUnit_unfloped;
		end if;
	end if;
end process NetworkDetailProc;
--#End	 	--Network Details

--#Begin -- Sel Outputs
DataToBank<= DataFromDDRUnit when Sel_BetweenDDRAndMAC='0' else
			 DataFromMACOutput;
IdxToBank<= IdxFromDDRUnit when Sel_BetweenDDRAndMAC='0' else
			IdxFromMACOutput;
WriteAddr<= LocalWriteAddr when Sel_BetweenDDRAndMAC='0' else
			AddrFromMACOutput;
--#End	 -- Sel Outputs
end Behavioral;
