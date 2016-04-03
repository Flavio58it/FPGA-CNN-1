----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2016 15:29:50
-- Design Name: 
-- Module Name: ConvEngineWeightBankTop_tb - Behavioral
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
use work.ReadTextFileLibrary.all;
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

entity ConvEngineWeightBankTop_tb is
--  Port ( );
end ConvEngineWeightBankTop_tb;

architecture Behavioral of ConvEngineWeightBankTop_tb is
--#Begin --Component
component ConvEngineTop
	port(clk, rst                                : in  std_logic;
		 StartNextNetworkIteration               : in  std_logic;
		 DoneWithNetworkIteration                : out std_logic;
		 NumberOfLayersInNetwork_unfloped        : in  LayerIdx_st;
		 Layer_Base_unfloped                     : in  ConvEngineTotalWeightAddrInTermsOf16Words_t;
		 SetSize_InTermsOf16Words_unfloped       : in  SetSize_InTermsOf16Words_t;
		 TotalNumberOfSetsInALayer_unfloped      : in  KernelIdx_st;
		 NumberOfLoopOverTheSet_unfloped         : in  NumberOfLoopOverTheSet_t;
		 KernelsInLastSet_unfloped               : in  NumberOfSimultaneousKernel_t;
		 SizeOfLastSet_InTermsof16Words_unfloped : in  SetSize_InTermsOf16Words_t;
		 NumberOfSimultaneousKernel_unfloped     : in  NumberOfSimultaneousKernel_t;
		 SetCrossesBankBoundary_unfloped         : in  std_logic;
		 NetworkFitsInWeightBank_unfloped        : in  std_logic;
		 FeatureRowSize_unflopped                : in  std_logic_vector(4 downto 0);
		 Rqst_ToNetworkArchitectureBank          : out std_logic;
		 Ack_FromNetworkArchitectureBank         : in  std_logic;
		 LayerIdxToNetworkArchitectureBank       : out LayerIdx_st;
		 EnableStreamingWeightsToMAC             : in  std_logic;
		 TellMACToWait                           : out std_logic;
		 WeightsToMac                            : out ConvUnitWeightPort_t;
		 DDR_LayerIdx_Rqst                       : out LayerIdx_st;
		 DDR_KernelIdx_Rqst                      : out KernelIdx_st;
		 DDR_GroupOf24Idx_Rqst                   : out KernelSize_InMultipleOf24Weights_t;
		 RqstToDDR                               : out std_logic;
		 AckFromDDR                              : in  std_logic;
		 DataFromDDR                             : in  DDR_DataOut_t);
end component ConvEngineTop;
--#End  --Components

