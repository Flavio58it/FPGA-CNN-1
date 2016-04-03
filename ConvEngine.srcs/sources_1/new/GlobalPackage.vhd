----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.01.2016 11:13:07
-- Design Name: 
-- Module Name: GlobalPackage - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


--#Begin --Layer features to be supplied from CPU
--		Item
--  TotalNumber Of Layers in Network	5 bits			
--	Layer_Base : 						25 bits
--	TotalNumberOfSetsInALayer:  		8
--	SetSize_InTermsOf16Words:			15 		-- Number Should always be in multiple of 3, as Set boundary need to be of 48 words (required for ConvEngineWeightBank)
--	SizeOfLastSet_InTermsof16Words: 	15
--	NumberOfLoopOverTheSet:				9 
--	NumberOfSimultaneousKernel: 		5
--	KernelsInLastSet:					5
--		
--#End	 --Layer features to be supplied from CPU

package NetworkPackage is
  function len(x: integer) return integer; -- Gives required value of bits to represent x as integer
  constant     C_WeightBitWidth     : integer       := 18;
  constant     C_DataBitWidth       : integer       := 18;
  subtype DataWord_st is std_logic_vector((C_DataBitWidth-1) downto 0);
  subtype WeightWord_st is std_logic_vector((C_WeightBitWidth-1) downto 0);
  --- Limits that hardware should support
  constant MaxLayers : integer := 32;
  constant MaxKernelsInALayer : integer := 256;
  constant MaxChannelsInAKernel : integer := 256;
  constant MaxPixelsInAFilter : integer := 256;	-- 16x16 filter kernel
  constant MaximumNumberOfWords: integer:= MaxLayers*MaxKernelsInALayer*MaxChannelsInAKernel*MaxPixelsInAFilter;
  constant C_AddressLengthForSingleWordAddressing : integer := len(MaxLayers-1) + 
  													len(MaxKernelsInALayer-1)+
  													len(MaxChannelsInAKernel-1)+
  													len(MaxPixelsInAFilter-1);
  
  constant MaxDataFeatureInALayer: integer := MaxKernelsInALayer;
  constant MaxDataFeatureRowSize: integer:= 256;
  constant MaxDataFeatureColumnSize: integer:= 256; -- It can be anything, no hardware restriction as such
  constant MaxDataFeatureSize: integer := MaxDataFeatureRowSize * MaxDataFeatureColumnSize;
  constant WordsPackedIn512Bits: integer:= 24; -- Words packed in 512 bits	
  constant GlobalSetSizeInAKernel: integer:= WordsPackedIn512Bits; ---- Words packed in 512 bits 
  
  constant LayerIdx_len: integer:= len(MaxLayers-1);
  constant KernelIdx_len: integer:= len(MaxKernelsInALayer-1);
  constant DataFeatureIdx_len: integer:= len(MaxDataFeatureInALayer-1);
  constant DataFeatureRowIdx_len: integer:= len(MaxDataFeatureColumnSize);
  subtype LayerIdx_st is std_logic_vector(LayerIdx_len-1 downto 0);    
  subtype KernelIdx_st is std_logic_vector(KernelIdx_len-1 downto 0);
  subtype DataFeatureIdx_st is std_logic_vector(DataFeatureIdx_len-1 downto 0);
  subtype DataFeatureRowIdx_st is std_logic_vector(DataFeatureRowIdx_len-1 downto 0);

--  constant C_AddressLength: integer := len((MaxLayers*MaxKernelsInALayer*MaxChannelsInAKernel*MaxPixelsInAFilter)-1); -- Word Address
  constant C_AllowedAddressLength: integer:= 25; -- In terms of 24 Word (512 bits)
  subtype GlobalAddress_st is std_logic_vector(C_AllowedAddressLength-1 downto 0);
  
  constant MaxKernelSize : integer := MaxChannelsInAKernel*MaxPixelsInAFilter; --In terms of pixels (or words)
  subtype KernelSize_st is std_logic_vector(len(MaxKernelSize-1)-1 downto 0);
  
	-- DDR macros ---
	subtype DDR_YOut is std_logic_vector(479 downto 0);
	type DDR_DataOut_t is array (23 downto 0) of WeightWord_st;
	subtype KernelSize_InMultipleOf24Weights_t is std_logic_vector(len(MaxKernelSize/24-1)-1 downto 0);
	constant DataFeatureSize_InMultipleOf24Words_len: integer:= len(MaxDataFeatureSize/24-1);
	subtype DataFeatureSize_InMultipleOf24Words_t is std_logic_vector(DataFeatureSize_InMultipleOf24Words_len-1 downto 0);

end NetworkPackage;

package body NetworkPackage is
  function len(x: integer) return integer is
  begin
    if (x<=1) then return 1;
    else return 1+len(x/2);
    end if;
  end len;
end NetworkPackage;

