// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.3 (lin64) Build 1368829 Mon Sep 28 20:06:39 MDT 2015
// Date        : Sat Feb 13 17:05:39 2016
// Host        : edcn103-pc running 64-bit Ubuntu 14.04.3 LTS
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               /home/edcn103/Dropbox/M.tech/Project/Hardware_Implementation/ConvEngine/ConvEngine.sim/sim_1/synth/timing/LocalMemControl_tb_time_synth.v
// Design      : ConvEngineWeightLocalMemory_ReadControl_Level1
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7vx485tffg1761-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* NotValidForBitStream *)
module ConvEngineWeightLocalMemory_ReadControl_Level1
   (clk,
    rst,
    BaseReadPointer,
    EndReadPointer,
    Load_Pointers,
    IncreamentReadAdress_Enable,
    SingleLocalMemoryReadEnable,
    SingleLocalMemoryReadAddr,
    StreamingFinished_Flag);
  input clk;
  input rst;
  input [12:0]BaseReadPointer;
  input [12:0]EndReadPointer;
  input Load_Pointers;
  input IncreamentReadAdress_Enable;
  output SingleLocalMemoryReadEnable;
  output [12:0]SingleLocalMemoryReadAddr;
  output StreamingFinished_Flag;

  wire \<const1> ;
  wire [12:0]BaseReadPointer;
  wire [12:0]EndReadPointer;
  wire [12:0]EndReadPointer_Registered;
  wire \FinalAdress[11]_i_2_n_0 ;
  wire \FinalAdress[11]_i_3_n_0 ;
  wire \FinalAdress[11]_i_4_n_0 ;
  wire \FinalAdress[11]_i_5_n_0 ;
  wire \FinalAdress[12]_i_1_n_0 ;
  wire \FinalAdress[12]_i_3_n_0 ;
  wire \FinalAdress[3]_i_2_n_0 ;
  wire \FinalAdress[3]_i_3_n_0 ;
  wire \FinalAdress[3]_i_4_n_0 ;
  wire \FinalAdress[3]_i_5_n_0 ;
  wire \FinalAdress[3]_i_6_n_0 ;
  wire \FinalAdress[7]_i_2_n_0 ;
  wire \FinalAdress[7]_i_3_n_0 ;
  wire \FinalAdress[7]_i_4_n_0 ;
  wire \FinalAdress[7]_i_5_n_0 ;
  wire \FinalAdress_reg[11]_i_1_n_0 ;
  wire \FinalAdress_reg[11]_i_1_n_1 ;
  wire \FinalAdress_reg[11]_i_1_n_2 ;
  wire \FinalAdress_reg[11]_i_1_n_3 ;
  wire \FinalAdress_reg[11]_i_1_n_4 ;
  wire \FinalAdress_reg[11]_i_1_n_5 ;
  wire \FinalAdress_reg[11]_i_1_n_6 ;
  wire \FinalAdress_reg[11]_i_1_n_7 ;
  wire \FinalAdress_reg[12]_i_2_n_7 ;
  wire \FinalAdress_reg[3]_i_1_n_0 ;
  wire \FinalAdress_reg[3]_i_1_n_1 ;
  wire \FinalAdress_reg[3]_i_1_n_2 ;
  wire \FinalAdress_reg[3]_i_1_n_3 ;
  wire \FinalAdress_reg[3]_i_1_n_4 ;
  wire \FinalAdress_reg[3]_i_1_n_5 ;
  wire \FinalAdress_reg[3]_i_1_n_6 ;
  wire \FinalAdress_reg[3]_i_1_n_7 ;
  wire \FinalAdress_reg[7]_i_1_n_0 ;
  wire \FinalAdress_reg[7]_i_1_n_1 ;
  wire \FinalAdress_reg[7]_i_1_n_2 ;
  wire \FinalAdress_reg[7]_i_1_n_3 ;
  wire \FinalAdress_reg[7]_i_1_n_4 ;
  wire \FinalAdress_reg[7]_i_1_n_5 ;
  wire \FinalAdress_reg[7]_i_1_n_6 ;
  wire \FinalAdress_reg[7]_i_1_n_7 ;
  wire IncreamentReadAdress_Enable;
  wire Load_Pointers;
  wire [12:0]SingleLocalMemoryReadAddr;
  wire StreamingFinished_Flag;
  wire StreamingFinished_Flag_INST_0_i_1_n_0;
  wire StreamingFinished_Flag_INST_0_i_1_n_1;
  wire StreamingFinished_Flag_INST_0_i_1_n_2;
  wire StreamingFinished_Flag_INST_0_i_1_n_3;
  wire StreamingFinished_Flag_INST_0_i_2_n_0;
  wire StreamingFinished_Flag_INST_0_i_3_n_0;
  wire StreamingFinished_Flag_INST_0_i_4_n_0;
  wire StreamingFinished_Flag_INST_0_i_5_n_0;
  wire StreamingFinished_Flag_INST_0_i_6_n_0;
  wire clk;
  wire rst;
  wire [3:0]\NLW_FinalAdress_reg[12]_i_2_CO_UNCONNECTED ;
  wire [3:1]\NLW_FinalAdress_reg[12]_i_2_O_UNCONNECTED ;
  wire [3:1]NLW_StreamingFinished_Flag_INST_0_CO_UNCONNECTED;
  wire [3:0]NLW_StreamingFinished_Flag_INST_0_O_UNCONNECTED;
  wire [3:0]NLW_StreamingFinished_Flag_INST_0_i_1_O_UNCONNECTED;

