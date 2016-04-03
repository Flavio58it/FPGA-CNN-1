----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2016 16:22:28
-- Design Name: 
-- Module Name: ConvEngineWeightBank_ReadControl_level1_tb - Behavioral
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
--

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ConvEngineWeightBank_ReadControl_level1_tb is
--  Port ( );
end ConvEngineWeightBank_ReadControl_level1_tb;

architecture Behavioral of ConvEngineWeightBank_ReadControl_level1_tb is
component ConvEngineWeightBank_ReadControl_Level1_v2
	port(clk, rst                                            : in  std_logic;
		 Layer_Base                                          : in  ConvEngineTotalWeightAddrInTermsOf16Words_t;
		 SetSize_InTermsOf16Words                            : in  SetSize_InTermsOf16Words_t;
		 TotalNumberOfSetsInALayer                           : in  ConvEngineWeightBankReadAddr_t;
		 KernelsInLastSet                                    : in  KernelsInLastSet_t;
		 NumberOfSimultaneousKernel                          : in  NumberOfSimultaneousKernel_t;
		 Rqst_ToStartNextLayer                               : in  std_logic;
		 DoneWithLayer                                       : out std_logic;
		 Tag1                                                : in  ConvEngineWeightBank_Tag_st;
		 Tag2                                                : in  ConvEngineWeightBank_Tag_st;
		 Tag3                                                : in  ConvEngineWeightBank_Tag_st;
		 Tag1Valid                                           : in  std_logic;
		 Tag2Valid                                           : in  std_logic;
		 Tag3Valid                                           : in  std_logic;
		 Tag1Range_Start                                     : in  ConvEngineWeightBankReadAddr_t;
		 Tag1Range_End                                       : in  ConvEngineWeightBankReadAddr_t;
		 Tag2Range_Start                                     : in  ConvEngineWeightBankReadAddr_t;
		 Tag2Range_End                                       : in  ConvEngineWeightBankReadAddr_t;
		 Tag3Range_Start                                     : in  ConvEngineWeightBankReadAddr_t;
		 Tag3Range_End                                       : in  ConvEngineWeightBankReadAddr_t;
		 FlowCtrl_ContinueStreaming_StrmEngineToWeightBank   : in  std_logic;
		 FlowCtrl_ContinueStreaming_WeightBankToStreamEngine_unfloped : out std_logic;
		 ReadAddr                                            : out ConvEngineWeightBankReadAddr_t;
		 Port_En                                             : out std_logic);
end component ConvEngineWeightBank_ReadControl_Level1_v2;
component ConvEngineWeightBankToMACControl_v3
	port(clk, rst                        : in  std_logic;
		 LoadFlipFlopRow                 : out std_logic_vector(0 to 7);
		 ShiftFlipFlopRow                : out std_logic_vector(0 to 7);
		 DirectlyFromBank                : out std_logic_vector(0 to 31);
		 WriteEnable                     : out WriteEnable_t;
		 ThirtyTwoMuxSelect              : out ThirtyTwoMuxSelect_t;
		 WriteAddr                       : out StreamBRAMWriteAddr_t;
		 ReadAddr                        : out StreamBRAMReadAddr_t;
		 FeatureRowSize                  : in  unsigned(4 downto 0);
		 EnabelLoadingWeightsFromBank    : in  std_logic;
		 EnableStreamingWeightsToMAC     : in  std_logic;
		 TellMACToWait                   : out std_logic;
		 RqstToSendWeightsFromWeightBank : out std_logic);
end component ConvEngineWeightBankToMACControl_v3;

signal 		 clk, rst                                            :   std_logic;
signal		 Layer_Base                                          :   ConvEngineTotalWeightAddrInTermsOf16Words_t:= (others => '0');
signal		 SetSize_InTermsOf16Words                            :   SetSize_InTermsOf16Words_t:= std_logic_vector(to_unsigned(20,len(32*256*64-1)-4));
signal		 TotalNumberOfSetsInALayer                           :   ConvEngineWeightBankReadAddr_t:= std_logic_vector(to_unsigned(8,len(MaxKernelsInALayer-1)));
signal		 KernelsInLastSet                                    :   KernelsInLastSet_t;
signal		 NumberOfSimultaneousKernel                          :   NumberOfSimultaneousKernel_t:= std_logic_vector(to_unsigned(4,len(C_MaxNuberOfParallelWeightKernels-1)));
signal		 Rqst_ToStartNextLayer                               :   std_logic:= '0';
signal		 DoneWithLayer                                       :  std_logic;
signal		 Tag1                                                :   ConvEngineWeightBank_Tag_st;
signal		 Tag2                                                :   ConvEngineWeightBank_Tag_st;
signal		 Tag3                                                :   ConvEngineWeightBank_Tag_st;
signal		 Tag1Valid                                           :   std_logic;
signal		 Tag2Valid                                           :   std_logic;
signal		 Tag3Valid                                           :   std_logic;
signal		 Tag1Range_Start                                     :   ConvEngineWeightBankReadAddr_t;
signal		 Tag1Range_End                                       :   ConvEngineWeightBankReadAddr_t;
signal		 Tag2Range_Start                                     :   ConvEngineWeightBankReadAddr_t;
signal		 Tag2Range_End                                       :   ConvEngineWeightBankReadAddr_t;
signal		 Tag3Range_Start                                     :   ConvEngineWeightBankReadAddr_t;
signal		 Tag3Range_End                                       :   ConvEngineWeightBankReadAddr_t;
signal		 FlowCtrl_ContinueStreaming_StrmEngineToWeightBank   :   std_logic:= '0';
signal		 FlowCtrl_ContinueStreaming_WeightBankToStreamEngine :  std_logic;
signal		 ReadAddr                                            :  ConvEngineWeightBankReadAddr_t;
signal		 Port_En                                             :  std_logic;

