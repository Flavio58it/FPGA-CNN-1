----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.01.2016 16:03:31
-- Design Name: 
-- Module Name: WordBankMACInterface - Behavioral
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
--use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

library work;
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

entity WeightBankMACInterface is
  Port ( clk,rst: in std_logic;
         ---- Ports for mux-----
         Level1_MuxSelect: in Level1_BankMuxSelect_t;
         --#Version_1
         Level2_MuxSelect: in Level2_ParallelWeightChannelsMuxSelect_t;
         WordsFromWeightBank: in WeightBankOutput_t;
         -----Control for Weight Streaming buffers--------
         WeightStreamingBufferReadAddr: in WeightStreamingBufferReadAddr_st; -- Common address to all BRAM
         WeightStreamingBufferWriteAddr: in WeightStreamingBufferWriteAddr_st; -- Common address to all BRAM
         WeightStreamingBufferBRAMRead_Enable: in WeightStreamingBufferBRAMEnable_st;
         WeightStreamingBufferBRAMWrite_Enable: in WeightStreamingBufferBRAMEnable_st;
         WeightStreamingBufferBRAMByteWrite_Enable: in WeightStreamingBufferByteWriteEnable_st; ----Word wise write enable

         ---- Port to MAC units--------
         WeightTowardsMAC: out ConvUnitWeightPort_t
       );
  
begin
    assert (C_NumberofParallelWeightChannels < 2) report "Error:NumberofParallelWeightsChannel in WeightBank interface is less than 2";
end WeightBankMACInterface;
-----------------------------------------------------------------------------------------

--#Begin -------Version 1 -------------------
architecture Behavioral of WeightBankMACInterface is

-----------Components---------
  COMPONENT blk_mem_gen_SDP_Awrite72depth512_Bread72
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
 	wea : IN STD_LOGIC_VECTOR(7 DOWNTO 0);    
 	addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(71 DOWNTO 0);
    clkb : IN STD_LOGIC;
    rstb : IN STD_LOGIC;
    enb : IN STD_LOGIC;
    addrb : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(71 DOWNTO 0)
  );
END COMPONENT;

-----types-------------
type ParallelWeightChannels_t is array (0 to C_NumberofParallelWeightChannels-1) of DataWord_st;
type Level1_to_Level2_Interface_t is array (0 to C_NumberofWeightBanks/C_NumberofParallelWeightChannels-1) of ParallelWeightChannels_t; 
type  Temp_WeightTowardsMac_t is array (0 to C_NumberofWeightStreamingBRAMBuffers-1) of std_logic_vector(71 downto 0);
subtype wea_st is std_logic_vector(7 downto 0);
type wea_t is array (0 to C_NumberofWeightStreamingBRAMBuffers-1) of wea_st;
---signal---
signal Bank_to_Level1: Level1_to_Level2_Interface_t; 
signal Level1_to_Level2_Interface: Level1_to_Level2_Interface_t; 
signal Level2_to_StreamingBRAM: ParallelWeightChannels_t;
signal Temp_WeightTowardsMac: Temp_WeightTowardsMac_t;
signal wea_array: wea_t;

------------begins!!!-------------
begin
  WeightStreamingBuffers:
  for i in 0 to C_NumberofWeightStreamingBRAMBuffers-1 generate
    WeightStreamingBuffer: blk_mem_gen_SDP_Awrite72depth512_Bread72
      PORT MAP (
        clka => clk,
        ena => WeightStreamingBufferBRAMWrite_Enable(i),
        wea =>wea_array(i), -- Byte Write Enable. Here Byte= 9 bits
        addra => WeightStreamingBufferWriteAddr, --Same address to entire generate loop
        dina => Level2_to_StreamingBRAM(0) & Level2_to_StreamingBRAM(1) & Level2_to_StreamingBRAM(2) & Level2_to_StreamingBRAM(3),
        clkb => clk,
        rstb => rst,
        enb => WeightStreamingBufferBRAMRead_Enable(i),
        addrb => WeightStreamingBufferReadAddr, -- Common address
        doutb => Temp_WeightTowardsMac(i)
        );
  end generate WeightStreamingBuffers;

  process(WordsFromWeightBank,Level1_MuxSelect,Bank_to_Level1)
  begin
    for i in 0 to (C_NumberofWeightBanks-1) loop
        Bank_to_Level1(i/C_NumberofParallelWeightChannels)(i mod C_NumberofParallelWeightChannels)<= WordsFromWeightBank(i);
    end loop;

    for i in 0 to (C_NumberofWeightBanks/C_NumberofParallelWeightChannels-1) loop
      for j in 0 to C_NumberofParallelWeightChannels-1 loop
       -- Level1_to_Level2_Interface(i)(j)<= WordsFromWeightBank(C_NumberofParallelWeightChannels*i + (to_integer(Unsigned(Level1_MuxSelect(j)))) );
        -- Level1_to_Level2_Interface(i)(j)<= WordsFromWeightBank((to_integer(Unsigned(Level1_MuxSelect(j)))) );
        Level1_to_Level2_Interface(i)(j)<= Bank_to_Level1(i)(to_integer(Unsigned(Level1_MuxSelect(j))));
      end loop;
    end loop;   
  end process;

  Level2_to_StreamingBRAM<= Level1_to_Level2_Interface(to_integer(Unsigned(Level2_MuxSelect)));
  OutputProcess:
    process (Temp_WeightTowardsMac)
    begin
      for i in 0 to  C_NumberofParallelShiftUnits-1 loop
        -- WeightTowardsMAC(0) <= Temp_WeightTowardsMac(71 downto 54)
        -- WeightTowardsMAC(3) <= Temp_WeightTowardsMac(17 downto 0)
        -- WeightTowardsMAC(4) <= Temp_WeightTowardsMac(71 downto 53)
        WeightTowardsMAC(i) <= Temp_WeightTowardsMac(i/4)(C_WeightBitWidth*(((3-i) mod 4)+1)-1 downto  C_WeightBitWidth*(((3-i) mod 4)+1)-18);
      end loop;
  end process;
  
  ByteEnable_Translation:
	process(WeightStreamingBufferBRAMByteWrite_Enable)
	begin
		for i in 0 to C_NumberofWeightStreamingBRAMBuffers-1 loop
			wea_array(i) <=  WeightStreamingBufferBRAMByteWrite_Enable(i*4) &
							 WeightStreamingBufferBRAMByteWrite_Enable(i*4) &
							 WeightStreamingBufferBRAMByteWrite_Enable(i*4 +1) &
  					 		 WeightStreamingBufferBRAMByteWrite_Enable(i*4 +1) &
							 WeightStreamingBufferBRAMByteWrite_Enable(i*4 +2) &
							 WeightStreamingBufferBRAMByteWrite_Enable(i*4 +2) &
							 WeightStreamingBufferBRAMByteWrite_Enable(i*4 +3) &
							 WeightStreamingBufferBRAMByteWrite_Enable(i*4 +3);
		end loop;
	end process ByteEnable_Translation;    
end Behavioral;
--#End -----Version 1 -------------------