initial begin
 $sdf_annotate("LocalMemControl_tb_time_synth.sdf",,,,"tool_control");
end
  assign SingleLocalMemoryReadEnable = \<const1> ;
  FDRE #(
    .INIT(1'b0)) 
    \EndReadPointer_Registered_reg[0] 
       (.C(clk),
        .CE(Load_Pointers),
        .D(EndReadPointer[0]),
        .Q(EndReadPointer_Registered[0]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \EndReadPointer_Registered_reg[10] 
       (.C(clk),
        .CE(Load_Pointers),
        .D(EndReadPointer[10]),
        .Q(EndReadPointer_Registered[10]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \EndReadPointer_Registered_reg[11] 
       (.C(clk),
        .CE(Load_Pointers),
        .D(EndReadPointer[11]),
        .Q(EndReadPointer_Registered[11]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \EndReadPointer_Registered_reg[12] 
       (.C(clk),
        .CE(Load_Pointers),
        .D(EndReadPointer[12]),
        .Q(EndReadPointer_Registered[12]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \EndReadPointer_Registered_reg[1] 
       (.C(clk),
        .CE(Load_Pointers),
        .D(EndReadPointer[1]),
        .Q(EndReadPointer_Registered[1]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \EndReadPointer_Registered_reg[2] 
       (.C(clk),
        .CE(Load_Pointers),
        .D(EndReadPointer[2]),
        .Q(EndReadPointer_Registered[2]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \EndReadPointer_Registered_reg[3] 
       (.C(clk),
        .CE(Load_Pointers),
        .D(EndReadPointer[3]),
        .Q(EndReadPointer_Registered[3]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \EndReadPointer_Registered_reg[4] 
       (.C(clk),
        .CE(Load_Pointers),
        .D(EndReadPointer[4]),
        .Q(EndReadPointer_Registered[4]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \EndReadPointer_Registered_reg[5] 
       (.C(clk),
        .CE(Load_Pointers),
        .D(EndReadPointer[5]),
        .Q(EndReadPointer_Registered[5]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \EndReadPointer_Registered_reg[6] 
       (.C(clk),
        .CE(Load_Pointers),
        .D(EndReadPointer[6]),
        .Q(EndReadPointer_Registered[6]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \EndReadPointer_Registered_reg[7] 
       (.C(clk),
        .CE(Load_Pointers),
        .D(EndReadPointer[7]),
        .Q(EndReadPointer_Registered[7]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \EndReadPointer_Registered_reg[8] 
       (.C(clk),
        .CE(Load_Pointers),
        .D(EndReadPointer[8]),
        .Q(EndReadPointer_Registered[8]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \EndReadPointer_Registered_reg[9] 
       (.C(clk),
        .CE(Load_Pointers),
        .D(EndReadPointer[9]),
        .Q(EndReadPointer_Registered[9]),
        .R(rst));
  LUT3 #(
    .INIT(8'hB8)) 
    \FinalAdress[11]_i_2 
       (.I0(BaseReadPointer[11]),
        .I1(Load_Pointers),
        .I2(SingleLocalMemoryReadAddr[11]),
        .O(\FinalAdress[11]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \FinalAdress[11]_i_3 
       (.I0(BaseReadPointer[10]),
        .I1(Load_Pointers),
        .I2(SingleLocalMemoryReadAddr[10]),
        .O(\FinalAdress[11]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \FinalAdress[11]_i_4 
       (.I0(BaseReadPointer[9]),
        .I1(Load_Pointers),
        .I2(SingleLocalMemoryReadAddr[9]),
        .O(\FinalAdress[11]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \FinalAdress[11]_i_5 
       (.I0(BaseReadPointer[8]),
        .I1(Load_Pointers),
        .I2(SingleLocalMemoryReadAddr[8]),
        .O(\FinalAdress[11]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hF4)) 
    \FinalAdress[12]_i_1 
       (.I0(StreamingFinished_Flag),
        .I1(IncreamentReadAdress_Enable),
        .I2(Load_Pointers),
        .O(\FinalAdress[12]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \FinalAdress[12]_i_3 
       (.I0(BaseReadPointer[12]),
        .I1(Load_Pointers),
        .I2(SingleLocalMemoryReadAddr[12]),
        .O(\FinalAdress[12]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \FinalAdress[3]_i_2 
       (.I0(BaseReadPointer[0]),
        .I1(Load_Pointers),
        .I2(SingleLocalMemoryReadAddr[0]),
        .O(\FinalAdress[3]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \FinalAdress[3]_i_3 
       (.I0(BaseReadPointer[3]),
        .I1(Load_Pointers),
        .I2(SingleLocalMemoryReadAddr[3]),
        .O(\FinalAdress[3]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \FinalAdress[3]_i_4 
       (.I0(BaseReadPointer[2]),
        .I1(Load_Pointers),
        .I2(SingleLocalMemoryReadAddr[2]),
        .O(\FinalAdress[3]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \FinalAdress[3]_i_5 
       (.I0(BaseReadPointer[1]),
        .I1(Load_Pointers),
        .I2(SingleLocalMemoryReadAddr[1]),
        .O(\FinalAdress[3]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hC5)) 
    \FinalAdress[3]_i_6 
       (.I0(SingleLocalMemoryReadAddr[0]),
        .I1(BaseReadPointer[0]),
        .I2(Load_Pointers),
        .O(\FinalAdress[3]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \FinalAdress[7]_i_2 
       (.I0(BaseReadPointer[7]),
        .I1(Load_Pointers),
        .I2(SingleLocalMemoryReadAddr[7]),
        .O(\FinalAdress[7]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \FinalAdress[7]_i_3 
       (.I0(BaseReadPointer[6]),
        .I1(Load_Pointers),
        .I2(SingleLocalMemoryReadAddr[6]),
        .O(\FinalAdress[7]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \FinalAdress[7]_i_4 
       (.I0(BaseReadPointer[5]),
        .I1(Load_Pointers),
        .I2(SingleLocalMemoryReadAddr[5]),
        .O(\FinalAdress[7]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \FinalAdress[7]_i_5 
       (.I0(BaseReadPointer[4]),
        .I1(Load_Pointers),
        .I2(SingleLocalMemoryReadAddr[4]),
        .O(\FinalAdress[7]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \FinalAdress_reg[0] 
       (.C(clk),
        .CE(\FinalAdress[12]_i_1_n_0 ),
        .D(\FinalAdress_reg[3]_i_1_n_7 ),
        .Q(SingleLocalMemoryReadAddr[0]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \FinalAdress_reg[10] 
       (.C(clk),
        .CE(\FinalAdress[12]_i_1_n_0 ),
        .D(\FinalAdress_reg[11]_i_1_n_5 ),
        .Q(SingleLocalMemoryReadAddr[10]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \FinalAdress_reg[11] 
       (.C(clk),
        .CE(\FinalAdress[12]_i_1_n_0 ),
        .D(\FinalAdress_reg[11]_i_1_n_4 ),
        .Q(SingleLocalMemoryReadAddr[11]),
        .R(rst));
  CARRY4 \FinalAdress_reg[11]_i_1 
       (.CI(\FinalAdress_reg[7]_i_1_n_0 ),
        .CO({\FinalAdress_reg[11]_i_1_n_0 ,\FinalAdress_reg[11]_i_1_n_1 ,\FinalAdress_reg[11]_i_1_n_2 ,\FinalAdress_reg[11]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\FinalAdress_reg[11]_i_1_n_4 ,\FinalAdress_reg[11]_i_1_n_5 ,\FinalAdress_reg[11]_i_1_n_6 ,\FinalAdress_reg[11]_i_1_n_7 }),
        .S({\FinalAdress[11]_i_2_n_0 ,\FinalAdress[11]_i_3_n_0 ,\FinalAdress[11]_i_4_n_0 ,\FinalAdress[11]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \FinalAdress_reg[12] 
       (.C(clk),
        .CE(\FinalAdress[12]_i_1_n_0 ),
        .D(\FinalAdress_reg[12]_i_2_n_7 ),
        .Q(SingleLocalMemoryReadAddr[12]),
        .R(rst));
  CARRY4 \FinalAdress_reg[12]_i_2 
       (.CI(\FinalAdress_reg[11]_i_1_n_0 ),
        .CO(\NLW_FinalAdress_reg[12]_i_2_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_FinalAdress_reg[12]_i_2_O_UNCONNECTED [3:1],\FinalAdress_reg[12]_i_2_n_7 }),
        .S({1'b0,1'b0,1'b0,\FinalAdress[12]_i_3_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \FinalAdress_reg[1] 
       (.C(clk),
        .CE(\FinalAdress[12]_i_1_n_0 ),
        .D(\FinalAdress_reg[3]_i_1_n_6 ),
        .Q(SingleLocalMemoryReadAddr[1]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \FinalAdress_reg[2] 
       (.C(clk),
        .CE(\FinalAdress[12]_i_1_n_0 ),
        .D(\FinalAdress_reg[3]_i_1_n_5 ),
        .Q(SingleLocalMemoryReadAddr[2]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \FinalAdress_reg[3] 
       (.C(clk),
        .CE(\FinalAdress[12]_i_1_n_0 ),
        .D(\FinalAdress_reg[3]_i_1_n_4 ),
        .Q(SingleLocalMemoryReadAddr[3]),
        .R(rst));
  CARRY4 \FinalAdress_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\FinalAdress_reg[3]_i_1_n_0 ,\FinalAdress_reg[3]_i_1_n_1 ,\FinalAdress_reg[3]_i_1_n_2 ,\FinalAdress_reg[3]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\FinalAdress[3]_i_2_n_0 }),
        .O({\FinalAdress_reg[3]_i_1_n_4 ,\FinalAdress_reg[3]_i_1_n_5 ,\FinalAdress_reg[3]_i_1_n_6 ,\FinalAdress_reg[3]_i_1_n_7 }),
        .S({\FinalAdress[3]_i_3_n_0 ,\FinalAdress[3]_i_4_n_0 ,\FinalAdress[3]_i_5_n_0 ,\FinalAdress[3]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \FinalAdress_reg[4] 
       (.C(clk),
        .CE(\FinalAdress[12]_i_1_n_0 ),
        .D(\FinalAdress_reg[7]_i_1_n_7 ),
        .Q(SingleLocalMemoryReadAddr[4]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \FinalAdress_reg[5] 
       (.C(clk),
        .CE(\FinalAdress[12]_i_1_n_0 ),
        .D(\FinalAdress_reg[7]_i_1_n_6 ),
        .Q(SingleLocalMemoryReadAddr[5]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \FinalAdress_reg[6] 
       (.C(clk),
        .CE(\FinalAdress[12]_i_1_n_0 ),
        .D(\FinalAdress_reg[7]_i_1_n_5 ),
        .Q(SingleLocalMemoryReadAddr[6]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \FinalAdress_reg[7] 
       (.C(clk),
        .CE(\FinalAdress[12]_i_1_n_0 ),
        .D(\FinalAdress_reg[7]_i_1_n_4 ),
        .Q(SingleLocalMemoryReadAddr[7]),
        .R(rst));
  CARRY4 \FinalAdress_reg[7]_i_1 
       (.CI(\FinalAdress_reg[3]_i_1_n_0 ),
        .CO({\FinalAdress_reg[7]_i_1_n_0 ,\FinalAdress_reg[7]_i_1_n_1 ,\FinalAdress_reg[7]_i_1_n_2 ,\FinalAdress_reg[7]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\FinalAdress_reg[7]_i_1_n_4 ,\FinalAdress_reg[7]_i_1_n_5 ,\FinalAdress_reg[7]_i_1_n_6 ,\FinalAdress_reg[7]_i_1_n_7 }),
        .S({\FinalAdress[7]_i_2_n_0 ,\FinalAdress[7]_i_3_n_0 ,\FinalAdress[7]_i_4_n_0 ,\FinalAdress[7]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \FinalAdress_reg[8] 
       (.C(clk),
        .CE(\FinalAdress[12]_i_1_n_0 ),
        .D(\FinalAdress_reg[11]_i_1_n_7 ),
        .Q(SingleLocalMemoryReadAddr[8]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \FinalAdress_reg[9] 
       (.C(clk),
        .CE(\FinalAdress[12]_i_1_n_0 ),
        .D(\FinalAdress_reg[11]_i_1_n_6 ),
        .Q(SingleLocalMemoryReadAddr[9]),
        .R(rst));
  CARRY4 StreamingFinished_Flag_INST_0
       (.CI(StreamingFinished_Flag_INST_0_i_1_n_0),
        .CO({NLW_StreamingFinished_Flag_INST_0_CO_UNCONNECTED[3:1],StreamingFinished_Flag}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_StreamingFinished_Flag_INST_0_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,StreamingFinished_Flag_INST_0_i_2_n_0}));
  CARRY4 StreamingFinished_Flag_INST_0_i_1
       (.CI(1'b0),
        .CO({StreamingFinished_Flag_INST_0_i_1_n_0,StreamingFinished_Flag_INST_0_i_1_n_1,StreamingFinished_Flag_INST_0_i_1_n_2,StreamingFinished_Flag_INST_0_i_1_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_StreamingFinished_Flag_INST_0_i_1_O_UNCONNECTED[3:0]),
        .S({StreamingFinished_Flag_INST_0_i_3_n_0,StreamingFinished_Flag_INST_0_i_4_n_0,StreamingFinished_Flag_INST_0_i_5_n_0,StreamingFinished_Flag_INST_0_i_6_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    StreamingFinished_Flag_INST_0_i_2
       (.I0(SingleLocalMemoryReadAddr[12]),
        .I1(EndReadPointer_Registered[12]),
        .O(StreamingFinished_Flag_INST_0_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    StreamingFinished_Flag_INST_0_i_3
       (.I0(EndReadPointer_Registered[9]),
        .I1(SingleLocalMemoryReadAddr[9]),
        .I2(SingleLocalMemoryReadAddr[11]),
        .I3(EndReadPointer_Registered[11]),
        .I4(SingleLocalMemoryReadAddr[10]),
        .I5(EndReadPointer_Registered[10]),
        .O(StreamingFinished_Flag_INST_0_i_3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    StreamingFinished_Flag_INST_0_i_4
       (.I0(EndReadPointer_Registered[6]),
        .I1(SingleLocalMemoryReadAddr[6]),
        .I2(SingleLocalMemoryReadAddr[8]),
        .I3(EndReadPointer_Registered[8]),
        .I4(SingleLocalMemoryReadAddr[7]),
        .I5(EndReadPointer_Registered[7]),
        .O(StreamingFinished_Flag_INST_0_i_4_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    StreamingFinished_Flag_INST_0_i_5
       (.I0(EndReadPointer_Registered[3]),
        .I1(SingleLocalMemoryReadAddr[3]),
        .I2(SingleLocalMemoryReadAddr[5]),
        .I3(EndReadPointer_Registered[5]),
        .I4(SingleLocalMemoryReadAddr[4]),
        .I5(EndReadPointer_Registered[4]),
        .O(StreamingFinished_Flag_INST_0_i_5_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    StreamingFinished_Flag_INST_0_i_6
       (.I0(EndReadPointer_Registered[0]),
        .I1(SingleLocalMemoryReadAddr[0]),
        .I2(SingleLocalMemoryReadAddr[2]),
        .I3(EndReadPointer_Registered[2]),
        .I4(SingleLocalMemoryReadAddr[1]),
        .I5(EndReadPointer_Registered[1]),
        .O(StreamingFinished_Flag_INST_0_i_6_n_0));
  VCC VCC
       (.P(\<const1> ));
endmodule
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
