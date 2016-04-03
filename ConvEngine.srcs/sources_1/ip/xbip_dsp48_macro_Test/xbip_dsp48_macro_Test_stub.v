// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.3 (lin64) Build 1368829 Mon Sep 28 20:06:39 MDT 2015
// Date        : Thu Mar 24 19:13:44 2016
// Host        : edcn103-pc running 64-bit Ubuntu 14.04.4 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/edcn103/Dropbox/M.tech/Project/Hardware_Implementation/ConvEngine/ConvEngine.srcs/sources_1/ip/xbip_dsp48_macro_Test/xbip_dsp48_macro_Test_stub.v
// Design      : xbip_dsp48_macro_Test
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1761-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "xbip_dsp48_macro_v3_0_10,Vivado 2015.3" *)
module xbip_dsp48_macro_Test(CLK, CE, SEL, PCIN, A, B, P, SCLRP)
/* synthesis syn_black_box black_box_pad_pin="CLK,CE,SEL[0:0],PCIN[47:0],A[17:0],B[17:0],P[47:0],SCLRP" */;
  input CLK;
  input CE;
  input [0:0]SEL;
  input [47:0]PCIN;
  input [17:0]A;
  input [17:0]B;
  output [47:0]P;
  input SCLRP;
endmodule