signal LoadFlipFlopRow: std_logic_vector(0 to 7);
signal ShiftFlipFlopRow: std_logic_vector(0 to 7);
signal DirectlyFromBank: std_logic_vector(0 to 31);
signal WriteEnable: WriteEnable_t;
signal EnableLoading: std_logic;
signal InvalidData: std_logic;
signal Counter: unsigned(5 downto 0);
signal Enable: std_logic_vector(31 downto 0);
signal FeatureRowSize: unsigned(4 downto 0);
signal DoneLoading: std_logic;
signal PrevFirstIdxOut: unsigned(5 downto 0);
signal PrevLastIdxOut: unsigned(5 downto 0);
signal ThirtyTwoMuxSelect: ThirtyTwoMuxSelect_t;


signal ClkPeriod: time := 5ns;
signal ClkTick,ClkHalfTick: integer:= 0;

begin
uut: ConvEngineWeightBank_ReadControl_Level1_v2
	port map(
		clk                                                 => clk,
		rst                                                 => rst,
		Layer_Base                                          => Layer_Base,
		SetSize_InTermsOf16Words                            => SetSize_InTermsOf16Words,
		TotalNumberOfSetsInALayer                           => TotalNumberOfSetsInALayer,
		KernelsInLastSet                                    => KernelsInLastSet,
		NumberOfSimultaneousKernel                          => NumberOfSimultaneousKernel,
		Rqst_ToStartNextLayer                               => Rqst_ToStartNextLayer,
		DoneWithLayer                                       => DoneWithLayer,
		Tag1                                                => Tag1,
		Tag2                                                => Tag2,
		Tag3                                                => Tag3,
		Tag1Valid                                           => Tag1Valid,
		Tag2Valid                                           => Tag2Valid,
		Tag3Valid                                           => Tag3Valid,
		Tag1Range_Start                                     => Tag1Range_Start,
		Tag1Range_End                                       => Tag1Range_End,
		Tag2Range_Start                                     => Tag2Range_Start,
		Tag2Range_End                                       => Tag2Range_End,
		Tag3Range_Start                                     => Tag3Range_Start,
		Tag3Range_End                                       => Tag3Range_End,
		FlowCtrl_ContinueStreaming_StrmEngineToWeightBank   => FlowCtrl_ContinueStreaming_StrmEngineToWeightBank,
		FlowCtrl_ContinueStreaming_WeightBankToStreamEngine_unfloped => FlowCtrl_ContinueStreaming_WeightBankToStreamEngine,
		ReadAddr                                            => ReadAddr,
		Port_En                                             => Port_En
	);

process is
begin
  for i in 0 to 2000 loop
	ClkTick <= i;
    clk<= '1'; wait for ClkPeriod/2;
	ClkHalfTick <=i;
    clk<= '0'; wait for ClkPeriod/2;
  end loop;
end process;

process is
begin
	wait for 20*ClkPeriod;
	rst <= '1'; wait for 5*ClkPeriod;
	rst <= '0'; wait;
end process;

process (ClkHalfTick)
begin
	if (ClkHalfTick=25) then
		Rqst_ToStartNextLayer <= '1';
	elsif (ClkHalfTick=27) then
		Rqst_ToStartNextLayer <= '0';
	elsif (ClkHalfTick=40) then
		FlowCtrl_ContinueStreaming_StrmEngineToWeightBank<= '1';
	elsif (ClkHalfTick=63) then
		FlowCtrl_ContinueStreaming_StrmEngineToWeightBank<= '0';
	elsif (ClkHalfTick=65) then
		FlowCtrl_ContinueStreaming_StrmEngineToWeightBank<= '1';
	elsif (ClkHalfTick=250) then
		Layer_Base<= std_logic_vector(to_unsigned(500,C_AddressLengthForSingleWordAddressing-4));			
		Rqst_ToStartNextLayer <= '1';
	end if;
end process;
end Behavioral;
