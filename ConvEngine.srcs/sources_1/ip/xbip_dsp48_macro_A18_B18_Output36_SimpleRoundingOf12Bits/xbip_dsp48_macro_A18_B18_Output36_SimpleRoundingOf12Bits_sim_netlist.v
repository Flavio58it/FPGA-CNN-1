// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.3 (lin64) Build 1368829 Mon Sep 28 20:06:39 MDT 2015
// Date        : Mon Mar 14 11:51:44 2016
// Host        : edcn103-pc running 64-bit Ubuntu 14.04.4 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/edcn103/Dropbox/M.tech/Project/Hardware_Implementation/ConvEngine/ConvEngine.srcs/sources_1/ip/xbip_dsp48_macro_A18_B18_Output36_SimpleRoundingOf12Bits/xbip_dsp48_macro_A18_B18_Output36_SimpleRoundingOf12Bits_sim_netlist.v
// Design      : xbip_dsp48_macro_A18_B18_Output36_SimpleRoundingOf12Bits
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7vx485tffg1761-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "xbip_dsp48_macro_A18_B18_Output36_SimpleRoundingOf12Bits,xbip_dsp48_macro_v3_0_10,{}" *) (* core_generation_info = "xbip_dsp48_macro_A18_B18_Output36_SimpleRoundingOf12Bits,xbip_dsp48_macro_v3_0_10,{x_ipProduct=Vivado 2015.3,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=xbip_dsp48_macro,x_ipVersion=3.0,x_ipCoreRevision=10,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_VERBOSITY=0,C_MODEL_TYPE=0,C_XDEVICEFAMILY=virtex7,C_HAS_CE=1,C_HAS_INDEP_CE=0,C_HAS_CED=0,C_HAS_CEA=0,C_HAS_CEB=0,C_HAS_CEC=0,C_HAS_CECONCAT=0,C_HAS_CEM=0,C_HAS_CEP=0,C_HAS_CESEL=0,C_HAS_SCLR=1,C_HAS_INDEP_SCLR=1,C_HAS_SCLRD=0,C_HAS_SCLRA=0,C_HAS_SCLRB=0,C_HAS_SCLRC=0,C_HAS_SCLRM=0,C_HAS_SCLRP=1,C_HAS_SCLRCONCAT=0,C_HAS_SCLRSEL=0,C_HAS_CARRYCASCIN=0,C_HAS_CARRYIN=0,C_HAS_ACIN=0,C_HAS_BCIN=0,C_HAS_PCIN=1,C_HAS_A=1,C_HAS_B=1,C_HAS_D=0,C_HAS_CONCAT=0,C_HAS_C=0,C_A_WIDTH=18,C_B_WIDTH=18,C_C_WIDTH=48,C_D_WIDTH=18,C_CONCAT_WIDTH=48,C_P_MSB=47,C_P_LSB=12,C_SEL_WIDTH=1,C_HAS_ACOUT=0,C_HAS_BCOUT=0,C_HAS_CARRYCASCOUT=0,C_HAS_CARRYOUT=0,C_HAS_PCOUT=1,C_CONSTANT_1=1,C_LATENCY=-1,C_OPMODES=000000000010010100000000_000000000001111001000000,C_REG_CONFIG=00000000000011000111000101100100,C_TEST_CORE=0}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "xbip_dsp48_macro_v3_0_10,Vivado 2015.3" *) 
(* NotValidForBitStream *)
module xbip_dsp48_macro_A18_B18_Output36_SimpleRoundingOf12Bits
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
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) output [35:0]P;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclrp_intf RST" *) input SCLRP;

  wire [17:0]A;
  wire [17:0]B;
  wire CE;
  wire CLK;
  wire [35:0]P;
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
  (* C_P_LSB = "12" *) 
  (* C_P_MSB = "47" *) 
  (* C_REG_CONFIG = "00000000000011000111000101100100" *) 
  (* C_SEL_WIDTH = "1" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "virtex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* x_interface_info = "xilinx.com:signal:data:1.0 pcout_intf DATA" *) 
  xbip_dsp48_macro_A18_B18_Output36_SimpleRoundingOf12Bits_xbip_dsp48_macro_v3_0_10 U0
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
(* C_MODEL_TYPE = "0" *) (* C_OPMODES = "000000000010010100000000,000000000001111001000000" *) (* C_P_LSB = "12" *) 
(* C_P_MSB = "47" *) (* C_REG_CONFIG = "00000000000011000111000101100100" *) (* C_SEL_WIDTH = "1" *) 
(* C_TEST_CORE = "0" *) (* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "virtex7" *) 
(* ORIG_REF_NAME = "xbip_dsp48_macro_v3_0_10" *) (* downgradeipidentifiedwarnings = "yes" *) 
module xbip_dsp48_macro_A18_B18_Output36_SimpleRoundingOf12Bits_xbip_dsp48_macro_v3_0_10
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
  output [35:0]P;
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
  wire [35:0]P;
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
  (* C_P_LSB = "12" *) 
  (* C_P_MSB = "47" *) 
  (* C_REG_CONFIG = "00000000000011000111000101100100" *) 
  (* C_SEL_WIDTH = "1" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "virtex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  xbip_dsp48_macro_A18_B18_Output36_SimpleRoundingOf12Bits_xbip_dsp48_macro_v3_0_10_viv i_synth
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
CwCBX2a8bfHflon2aXG8vAF3udkY7cryTb4W16qI9xQU0voVYbgVPCo/x11ziyaywAQezKuW1qY+
WnV0T84tXJEVW8I5lok7ldEXiD3KpTOg9reAfz48WjOfGntES6YiFPascTy4qbTfwmilc+PcPnXZ
d0L+cUT2szmQ9UuxjyjV0p8CMSpdDrsFLYWKcERGIIm25ku45b1IEP2f+hbuJMos+OJun7xXRbo3
swcBE7CXpwhzsRDuVnTKITqnT4O4hbMRpqShxZVjciMS7oqFUIERsKOmACK6ILpSdgPAz0sjUNnQ
cusaY0Fyqzh5opYjWx6aRBNe00ntJp0yGLyXPg==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
oL1UdinIWZb3IQyQMAl6E883EunCqxL6gk9Yatbfpz8uJc6x0De/5RLbw4rid/KZqljuh/VybHqH
n4DRilf019M9KD+HAzVgZWSMKh/8x6QCtSHxMF8MJe279DdwHKePPYe0hQgETcr2afI41P7r6LxS
+vxxQNK065SPjOyNlrAq9Cc5oGWl7gEReHH0rfhQ4+B3Unb2Q9ZsycD0KeaLbcvekmnVXenG2zey
krLY1yn/DlDSwdrP6fLkOxnMQRAMpebFlNRSawyRJ7O/2jV1WJHcNdi6t2nvqCZ+416XuKAVXawd
akEbXB3deD874AhddzTIOpBlcY1lPTDLm39hvg==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7120)
`pragma protect data_block
im+9rBzXDPDmXk3oENymZC5BVYjJaoGVLttoHIOAtE43beCssBTIvu2LMF4SCKubWXm1y2EX9TRW
6Ltw8EO1ouJ3yOQbD9PZkNM7heqDXWuBJpHKiIhc9Hd+G4/EpQ3ZB0I3+f1lric/J5/SKedgbW0a
SZPBQrLTdLBsBF971iiQEgGSWDUjxAb6hIsj290VRQ8X7XcI11ineWVov4o3mX++IXfNcg5m1xoq
rlxQZqunN78UOo03q6zm8GGfBy2YJrGk4ZatBUpsbMJNwSQguIRLPQ1piLm/RglsyNU6yLA71nkM
gpS50p/5K0p+abLVF3Xta2NGwKHz83GprAYHIlm9rvGQ9vtMAHaJLijQ91/iSEYVReufiJTMxOkd
bc2wOrcOKCkJrkEqR6bZCIP44JYuftyrlvxpp6YUqSMxg0TT8uBiL+fRKJ3r89oW2xQArJTvqnHA
+pxsWso/uL+DyJnplmarAlb2N7BpdFRg5WQVCxhD80puShZyDKiNsX8zRUsvepL04XvXxdBghIy+
WyF5yAEXR30Ck//VRA9cyrkKe16bOCcCdDHIi0Prx/+zxDX21EEPzB+Q2ZRi4pSe1+QQWya4ecqp
BaBu0gKWVdHjfftipU1Xn6LUb3motxLbACskbbyiU/7RNlS28fIvbeIQsgBqZSLT9CtRbGtXW5++
Y4CWYQHoqA8RrtyZziB6VU/EV5+9UYZnWQ4e3appRJ8aMmfSjpGvaJY5viSWwWu9SvH8MTMKGD46
UFrL2Ewk9i1YwR2J0qIAoHZ3qXWBJA9yACkyU8R97kSvDp/c7bI09Nu3Bh+J5IO6Wi5Xb9B653xb
eO1kSotIkMQVS2M6k+8j6Qkd8gOpPltrMQ8Sq7E//oHJ78yfLkmcWdMfHggFYtkMJMlmI/KK5cUX
58gnZ9M5jdV2UEZ5f/1zo9qZ5OG6uIanD9WE2cvLUM/g2y16/OzeSC5ExUOcOilJPhWg1cUydMql
89+CLUs6uwmK16fqqlUz3MTvFLda7B+9rKV8VuJrGXRvXkyonZCFbEWKimcZ5hsGHqEDHXED96W0
1/Ve/marzuJgov0fhR7f7MTTmxy0LIhQVfZVq7OuyHrMZkXfHCrBGTrvDLCKrsB/B75yhTLD8TrE
HunSAWw1eMLkT/nx+GhVNAZNsJr5/Y9PAas2ZbRYUx7BFY5QLcxjG066hCvV88Gr2yoOOxZ85Q9y
BMS3Grmf7j5Hg062ZEpSOsKDZWpFAbvXBraDh9cpKquzbdiglOVTn5NzGAsnjx49PNJJtkh8jzjl
GIbPzllCT8emA+fRZ9kKedojhusqI6tGytCwRANGbtsBi9ANOiS6ux+iTklKUk5ORperFI3e+mix
ZeXhDLlKubHUJ+YGbgjKJRGmO1XAzRmwleVGzCl9fEPQxC6Trx/sX3yh9YzEV8tT9zVmU2Zk/hZO
zptD0KaVFvynYyHR2eoZVARSdB2f+zQn8ej2MxbZUdqait0NYWThyxqEi/KArMIiu3zmmFJsgl7c
RaHRbedTNH2uUYg9mWglVGf0ITbni2hW255wulcZZw+wowH/JQnAD3sQhlvxDVhaE6fB3YXGKVhJ
7gN4DG9U0lG6iCaya9n3tRICFWXUH7BI8LKyNoQOzNRqvHxqGzTz2oNogq0fjVGk6h1+NkyKyJdH
j/8HPRS5HFaHGVZP8NTOnwLPSttxZLgfl6Ky6E3rdApR/tkissMZtJzWn601XFkXvLvqJ83AAH+l
zJWb3ZY/Kj28eGknZMZPPKr70lsdrWzDyZMDZVvniA0T7NnaYXSLq/baySrnZ6h0gU4+N74S0agu
zbZAkajhsPcehgzZDfvfBkL4KVwNq3e/lIsGi3+JmQAmRNarDE6koMdY7zBgcet7ZYN3rd9gjiZA
3P3b/8On6UtxMY8EglZbmLaOuVLatRwkNBSxwCZkUnBmbQCL6odPwYROHp2e/6NXwcqxM01SrA6U
+fNylk0/7gF5gdRnhzqTh6/a7zcnatCYmVs4XNAEg2rUgM5RhRjAiwcBaveWQAuZ0x6IplPp5C4g
q+0tiOZEaXS+lcTnNJ9M1HX1LI8qhKJCKuG/UcQkujghc9/Y/tLnvKO/rGJSSB3xYW8jK5obxqfR
t3stZFgUsK6sbfQ/wIEvnK1TKiypgMe1NKA5rM0kQpjuw+5F6Fiuf5wfCXU8DgMeyW0qOMRNNDza
qxVhvFn7TTqzZunFv/AgkIKkBYSN7bG9E+k/tkgnNQ/50NpyFgjbcvXNHR1rFENhzJL+kvmR0G6y
4lvYmtMkf6Ce/1M+LdQwFPRo76qSYYcmY3eFK9EPWf9o5sshkbnteE61ZzY3Cgmbem16BP6VLGHs
PTIZNPip+y1yhV2uLinck0HQ/YipJdRtJYLCy9xNhEbOH6zoD+nkk1rLvAdJ5YoyRZV7EBFjGO2t
5lI1LpgtE+ShH3TElx+IJ0MJqwpkmTdosbHxb+3vpdA2Cbi2MgZNXRL09lw1WOroQMOXDLpNJYQZ
hudLvb5LQAmxQ42FqP6akXgWRl2SKdsyRgLsw1rhfZ/dmBvl5IeZVlr7FI0oGmH8sNPvj5/KM4+S
aXGdzMWKrYooDO9RlqHEIyXBfbTI0WH3h8utJi7b6BzX8X1KWvoa3yDj3EE1tsxRyoMH28BvV9Jy
R5wcqOuVLH7khJu0lbWOdKhuoXB9dWBXCJjFEXgIscZ6aj+AoorrylSCELXkcoTqPcOmUaleWPA/
5YUFYiszvE90CWPB/dPkM4aFzbkVdfsxyJH9ro7zUi+ioeuLx5JxcFQuaWnCHZMXqK4WePmj6H3y
HtLiGJ9mgRitgq2oh+CatWaabNQqufnHoww9HVxbUCh0aH3JLNFcL2bTkxAqgzvpxb/UPCPbP1hQ
/67qpsGSmBoVe/zBND9mugPMlCosbwBcfamRqRAxZLL6fN4QcDdTBfkZadPSwmbXwTnqcoRG/B6+
ONfPhueMMQoAUWyAxxqLwB/8qNtzltng+CD6DGLlyWlMCUVpfWT8rWNEmtgQJBMojs8cdwQ4yzKj
1+00dV0uQYH/6AADno/YFy9chZpzWDZhZGBGkZ+SoWw6S6Wt+ZK1deKPBFZpJH98rj2Zy/osQXSB
2dvcUxX70VYprei9bwD2EvwgSgYmm+O3uFlhL9v2qTboRimDw/COsCVNuT0508zEMsT0jayoOB3G
MISRRoYDRN3L6ZKfIrt0Pve1IlPaJ1e3e4AshEvCs7Hgo+bTz7rCOvgDNL1JDYzyU2QOtLJVRc32
SGMpmOODEnglgUVDPuySb71jwKPfuE0OnsegIMIL05fbs2wto6wShxVN7fctVAxrYqU6GARKx1ES
8oKOiIRMLO005AENRet0Y4OoFnVzYAdk8X+py1w3bznuqTiXSjazRXRVpFlHdli98R5LyoTU000q
jV7EO9Ym1kQh0PTsbfBTI7VVTcKZ4nMIParuKxyKeQD21xjAvopYdLtB5siYzvM6IJo0LoxPg8hZ
nOXyUYrG6kO8uXFAKLZqR/WfnOlzhGRoA8NOfLMg2uFM56BP+1IFAr+9eWIyPoZI1W5EECxyp91h
/bhFC6OV6vcLJUBDVNKjefdNAKOrpT44aWSbl5Kqpl6cYX+8CDQ4tURPMVds6VVmd3hATLKkSsmS
L/sinTTPClmtDj8KQ5mlUFtFoZgSIfgO9QeEwq3CWcvkEbbR7IA2o0nc0eQgcXCS/I0K50Jb+6Uk
5lUkloItPgivn+sLRJj051zzCWjnfv0NjN3fydil/uLio+H935o+4RmjEetcRdXLXxlj04j4XiDE
TouNmu79hfQn5mjxdIB6YZhI7f6JiiesQZqcFbPHOjNgsgppttxV5FhOPH0gcnG69iZUWH3i/Tsf
FydFTu0V+MDDPLXiMKafDjg9E25Ak2W5Rhb2sOhMQ0/D4AMKjSVmBAdOt8u+Tsi62egIEmvQYTwF
EUxAJmUh3mKIyGhi+I9qfq/IKLnn7nAvgJAaaKyr3tC60q3yegjs9T+gYNE1fio/9RTzN3vCGhOC
frdFHYPhk+GHUiQmgUZvVwegkasqyMRTESv3FlMPaPJEDyFWIBXIENbbs84uwJWG+0hGtfoYdX2t
Ac75aueVL52YyfHw8ZHC8/JDCGWoNp7qL52Lw0jHvTj9aHCxPb4/mVpbbiIzHeSC7qJ/gZCcJDoM
MYjDUcJDc2nvyIq9k/qZ/cXulaP3rW8T2N8RXXUo6g8jh8G/tiFZwdEHzIKPD//wB2t8rRijgqIg
//Yl+l73SUwQl759uro4OwSPsIjERihnsREBuR2ORcwUofY+ujINQNxe5OuDUejkdZkVSap8FNwA
OZyGVangKph/1wAwfspkzJdftNwe+56zxrEXYfHKVoK0/AYjZQELmP/Y5y5xDSuxjcMjAspSTs3V
yJZFYIOHYcZClRJNVvWxKSGLeWZazRWEr7esD0FicXE6nT6AhSNkqNrD06RQYJZWQzMe0p66m8pf
SOiBj5lMvurSLgAyGdkSoHlMJORUJOIKfepZv7UN1tbkMXMeZKAyztk7TD4A8POwxHAt32NGzgAf
iM15R8kyA20e3ifC3mZKyCwHorpOpRI+EbDGHg57VxXcDUnXRTfLQ9lYc2z25l5wjOE+d+3DN3rf
sc9Z/eecOPAKYJj47tQmqCcuWoJACVGLT/I4eo24IPXrQ729Osal8Apkfq1DVZ9ULmtKSt3hRu7x
+zGPr7s1iMldxdQjuYGjK046bF253M4oko/V3qhpKJ+ekc5XoVAWZ69y95cWNyr+8OClw2mhmqxc
sY9NYMl7D96PJyHOgKQwwD/hriUoAgWVlJeNyYS7zMbwSLIvQlWcqoRZNp5xFpigwyOKPRArkqAf
3YW2DPPg+wznqEj65y/PHcK1afr9LIEjpkDE72VL9jRxeCVFuUiqUvzGXVOApwgFotnI7JjSWHHJ
eO02CWR88wNICKBa+troxJSxRH+kTvlOGBzWHt5PaHIp44FrGtBMU0OZrmWjVbSXPgS86j3k5lRu
6loT/pfsAvBg5CqvZeTCSfKZqU+58Bnr3bnF+rlsCAipKBQzM96Wv1Xlxzl8WScCD5s8B9tW9Frz
SJ0uDs782nbkuXXuRHKHTaxYb+Y9r5fwQVjaO98RY6RwvkGbSxPzjWMDbVzMbNblMpR6h/Wu0TnU
RAh6voY8PuccwmWozoABz4UuNpvDJMUH9ok/XjHaKTgr9Izh7uCN1oNYd3xhO1d5XSO94KOQsP43
ki4rcgX+sDpjZEnr8DzWvh5m9QEmxQCQFW8N93waZEjY9Z9hQA6NmTsx1Zzvi53MLx3epT3+u9pX
gcCc4fJse5e/iiPShtc+mXrY9/4mNQCJ+V9ty5GEfIOC0HB5wwM5khBVg5YgzwXjQU0gitzKxc6T
9NCcrVAHBKHS6/Q/ZtkO7PnGzemkvTrPtCJVpWZkaVHS9JLplSZVdA3R8IUTp0qGcRhQ3gcaB2Ix
LNf0aLC77BeF4/kpk8YZAF8RNFHqJvEBvnhEXs2so5DQWwG7i+pyp/Sqa5VsI97m38kUhPzflEV/
xkOtdYuAMOItRYbViesSeI7VHBWWpD38+KdGRXYMKltkYYzgee+WItnzmpj43euIaXotQve/eeu4
uxKAJ1iI0fsBwYd0WZGbqTSdHKlx6T0UNkhhYRLwlq9xcOPKxNqyXpKDJuZSnwCxudyihfof2L6Q
QX3Ca2jZOqI7UNp1tar/+bLmYy809OzSYQPg6xeo17jqxx7UZGLp2k+ytC3bFDZ0ShjrPad7Vq/t
DTXwDe5emSxgguXpZ4OI4KyOXJ+1574fuB3f+Zj5QQ/omPTqUwOzBIsMAhML94EW7jjzyuWh2qJI
AZqTzPHAHdBK/6F6jlh8NPU022blKq3bw5jCjL24iZA2ITYsFxCT0iyJBQkBuWh5RGwf/MX7EqRM
Ov1YBv4F8am4VA0ONmocVlZVq/a3J91UdZ6YzR7JyodtDowoi1cM+6R+/6yjE0qo3Mj4pu/VGIv2
AQM4R1qpLSVBYgeORcBoVyWNXRSsHAFT9ML35GWvE0lURa75GsvXSk8nr3Q+wwT1+x2IRDLEOqfZ
cAFb2qSiDhkj6MOru9g2dnt2uu6aTPJL7xxgPRVe43UIoitkIl/IMWYizQw+x8JfiIiRCxeQyGrC
vu84k/l4XAZuY6UqDvP/z6CE5C7jXkg+TUPazd1hUUz0FwcL/O3sdOwiouC2gxag/BjQH25s03yE
tN5KTB7VaW8WBxziaIqUhqdI4UB2TvF9/mCxdOHrmHDdmobh8TbMQVwaHQwwq2l9lJjfh/eIsdun
rVaWF83WPeTgHcDH9+r51TbrGrOUYop0MhAO/ZR4njJaEJXR02L0oeYW0lSP5t22yt0y9whvMDyk
UTskVN7wdrFuq1WYE7b2GCOxZ4m89Qk4VeEzBhPX+tqq85Fy3eDP5xhbq9G8f3LtZhkKPmppCCV0
lLnj5T7Dw+zXiALZTTyPHfE1ZO31x0eo7kNs+dp4Jwe7CW+UmaST0gtEAe00KB+I5FrGoqVy7uy2
VTyrtaYMYFuPJEtysccyWK50LxUEDnxfeCDd8edVa0cMJhkig/gtBRwE7Ja1xoSLSrCkVryvu1Ig
nHlv3D5iBtEMDDcMasz6EZ87VXCnjs/y+iGyHJdeHX4JO4gXCdc4/AP7MPvGemMBm5IRsBmwP5gx
oL8kR9BjYH0AIN4Db/+YfRosUo5+qHMrHqZZZOlb7tZp8PFop+CyY+eNPY9A53OuY299K+ZpuK2A
s1Xqrdi4ITX4nwf7YXs8VS73spnrKos+lAYHgJf7mJBiYA1mit8H/xN1zq3PhLprwPwwPzOLLjvK
KDlhwot7mpgndlmflC7Cep38+Qaka5xaWFTtkggoxGjPTxRLySKmkyuqCDcDwipaDkm6mbrbbf0V
rq1Nfvlikbg3bfHgzXifwShSLk2hchps6rXKFSdnJBlMuzXRkEzt9voq8bceNYjC54YecJCVr1Sq
vX04AvAORJy7anxqJTvETdhA31V0Yt4Xmm2RBt0JVkVng0V0Ixmqhjo97UPHmu3jc/CqHQ8K+8xQ
M7uzDwvL7+7ixUWiX9dJ9doBMblMqUc6t2MbA/EMs9L7PMmFJRXemaDrsnvsa/X8jHPK/zWGeTxD
RhUx8FItFBxm+g/+wjh7N16zXD8gHngC6xLf0cZd8Iiwr1TF69cOik72B6IQY3oBZ9fx+jK0V84a
W+He9dRYtTj7KiR6xS0/M1q+5y5qr5LKs9sor/3Ayx4LcNUH9YB6RD3hKJC/OlSYwMWUYal/dLTk
4wNMYYn+Ubc96TLzqtF1caar6vN63FF9TKLwBloK42ynKAZ57Bz3rwkk9IL4hRsli1bVrhcTTgM4
zeivN+KTQEWsB+NGwQIHmMeGYwnzF7R1BJoSn6o8BipDV0x6MNdACj1RAOtqPHYXq1vyvB3X1VFK
4wNwdB003D/JH6zUqzJCIDn38O6p3resT+lZc2/PI7DH5wyhlcKp2BW149NmysQOLuLvYU0dbc9g
ORHJaBxq++akMlkVdyAKZ3QXRD/S+v9/t2XOXADFLd1WXuJ0ba3bB9ROgHQ+5edSwCJ/P8MekTyZ
MuneYDeSvbXcDxQuvPdIFH9Z+MjmfxR966nbojM9acXaRIcMgydIdkmz9t/rrfRkA0PoB58aPc/T
MZd7fNXU0e/sSW+VBPEuOkERkNCAyE2AI7Kqz7IK8ytsMPIubMYsNCTfojyu5tyJvmS59VhF12IR
0qm8XCy3lEkTfeokDqLjJGw+RggP/BPdNP40vHkGURiKaHSfuZ3i4wF6QkOk8MBREq4rQtHWW6Ei
kCVmFl47CPuhvNVdIn7Fcww0XXlIdiMz9Zyr+UyX9tTlSn19wmfdN+oDVXZjEl2lr17upw0xLElt
G+pQWDYSYNNi7wZUiIwDG8tI+w6csElqw5bLTFprnvJhpZiSjYmsX9RxSL9z5l81ndsMoa9Yi6g1
OjHx0Oyz0RTKNeb0+usmrq32rjIy3rTV2Qi8S9swreJP525IE8w2v6M9I/GZrc3yrakoADa9LDW/
ZTozMIeiULgKkpFBw8CpeGutmlPr4buka0YnFpj26yA/ifv9BUwv7LHvT+gxY8CJferQRSrxpNrh
ttncsWzcQ8wtznP1XDGDCEvIHuBJPaL9BMCV3RM/OZhXotE/wC2RdRPRzcnFdiYIkT1d8j5ogQCN
CgFyiCoolGhCVejFdkiCigsIAqopWLDLhhOF25v2/uSRdlF2kNC0XslUZpDBKwO7Mv5+8Lnob2Oe
SaSvxAgnq5I7wZ/fsu/runf8YX2S7aftiMwpFQqeP4ouWDi621PQUFy/ug4+EY1VOLRd4pfPdb82
KvBAQCa+Mssqu2kxOCRtZjHBzukcpZgi6SLPhFOp5wed1jRpX8NOzu7Y1jfHfMaKyc9F+ME084qO
ODTHvmjNTQHw7qz8wlMRVTzOMXVs264Xfst5sQQSPf4W4G/H1dUCqsPN46JG0qKcNlyPOGv1tLIc
cJlmQ+9bUL0/elL+8eqNaLU2h8nldWIYhNv+dJv2zCIHUoRMpZWXzjlF/VpTFEXrFLQnXbm6iJ5I
FzJ/8sVMZCb0ewwiZHLgXtTOB05/fR3dL1/BXgKe2wycGxi6Kz7M4RUOPQ6U/O6ilC7Xuj3Ly931
Kh+UlahAG6rzYP4+bp3l8f4NB747mB9owAoq6sViQz1gEZducyNsZlDV0/5izSsUshfztteN4NIr
sJ+/srfv6JbaJ6pl5vuB8XPueU2RqwiiapYYl0e4jfmXQZLyFI7NBAbGhPFfOCQoBKYUHnP9uWai
WvGQUWJNHKlXtKUdIsfTOAc00ur4+G3Q3TzF5IkEXEkiv4ZXSv5sEoLcsfNnpvZxAdOYZrlIY/rg
OWVizSUKndMnJVv9QHQGMk4ZG3taVmTfpRHuSSX5ACvn8pUPYtCJJ0hP9rO3hp3+3xjfxKuZWnz1
1IJX8L/wxztOnMTzmzxNOJ07L7XYIZgjxno/YO50pw6gcmOr3izfGRihHO6FqM/jRL/2ao2VKde/
11C4hArW6QH238BoMDOZXIcJscl8jr/f6LPpRvOPhlmMN3izNjFErH7aoJVQix5iAPiTmUSJh9ST
tXZr3dsPSpTW/hR2bZ2tEhb64yBsWgJV0aJP0v+CHRon28vqbllz/TiEj5OhNG5aZFrXVA2ivxYN
vOLCDr+mWTd4kw0WiSxMSBygqfMDcf11C8b39CxYWVQLRUy/Vxj/ZDizJZtdiLKjUz4/V/zYcxN+
07V5cagqoZDqMSeJDTuCYfQDShZoFFEyMcY2UtuQ+GXLJF8E9efcP9obu6T8MsuFAqAOtXPkGLrd
3WG2Y7p2lgO6kGEWg02aKszL7sMaKBvKT8MCy6/kBhFkC+EwBJhml1VztljV3vKx8mp9KMbhsaWL
XASA3zeCpXvDE0DvV4QdqN/bTWlH9fDfT1a/T0L4ZKeWFPtPPpoCOsv/p9pgYAdzGgYdIQ==
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
CwCBX2a8bfHflon2aXG8vAF3udkY7cryTb4W16qI9xQU0voVYbgVPCo/x11ziyaywAQezKuW1qY+
WnV0T84tXJEVW8I5lok7ldEXiD3KpTOg9reAfz48WjOfGntES6YiFPascTy4qbTfwmilc+PcPnXZ
d0L+cUT2szmQ9UuxjyjV0p8CMSpdDrsFLYWKcERGIIm25ku45b1IEP2f+hbuJMos+OJun7xXRbo3
swcBE7CXpwhzsRDuVnTKITqnT4O4hbMRpqShxZVjciMS7oqFUIERsKOmACK6ILpSdgPAz0sjUNnQ
cusaY0Fyqzh5opYjWx6aRBNe00ntJp0yGLyXPg==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
oL1UdinIWZb3IQyQMAl6E883EunCqxL6gk9Yatbfpz8uJc6x0De/5RLbw4rid/KZqljuh/VybHqH
n4DRilf019M9KD+HAzVgZWSMKh/8x6QCtSHxMF8MJe279DdwHKePPYe0hQgETcr2afI41P7r6LxS
+vxxQNK065SPjOyNlrAq9Cc5oGWl7gEReHH0rfhQ4+B3Unb2Q9ZsycD0KeaLbcvekmnVXenG2zey
krLY1yn/DlDSwdrP6fLkOxnMQRAMpebFlNRSawyRJ7O/2jV1WJHcNdi6t2nvqCZ+416XuKAVXawd
akEbXB3deD874AhddzTIOpBlcY1lPTDLm39hvg==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 3808)
`pragma protect data_block
im+9rBzXDPDmXk3oENymZC5BVYjJaoGVLttoHIOAtE5FKoQjo74N8XaLwd4/q/z5OuheydxmZaso
s2sPXAz0K05flONwn9Y1lNJKC2l1NaZHlIX2DmuQZwSJMVRdD8RHWXZx5lTB72ed7YXk0q/QqbmL
fcfjRa/itaR5Xg1ZH/mFcH3jtFbrN8ahN0jxjHby8GDBTLqzAne7m3cNVQerjJk6N3HKZ7fClv+M
Dz2uTCXutU6aZybTbYgqXrKOWxL4wGgUCAswYZ/D4ZNAUfgVppEb5/beFCZLydX3paojWd5nA0JB
W24654GbePZYjhknmyTrFxnF15LkYp0Zdq0w+elVJVzUN7DFF6cpNS9id5KoVBClXgorpZgglsqY
bhley/H+WHBfeZCukqZo9sj8/TuvzYrrJ1EXYkzrNxwu7cnwpfmaBvCUriEhlpJXpU3rwn6K3GbH
6FZTS1oZQLZwb3rh0k+W7T9FQ+PhJzYwAe8cGpd3/Ii8FVKIrLgYJ5ooBwELoemRTXnipMWH5yMe
GOhRkZXeW0Gfxdz6o3/oze/Vu5tnqNilbXHZeQ2nyCaJ+QzgjBycNoib3wui06DiewnsWyTGkz4w
e6fDtk/hDb/jcwWOkUEnA/yuIb37c2Vnme1AG5vF3Is20ZL3QQTErFH9+w9auMrryvmWexk8YFoW
KAY9tUQRqjmQTPOO2XLMYOUOMq+41tWRgVk3FBnDY6FeuubwxJhuojULhr2nWefA4cbzo0JcwNjJ
WUCfiFQXpLizWttR94wiJLQoSk7dIAkAksAyh895IPXS6uZThsPF2Rj+OFHZWmgWaIlTobCjgzMg
PxVVenjirvBNF0S2Yl3FWF95r08fNCv4Uck5Lw5pjnxrcmIYIJ4Sx2b4Sh26Mn+AkxeGf2T6QeMw
nCjEM6o9C8SqwRWZ4KKMPlRx7tutYyebk60jKnmqwFnc2LQJ+fLmjr6ElXpPHCKz/TgQpw4moJK0
e6Dn7AMtLcBK1uFSX+qUgrBGldQEfqZlJZfNGt9SCIFojV6x5F6miDTtNujx2/a+EeaTvbFXoL2F
QdClrHDfzuHpw+e6d8i7nHFwrvwJkfkP1yjuipNJRXsR0S5WDNxOO8ASoyxOvg3JVcAd7EKl0pmx
Evs4CvtMr1Gw9mWdaIMu2AGcL4Jp2Gw3Rkm4xE8ZNN/4fXnLba6Pxyb8P71m/R6Zr53tBE/myygC
g7DBB+lp/odCejcwVvqr9jLU9uPQaGRiTn6JjMqzL87cjC+VRmvATrwO5/0dumcBnCjr3W/wQ6HJ
9hcl9L/ZSXmEvjqsoVT3RGZgNJPohArxYPkVqYhNtTHsbnxj4b3q2k3wkuRJf7ssvzcnBmt84qMR
G+CLSu8eUl8BzKvVkjSEwgDSnqqMjf23YF+vicFbRVy+NgCkNXtJYwtfl8eU+LTPro/wr1fxoV8D
bI8aT2ZvLvr9UK7EZ8X5Tgqrfi0KFyV69RVMqIJMrZRR8m/4wOwkfRgHt4v9u60HsWD1bGMcq8BL
INWRUlPHE4wOFwv4ebyXR4gsJF7P+SfQH2L3kLpnv42ffCoo8icWNE46nn7BsZb8/asx324qxFSn
TP2yKT0Ov4bUvcyltcYTCAxbwMcmmg/1s9BMXKt0hPoJ75I0ypm7+1YEFFViatQaJ9QtG5MWUo6g
BuLSwQsLizOQ9Oxv44chSs8x4kAk/XSGl36S8iPlN/ZFRsFCf8BKylrcJW8hxGtxLqO9NGeF8Db2
/dbiWCRVDY26Qy15g/dOITCI7c7U85IbfiMbxogSNzVjrG8n1HTf/zoi9VY9pfacOz3te6tCuq7k
TSAnCnofy03Clv8l3V/k+twiSqRJ6WBvvBX+jhBIOcOYqVtTSTooEK25/OHs5T+bXnSpKmQrxpHR
n1kZQedLU4HT+g4IvwrolRelGhGjInBnwqv6gMBceAccYOESxUMrRZNv+D3QF6JdGTJMzCiiQWFE
PfOhg+iT18FKY7WI3fEGuGClnWrunZgd8Fse4T7BIo/daM1JLVBg/IOfeFT7dZ8712r32Ha/mq0P
NQ7BJWF6nZX6bR+piosJEq6+N+k7gh4+W2/KZYqpPm2L1FJwVEcrrtHilhN5z1r/BDZCIzx3/4cd
g5bMYZEz2MWZQ6tJSNiJOD5DCt9QvMBPyyvkIQLMtK2u36n6XJ7dcUW7Xoafai0VnZgury99FnFP
KkxF4tPsT2XvwdkPgKVPtbiKgCxRYXiQtUIFvyNBMUMNB3BTohokaeOYvEh+UVNA2e+SUsUO4Zny
yHisITumnVg4IuDjejDocfsMjYvfH1Ireh6bWF5B7BHEv/HvJYsPweTaJH9CN60qgMxEPZMCdB2m
hSrTcflDi5DQ7MDpyksIs5ZlKmWCjBkInGBcATJtoGE/mi8cQW5XUORD5/ZqxYwRagu2mlwbcaeH
/t8wCI2rd9sPVm3DuS2qWKOC6NGAMZ8WlzYTCat3A4u4yRJP/OH00H8jBLfcQ4URHbSelZrE0eBJ
cDjzuVrpZ+1lBgNFByUizP+1Ee0fkfjn4W5eDIOQbsOvqcHEY9BbTJI07dTOApaC2W+O8Z/iPqcc
s58UASvVAaZbCrIUXRFYRjCFlkob199yWohbtr6l569liA4+idGsGt/Qsl3C3SSeEZ+qNQCCj1rw
I6ouGye+Tx1bIGjQPepvwryDfkDPKuMmP2zNJC5FrhdNVYpP/CUPjYUraAg0embVLEh8KchtWFbC
1Ws3EdqhxuRgUipeSA3rGaGLwhgYHbPn7rQVmPcd4hL8T8cOwu4FL/R9zs8UPP1ryr5zP/Gw6Qur
p4Wp0LQLa6F/CD77ZRtlBk4lSOvg7YSHbxXBieEjpQQamiuTFMkAmEjhDlZXe8B88gqHEdyZ+LQK
bpb6hNsG47gT1M1OKv8G+Go9v4tTHHPm5FR2a6ONLyIeuL85hVHYimqjIDvh6RCb4N7gIbxt+nLq
mbhbX3bciat80aZAhCfhgp1eWRl3OT2WgSayeTrzfKT1IEGxHNVnaEjJiALpPIt0msv99WsKz0OD
DfWpPyHdq8ifbxSrNXKhuaGFQ+bkADzaaFxXQoRthy35Yi7ap+WLmVNsyCbUwaGpXONeKixysIsA
D6cHC0XZbptBLWJb0V5F/cMjVBD9SPqUtZKS7fatuHGD1zTTjy4JzZh4s20N6m28Nfjjy4J+Gvwk
kvTzBg6J3t0EJ/phWQi67MoZdVAEmiVNYndOpUdjznS9Cp/xDYPv8nPF8eQ4uyzyXoT0f/2mSZka
H38RoNjc+efp8Ztv0ZwgiVZ9gnt/A4hs4ua1sWhOqConDxjEQHSaXmbX+9fWgW2rDoTr/ovBWprI
ifs8VHHpUl90o8vAs54rpY783ROYajR5yjC4/ZfzbsuwFjgdq3Z3tvlZvv8bSx5WKia/NzoErVhK
jKfJuo7U7p3HSB6pSL+VbXzLN4D5PzIuBTyc/5Cq+oBBe200u8cn7P6b+7KctnE6ir4529M0TBKi
6m1X9TDd7OVsVSIPSYOdTJOc8DUUfRY1/ZC+7lbEdTKPPmGSf6h8qSlvx8Djpw/GDvL4w4FRNo+g
IP46ntHftWlSxw2wSZa1wfVklfYPJnZlQZIG8B2+HOIx/Jp4FpaSdBBBgOjSFxihvYjB0/7gDlZq
gV/xzSWioWxC2cMzFkiaok7QPYEarZjZQodIjXbLY7sv4iP7laxMRxNb0QV747kxexOk60sXcbma
yiEzTBjICtAnZE3k4B/xGqwPxqvOkwM5LC0ZdJmHHF1ZrFp15tgHqzCQDSQWU1pVYVrIkB6jw125
bkW13Cfg5s5ezim8pKM3kUYGhr6gaXSdhpYnU74sbE9nKTe52JpZlMc8YGQ/u0HhndLksLpYefOE
tBCEiAc1pW3g1YJWbW50Sr/z2RcsRLX4IXN9vBEQ+SNBdee3f9tLYUbA3bKUmXG0P/5BMvKjfYA+
IW9mYiXJYTglF3BXBYA0vMDnuPCE1BSzG0UWEHIq0LGG3dI67N/fcOzfBA9mlU/4LBv8BJixPZ7A
OXve/Sj+6KFCNdgju+oEe6xRB4wnwRWEgd7jECpEmGb12tVaN8VXdRev6igkrOwxvF+fuN8qtw9o
m/be+YxeQMxbEqe02f6DqQPIrIUh7+8zgyP6JxIG8Aw+Ah6o9DmTzvj/sWqk53ELvLQUz1WFBRY6
JP9Fo0lw3woOFGs3hf29HcjD4JYR0F2YqbfIzC2uFD/4+ZEQ2pZL1itmqb2sK9IqC/b/nle3yvTj
3WV8QdJXyQCCjndhmRxVBYlh8B4yQUM6/gTylYK8MEOaK43CJbdy8ZjwRPOw5JV4jdlr/gF3goM3
qdbl6w/dELFU/MpXrJfQimqO7yysnHCBfDzkfc+FsRURqkVszvYIAh7X6RAb2+mmIK0/Km9VdXuB
/d4swQBYJusKZZR842ei1QV9AnP6j5ZsLDgS+3aKaUsIE/vM7SlgS7AI8gbUnoldD1LbvHxHqWtO
DiZlovZx53dzkIECKLKVrZn9ImBeHH3zbPJx/JkGwVxrpwhJtkNBDXLMU2mw+IpbueuVBqRv6tXJ
lpJpNp7ut8P+l+YrXpqT3d6SBwxB5JSKbZxKDQB2zHHQ18dejrdPeVsCxDoKkHg/vZdoFNvPaOXm
mjQ/s0i269hVVAOVkElXflK8WUpMaYYjifQq6tjNlZZq0bzfF5QUA9ZPxo0ZYObq8j0Bd9dJYa1a
OgtLca2Hgxa5qybUnvy6JghVkTlaGv3eoHNdU9ehwF4/Y2CGbLRaU+DUyJZVjbY2MS0u+SsWFKr1
2OcYZHEuEdzyC8q5qVkpmMIsmIX4UPg/tNOonVNEDb5G8452+kbBmmMMakY5zGn4AEvKNlxz1pJM
I4rHsY2jSZNKRRMtI0Pi6ItGzszlLCjdmczQZqSvhghuGBJGgwqRXDJEcdaim7Y5C4mgbTIaIg9l
XcTY9Cb9vwN0z6k79FRQcJPtRHfgImip3XG6LQKNS9NUz007/Bt/6x1T46R22St/qY8E6oElSXim
LUgdP546y6X/w7/AN7dVmLFCsAocJ6IblKQvEnN0vnOwsyU5TP2WASya1gd05A==
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
CwCBX2a8bfHflon2aXG8vAF3udkY7cryTb4W16qI9xQU0voVYbgVPCo/x11ziyaywAQezKuW1qY+
WnV0T84tXJEVW8I5lok7ldEXiD3KpTOg9reAfz48WjOfGntES6YiFPascTy4qbTfwmilc+PcPnXZ
d0L+cUT2szmQ9UuxjyjV0p8CMSpdDrsFLYWKcERGIIm25ku45b1IEP2f+hbuJMos+OJun7xXRbo3
swcBE7CXpwhzsRDuVnTKITqnT4O4hbMRpqShxZVjciMS7oqFUIERsKOmACK6ILpSdgPAz0sjUNnQ
cusaY0Fyqzh5opYjWx6aRBNe00ntJp0yGLyXPg==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
oL1UdinIWZb3IQyQMAl6E883EunCqxL6gk9Yatbfpz8uJc6x0De/5RLbw4rid/KZqljuh/VybHqH
n4DRilf019M9KD+HAzVgZWSMKh/8x6QCtSHxMF8MJe279DdwHKePPYe0hQgETcr2afI41P7r6LxS
+vxxQNK065SPjOyNlrAq9Cc5oGWl7gEReHH0rfhQ4+B3Unb2Q9ZsycD0KeaLbcvekmnVXenG2zey
krLY1yn/DlDSwdrP6fLkOxnMQRAMpebFlNRSawyRJ7O/2jV1WJHcNdi6t2nvqCZ+416XuKAVXawd
akEbXB3deD874AhddzTIOpBlcY1lPTDLm39hvg==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21168)
`pragma protect data_block
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
Bc8VuT8Xu3AxldKWLdz1krKq/8j6
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