--#Begin --Signals
signal	 clk, rst                                :   std_logic;
signal	 StartNextNetworkIteration               :   std_logic:= '0';
signal	 DoneWithNetworkIteration                :   std_logic;
signal	 NumberOfLayersInNetwork_unfloped        :   LayerIdx_st:= std_logic_vector(to_unsigned(2,len(MaxLayers-1)));
signal	 Layer_Base_unfloped                     :   ConvEngineTotalWeightAddrInTermsOf16Words_t:= (others=>'0');
signal	 SetSize_InTermsOf16Words_unfloped       :   SetSize_InTermsOf16Words_t:= std_logic_vector(to_unsigned(300,len(32*256*64-1)-4));
signal	 TotalNumberOfSetsInALayer_unfloped      :   KernelIdx_st:= std_logic_vector(to_unsigned(5,len(MaxKernelsInALayer-1)));
signal	 NumberOfLoopOverTheSet_unfloped         :   NumberOfLoopOverTheSet_t:= std_logic_vector(to_unsigned(1,9));
signal	 KernelsInLastSet_unfloped               :   NumberOfSimultaneousKernel_t:= std_logic_vector(to_unsigned(1,len(C_MaxNuberOfParallelWeightKernels-1)));
signal	 SizeOfLastSet_InTermsof16Words_unfloped :   SetSize_InTermsOf16Words_t:= std_logic_vector(to_unsigned(300,len(32*256*64-1)-4));
signal	 NumberOfSimultaneousKernel_unfloped     :   NumberOfSimultaneousKernel_t:= std_logic_vector(to_unsigned(1,len(C_MaxNuberOfParallelWeightKernels-1)));
signal	 SetCrossesBankBoundary_unfloped         :   std_logic:='0';
signal	 NetworkFitsInWeightBank_unfloped        :   std_logic:='1';
signal	 FeatureRowSize_unflopped                :   std_logic_vector(4 downto 0):= std_logic_vector(to_unsigned(16,5));
signal	 Rqst_ToNetworkArchitectureBank          :  std_logic;
signal	 Ack_FromNetworkArchitectureBank         :   std_logic:='1';
signal	 LayerIdxToNetworkArchitectureBank       :  LayerIdx_st;
signal	 EnableStreamingWeightsToMAC             :   std_logic:='1';
signal	 TellMACToWait                           :  std_logic;
signal	 WeightsToMac                            :  ConvUnitWeightPort_t;
signal	 DDR_LayerIdx_Rqst                       :  LayerIdx_st;
signal	 DDR_KernelIdx_Rqst                      :  KernelIdx_st;
signal	 DDR_GroupOf24Idx_Rqst                   :  KernelSize_InMultipleOf24Weights_t;
signal	 RqstToDDR                               :  std_logic;
signal	 AckFromDDR                              :   std_logic:='0';
signal	 DataFromDDR                             :   DDR_DataOut_t:= (others=> std_logic_vector(to_unsigned(0,18)));

signal ClkPeriod: time := 5 ns;
signal ClkTick,ClkHalfTick: integer:= 0;

	-- Read File signals
signal ReadFileRqst,ReadFileRqst_1,ReadFileRqst_2: std_logic;	
signal FileData_vector,FileData_vector_delayed: std_logic_vector(431 downto 0);
signal AckFromDDR_1, AckFromDDR_2, AckFromDDR_3,
		 AckFromDDR_6,AckFromDDR_5,AckFromDDR_4,
		 AckFromDDR_7,AckFromDDR_8,AckFromDDR_9,
		 AckFromDDR_10,AckFromDDR_11,AckFromDDR_temp: std_logic;
--#End	 --Signals

begin
uut: ConvEngineTop
	port map(
		clk                                     => clk,
		rst                                     => rst,
		StartNextNetworkIteration               => StartNextNetworkIteration,
		DoneWithNetworkIteration                => DoneWithNetworkIteration,
		NumberOfLayersInNetwork_unfloped        => NumberOfLayersInNetwork_unfloped,
		Layer_Base_unfloped                     => Layer_Base_unfloped,
		SetSize_InTermsOf16Words_unfloped       => SetSize_InTermsOf16Words_unfloped,
		TotalNumberOfSetsInALayer_unfloped      => TotalNumberOfSetsInALayer_unfloped,
		NumberOfLoopOverTheSet_unfloped         => NumberOfLoopOverTheSet_unfloped,
		KernelsInLastSet_unfloped               => KernelsInLastSet_unfloped,
		SizeOfLastSet_InTermsof16Words_unfloped => SizeOfLastSet_InTermsof16Words_unfloped,
		NumberOfSimultaneousKernel_unfloped     => NumberOfSimultaneousKernel_unfloped,
		SetCrossesBankBoundary_unfloped         => SetCrossesBankBoundary_unfloped,
		NetworkFitsInWeightBank_unfloped        => NetworkFitsInWeightBank_unfloped,
		FeatureRowSize_unflopped                => FeatureRowSize_unflopped,
		Rqst_ToNetworkArchitectureBank          => Rqst_ToNetworkArchitectureBank,
		Ack_FromNetworkArchitectureBank         => Ack_FromNetworkArchitectureBank,
		LayerIdxToNetworkArchitectureBank       => LayerIdxToNetworkArchitectureBank,
		EnableStreamingWeightsToMAC             => EnableStreamingWeightsToMAC,
		TellMACToWait                           => TellMACToWait,
		WeightsToMac                            => WeightsToMac,
		DDR_LayerIdx_Rqst                       => DDR_LayerIdx_Rqst,
		DDR_KernelIdx_Rqst                      => DDR_KernelIdx_Rqst,
		DDR_GroupOf24Idx_Rqst                   => DDR_GroupOf24Idx_Rqst,
		RqstToDDR                               => RqstToDDR,
		AckFromDDR                              => AckFromDDR,
		DataFromDDR                             => DataFromDDR
	);

