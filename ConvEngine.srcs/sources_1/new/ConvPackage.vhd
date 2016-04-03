----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.01.2016 10:55:57
-- Design Name: 
-- Module Name: ConvPackage - Behavioral
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

library work;
use work.NetworkPackage.all;
use work.ConvEngineWeightBankPkg.all;  
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values


-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--#Begin --Layer features to be supplied from CPU
--		Item
--  TotalNumber Of Layers in Network	5 bits			
--	Layer_Base : 						25 bits
--	TotalNumberOfSetsInALayer:  		8
--	SetSize_InTermsOf16Words:			15 
--	SizeOfLastSet_InTermsof16Words: 	15
--	NumberOfLoopOverTheSet:				9 
--	NumberOfSimultaneousKernel: 		5
--	KernelsInLastSet:					5
--		
--#End	 --Layer features to be supplied from CPU


package ConvPackage is
--- Network Details --
	constant C_MaxNuberOfParallelWeightKernels: integer:= 32;
	subtype NumberOfSimultaneousKernel_t is std_logic_vector(len(C_MaxNuberOfParallelWeightKernels)-1 downto 0);
	subtype KernelSize_InMultipleOf16Weights_t is std_logic_vector(len(MaxKernelSize-1)-4-1 downto 0);
	subtype SetSize_InTermsOf16Words_t is std_logic_vector(len(32*256*64-1)-4-1 downto 0); -- Max simultaneous kernels- 32, max channels in a kernel -256, max filter size when 32 parallel kernels are used- 8x8=64
	subtype NumberOfLoopOverTheSet_t is std_logic_vector(8 downto 0); -- Depends on max Column Size	
	subtype FeatureRowSize_t is std_logic_vector(5 downto 0); -- In terms of 8 Words, Max Value 32 (not 31) 
	subtype KernelSizeInTermsOf16Words_t is std_logic_vector(len(MaxKernelSize-1)-4-1 downto 0);


----- MAC unit------
  constant     C_ShiftUnitSize      : integer       := 8; --Size in number of Words. Depends on the acceptable
                                                          --minimum row size of features
  constant     C_NumberofParallelShiftUnits   : integer  := 32;          --Number in terms of ShiftUnits.
                                                                    --32 x 8WordsUnits(requiring 256 DSPunits)
  constant C_NumberofMACunits   :integer    := C_ShiftUnitSize*C_NumberofParallelShiftUnits;
  type ShiftPort_t is array (0 to C_ShiftUnitSize-1) of DataWord_st;
  type ConvUnitDataPort_t is array (0 to C_NumberofParallelShiftUnits-1) of ShiftPort_t;
  type ConvUnitWeightPort_t is array (0 to C_NumberofParallelShiftUnits-1) of WeightWord_st;
--  type ConvUnitOutput_st is array (0 to C_NumberofMACunits-1) of DataWord_st;
  constant C_RawMACOutputWidth	: integer	:=34;
  type DataWordArray_GrpOf8 is array (0 to 7) of DataWord_st;
  type DataIdxArray_GrpOf8 is array (0 to 7) of std_logic_vector(1 downto 0);
  type DataWordArray_GrpOf24 is array (0 to 23) of DataWord_st;
  type DataIdxArray_GrpOf24 is array (0 to 23) of std_logic_vector(1 downto 0);
  type MACFinalOutput_InGrpOf8_t is array (0 to 7) of DataWord_st;
  type MACFinalOutputIdx_InGrpOf8_t is array (0 to 7) of std_logic_vector(1 downto 0);
  type MACUnitRawOutput_t is array (0 to C_NumberofMACunits-1) of std_logic_vector(C_RawMACOutputWidth-1 downto 0);
  subtype DataFeatureRowSize_InMultipleOf16Words_t is std_logic_vector(len(MaxDataFeatureRowSize/16)-1 downto 0);
  --Timepass
  type MaxPooledOutput_t is array (0 to (C_NumberofMACunits/2)-1) of std_logic_vector(C_RawMACOutputWidth-1 downto 0);
  --#Begin  ---DataBank -------------
  	constant     C_DataBRAMWidth  : integer   := 2;    -- Width in number of words(cannot give 1, len()will go in infinite loop).
                                                     -- Two Data inputs can be fetched from BRAM at a time
  	type DataBRAM_ConvUnitInterfaceMuxSelect_t is array (0 to C_DataBRAMWidth-1) of std_logic_vector(len(C_DataBRAMWidth-1)-1 downto 0);
                                        -- For MuxSelect signals that pushes data from BRAM to ShiftUnits
  	type DataBRAMPort_t is array (0 to C_DataBRAMWidth-1) of ShiftPort_t;
  --#End  ---DataBank -------------

  --#Begin -- Weights Addressing ---
	subtype ConvEngineTotalWeightAddrInTermsOf16Words_t is std_logic_vector((C_AddressLengthForSingleWordAddressing-4-1) downto 0);
	subtype ConvEngineWeightBank_Tag_st is std_logic_vector( (C_AddressLengthForSingleWordAddressing-4) - C_ConvEngineWeightBank_ReadAddrLength -1 downto 0);
   --#End -- Weights Addressing ------
	
	--#Begin -- Control of Weight Bank
		--Write Control
	type SingleSetOf8Words_t is array (0 to 7) of WeightWord_st;
	--#End -- Control of Weight Bank

  --#Begin ---WeightsBankMACInterface--------
  	--#Begin Version 1
  	--constant C_NumberofWeightBanks:   integer     := C_NumberofWeightBanks;  -- Each bank has 18bit read width and stores filter parameters row element wise
	--constant C_NumberofParallelWeightChannels:    integer     :=4;  -- Number of weight read in parallel from Weight Bank
	--subtype Level2_ParallelWeightChannelsMuxSelect_t is std_logic_vector(len(C_NumberofWeightBanks/C_NumberofParallelWeightChannels-1)-1 downto 0);
	--type Level1_BankMuxSelect_t is array (0 to C_NumberofParallelWeightChannels-1) of std_logic_vector(len(C_NumberofParallelWeightChannels-1)-1 downto 0);
	--type ParallelWeightChannels_t is array (0 to C_NumberofParallelWeightChannels-1) of DataWord_st;
 	--#End Version 1
	
	--#Begin Version 2
