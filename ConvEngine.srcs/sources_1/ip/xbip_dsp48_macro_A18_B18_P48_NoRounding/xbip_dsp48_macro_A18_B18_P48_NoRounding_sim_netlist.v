// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.3 (lin64) Build 1368829 Mon Sep 28 20:06:39 MDT 2015
// Date        : Tue Feb 23 11:59:48 2016
// Host        : edcn103-pc running 64-bit Ubuntu 14.04.3 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/edcn103/Dropbox/M.tech/Project/Hardware_Implementation/ConvEngine/ConvEngine.srcs/sources_1/ip/xbip_dsp48_macro_A18_B18_P48_NoRounding/xbip_dsp48_macro_A18_B18_P48_NoRounding_sim_netlist.v
// Design      : xbip_dsp48_macro_A18_B18_P48_NoRounding
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7vx485tffg1761-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "xbip_dsp48_macro_A18_B18_P48_NoRounding,xbip_dsp48_macro_v3_0_10,{}" *) (* core_generation_info = "xbip_dsp48_macro_A18_B18_P48_NoRounding,xbip_dsp48_macro_v3_0_10,{x_ipProduct=Vivado 2015.3,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=xbip_dsp48_macro,x_ipVersion=3.0,x_ipCoreRevision=10,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_XDEVICEFAMILY=virtex7,C_HAS_CE=1,C_HAS_INDEP_CE=0,C_HAS_CED=0,C_HAS_CEA=0,C_HAS_CEB=0,C_HAS_CEC=0,C_HAS_CECONCAT=0,C_HAS_CEM=0,C_HAS_CEP=0,C_HAS_CESEL=0,C_HAS_SCLR=1,C_HAS_INDEP_SCLR=0,C_HAS_SCLRD=0,C_HAS_SCLRA=0,C_HAS_SCLRB=0,C_HAS_SCLRC=0,C_HAS_SCLRM=0,C_HAS_SCLRP=0,C_HAS_SCLRCONCAT=0,C_HAS_SCLRSEL=0,C_HAS_CARRYCASCIN=0,C_HAS_CARRYIN=0,C_HAS_ACIN=0,C_HAS_BCIN=0,C_HAS_PCIN=0,C_HAS_A=1,C_HAS_B=1,C_HAS_D=0,C_HAS_CONCAT=0,C_HAS_C=0,C_A_WIDTH=18,C_B_WIDTH=18,C_C_WIDTH=48,C_D_WIDTH=18,C_CONCAT_WIDTH=48,C_P_MSB=47,C_P_LSB=0,C_SEL_WIDTH=0,C_HAS_ACOUT=0,C_HAS_BCOUT=0,C_HAS_CARRYCASCOUT=0,C_HAS_CARRYOUT=0,C_HAS_PCOUT=0,C_CONSTANT_1=1,C_LATENCY=-1,C_OPMODES=000000000010010100000000,C_REG_CONFIG=00000000000011000011000001000100,C_TEST_CORE=0}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "xbip_dsp48_macro_v3_0_10,Vivado 2015.3" *) 
(* NotValidForBitStream *)
module xbip_dsp48_macro_A18_B18_P48_NoRounding
   (CLK,
    CE,
    SCLR,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [17:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [17:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) output [47:0]P;

  wire [17:0]A;
  wire [17:0]B;
  wire CE;
  wire CLK;
  wire [47:0]P;
  wire SCLR;
  wire NLW_U0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_U0_CARRYOUT_UNCONNECTED;
  wire [29:0]NLW_U0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_U0_BCOUT_UNCONNECTED;
  wire [47:0]NLW_U0_PCOUT_UNCONNECTED;

  (* C_A_WIDTH = "18" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CONCAT_WIDTH = "48" *) 
  (* C_CONSTANT_1 = "1" *) 
  (* C_C_WIDTH = "48" *) 
  (* C_D_WIDTH = "18" *) 
  (* C_HAS_A = "1" *) 
  (* C_HAS_ACIN = "0" *) 
  (* C_HAS_ACOUT = "0" *) 
  (* C_HAS_B = "1" *) 
  (* C_HAS_BCIN = "0" *) 
  (* C_HAS_BCOUT = "0" *) 
  (* C_HAS_C = "0" *) 
  (* C_HAS_CARRYCASCIN = "0" *) 
  (* C_HAS_CARRYCASCOUT = "0" *) 
  (* C_HAS_CARRYIN = "0" *) 
  (* C_HAS_CARRYOUT = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_CEA = "0" *) 
  (* C_HAS_CEB = "0" *) 
  (* C_HAS_CEC = "0" *) 
  (* C_HAS_CECONCAT = "0" *) 
  (* C_HAS_CED = "0" *) 
  (* C_HAS_CEM = "0" *) 
  (* C_HAS_CEP = "0" *) 
  (* C_HAS_CESEL = "0" *) 
  (* C_HAS_CONCAT = "0" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_INDEP_CE = "0" *) 
  (* C_HAS_INDEP_SCLR = "0" *) 
  (* C_HAS_PCIN = "0" *) 
  (* C_HAS_PCOUT = "0" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SCLRA = "0" *) 
  (* C_HAS_SCLRB = "0" *) 
  (* C_HAS_SCLRC = "0" *) 
  (* C_HAS_SCLRCONCAT = "0" *) 
  (* C_HAS_SCLRD = "0" *) 
  (* C_HAS_SCLRM = "0" *) 
  (* C_HAS_SCLRP = "0" *) 
  (* C_HAS_SCLRSEL = "0" *) 
  (* C_LATENCY = "-1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_OPMODES = "000000000010010100000000" *) 
  (* C_P_LSB = "0" *) 
  (* C_P_MSB = "47" *) 
  (* C_REG_CONFIG = "00000000000011000011000001000100" *) 
  (* C_SEL_WIDTH = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "virtex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) 
  xbip_dsp48_macro_A18_B18_P48_NoRounding_xbip_dsp48_macro_v3_0_10 U0
       (.A(A),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_U0_ACOUT_UNCONNECTED[29:0]),
        .B(B),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_U0_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_U0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYOUT(NLW_U0_CARRYOUT_UNCONNECTED),
        .CE(CE),
        .CEA(1'b1),
        .CEA1(1'b1),
        .CEA2(1'b1),
        .CEA3(1'b1),
        .CEA4(1'b1),
        .CEB(1'b1),
        .CEB1(1'b1),
        .CEB2(1'b1),
        .CEB3(1'b1),
        .CEB4(1'b1),
        .CEC(1'b1),
        .CEC1(1'b1),
        .CEC2(1'b1),
        .CEC3(1'b1),
        .CEC4(1'b1),
        .CEC5(1'b1),
        .CECONCAT(1'b1),
        .CECONCAT3(1'b1),
        .CECONCAT4(1'b1),
        .CECONCAT5(1'b1),
        .CED(1'b1),
        .CED1(1'b1),
        .CED2(1'b1),
        .CED3(1'b1),
        .CEM(1'b1),
        .CEP(1'b1),
        .CESEL(1'b1),
        .CESEL1(1'b1),
        .CESEL2(1'b1),
        .CESEL3(1'b1),
        .CESEL4(1'b1),
        .CESEL5(1'b1),
        .CLK(CLK),
        .CONCAT({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_U0_PCOUT_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .SCLRA(1'b0),
        .SCLRB(1'b0),
        .SCLRC(1'b0),
        .SCLRCONCAT(1'b0),
        .SCLRD(1'b0),
        .SCLRM(1'b0),
        .SCLRP(1'b0),
        .SCLRSEL(1'b0),
        .SEL(1'b0));
endmodule

(* C_A_WIDTH = "18" *) (* C_B_WIDTH = "18" *) (* C_CONCAT_WIDTH = "48" *) 
(* C_CONSTANT_1 = "1" *) (* C_C_WIDTH = "48" *) (* C_D_WIDTH = "18" *) 
(* C_HAS_A = "1" *) (* C_HAS_ACIN = "0" *) (* C_HAS_ACOUT = "0" *) 
(* C_HAS_B = "1" *) (* C_HAS_BCIN = "0" *) (* C_HAS_BCOUT = "0" *) 
(* C_HAS_C = "0" *) (* C_HAS_CARRYCASCIN = "0" *) (* C_HAS_CARRYCASCOUT = "0" *) 
(* C_HAS_CARRYIN = "0" *) (* C_HAS_CARRYOUT = "0" *) (* C_HAS_CE = "1" *) 
(* C_HAS_CEA = "0" *) (* C_HAS_CEB = "0" *) (* C_HAS_CEC = "0" *) 
(* C_HAS_CECONCAT = "0" *) (* C_HAS_CED = "0" *) (* C_HAS_CEM = "0" *) 
(* C_HAS_CEP = "0" *) (* C_HAS_CESEL = "0" *) (* C_HAS_CONCAT = "0" *) 
(* C_HAS_D = "0" *) (* C_HAS_INDEP_CE = "0" *) (* C_HAS_INDEP_SCLR = "0" *) 
(* C_HAS_PCIN = "0" *) (* C_HAS_PCOUT = "0" *) (* C_HAS_SCLR = "1" *) 
(* C_HAS_SCLRA = "0" *) (* C_HAS_SCLRB = "0" *) (* C_HAS_SCLRC = "0" *) 
(* C_HAS_SCLRCONCAT = "0" *) (* C_HAS_SCLRD = "0" *) (* C_HAS_SCLRM = "0" *) 
(* C_HAS_SCLRP = "0" *) (* C_HAS_SCLRSEL = "0" *) (* C_LATENCY = "-1" *) 
(* C_MODEL_TYPE = "0" *) (* C_OPMODES = "000000000010010100000000" *) (* C_P_LSB = "0" *) 
(* C_P_MSB = "47" *) (* C_REG_CONFIG = "00000000000011000011000001000100" *) (* C_SEL_WIDTH = "0" *) 
(* C_TEST_CORE = "0" *) (* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "virtex7" *) 
(* ORIG_REF_NAME = "xbip_dsp48_macro_v3_0_10" *) (* downgradeipidentifiedwarnings = "yes" *) 
module xbip_dsp48_macro_A18_B18_P48_NoRounding_xbip_dsp48_macro_v3_0_10
   (CLK,
    CE,
    SCLR,
    SEL,
    CARRYCASCIN,
    CARRYIN,
    PCIN,
    ACIN,
    BCIN,
    A,
    B,
    C,
    D,
    CONCAT,
    ACOUT,
    BCOUT,
    CARRYOUT,
    CARRYCASCOUT,
    PCOUT,
    P,
    CED,
    CED1,
    CED2,
    CED3,
    CEA,
    CEA1,
    CEA2,
    CEA3,
    CEA4,
    CEB,
    CEB1,
    CEB2,
    CEB3,
    CEB4,
    CECONCAT,
    CECONCAT3,
    CECONCAT4,
    CECONCAT5,
    CEC,
    CEC1,
    CEC2,
    CEC3,
    CEC4,
    CEC5,
    CEM,
    CEP,
    CESEL,
    CESEL1,
    CESEL2,
    CESEL3,
    CESEL4,
    CESEL5,
    SCLRD,
    SCLRA,
    SCLRB,
    SCLRCONCAT,
    SCLRC,
    SCLRM,
    SCLRP,
    SCLRSEL);
  input CLK;
  input CE;
  input SCLR;
  input [0:0]SEL;
  input CARRYCASCIN;
  input CARRYIN;
  input [47:0]PCIN;
  input [29:0]ACIN;
  input [17:0]BCIN;
  input [17:0]A;
  input [17:0]B;
  input [47:0]C;
  input [17:0]D;
  input [47:0]CONCAT;
  output [29:0]ACOUT;
  output [17:0]BCOUT;
  output CARRYOUT;
  output CARRYCASCOUT;
  output [47:0]PCOUT;
  output [47:0]P;
  input CED;
  input CED1;
  input CED2;
  input CED3;
  input CEA;
  input CEA1;
  input CEA2;
  input CEA3;
  input CEA4;
  input CEB;
  input CEB1;
  input CEB2;
  input CEB3;
  input CEB4;
  input CECONCAT;
  input CECONCAT3;
  input CECONCAT4;
  input CECONCAT5;
  input CEC;
  input CEC1;
  input CEC2;
  input CEC3;
  input CEC4;
  input CEC5;
  input CEM;
  input CEP;
  input CESEL;
  input CESEL1;
  input CESEL2;
  input CESEL3;
  input CESEL4;
  input CESEL5;
  input SCLRD;
  input SCLRA;
  input SCLRB;
  input SCLRCONCAT;
  input SCLRC;
  input SCLRM;
  input SCLRP;
  input SCLRSEL;

  wire [17:0]A;
  wire [29:0]ACIN;
  wire [29:0]ACOUT;
  wire [17:0]B;
  wire [17:0]BCIN;
  wire [17:0]BCOUT;
  wire [47:0]C;
  wire CARRYCASCIN;
  wire CARRYCASCOUT;
  wire CARRYIN;
  wire CARRYOUT;
  wire CE;
  wire CEA;
  wire CEA1;
  wire CEA2;
  wire CEA3;
  wire CEA4;
  wire CEB;
  wire CEB1;
  wire CEB2;
  wire CEB3;
  wire CEB4;
  wire CEC;
  wire CEC1;
  wire CEC2;
  wire CEC3;
  wire CEC4;
  wire CEC5;
  wire CECONCAT;
  wire CECONCAT3;
  wire CECONCAT4;
  wire CECONCAT5;
  wire CED;
  wire CED1;
  wire CED2;
  wire CED3;
  wire CEM;
  wire CEP;
  wire CESEL;
  wire CESEL1;
  wire CESEL2;
  wire CESEL3;
  wire CESEL4;
  wire CESEL5;
  wire CLK;
  wire [47:0]CONCAT;
  wire [17:0]D;
  wire [47:0]P;
  wire [47:0]PCIN;
  wire [47:0]PCOUT;
  wire SCLR;
  wire SCLRA;
  wire SCLRB;
  wire SCLRC;
  wire SCLRCONCAT;
  wire SCLRD;
  wire SCLRM;
  wire SCLRP;
  wire SCLRSEL;
  wire [0:0]SEL;

  (* C_A_WIDTH = "18" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CONCAT_WIDTH = "48" *) 
  (* C_CONSTANT_1 = "1" *) 
  (* C_C_WIDTH = "48" *) 
  (* C_D_WIDTH = "18" *) 
  (* C_HAS_A = "1" *) 
  (* C_HAS_ACIN = "0" *) 
  (* C_HAS_ACOUT = "0" *) 
  (* C_HAS_B = "1" *) 
  (* C_HAS_BCIN = "0" *) 
  (* C_HAS_BCOUT = "0" *) 
  (* C_HAS_C = "0" *) 
  (* C_HAS_CARRYCASCIN = "0" *) 
  (* C_HAS_CARRYCASCOUT = "0" *) 
  (* C_HAS_CARRYIN = "0" *) 
  (* C_HAS_CARRYOUT = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_CEA = "0" *) 
  (* C_HAS_CEB = "0" *) 
  (* C_HAS_CEC = "0" *) 
  (* C_HAS_CECONCAT = "0" *) 
  (* C_HAS_CED = "0" *) 
  (* C_HAS_CEM = "0" *) 
  (* C_HAS_CEP = "0" *) 
  (* C_HAS_CESEL = "0" *) 
  (* C_HAS_CONCAT = "0" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_INDEP_CE = "0" *) 
  (* C_HAS_INDEP_SCLR = "0" *) 
  (* C_HAS_PCIN = "0" *) 
  (* C_HAS_PCOUT = "0" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SCLRA = "0" *) 
  (* C_HAS_SCLRB = "0" *) 
  (* C_HAS_SCLRC = "0" *) 
  (* C_HAS_SCLRCONCAT = "0" *) 
  (* C_HAS_SCLRD = "0" *) 
  (* C_HAS_SCLRM = "0" *) 
  (* C_HAS_SCLRP = "0" *) 
  (* C_HAS_SCLRSEL = "0" *) 
  (* C_LATENCY = "-1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_OPMODES = "000000000010010100000000" *) 
  (* C_P_LSB = "0" *) 
  (* C_P_MSB = "47" *) 
  (* C_REG_CONFIG = "00000000000011000011000001000100" *) 
  (* C_SEL_WIDTH = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "virtex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  xbip_dsp48_macro_A18_B18_P48_NoRounding_xbip_dsp48_macro_v3_0_10_viv i_synth
       (.A(A),
        .ACIN(ACIN),
        .ACOUT(ACOUT),
        .B(B),
        .BCIN(BCIN),
        .BCOUT(BCOUT),
        .C(C),
        .CARRYCASCIN(CARRYCASCIN),
        .CARRYCASCOUT(CARRYCASCOUT),
        .CARRYIN(CARRYIN),
        .CARRYOUT(CARRYOUT),
        .CE(CE),
        .CEA(CEA),
        .CEA1(CEA1),
        .CEA2(CEA2),
        .CEA3(CEA3),
        .CEA4(CEA4),
        .CEB(CEB),
        .CEB1(CEB1),
        .CEB2(CEB2),
        .CEB3(CEB3),
        .CEB4(CEB4),
        .CEC(CEC),
        .CEC1(CEC1),
        .CEC2(CEC2),
        .CEC3(CEC3),
        .CEC4(CEC4),
        .CEC5(CEC5),
        .CECONCAT(CECONCAT),
        .CECONCAT3(CECONCAT3),
        .CECONCAT4(CECONCAT4),
        .CECONCAT5(CECONCAT5),
        .CED(CED),
        .CED1(CED1),
        .CED2(CED2),
        .CED3(CED3),
        .CEM(CEM),
        .CEP(CEP),
        .CESEL(CESEL),
        .CESEL1(CESEL1),
        .CESEL2(CESEL2),
        .CESEL3(CESEL3),
        .CESEL4(CESEL4),
        .CESEL5(CESEL5),
        .CLK(CLK),
        .CONCAT(CONCAT),
        .D(D),
        .P(P),
        .PCIN(PCIN),
        .PCOUT(PCOUT),
        .SCLR(SCLR),
        .SCLRA(SCLRA),
        .SCLRB(SCLRB),
        .SCLRC(SCLRC),
        .SCLRCONCAT(SCLRCONCAT),
        .SCLRD(SCLRD),
        .SCLRM(SCLRM),
        .SCLRP(SCLRP),
        .SCLRSEL(SCLRSEL),
        .SEL(SEL));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`pragma protect key_block
VsinksLpJWI1tuaOI7h8aSORfn/+DW4FgGWyEDOqHNlVivfJQf+MdvTR8ppGqPOJph04UfQew3Tt
9UcXkhvcCQ==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
c+q7wFKp4PHZ99AOUXOfirVj8vjzVgTcROZi67zAuw/5nj1fUNd8IrtLm017VkcF7WHeCEaKQOit
7blqlCcFByKHzQZW2lCOHhJ9lEeJxJj967u6BCbISZhlKVikQBA8fKRVVZn0WvcMZn77lmVL7JTc
D8KSr6wy9yJwkkV+ppg=


`pragma protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
W2UVrope1p5WH2sS/2M7d2v+U87r5bZ1kcQCK80etZcsJN7glyuCz7NAnFVTiQhwq2JxwCBoVOEf
8BNELEM0HOxMWOFqPzWztADNCxArYYKM7CGbUSiNCCD4bdpKHBPHGPYVs4ePAKJGoVYgB8JAz9cG
Aa8RBN5Qx71Y9FxO58FCXPFCc6UTW26PNiGdlVOGG182Blnfw2zmLnNc/DXqiUa/NQKsDHrDwxHR
XPsvWVIUh6+IU5hYZZJwEqWBcm4bj4I16etHiYIe+EPeftbKa6UcdBWIzYmW0Bz2WOn7tCADIUpM
PifKVu5RzyoJjNiGbp9Z3S9dpTJynoDuBvID9w==


`pragma protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
h6rZV2rYxkx1Ra2F0CM6473N9Mzbp8xIWRu0//VbQefhQbOMXtTVTxhCItdVdR4EfFsRZVI7+nt7
9KJ7Um1ycu0Gx2wyjgWOmLlY2v62OYdx4w7yId4HA35a4yo2J6/kKJYlM00NmVziarFDB7al9/de
EwEjHKg7DQl0oyrlbvw=


`pragma protect key_keyowner = "Aldec", key_keyname= "ALDEC15_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
bv4R6oBTTV/Ekm8xZ5sZQat0BLfpO8TeLbF1+Xcd6TrfhzW5K3nQ80+HK8qvK6o6zcyKypall82o
bEISra9NsvpO17A/MNcMY8Jvt4J+nlPv2hZqLiR4f/Tau55kV3j+FopH6wzcicrl672uRYGgNBB6
wPEhmpqGHrIloK11m124q5xZEHCZmz+16YsroAgM8nfdm7r8dBytwyF5338RSeK8MlbvBR8kYUFx
f30JLB2q9/nlc57jD1fhdTsLKIaxFI6L/hh4l+vWb3d2FG0fW1mQJnB0omomUYLkfezFp/WkmP+X
JoEz3xpGC/PExNVEwJnGKnFX4uSp2hZRTx46Wg==


`pragma protect key_keyowner = "ATRENTA", key_keyname= "ATR-SG-2015-RSA-3", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
LSNZAyyvsFlTnG6tGAEv7pRHmgtMyJkEsbP6DfPx7YLChIw7VTeSUXKqKiSxcdFMzbEH6PVN5OXU
TOzOe4LQSB4VrDpMHU1iWuuQK5hU6V+wT9+NKx1cCF2+4zfr2alMgIb9PGOgArGsXYvJBEEKTH7v
SQ2wXjEs8OBK/1ScP8hDVuAAHMTRDlfU4a9W50nqxIHdJOzL5EPbQa2W1W3sEyJ51s0yVcASBMwH
b+rBsOhU6NgQuKQ6DQj9VNNr7myYq7PN/TIdYKSzLOuFMm7bG7gu7rUs7LtIxQeSI2Z4K70PKGJF
OVJKu6LUG9jJJXt7UlnU74Siw0CA/SX0KpbOOw==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
TPBzZ3DfHyDzhtGUqdtTJn3BljJFk4Lgaw421+3eKgKG10wVxzJZ+sVEb9OtQnHVlVL/2acxTZBc
i5GmjCpWczWeJoYRR2uwGuJw3GF0SKDFJHPChVhvz406VUfVAnmo393nrFGFH9ix9uuhAKQAokZj
WiJYv+H2G+IW0F1LsAkbQj9d2Jwv5cA4TUt5aLn4pZalY6zIxPnWwzGEjGqStRSK7LIU2c0gZ96h
URUuMpVqhVK2tNZYa2oQUKdJBAuLqP9bAt8D3ekinBR0vuXyl8ODJlZ+avYLftPIB+8yh8GUhxW8
iSFctm3olqgzjhwgFjfW/n0WMhlr1Kg13Uj+RQ==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
nCsRB/2XZsqVNiXl9zqKUQ/2Een8a1gHNM/aPhP1GBiKUgwhsXZzEVcuQRbp5O/XwBJ7wxXb5ogX
qUvWXKKnUKmOxMX/Rw6tHnCcxlM/WXnDE0NL7K+mc6Y9Csw0VlrXt1U2IpPj0qQlIeyMMENO6srN
Oe+diTx7OCQS28jwLvC4hrWazBzJRoGDCL9pWQD2lt5rnIO/u8WknlRXAdcn6ChEg4lHWGYZ/NdX
B4gq1A5ABRuRt+5SX8leLzPw75295YspUPugJQ1kngKcCJGZtpSQcTHxC/915BJDSMdWHG/mn0bL
/ZJGDGT8ukDUm2mA8EV+oxCHv03mc0Tljq+nFQ==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 6512)
`pragma protect data_block
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
N/1YLl1c7rlcjddUrrI=
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`pragma protect key_block
VsinksLpJWI1tuaOI7h8aSORfn/+DW4FgGWyEDOqHNlVivfJQf+MdvTR8ppGqPOJph04UfQew3Tt
9UcXkhvcCQ==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
c+q7wFKp4PHZ99AOUXOfirVj8vjzVgTcROZi67zAuw/5nj1fUNd8IrtLm017VkcF7WHeCEaKQOit
7blqlCcFByKHzQZW2lCOHhJ9lEeJxJj967u6BCbISZhlKVikQBA8fKRVVZn0WvcMZn77lmVL7JTc
D8KSr6wy9yJwkkV+ppg=


`pragma protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
W2UVrope1p5WH2sS/2M7d2v+U87r5bZ1kcQCK80etZcsJN7glyuCz7NAnFVTiQhwq2JxwCBoVOEf
8BNELEM0HOxMWOFqPzWztADNCxArYYKM7CGbUSiNCCD4bdpKHBPHGPYVs4ePAKJGoVYgB8JAz9cG
Aa8RBN5Qx71Y9FxO58FCXPFCc6UTW26PNiGdlVOGG182Blnfw2zmLnNc/DXqiUa/NQKsDHrDwxHR
XPsvWVIUh6+IU5hYZZJwEqWBcm4bj4I16etHiYIe+EPeftbKa6UcdBWIzYmW0Bz2WOn7tCADIUpM
PifKVu5RzyoJjNiGbp9Z3S9dpTJynoDuBvID9w==


`pragma protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
h6rZV2rYxkx1Ra2F0CM6473N9Mzbp8xIWRu0//VbQefhQbOMXtTVTxhCItdVdR4EfFsRZVI7+nt7
9KJ7Um1ycu0Gx2wyjgWOmLlY2v62OYdx4w7yId4HA35a4yo2J6/kKJYlM00NmVziarFDB7al9/de
EwEjHKg7DQl0oyrlbvw=


`pragma protect key_keyowner = "Aldec", key_keyname= "ALDEC15_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
bv4R6oBTTV/Ekm8xZ5sZQat0BLfpO8TeLbF1+Xcd6TrfhzW5K3nQ80+HK8qvK6o6zcyKypall82o
bEISra9NsvpO17A/MNcMY8Jvt4J+nlPv2hZqLiR4f/Tau55kV3j+FopH6wzcicrl672uRYGgNBB6
wPEhmpqGHrIloK11m124q5xZEHCZmz+16YsroAgM8nfdm7r8dBytwyF5338RSeK8MlbvBR8kYUFx
f30JLB2q9/nlc57jD1fhdTsLKIaxFI6L/hh4l+vWb3d2FG0fW1mQJnB0omomUYLkfezFp/WkmP+X
JoEz3xpGC/PExNVEwJnGKnFX4uSp2hZRTx46Wg==


`pragma protect key_keyowner = "ATRENTA", key_keyname= "ATR-SG-2015-RSA-3", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
LSNZAyyvsFlTnG6tGAEv7pRHmgtMyJkEsbP6DfPx7YLChIw7VTeSUXKqKiSxcdFMzbEH6PVN5OXU
TOzOe4LQSB4VrDpMHU1iWuuQK5hU6V+wT9+NKx1cCF2+4zfr2alMgIb9PGOgArGsXYvJBEEKTH7v
SQ2wXjEs8OBK/1ScP8hDVuAAHMTRDlfU4a9W50nqxIHdJOzL5EPbQa2W1W3sEyJ51s0yVcASBMwH
b+rBsOhU6NgQuKQ6DQj9VNNr7myYq7PN/TIdYKSzLOuFMm7bG7gu7rUs7LtIxQeSI2Z4K70PKGJF
OVJKu6LUG9jJJXt7UlnU74Siw0CA/SX0KpbOOw==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
TPBzZ3DfHyDzhtGUqdtTJn3BljJFk4Lgaw421+3eKgKG10wVxzJZ+sVEb9OtQnHVlVL/2acxTZBc
i5GmjCpWczWeJoYRR2uwGuJw3GF0SKDFJHPChVhvz406VUfVAnmo393nrFGFH9ix9uuhAKQAokZj
WiJYv+H2G+IW0F1LsAkbQj9d2Jwv5cA4TUt5aLn4pZalY6zIxPnWwzGEjGqStRSK7LIU2c0gZ96h
URUuMpVqhVK2tNZYa2oQUKdJBAuLqP9bAt8D3ekinBR0vuXyl8ODJlZ+avYLftPIB+8yh8GUhxW8
iSFctm3olqgzjhwgFjfW/n0WMhlr1Kg13Uj+RQ==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
nCsRB/2XZsqVNiXl9zqKUQ/2Een8a1gHNM/aPhP1GBiKUgwhsXZzEVcuQRbp5O/XwBJ7wxXb5ogX
qUvWXKKnUKmOxMX/Rw6tHnCcxlM/WXnDE0NL7K+mc6Y9Csw0VlrXt1U2IpPj0qQlIeyMMENO6srN
Oe+diTx7OCQS28jwLvC4hrWazBzJRoGDCL9pWQD2lt5rnIO/u8WknlRXAdcn6ChEg4lHWGYZ/NdX
B4gq1A5ABRuRt+5SX8leLzPw75295YspUPugJQ1kngKcCJGZtpSQcTHxC/915BJDSMdWHG/mn0bL
/ZJGDGT8ukDUm2mA8EV+oxCHv03mc0Tljq+nFQ==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 3840)
`pragma protect data_block
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
pf6WCxH9o+DLbALIs5PRvxSAdXZL
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`pragma protect key_block
VsinksLpJWI1tuaOI7h8aSORfn/+DW4FgGWyEDOqHNlVivfJQf+MdvTR8ppGqPOJph04UfQew3Tt
9UcXkhvcCQ==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
c+q7wFKp4PHZ99AOUXOfirVj8vjzVgTcROZi67zAuw/5nj1fUNd8IrtLm017VkcF7WHeCEaKQOit
7blqlCcFByKHzQZW2lCOHhJ9lEeJxJj967u6BCbISZhlKVikQBA8fKRVVZn0WvcMZn77lmVL7JTc
D8KSr6wy9yJwkkV+ppg=


`pragma protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
W2UVrope1p5WH2sS/2M7d2v+U87r5bZ1kcQCK80etZcsJN7glyuCz7NAnFVTiQhwq2JxwCBoVOEf
8BNELEM0HOxMWOFqPzWztADNCxArYYKM7CGbUSiNCCD4bdpKHBPHGPYVs4ePAKJGoVYgB8JAz9cG
Aa8RBN5Qx71Y9FxO58FCXPFCc6UTW26PNiGdlVOGG182Blnfw2zmLnNc/DXqiUa/NQKsDHrDwxHR
XPsvWVIUh6+IU5hYZZJwEqWBcm4bj4I16etHiYIe+EPeftbKa6UcdBWIzYmW0Bz2WOn7tCADIUpM
PifKVu5RzyoJjNiGbp9Z3S9dpTJynoDuBvID9w==


`pragma protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
h6rZV2rYxkx1Ra2F0CM6473N9Mzbp8xIWRu0//VbQefhQbOMXtTVTxhCItdVdR4EfFsRZVI7+nt7
9KJ7Um1ycu0Gx2wyjgWOmLlY2v62OYdx4w7yId4HA35a4yo2J6/kKJYlM00NmVziarFDB7al9/de
EwEjHKg7DQl0oyrlbvw=


`pragma protect key_keyowner = "Aldec", key_keyname= "ALDEC15_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
bv4R6oBTTV/Ekm8xZ5sZQat0BLfpO8TeLbF1+Xcd6TrfhzW5K3nQ80+HK8qvK6o6zcyKypall82o
bEISra9NsvpO17A/MNcMY8Jvt4J+nlPv2hZqLiR4f/Tau55kV3j+FopH6wzcicrl672uRYGgNBB6
wPEhmpqGHrIloK11m124q5xZEHCZmz+16YsroAgM8nfdm7r8dBytwyF5338RSeK8MlbvBR8kYUFx
f30JLB2q9/nlc57jD1fhdTsLKIaxFI6L/hh4l+vWb3d2FG0fW1mQJnB0omomUYLkfezFp/WkmP+X
JoEz3xpGC/PExNVEwJnGKnFX4uSp2hZRTx46Wg==


`pragma protect key_keyowner = "ATRENTA", key_keyname= "ATR-SG-2015-RSA-3", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
LSNZAyyvsFlTnG6tGAEv7pRHmgtMyJkEsbP6DfPx7YLChIw7VTeSUXKqKiSxcdFMzbEH6PVN5OXU
TOzOe4LQSB4VrDpMHU1iWuuQK5hU6V+wT9+NKx1cCF2+4zfr2alMgIb9PGOgArGsXYvJBEEKTH7v
SQ2wXjEs8OBK/1ScP8hDVuAAHMTRDlfU4a9W50nqxIHdJOzL5EPbQa2W1W3sEyJ51s0yVcASBMwH
b+rBsOhU6NgQuKQ6DQj9VNNr7myYq7PN/TIdYKSzLOuFMm7bG7gu7rUs7LtIxQeSI2Z4K70PKGJF
OVJKu6LUG9jJJXt7UlnU74Siw0CA/SX0KpbOOw==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
TPBzZ3DfHyDzhtGUqdtTJn3BljJFk4Lgaw421+3eKgKG10wVxzJZ+sVEb9OtQnHVlVL/2acxTZBc
i5GmjCpWczWeJoYRR2uwGuJw3GF0SKDFJHPChVhvz406VUfVAnmo393nrFGFH9ix9uuhAKQAokZj
WiJYv+H2G+IW0F1LsAkbQj9d2Jwv5cA4TUt5aLn4pZalY6zIxPnWwzGEjGqStRSK7LIU2c0gZ96h
URUuMpVqhVK2tNZYa2oQUKdJBAuLqP9bAt8D3ekinBR0vuXyl8ODJlZ+avYLftPIB+8yh8GUhxW8
iSFctm3olqgzjhwgFjfW/n0WMhlr1Kg13Uj+RQ==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
nCsRB/2XZsqVNiXl9zqKUQ/2Een8a1gHNM/aPhP1GBiKUgwhsXZzEVcuQRbp5O/XwBJ7wxXb5ogX
qUvWXKKnUKmOxMX/Rw6tHnCcxlM/WXnDE0NL7K+mc6Y9Csw0VlrXt1U2IpPj0qQlIeyMMENO6srN
Oe+diTx7OCQS28jwLvC4hrWazBzJRoGDCL9pWQD2lt5rnIO/u8WknlRXAdcn6ChEg4lHWGYZ/NdX
B4gq1A5ABRuRt+5SX8leLzPw75295YspUPugJQ1kngKcCJGZtpSQcTHxC/915BJDSMdWHG/mn0bL
/ZJGDGT8ukDUm2mA8EV+oxCHv03mc0Tljq+nFQ==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20096)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
