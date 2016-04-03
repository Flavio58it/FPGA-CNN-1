// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.3 (lin64) Build 1368829 Mon Sep 28 20:06:39 MDT 2015
// Date        : Mon Mar 14 11:50:04 2016
// Host        : edcn103-pc running 64-bit Ubuntu 14.04.4 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/edcn103/Dropbox/M.tech/Project/Hardware_Implementation/ConvEngine/ConvEngine.srcs/sources_1/ip/xbip_dsp48_macro_A18_B18_Output34_SimpleRoundingOf14Bits/xbip_dsp48_macro_A18_B18_Output34_SimpleRoundingOf14Bits_sim_netlist.v
// Design      : xbip_dsp48_macro_A18_B18_Output34_SimpleRoundingOf14Bits
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7vx485tffg1761-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "xbip_dsp48_macro_A18_B18_Output34_SimpleRoundingOf14Bits,xbip_dsp48_macro_v3_0_10,{}" *) (* core_generation_info = "xbip_dsp48_macro_A18_B18_Output34_SimpleRoundingOf14Bits,xbip_dsp48_macro_v3_0_10,{x_ipProduct=Vivado 2015.3,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=xbip_dsp48_macro,x_ipVersion=3.0,x_ipCoreRevision=10,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_XDEVICEFAMILY=virtex7,C_HAS_CE=1,C_HAS_INDEP_CE=0,C_HAS_CED=0,C_HAS_CEA=0,C_HAS_CEB=0,C_HAS_CEC=0,C_HAS_CECONCAT=0,C_HAS_CEM=0,C_HAS_CEP=0,C_HAS_CESEL=0,C_HAS_SCLR=1,C_HAS_INDEP_SCLR=1,C_HAS_SCLRD=0,C_HAS_SCLRA=0,C_HAS_SCLRB=0,C_HAS_SCLRC=0,C_HAS_SCLRM=0,C_HAS_SCLRP=1,C_HAS_SCLRCONCAT=0,C_HAS_SCLRSEL=0,C_HAS_CARRYCASCIN=0,C_HAS_CARRYIN=0,C_HAS_ACIN=0,C_HAS_BCIN=0,C_HAS_PCIN=1,C_HAS_A=1,C_HAS_B=1,C_HAS_D=0,C_HAS_CONCAT=0,C_HAS_C=0,C_A_WIDTH=18,C_B_WIDTH=18,C_C_WIDTH=48,C_D_WIDTH=18,C_CONCAT_WIDTH=48,C_P_MSB=47,C_P_LSB=14,C_SEL_WIDTH=1,C_HAS_ACOUT=0,C_HAS_BCOUT=0,C_HAS_CARRYCASCOUT=0,C_HAS_CARRYOUT=0,C_HAS_PCOUT=1,C_CONSTANT_1=1,C_LATENCY=-1,C_OPMODES=000000000010010100000000_000000000001111001000000,C_REG_CONFIG=00000000000011000111000101100100,C_TEST_CORE=0}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "xbip_dsp48_macro_v3_0_10,Vivado 2015.3" *) 
(* NotValidForBitStream *)
module xbip_dsp48_macro_A18_B18_Output34_SimpleRoundingOf14Bits
   (CLK,
    CE,
    SEL,
    PCIN,
    A,
    B,
    PCOUT,
    P,
    SCLRP);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 sel_intf DATA" *) input [0:0]SEL;
  (* x_interface_info = "xilinx.com:signal:data:1.0 pcin_intf DATA" *) input [47:0]PCIN;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [17:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [17:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 pcout_intf DATA" *) output [47:0]PCOUT;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) output [33:0]P;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclrp_intf RST" *) input SCLRP;

  wire [17:0]A;
  wire [17:0]B;
  wire CE;
  wire CLK;
  wire [33:0]P;
  wire [47:0]PCIN;
  wire [47:0]PCOUT;
  wire SCLRP;
  wire [0:0]SEL;
  wire NLW_U0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_U0_CARRYOUT_UNCONNECTED;
  wire [29:0]NLW_U0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_U0_BCOUT_UNCONNECTED;

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
  (* C_HAS_INDEP_SCLR = "1" *) 
  (* C_HAS_PCIN = "1" *) 
  (* C_HAS_PCOUT = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SCLRA = "0" *) 
  (* C_HAS_SCLRB = "0" *) 
  (* C_HAS_SCLRC = "0" *) 
  (* C_HAS_SCLRCONCAT = "0" *) 
  (* C_HAS_SCLRD = "0" *) 
  (* C_HAS_SCLRM = "0" *) 
  (* C_HAS_SCLRP = "1" *) 
  (* C_HAS_SCLRSEL = "0" *) 
  (* C_LATENCY = "-1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_OPMODES = "000000000010010100000000,000000000001111001000000" *) 
  (* C_P_LSB = "14" *) 
  (* C_P_MSB = "47" *) 
  (* C_REG_CONFIG = "00000000000011000111000101100100" *) 
  (* C_SEL_WIDTH = "1" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "virtex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_interface_info = "xilinx.com:signal:data:1.0 pcout_intf DATA" *) 
  xbip_dsp48_macro_A18_B18_Output34_SimpleRoundingOf14Bits_xbip_dsp48_macro_v3_0_10 U0
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
        .PCIN(PCIN),
        .PCOUT(PCOUT),
        .SCLR(1'b0),
        .SCLRA(1'b0),
        .SCLRB(1'b0),
        .SCLRC(1'b0),
        .SCLRCONCAT(1'b0),
        .SCLRD(1'b0),
        .SCLRM(1'b0),
        .SCLRP(SCLRP),
        .SCLRSEL(1'b0),
        .SEL(SEL));
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
(* C_HAS_D = "0" *) (* C_HAS_INDEP_CE = "0" *) (* C_HAS_INDEP_SCLR = "1" *) 
(* C_HAS_PCIN = "1" *) (* C_HAS_PCOUT = "1" *) (* C_HAS_SCLR = "1" *) 
(* C_HAS_SCLRA = "0" *) (* C_HAS_SCLRB = "0" *) (* C_HAS_SCLRC = "0" *) 
(* C_HAS_SCLRCONCAT = "0" *) (* C_HAS_SCLRD = "0" *) (* C_HAS_SCLRM = "0" *) 
(* C_HAS_SCLRP = "1" *) (* C_HAS_SCLRSEL = "0" *) (* C_LATENCY = "-1" *) 
(* C_MODEL_TYPE = "0" *) (* C_OPMODES = "000000000010010100000000,000000000001111001000000" *) (* C_P_LSB = "14" *) 
(* C_P_MSB = "47" *) (* C_REG_CONFIG = "00000000000011000111000101100100" *) (* C_SEL_WIDTH = "1" *) 
(* C_TEST_CORE = "0" *) (* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "virtex7" *) 
(* ORIG_REF_NAME = "xbip_dsp48_macro_v3_0_10" *) (* downgradeipidentifiedwarnings = "yes" *) 
module xbip_dsp48_macro_A18_B18_Output34_SimpleRoundingOf14Bits_xbip_dsp48_macro_v3_0_10
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
  output [33:0]P;
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
  wire [33:0]P;
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
  (* C_HAS_INDEP_SCLR = "1" *) 
  (* C_HAS_PCIN = "1" *) 
  (* C_HAS_PCOUT = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SCLRA = "0" *) 
  (* C_HAS_SCLRB = "0" *) 
  (* C_HAS_SCLRC = "0" *) 
  (* C_HAS_SCLRCONCAT = "0" *) 
  (* C_HAS_SCLRD = "0" *) 
  (* C_HAS_SCLRM = "0" *) 
  (* C_HAS_SCLRP = "1" *) 
  (* C_HAS_SCLRSEL = "0" *) 
  (* C_LATENCY = "-1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_OPMODES = "000000000010010100000000,000000000001111001000000" *) 
  (* C_P_LSB = "14" *) 
  (* C_P_MSB = "47" *) 
  (* C_REG_CONFIG = "00000000000011000111000101100100" *) 
  (* C_SEL_WIDTH = "1" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "virtex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  xbip_dsp48_macro_A18_B18_Output34_SimpleRoundingOf14Bits_xbip_dsp48_macro_v3_0_10_viv i_synth
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
K28h6SRHeqjjwrDPZv3tW+OTyDsNdAoBdDgDetijXskZispAEfwLDh+zueXBLYf8tyo4Fld0eOde
Tvnkuna5+XO+s85F3L9NazeSz4eUNZ5cDZH0U0olBudhtPzDwHLz72y4xw2drpxrDJdNaSTkIxsD
V5X06eFYniC0X9Tgi3DjUmUoU9jax1mz/HG3nlE8QcKMCHyS39sqA1MtE+5tmmZRROSkL+cm7hYE
cBXtQpuUQ1aZyBeE969Bbi4h4k8gSXW7WLyGtHk+VZNGqV7NsPp1ixcWxl1C4Tnk127vStdMxemm
/L6ijn9eIjiXyVEke9i5Im2yEOgHYXh2ytxP4w==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
WAcd0k3wRqtDdZcR4TRs4/DMKefKh+F/5VyvinQrnF5tUY9JVva+h/srptX6J624hUel0f11foOE
ex196h6gYkN6Rd1kswk0Arom5LYa/XnfICtQedekVgyKS5uGscWYV6ijr4NlQ4VNDa9/5Jr2LoQO
Ep1lzzyovMRDUiC10j0MLqpQk9cqjmbPq7oewE1B/feEpDeMDWkOhc01lGVIGKeIGTkRbFVzE4ON
iM/NMFp3zNitTyy2mS636kJMqOedZV1TzdPO7fSJXLnIPDQBAhZYfk4S6tkyPwFQW1lyhbTp/zN/
CC21XVT10xuysSqHrvdZ7D/KVJ97tAv32/23vQ==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7120)
`pragma protect data_block
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
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
K28h6SRHeqjjwrDPZv3tW+OTyDsNdAoBdDgDetijXskZispAEfwLDh+zueXBLYf8tyo4Fld0eOde
Tvnkuna5+XO+s85F3L9NazeSz4eUNZ5cDZH0U0olBudhtPzDwHLz72y4xw2drpxrDJdNaSTkIxsD
V5X06eFYniC0X9Tgi3DjUmUoU9jax1mz/HG3nlE8QcKMCHyS39sqA1MtE+5tmmZRROSkL+cm7hYE
cBXtQpuUQ1aZyBeE969Bbi4h4k8gSXW7WLyGtHk+VZNGqV7NsPp1ixcWxl1C4Tnk127vStdMxemm
/L6ijn9eIjiXyVEke9i5Im2yEOgHYXh2ytxP4w==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
WAcd0k3wRqtDdZcR4TRs4/DMKefKh+F/5VyvinQrnF5tUY9JVva+h/srptX6J624hUel0f11foOE
ex196h6gYkN6Rd1kswk0Arom5LYa/XnfICtQedekVgyKS5uGscWYV6ijr4NlQ4VNDa9/5Jr2LoQO
Ep1lzzyovMRDUiC10j0MLqpQk9cqjmbPq7oewE1B/feEpDeMDWkOhc01lGVIGKeIGTkRbFVzE4ON
iM/NMFp3zNitTyy2mS636kJMqOedZV1TzdPO7fSJXLnIPDQBAhZYfk4S6tkyPwFQW1lyhbTp/zN/
CC21XVT10xuysSqHrvdZ7D/KVJ97tAv32/23vQ==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 3808)
`pragma protect data_block
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
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
K28h6SRHeqjjwrDPZv3tW+OTyDsNdAoBdDgDetijXskZispAEfwLDh+zueXBLYf8tyo4Fld0eOde
Tvnkuna5+XO+s85F3L9NazeSz4eUNZ5cDZH0U0olBudhtPzDwHLz72y4xw2drpxrDJdNaSTkIxsD
V5X06eFYniC0X9Tgi3DjUmUoU9jax1mz/HG3nlE8QcKMCHyS39sqA1MtE+5tmmZRROSkL+cm7hYE
cBXtQpuUQ1aZyBeE969Bbi4h4k8gSXW7WLyGtHk+VZNGqV7NsPp1ixcWxl1C4Tnk127vStdMxemm
/L6ijn9eIjiXyVEke9i5Im2yEOgHYXh2ytxP4w==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
WAcd0k3wRqtDdZcR4TRs4/DMKefKh+F/5VyvinQrnF5tUY9JVva+h/srptX6J624hUel0f11foOE
ex196h6gYkN6Rd1kswk0Arom5LYa/XnfICtQedekVgyKS5uGscWYV6ijr4NlQ4VNDa9/5Jr2LoQO
Ep1lzzyovMRDUiC10j0MLqpQk9cqjmbPq7oewE1B/feEpDeMDWkOhc01lGVIGKeIGTkRbFVzE4ON
iM/NMFp3zNitTyy2mS636kJMqOedZV1TzdPO7fSJXLnIPDQBAhZYfk4S6tkyPwFQW1lyhbTp/zN/
CC21XVT10xuysSqHrvdZ7D/KVJ97tAv32/23vQ==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21168)
`pragma protect data_block
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
UEYQb4lVFRPAysUomXk0xeUFet2N
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