ReadTextFile (
		"/home/edcn103/Desktop/Link_to_M.tech/Project/Hardware_Implementation/PythonScripts/ConvEngineWeightBankTop_test_v1.txt", 
		432,
		clk,
		rst,
		ReadFileRqst,
		FileData_vector
);

ReadFileRqst_1<= RqstToDDR;
ReadFileRqst_2<= RqstToDDR after 2*ClkPeriod;
ReadFileRqst<= ReadFileRqst_1 and not ReadFileRqst_2;

--TP : process is
--begin
----	AckFromDDR_1<= RqstToDDR after 2*ClkPeriod;
----	AckFromDDR_2<= RqstToDDR after 3*ClkPeriod;
----	AckFromDDR_temp <= AckFromDDR_1 and not(AckFromDDR_2);
--	if (RqstToDDR ='1') then
--		wait for 15*ClkPeriod;		
--		AckFromDDR<= '1';
--		wait for ClkPeriod;
--		AckFromDDR<= '0';		
--	end if;
--end process TP;

AckProc : process (clk) is
begin
	if rising_edge(clk) then
		if rst = '1' then
			AckFromDDR_1<= '0';
			AckFromDDR_2<= '0';
			AckFromDDR_3<= '0';
			AckFromDDR_4<= '0';
			AckFromDDR_5<= '0';
			AckFromDDR_6<= '0';
			AckFromDDR_7<= '0';
			AckFromDDR_8<= '0';
			AckFromDDR_9<= '0';
			AckFromDDR_10<= '0';
			AckFromDDR_11<= '0';
		else
			AckFromDDR_1<= ReadFileRqst;
			AckFromDDR_2<= AckFromDDR_1;
			AckFromDDR_3<= AckFromDDR_2;
			AckFromDDR_4<= AckFromDDR_3;
			AckFromDDR_5<= AckFromDDR_4;
			AckFromDDR_6<= AckFromDDR_5;
			AckFromDDR_7<= AckFromDDR_6;
			AckFromDDR_8<= AckFromDDR_7;
			AckFromDDR_9<= AckFromDDR_8;
			AckFromDDR_10<= AckFromDDR_9;
			AckFromDDR_11<= AckFromDDR_10;
			AckFromDDR<= AckFromDDR_10 and (not AckFromDDR_11);
		end if;
	end if;
end process AckProc;

FileData_vector_delayed<= FileData_vector after ClkPeriod/2;
DDRproc : process (FileData_vector_delayed)
begin
	for i in 0 to 23 loop
		DataFromDDR(i) <= FileData_vector_delayed(432-18*(i)-1 downto 432-18*(i+1)); 
	end loop;	
end process DDRproc;


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
	if (ClkHalfTick=30) then
		StartNextNetworkIteration <= '1';
	elsif (ClkHalfTick=31) then
		StartNextNetworkIteration <= '0';
	elsif (ClkHalfTick=1000) then
		EnableStreamingWeightsToMAC <= '0';
	elsif (ClkHalfTick=1100) then
		EnableStreamingWeightsToMAC <= '1';
	end if;
end process;

end Behavioral;
