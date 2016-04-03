// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.3 (lin64) Build 1368829 Mon Sep 28 20:06:39 MDT 2015
// Date        : Sat Mar 19 12:06:52 2016
// Host        : edcn103-pc running 64-bit Ubuntu 14.04.4 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/edcn103/Dropbox/M.tech/Project/Hardware_Implementation/ConvEngine/ConvEngine.srcs/sources_1/ip/fifo_generator_Width160_Depth128/fifo_generator_Width160_Depth128_stub.v
// Design      : fifo_generator_Width160_Depth128
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1761-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_0_0,Vivado 2015.3" *)
module fifo_generator_Width160_Depth128(clk, din, wr_en, rd_en, dout, full, empty)
/* synthesis syn_black_box black_box_pad_pin="clk,din[159:0],wr_en,rd_en,dout[159:0],full,empty" */;
  input clk;
  input [159:0]din;
  input wr_en;
  input rd_en;
  output [159:0]dout;
  output full;
  output empty;
endmodule
