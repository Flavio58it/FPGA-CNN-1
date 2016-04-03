-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.3 (lin64) Build 1368829 Mon Sep 28 20:06:39 MDT 2015
-- Date        : Thu Mar 24 19:13:44 2016
-- Host        : edcn103-pc running 64-bit Ubuntu 14.04.4 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/edcn103/Dropbox/M.tech/Project/Hardware_Implementation/ConvEngine/ConvEngine.srcs/sources_1/ip/xbip_dsp48_macro_Test/xbip_dsp48_macro_Test_stub.vhdl
-- Design      : xbip_dsp48_macro_Test
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx485tffg1761-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xbip_dsp48_macro_Test is
  Port ( 
    CLK : in STD_LOGIC;
    CE : in STD_LOGIC;
    SEL : in STD_LOGIC_VECTOR ( 0 to 0 );
    PCIN : in STD_LOGIC_VECTOR ( 47 downto 0 );
    A : in STD_LOGIC_VECTOR ( 17 downto 0 );
    B : in STD_LOGIC_VECTOR ( 17 downto 0 );
    P : out STD_LOGIC_VECTOR ( 47 downto 0 );
    SCLRP : in STD_LOGIC
  );

end xbip_dsp48_macro_Test;

architecture stub of xbip_dsp48_macro_Test is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK,CE,SEL[0:0],PCIN[47:0],A[17:0],B[17:0],P[47:0],SCLRP";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "xbip_dsp48_macro_v3_0_10,Vivado 2015.3";
begin
end;