-- 	constant C_NumberofParallelWeightChannels:    integer     :=4;  -- Number of weight read in parallel from Weight Bank
-- 	subtype Level1_BankMuxSelect_st is std_logic_vector(len(C_NumberofParallelWeightChannels-1)-1 downto 0);
-- 	type Level1_BankMuxSelect_t is array (0 to C_NumberofParallelWeightChannels-1) of Level1_BankMuxSelect_st;
 	--#End Version 2
  	
  	--Begin Version 3
  	--type StreamBRAMAddr_st is array (0 to 7) of STD_LOGIC_VECTOR(10 DOWNTO 0);
	--type StreamBRAMAddr_t is array (0 to 3) of StreamBRAMAddr_st;
	--subtype StreamBRAMAddr_t is std_logic_vector(10 downto 0);
  	subtype StreamBRAMWriteAddr_st is std_logic_vector(8 downto 0);
  	subtype StreamBRAMReadAddr_t is std_logic_vector(9 downto 0);
  	type StreamBRAMWriteAddr_t is array( 0 to 31) of StreamBRAMWriteAddr_st;
  	--type WriteEnable_st is array (0 to 7) of std_logic_vector(0 downto 0);
	--subtype WriteEnable_st is std_logic_vector(0 to 31);
	type WriteEnable_t is array (0 to 31) of std_logic_vector(0 downto 0);
  	type ThirtyTwoMuxSelect_t is array (0 to 31) of std_logic_vector(2 downto 0);
	type SixteenMuxSelect_t is array (0 to 15) of std_logic_vector(1 downto 0);
  	--Begin Version 3  
  --#End ---WeightsBankMACInterface--------




--  --#Begin-- Weight streaming buffers-----------------------
--  	constant C_NumberofWeightStreamingBRAMBuffers     :integer    := C_NumberofParallelShiftUnits/4; --Number of 72bit BRAM
--  	--Read addr of Streaming buuffers
--  	subtype WeightStreamingBufferReadAddr_st is std_logic_vector(8 DOWNTO 0);
--  	type WeightStreamingBufferReadAddr_t is array (0 to C_NumberofWeightStreamingBRAMBuffers-1) of WeightStreamingBufferReadAddr_st;
--  	--Write Addr
--  	subtype WeightStreamingBufferWriteAddr_st is std_logic_vector(8 DOWNTO 0);
--  	type WeightStreamingBufferWriteAddr_t is array (0 to C_NumberofWeightStreamingBRAMBuffers-1) of WeightStreamingBufferWriteAddr_st;
--  	--Enable for WeightStreamBuffers BRAM
-- 	subtype WeightStreamingBufferBRAMEnable_st is std_logic_vector(0 to  C_NumberofWeightStreamingBRAMBuffers-1); 
--	-- Byte Enable for streaming BRAM
--	subtype WeightStreamingBufferByteWriteEnable_st is std_logic_vector(0 to C_NumberofParallelShiftUnits-1 ); --C_NumberofParallelShiftUnits=32 in our case
--  --#End-- Weight streaming buffers-----------------------

  --#Begin --Local Memory of ConvEngine
--  	subtype LocalMemoryReadAddr_st is std_logic_vector(12 downto 0);
--  	type LocalMemoryReadAddr_t is array (0 to C_NumberofParallelWeightChannels-1) of LocalMemoryReadAddr_st;
--  	subtype LocalMemoryWriteAddr_st is std_logic_vector(12 downto 0);
--	type LocalMemoryWriteAddr_t is array (0 to C_NumberofParallelWeightChannels-1) of LocalMemoryWriteAddr_st;
--	subtype LocalMemoryEnable_st is std_logic_vector(C_NumberofParallelWeightChannels-1 downto 0);
--	type LocalMemoryInputPort_t is array (0 to C_NumberofParallelWeightChannels-1) of std_logic_vector(17 downto 0);
--	type LocalMemoryOutputPort_t is array (0 to C_NumberofParallelWeightChannels-1) of std_logic_vector(17 downto 0);
  --#End --Local Memory of ConvEngine

------------------ Control---------
--	---Control of WeightStreaming
--	subtype DataRowSize_InMultipleOfEight_st is std_logic_vector(len(C_NumberofParallelShiftUnits)-1 downto 0);
--	---Control of WeightBank 
--    subtype ConvEngineWeightBank_Tag_st is std_logic_vector(C_AllowedAddressLength - C_ConvEngineWeightBank_OutputAddrLength -1 downto 0);
--	subtype ConvEngineKernelProduct_st is std_logic_vector(len(MaxKernelSize-1)+len(MaxKernelsInALayer-1)-1 downto 0);
--	subtype ConvEngineChannelProduct_st is std_logic_vector(len(MaxChannelSize-1)+len(MaxChannelsInAKernel-1)-1 downto 0);
	
end ConvPackage;
