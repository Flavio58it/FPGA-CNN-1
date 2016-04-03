// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.3 (lin64) Build 1368829 Mon Sep 28 20:06:39 MDT 2015
// Date        : Fri Feb 12 09:24:37 2016
// Host        : edcn103-pc running 64-bit Ubuntu 14.04.3 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/edcn103/Dropbox/M.tech/Project/Hardware_Implementation/ConvEngine/ConvEngine.srcs/sources_1/ip/blk_mem_gen_SDP_Awrite18depth8192_Bread18/blk_mem_gen_SDP_Awrite18depth8192_Bread18_stub.v
// Design      : blk_mem_gen_SDP_Awrite18depth8192_Bread18
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1761-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_0,Vivado 2015.3" *)
module blk_mem_gen_SDP_Awrite18depth8192_Bread18(clka, ena, wea, addra, dina, clkb, rstb, enb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[0:0],addra[12:0],dina[17:0],clkb,rstb,enb,addrb[12:0],doutb[17:0]" */;
  input clka;
  input ena;
  input [0:0]wea;
  input [12:0]addra;
  input [17:0]dina;
  input clkb;
  input rstb;
  input enb;
  input [12:0]addrb;
  output [17:0]doutb;
endmodule
