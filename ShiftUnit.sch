# File saved with Nlview 6.5.5  2015-06-26 bk=1.3371 VDI=38 GEI=35 GUI=JA:1.8
# 
# non-default properties - (restore without -noprops)
property attrcolor #000000
property attrfontsize 8
property autobundle 1
property backgroundcolor #ffffff
property boxcolor0 #000000
property boxcolor1 #000000
property boxcolor2 #000000
property boxinstcolor #000000
property boxpincolor #000000
property buscolor #008000
property closeenough 5
property createnetattrdsp 2048
property decorate 1
property elidetext 40
property fillcolor1 #ffffcc
property fillcolor2 #dfebf8
property fillcolor3 #f0f0f0
property gatecellname 2
property instattrmax 30
property instdrag 15
property instorder 1
property marksize 12
property maxfontsize 12
property maxzoom 5
property netcolor #19b400
property objecthighlight0 #ff00ff
property objecthighlight1 #ffff00
property objecthighlight2 #00ff00
property objecthighlight3 #ff6666
property objecthighlight4 #0000ff
property objecthighlight5 #ffc800
property objecthighlight7 #00ffff
property objecthighlight8 #ff00ff
property objecthighlight9 #ccccff
property objecthighlight10 #0ead00
property objecthighlight11 #cefc00
property objecthighlight12 #9e2dbe
property objecthighlight13 #ba6a29
property objecthighlight14 #fc0188
property objecthighlight15 #02f990
property objecthighlight16 #f1b0fb
property objecthighlight17 #fec004
property objecthighlight18 #149bff
property objecthighlight19 #eb591b
property overlapcolor #19b400
property pbuscolor #000000
property pbusnamecolor #000000
property pinattrmax 20
property pinorder 2
property pinpermute 0
property portcolor #000000
property portnamecolor #000000
property ripindexfontsize 8
property rippercolor #000000
property rubberbandcolor #000000
property rubberbandfontsize 12
property selectattr 0
property selectionappearance 2
property selectioncolor #0000ff
property sheetheight 44
property sheetwidth 68
property showmarks 1
property shownetname 0
property showpagenumbers 1
property showripindex 4
property timelimit 1
#
module new ShiftUnit work:ShiftUnit:NOFILE -nosplit
load symbol RTL_MUX13 work MUX pin S input.bot pinBus I0 input.left [17:0] pinBus I1 input.left [17:0] pinBus O output.right [17:0] fillcolor 1
load symbol OBUF hdi_primitives[17:0] BUF pinBus O output [17:0] pinBus I input [17:0] fillcolor 1 sandwich 3 prop @bundle 18
load symbol RTL_REG_SYNC__BREG_1 work[17:0]swws GEN pin C input.clk.left pinBus D input.left [17:0] pinBus Q output.right [17:0] pin RST input.top fillcolor 1 sandwich 3 prop @bundle 18
load symbol RTL_MUX14 work[7:0]ssws MUX pin I0 input.left pin I1 input.left pinBus O output.right [7:0] pin S input.bot fillcolor 1 sandwich 3 prop @bundle 8
load port clk input -pg 1 -y 560
load port rst input -pg 1 -y 530
load port ShiftEn input -pg 1 -y 170
load portBus InputWords[1] input [17:0] -attr @name InputWords[1][17:0] -pg 1 -y 250
load portBus NextUnit_out output [17:0] -attr @name NextUnit_out[17:0] -pg 1 -y 50
load portBus OutputWords[6] output [17:0] -attr @name OutputWords[6][17:0] -pg 1 -y 450
load portBus InputWords[0] input [17:0] -attr @name InputWords[0][17:0] -pg 1 -y 270
load portBus OutputWords[4] output [17:0] -attr @name OutputWords[4][17:0] -pg 1 -y 310
load portBus InputWords[6] input [17:0] -attr @name InputWords[6][17:0] -pg 1 -y 290
load portBus OutputWords[3] output [17:0] -attr @name OutputWords[3][17:0] -pg 1 -y 240
load portBus InputWords[5] input [17:0] -attr @name InputWords[5][17:0] -pg 1 -y 310
load portBus OutputWords[7] output [17:0] -attr @name OutputWords[7][17:0] -pg 1 -y 520
load portBus InputWords[4] input [17:0] -attr @name InputWords[4][17:0] -pg 1 -y 190
load portBus InputWords[7] input [17:0] -attr @name InputWords[7][17:0] -pg 1 -y 130
load portBus OutputWords[2] output [17:0] -attr @name OutputWords[2][17:0] -pg 1 -y 170
load portBus InputWords[3] input [17:0] -attr @name InputWords[3][17:0] -pg 1 -y 210
load portBus OutputWords[1] output [17:0] -attr @name OutputWords[1][17:0] -pg 1 -y 100
load portBus OutputWords[0] output [17:0] -attr @name OutputWords[0][17:0] -pg 1 -y 30
load portBus OutputWords[5] output [17:0] -attr @name OutputWords[5][17:0] -pg 1 -y 380
load portBus InputWords[2] input [17:0] -attr @name InputWords[2][17:0] -pg 1 -y 230
load portBus PrevUnit_in input [17:0] -attr @name PrevUnit_in[17:0] -pg 1 -y 110
load inst OutputWords_FF[7:0]_i__0 RTL_MUX14 work[7:0]ssws -attr @cell(#000000) RTL_MUX -pinAttr I0 @attr S=1'b0 -pinAttr I1 @attr S=default -pg 1 -lvl 1 -y 460
load inst OutputWords_FF[0]_i RTL_MUX13 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[17:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[17:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[17:0] -pg 1 -lvl 15 -y 540
load inst OutputWords_FF[5]_i RTL_MUX13 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[17:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[17:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[17:0] -pg 1 -lvl 5 -y 330
load inst OutputWords_FF[6]_i RTL_MUX13 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[17:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[17:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[17:0] -pg 1 -lvl 3 -y 370
load inst OutputWords_FF_reg[1][17:0] RTL_REG_SYNC__BREG_1 work[17:0]swws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 14 -y 540
load inst OutputWords_FF[4]_i RTL_MUX13 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[17:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[17:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[17:0] -pg 1 -lvl 7 -y 330
load inst OutputWords[7][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 17 -y 570
load inst OutputWords[5][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 17 -y 410
load inst OutputWords_FF[3]_i RTL_MUX13 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[17:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[17:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[17:0] -pg 1 -lvl 9 -y 330
load inst OutputWords_FF_reg[0][17:0] RTL_REG_SYNC__BREG_1 work[17:0]swws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 16 -y 540
load inst OutputWords_FF_reg[3][17:0] RTL_REG_SYNC__BREG_1 work[17:0]swws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 10 -y 540
load inst OutputWords[6][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 17 -y 490
load inst OutputWords_FF_reg[6][17:0] RTL_REG_SYNC__BREG_1 work[17:0]swws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 4 -y 520
load inst OutputWords_FF_reg[5][17:0] RTL_REG_SYNC__BREG_1 work[17:0]swws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 6 -y 520
load inst OutputWords[1][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 17 -y 90
load inst OutputWords_FF[1]_i RTL_MUX13 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[17:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[17:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[17:0] -pg 1 -lvl 13 -y 330
load inst OutputWords_FF_reg[2][17:0] RTL_REG_SYNC__BREG_1 work[17:0]swws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 12 -y 540
load inst OutputWords[3][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 17 -y 250
load inst OutputWords_FF[2]_i RTL_MUX13 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[17:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[17:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[17:0] -pg 1 -lvl 11 -y 330
load inst OutputWords[4][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 17 -y 330
load inst OutputWords_FF_reg[7][17:0] RTL_REG_SYNC__BREG_1 work[17:0]swws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 520
load inst OutputWords_FF_reg[4][17:0] RTL_REG_SYNC__BREG_1 work[17:0]swws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 8 -y 520
load inst OutputWords_FF[7]_i RTL_MUX13 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[17:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[17:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[17:0] -pg 1 -lvl 1 -y 120
load inst OutputWords[0][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 17 -y 10
load inst OutputWords[2][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 17 -y 170
load net InputWords[5][1] -attr @rip(#000000) InputWords[5][1] -port InputWords[5][1] -pin OutputWords_FF[5]_i I1[1]
load net OutputWords[0][8] -attr @rip(#000000) 8 -port OutputWords[0][8] -pin OutputWords[0][17:0]_OBUF_inst O[8]
load net InputWords[3][14] -attr @rip(#000000) InputWords[3][14] -port InputWords[3][14] -pin OutputWords_FF[3]_i I1[14]
load net OutputWords[6][17] -attr @rip(#000000) 17 -port OutputWords[6][17] -pin OutputWords[6][17:0]_OBUF_inst O[17]
load net OutputWords[7]_OBUF[14] -attr @rip(#000000) 14 -pin OutputWords[7][17:0]_OBUF_inst I[14] -pin OutputWords_FF[6]_i I0[14] -pin OutputWords_FF_reg[7][17:0] Q[14]
load net OutputWords_FF[3][10] -attr @rip(#000000) O[10] -pin OutputWords_FF[3]_i O[10] -pin OutputWords_FF_reg[3][17:0] D[10]
load net OutputWords[1][9] -attr @rip(#000000) 9 -port OutputWords[1][9] -pin OutputWords[1][17:0]_OBUF_inst O[9]
load net OutputWords[2][6] -attr @rip(#000000) 6 -port OutputWords[2][6] -pin OutputWords[2][17:0]_OBUF_inst O[6]
load net OutputWords[0]_OBUF[3] -pin OutputWords[0][17:0]_OBUF_inst I[3] -pin OutputWords_FF_reg[0][17:0] Q[3]
load net OutputWords[7][14] -attr @rip(#000000) 14 -port OutputWords[7][14] -pin OutputWords[7][17:0]_OBUF_inst O[14]
load net OutputWords_FF[5][13] -attr @rip(#000000) O[13] -pin OutputWords_FF[5]_i O[13] -pin OutputWords_FF_reg[5][17:0] D[13]
load net PrevUnit_in[14] -attr @rip(#000000) PrevUnit_in[14] -pin OutputWords_FF[7]_i I0[14] -port PrevUnit_in[14]
load net InputWords[7][15] -attr @rip(#000000) InputWords[7][15] -port InputWords[7][15] -pin OutputWords_FF[7]_i I1[15]
load net InputWords[0][5] -attr @rip(#000000) InputWords[0][5] -port InputWords[0][5] -pin OutputWords_FF[0]_i I1[5]
load net OutputWords[3]_OBUF[2] -attr @rip(#000000) 2 -pin OutputWords[3][17:0]_OBUF_inst I[2] -pin OutputWords_FF[2]_i I0[2] -pin OutputWords_FF_reg[3][17:0] Q[2]
load net OutputWords[5]_OBUF[10] -attr @rip(#000000) 10 -pin OutputWords[5][17:0]_OBUF_inst I[10] -pin OutputWords_FF[4]_i I0[10] -pin OutputWords_FF_reg[5][17:0] Q[10]
load net OutputWords_FF[0][15] -attr @rip(#000000) O[15] -pin OutputWords_FF[0]_i O[15] -pin OutputWords_FF_reg[0][17:0] D[15]
load net OutputWords[4]_OBUF[14] -attr @rip(#000000) 14 -pin OutputWords[4][17:0]_OBUF_inst I[14] -pin OutputWords_FF[3]_i I0[14] -pin OutputWords_FF_reg[4][17:0] Q[14]
load net OutputWords[2][10] -attr @rip(#000000) 10 -port OutputWords[2][10] -pin OutputWords[2][17:0]_OBUF_inst O[10]
load net OutputWords[2][15] -attr @rip(#000000) 15 -port OutputWords[2][15] -pin OutputWords[2][17:0]_OBUF_inst O[15]
load net OutputWords[3]_OBUF[11] -attr @rip(#000000) 11 -pin OutputWords[3][17:0]_OBUF_inst I[11] -pin OutputWords_FF[2]_i I0[11] -pin OutputWords_FF_reg[3][17:0] Q[11]
load net OutputWords[4][5] -attr @rip(#000000) 5 -port OutputWords[4][5] -pin OutputWords[4][17:0]_OBUF_inst O[5]
load net OutputWords_FF[5][4] -attr @rip(#000000) O[4] -pin OutputWords_FF[5]_i O[4] -pin OutputWords_FF_reg[5][17:0] D[4]
load net InputWords[2][14] -attr @rip(#000000) InputWords[2][14] -port InputWords[2][14] -pin OutputWords_FF[2]_i I1[14]
load net OutputWords[3][17] -attr @rip(#000000) 17 -port OutputWords[3][17] -pin OutputWords[3][17:0]_OBUF_inst O[17]
load net OutputWords[3][3] -attr @rip(#000000) 3 -port OutputWords[3][3] -pin OutputWords[3][17:0]_OBUF_inst O[3]
load net OutputWords_FF[1][7] -attr @rip(#000000) O[7] -pin OutputWords_FF[1]_i O[7] -pin OutputWords_FF_reg[1][17:0] D[7]
load net InputWords[6][6] -attr @rip(#000000) InputWords[6][6] -port InputWords[6][6] -pin OutputWords_FF[6]_i I1[6]
load net InputWords[3][10] -attr @rip(#000000) InputWords[3][10] -port InputWords[3][10] -pin OutputWords_FF[3]_i I1[10]
load net OutputWords[4]_OBUF[4] -attr @rip(#000000) 4 -pin OutputWords[4][17:0]_OBUF_inst I[4] -pin OutputWords_FF[3]_i I0[4] -pin OutputWords_FF_reg[4][17:0] Q[4]
load net OutputWords[7]_OBUF[6] -attr @rip(#000000) 6 -pin OutputWords[7][17:0]_OBUF_inst I[6] -pin OutputWords_FF[6]_i I0[6] -pin OutputWords_FF_reg[7][17:0] Q[6]
load net OutputWords_FF[2][6] -attr @rip(#000000) O[6] -pin OutputWords_FF[2]_i O[6] -pin OutputWords_FF_reg[2][17:0] D[6]
load net InputWords[1][17] -attr @rip(#000000) InputWords[1][17] -port InputWords[1][17] -pin OutputWords_FF[1]_i I1[17]
load net InputWords[3][9] -attr @rip(#000000) InputWords[3][9] -port InputWords[3][9] -pin OutputWords_FF[3]_i I1[9]
load net OutputWords_FF[0][4] -attr @rip(#000000) O[4] -pin OutputWords_FF[0]_i O[4] -pin OutputWords_FF_reg[0][17:0] D[4]
load net OutputWords_FF[2][16] -attr @rip(#000000) O[16] -pin OutputWords_FF[2]_i O[16] -pin OutputWords_FF_reg[2][17:0] D[16]
load net InputWords[1][9] -attr @rip(#000000) InputWords[1][9] -port InputWords[1][9] -pin OutputWords_FF[1]_i I1[9]
load net OutputWords[2]_OBUF[2] -attr @rip(#000000) 2 -pin OutputWords[2][17:0]_OBUF_inst I[2] -pin OutputWords_FF[1]_i I0[2] -pin OutputWords_FF_reg[2][17:0] Q[2]
load net InputWords[6][16] -attr @rip(#000000) InputWords[6][16] -port InputWords[6][16] -pin OutputWords_FF[6]_i I1[16]
load net OutputWords_FF[5][7] -attr @rip(#000000) O[7] -pin OutputWords_FF[5]_i O[7] -pin OutputWords_FF_reg[5][17:0] D[7]
load net InputWords[6][9] -attr @rip(#000000) InputWords[6][9] -port InputWords[6][9] -pin OutputWords_FF[6]_i I1[9]
load net OutputWords[2][3] -attr @rip(#000000) 3 -port OutputWords[2][3] -pin OutputWords[2][17:0]_OBUF_inst O[3]
load net OutputWords[6][1] -attr @rip(#000000) 1 -port OutputWords[6][1] -pin OutputWords[6][17:0]_OBUF_inst O[1]
load net OutputWords_FF[5][10] -attr @rip(#000000) O[10] -pin OutputWords_FF[5]_i O[10] -pin OutputWords_FF_reg[5][17:0] D[10]
load net InputWords[5][2] -attr @rip(#000000) InputWords[5][2] -port InputWords[5][2] -pin OutputWords_FF[5]_i I1[2]
load net OutputWords[0][17] -attr @rip(#000000) 17 -port OutputWords[0][17] -pin OutputWords[0][17:0]_OBUF_inst O[17]
load net OutputWords[1][8] -attr @rip(#000000) 8 -port OutputWords[1][8] -pin OutputWords[1][17:0]_OBUF_inst O[8]
load net OutputWords[5]_OBUF[6] -attr @rip(#000000) 6 -pin OutputWords[5][17:0]_OBUF_inst I[6] -pin OutputWords_FF[4]_i I0[6] -pin OutputWords_FF_reg[5][17:0] Q[6]
load net OutputWords[6][11] -attr @rip(#000000) 11 -port OutputWords[6][11] -pin OutputWords[6][17:0]_OBUF_inst O[11]
load net OutputWords[7]_OBUF[2] -attr @rip(#000000) 2 -pin OutputWords[7][17:0]_OBUF_inst I[2] -pin OutputWords_FF[6]_i I0[2] -pin OutputWords_FF_reg[7][17:0] Q[2]
load net OutputWords[1]_OBUF[16] -attr @rip(#000000) 16 -pin OutputWords[1][17:0]_OBUF_inst I[16] -pin OutputWords_FF[0]_i I0[16] -pin OutputWords_FF_reg[1][17:0] Q[16]
load net OutputWords[0]_OBUF[2] -pin OutputWords[0][17:0]_OBUF_inst I[2] -pin OutputWords_FF_reg[0][17:0] Q[2]
load net OutputWords[1]_OBUF[8] -attr @rip(#000000) 8 -pin OutputWords[1][17:0]_OBUF_inst I[8] -pin OutputWords_FF[0]_i I0[8] -pin OutputWords_FF_reg[1][17:0] Q[8]
load net OutputWords[7][13] -attr @rip(#000000) 13 -port OutputWords[7][13] -pin OutputWords[7][17:0]_OBUF_inst O[13]
load net OutputWords[7]_OBUF[15] -attr @rip(#000000) 15 -pin OutputWords[7][17:0]_OBUF_inst I[15] -pin OutputWords_FF[6]_i I0[15] -pin OutputWords_FF_reg[7][17:0] Q[15]
load net OutputWords_FF[3][11] -attr @rip(#000000) O[11] -pin OutputWords_FF[3]_i O[11] -pin OutputWords_FF_reg[3][17:0] D[11]
load net InputWords[0][4] -attr @rip(#000000) InputWords[0][4] -port InputWords[0][4] -pin OutputWords_FF[0]_i I1[4]
load net InputWords[7][14] -attr @rip(#000000) InputWords[7][14] -port InputWords[7][14] -pin OutputWords_FF[7]_i I1[14]
load net OutputWords[3]_OBUF[1] -attr @rip(#000000) 1 -pin OutputWords[3][17:0]_OBUF_inst I[1] -pin OutputWords_FF[2]_i I0[1] -pin OutputWords_FF_reg[3][17:0] Q[1]
load net InputWords[3][17] -attr @rip(#000000) InputWords[3][17] -port InputWords[3][17] -pin OutputWords_FF[3]_i I1[17]
load net OutputWords[4]_OBUF[13] -attr @rip(#000000) 13 -pin OutputWords[4][17:0]_OBUF_inst I[13] -pin OutputWords_FF[3]_i I0[13] -pin OutputWords_FF_reg[4][17:0] Q[13]
load net OutputWords[6]_OBUF[1] -attr @rip(#000000) 1 -pin OutputWords[6][17:0]_OBUF_inst I[1] -pin OutputWords_FF[5]_i I0[1] -pin OutputWords_FF_reg[6][17:0] Q[1]
load net InputWords[4][17] -attr @rip(#000000) InputWords[4][17] -port InputWords[4][17] -pin OutputWords_FF[4]_i I1[17]
load net OutputWords[1][10] -attr @rip(#000000) 10 -port OutputWords[1][10] -pin OutputWords[1][17:0]_OBUF_inst O[10]
load net OutputWords[2][14] -attr @rip(#000000) 14 -port OutputWords[2][14] -pin OutputWords[2][17:0]_OBUF_inst O[14]
load net OutputWords[5]_OBUF[11] -attr @rip(#000000) 11 -pin OutputWords[5][17:0]_OBUF_inst I[11] -pin OutputWords_FF[4]_i I0[11] -pin OutputWords_FF_reg[5][17:0] Q[11]
load net OutputWords_FF[0][16] -attr @rip(#000000) O[16] -pin OutputWords_FF[0]_i O[16] -pin OutputWords_FF_reg[0][17:0] D[16]
load net OutputWords_FF[5][3] -attr @rip(#000000) O[3] -pin OutputWords_FF[5]_i O[3] -pin OutputWords_FF_reg[5][17:0] D[3]
load net InputWords[2][13] -attr @rip(#000000) InputWords[2][13] -port InputWords[2][13] -pin OutputWords_FF[2]_i I1[13]
load net OutputWords[3][2] -attr @rip(#000000) 2 -port OutputWords[3][2] -pin OutputWords[3][17:0]_OBUF_inst O[2]
load net OutputWords[4][6] -attr @rip(#000000) 6 -port OutputWords[4][6] -pin OutputWords[4][17:0]_OBUF_inst O[6]
load net <const0> -ground -pin OutputWords_FF[7:0]_i__0 I1
load net OutputWords[2]_OBUF[9] -attr @rip(#000000) 9 -pin OutputWords[2][17:0]_OBUF_inst I[9] -pin OutputWords_FF[1]_i I0[9] -pin OutputWords_FF_reg[2][17:0] Q[9]
load net OutputWords[4]_OBUF[3] -attr @rip(#000000) 3 -pin OutputWords[4][17:0]_OBUF_inst I[3] -pin OutputWords_FF[3]_i I0[3] -pin OutputWords_FF_reg[4][17:0] Q[3]
load net OutputWords[7]_OBUF[5] -attr @rip(#000000) 5 -pin OutputWords[7][17:0]_OBUF_inst I[5] -pin OutputWords_FF[6]_i I0[5] -pin OutputWords_FF_reg[7][17:0] Q[5]
load net PrevUnit_in[1] -attr @rip(#000000) PrevUnit_in[1] -pin OutputWords_FF[7]_i I0[1] -port PrevUnit_in[1]
load net InputWords[1][16] -attr @rip(#000000) InputWords[1][16] -port InputWords[1][16] -pin OutputWords_FF[1]_i I1[16]
load net OutputWords_FF[7][14] -attr @rip(#000000) O[14] -pin OutputWords_FF[7]_i O[14] -pin OutputWords_FF_reg[7][17:0] D[14]
load net OutputWords[2]_OBUF[17] -attr @rip(#000000) 17 -pin OutputWords[2][17:0]_OBUF_inst I[17] -pin OutputWords_FF[1]_i I0[17] -pin OutputWords_FF_reg[2][17:0] Q[17]
load net OutputWords_FF[2][7] -attr @rip(#000000) O[7] -pin OutputWords_FF[2]_i O[7] -pin OutputWords_FF_reg[2][17:0] D[7]
load net OutputWords_FF[0][5] -attr @rip(#000000) O[5] -pin OutputWords_FF[0]_i O[5] -pin OutputWords_FF_reg[0][17:0] D[5]
load net InputWords[6][15] -attr @rip(#000000) InputWords[6][15] -port InputWords[6][15] -pin OutputWords_FF[6]_i I1[15]
load net OutputWords_FF[5][6] -attr @rip(#000000) O[6] -pin OutputWords_FF[5]_i O[6] -pin OutputWords_FF_reg[5][17:0] D[6]
load net InputWords[5][9] -attr @rip(#000000) InputWords[5][9] -port InputWords[5][9] -pin OutputWords_FF[5]_i I1[9]
load net OutputWords[7][17] -attr @rip(#000000) 17 -port OutputWords[7][17] -pin OutputWords[7][17:0]_OBUF_inst O[17]
load net OutputWords[7]_OBUF[12] -attr @rip(#000000) 12 -pin OutputWords[7][17:0]_OBUF_inst I[12] -pin OutputWords_FF[6]_i I0[12] -pin OutputWords_FF_reg[7][17:0] Q[12]
load net OutputWords[0][16] -attr @rip(#000000) 16 -port OutputWords[0][16] -pin OutputWords[0][17:0]_OBUF_inst O[16]
load net OutputWords[2][4] -attr @rip(#000000) 4 -port OutputWords[2][4] -pin OutputWords[2][17:0]_OBUF_inst O[4]
load net OutputWords[4][13] -attr @rip(#000000) 13 -port OutputWords[4][13] -pin OutputWords[4][17:0]_OBUF_inst O[13]
load net OutputWords[5]_OBUF[5] -attr @rip(#000000) 5 -pin OutputWords[5][17:0]_OBUF_inst I[5] -pin OutputWords_FF[4]_i I0[5] -pin OutputWords_FF_reg[5][17:0] Q[5]
load net OutputWords[6][10] -attr @rip(#000000) 10 -port OutputWords[6][10] -pin OutputWords[6][17:0]_OBUF_inst O[10]
load net OutputWords[7]_OBUF[1] -attr @rip(#000000) 1 -pin OutputWords[7][17:0]_OBUF_inst I[1] -pin OutputWords_FF[6]_i I0[1] -pin OutputWords_FF_reg[7][17:0] Q[1]
load net OutputWords_FF[4][4] -attr @rip(#000000) O[4] -pin OutputWords_FF[4]_i O[4] -pin OutputWords_FF_reg[4][17:0] D[4]
load net InputWords[5][15] -attr @rip(#000000) InputWords[5][15] -port InputWords[5][15] -pin OutputWords_FF[5]_i I1[15]
load net OutputWords[1]_OBUF[7] -attr @rip(#000000) 7 -pin OutputWords[1][17:0]_OBUF_inst I[7] -pin OutputWords_FF[0]_i I0[7] -pin OutputWords_FF_reg[1][17:0] Q[7]
load net OutputWords[5][8] -attr @rip(#000000) 8 -port OutputWords[5][8] -pin OutputWords[5][17:0]_OBUF_inst O[8]
load net OutputWords[6][2] -attr @rip(#000000) 2 -port OutputWords[6][2] -pin OutputWords[6][17:0]_OBUF_inst O[2]
load net OutputWords_FF[5][11] -attr @rip(#000000) O[11] -pin OutputWords_FF[5]_i O[11] -pin OutputWords_FF_reg[5][17:0] D[11]
load net InputWords[0][3] -attr @rip(#000000) InputWords[0][3] -port InputWords[0][3] -pin OutputWords_FF[0]_i I1[3]
load net InputWords[7][13] -attr @rip(#000000) InputWords[7][13] -port InputWords[7][13] -pin OutputWords_FF[7]_i I1[13]
load net InputWords[3][16] -attr @rip(#000000) InputWords[3][16] -port InputWords[3][16] -pin OutputWords_FF[3]_i I1[16]
load net OutputWords[1]_OBUF[17] -attr @rip(#000000) 17 -pin OutputWords[1][17:0]_OBUF_inst I[17] -pin OutputWords_FF[0]_i I0[17] -pin OutputWords_FF_reg[1][17:0] Q[17]
load net OutputWords[4]_OBUF[12] -attr @rip(#000000) 12 -pin OutputWords[4][17:0]_OBUF_inst I[12] -pin OutputWords_FF[3]_i I0[12] -pin OutputWords_FF_reg[4][17:0] Q[12]
load net OutputWords[6]_OBUF[0] -attr @rip(#000000) 0 -pin OutputWords[6][17:0]_OBUF_inst I[0] -pin OutputWords_FF[5]_i I0[0] -pin OutputWords_FF_reg[6][17:0] Q[0]
load net clk -pin OutputWords_FF_reg[0][17:0] C -pin OutputWords_FF_reg[1][17:0] C -pin OutputWords_FF_reg[2][17:0] C -pin OutputWords_FF_reg[3][17:0] C -pin OutputWords_FF_reg[4][17:0] C -pin OutputWords_FF_reg[5][17:0] C -pin OutputWords_FF_reg[6][17:0] C -pin OutputWords_FF_reg[7][17:0] C -port clk
netloc clk 1 0 16 NJ 560 440 590 NJ 590 1080 590 NJ 590 1720 590 NJ 590 2460 590 NJ 590 3220 610 NJ 610 4000 610 NJ 610 4820 610 NJ 620 NJ
load net InputWords[4][16] -attr @rip(#000000) InputWords[4][16] -port InputWords[4][16] -pin OutputWords_FF[4]_i I1[16]
load net OutputWords[2][13] -attr @rip(#000000) 13 -port OutputWords[2][13] -pin OutputWords[2][17:0]_OBUF_inst O[13]
load net OutputWords_FF[0][1] -attr @rip(#000000) O[1] -pin OutputWords_FF[0]_i O[1] -pin OutputWords_FF_reg[0][17:0] D[1]
load net OutputWords_FF[5][2] -attr @rip(#000000) O[2] -pin OutputWords_FF[5]_i O[2] -pin OutputWords_FF_reg[5][17:0] D[2]
load net OutputWords[0]_OBUF[5] -pin OutputWords[0][17:0]_OBUF_inst I[5] -pin OutputWords_FF_reg[0][17:0] Q[5]
load net InputWords[1][11] -attr @rip(#000000) InputWords[1][11] -port InputWords[1][11] -pin OutputWords_FF[1]_i I1[11]
load net OutputWords[3][10] -attr @rip(#000000) 10 -port OutputWords[3][10] -pin OutputWords[3][17:0]_OBUF_inst O[10]
load net OutputWords_FF[2][10] -attr @rip(#000000) O[10] -pin OutputWords_FF[2]_i O[10] -pin OutputWords_FF_reg[2][17:0] D[10]
load net InputWords[5][7] -attr @rip(#000000) InputWords[5][7] -port InputWords[5][7] -pin OutputWords_FF[5]_i I1[7]
load net OutputWords[5]_OBUF[12] -attr @rip(#000000) 12 -pin OutputWords[5][17:0]_OBUF_inst I[12] -pin OutputWords_FF[4]_i I0[12] -pin OutputWords_FF_reg[5][17:0] Q[12]
load net InputWords[3][0] -attr @rip(#000000) InputWords[3][0] -port InputWords[3][0] -pin OutputWords_FF[3]_i I1[0]
load net OutputWords_FF[1]_i__0_n_0 -pin OutputWords_FF[7:0]_i__0 O[1] -pin OutputWords_FF_reg[1][17:0] RST
load net OutputWords[2]_OBUF[8] -attr @rip(#000000) 8 -pin OutputWords[2][17:0]_OBUF_inst I[8] -pin OutputWords_FF[1]_i I0[8] -pin OutputWords_FF_reg[2][17:0] Q[8]
load net OutputWords[4][7] -attr @rip(#000000) 7 -port OutputWords[4][7] -pin OutputWords[4][17:0]_OBUF_inst O[7]
load net OutputWords[4]_OBUF[2] -attr @rip(#000000) 2 -pin OutputWords[4][17:0]_OBUF_inst I[2] -pin OutputWords_FF[3]_i I0[2] -pin OutputWords_FF_reg[4][17:0] Q[2]
load net PrevUnit_in[0] -attr @rip(#000000) PrevUnit_in[0] -pin OutputWords_FF[7]_i I0[0] -port PrevUnit_in[0]
load net <const1> -power -pin OutputWords_FF[7:0]_i__0 I0
load net OutputWords[3][5] -attr @rip(#000000) 5 -port OutputWords[3][5] -pin OutputWords[3][17:0]_OBUF_inst O[5]
load net OutputWords_FF[0][2] -attr @rip(#000000) O[2] -pin OutputWords_FF[0]_i O[2] -pin OutputWords_FF_reg[0][17:0] D[2]
load net OutputWords[0]_OBUF[14] -pin OutputWords[0][17:0]_OBUF_inst I[14] -pin OutputWords_FF_reg[0][17:0] Q[14]
load net OutputWords[2]_OBUF[16] -attr @rip(#000000) 16 -pin OutputWords[2][17:0]_OBUF_inst I[16] -pin OutputWords_FF[1]_i I0[16] -pin OutputWords_FF_reg[2][17:0] Q[16]
load net InputWords[1][7] -attr @rip(#000000) InputWords[1][7] -port InputWords[1][7] -pin OutputWords_FF[1]_i I1[7]
load net OutputWords_FF[7][15] -attr @rip(#000000) O[15] -pin OutputWords_FF[7]_i O[15] -pin OutputWords_FF_reg[7][17:0] D[15]
load net InputWords[6][14] -attr @rip(#000000) InputWords[6][14] -port InputWords[6][14] -pin OutputWords_FF[6]_i I1[14]
load net OutputWords[7]_OBUF[8] -attr @rip(#000000) 8 -pin OutputWords[7][17:0]_OBUF_inst I[8] -pin OutputWords_FF[6]_i I0[8] -pin OutputWords_FF_reg[7][17:0] Q[8]
load net OutputWords_FF[5][5] -attr @rip(#000000) O[5] -pin OutputWords_FF[5]_i O[5] -pin OutputWords_FF_reg[5][17:0] D[5]
load net OutputWords_FF[2]_i__0_n_0 -pin OutputWords_FF[7:0]_i__0 O[2] -pin OutputWords_FF_reg[2][17:0] RST
load net OutputWords[0][0] -attr @rip(#000000) 0 -port OutputWords[0][0] -pin OutputWords[0][17:0]_OBUF_inst O[0]
load net OutputWords[0][15] -attr @rip(#000000) 15 -port OutputWords[0][15] -pin OutputWords[0][17:0]_OBUF_inst O[15]
load net OutputWords[4][12] -attr @rip(#000000) 12 -port OutputWords[4][12] -pin OutputWords[4][17:0]_OBUF_inst O[12]
load net OutputWords_FF[4][8] -attr @rip(#000000) O[8] -pin OutputWords_FF[4]_i O[8] -pin OutputWords_FF_reg[4][17:0] D[8]
load net OutputWords[1]_OBUF[14] -attr @rip(#000000) 14 -pin OutputWords[1][17:0]_OBUF_inst I[14] -pin OutputWords_FF[0]_i I0[14] -pin OutputWords_FF_reg[1][17:0] Q[14]
load net InputWords[2][9] -attr @rip(#000000) InputWords[2][9] -port InputWords[2][9] -pin OutputWords_FF[2]_i I1[9]
load net InputWords[5][14] -attr @rip(#000000) InputWords[5][14] -port InputWords[5][14] -pin OutputWords_FF[5]_i I1[14]
load net OutputWords[1]_OBUF[6] -attr @rip(#000000) 6 -pin OutputWords[1][17:0]_OBUF_inst I[6] -pin OutputWords_FF[0]_i I0[6] -pin OutputWords_FF_reg[1][17:0] Q[6]
load net OutputWords[3][1] -attr @rip(#000000) 1 -port OutputWords[3][1] -pin OutputWords[3][17:0]_OBUF_inst O[1]
load net OutputWords[7]_OBUF[13] -attr @rip(#000000) 13 -pin OutputWords[7][17:0]_OBUF_inst I[13] -pin OutputWords_FF[6]_i I0[13] -pin OutputWords_FF_reg[7][17:0] Q[13]
load net OutputWords_FF[1][14] -attr @rip(#000000) O[14] -pin OutputWords_FF[1]_i O[14] -pin OutputWords_FF_reg[1][17:0] D[14]
load net OutputWords_FF[6][13] -attr @rip(#000000) O[13] -pin OutputWords_FF[6]_i O[13] -pin OutputWords_FF_reg[6][17:0] D[13]
load net InputWords[7][12] -attr @rip(#000000) InputWords[7][12] -port InputWords[7][12] -pin OutputWords_FF[7]_i I1[12]
load net InputWords[0][2] -attr @rip(#000000) InputWords[0][2] -port InputWords[0][2] -pin OutputWords_FF[0]_i I1[2]
load net OutputWords_FF[4][5] -attr @rip(#000000) O[5] -pin OutputWords_FF[4]_i O[5] -pin OutputWords_FF_reg[4][17:0] D[5]
load net OutputWords_FF[5]_i__0_n_0 -pin OutputWords_FF[7:0]_i__0 O[5] -pin OutputWords_FF_reg[5][17:0] RST
load net InputWords[0][14] -attr @rip(#000000) InputWords[0][14] -port InputWords[0][14] -pin OutputWords_FF[0]_i I1[14]
load net OutputWords[4]_OBUF[11] -attr @rip(#000000) 11 -pin OutputWords[4][17:0]_OBUF_inst I[11] -pin OutputWords_FF[3]_i I0[11] -pin OutputWords_FF_reg[4][17:0] Q[11]
load net OutputWords[5][9] -attr @rip(#000000) 9 -port OutputWords[5][9] -pin OutputWords[5][17:0]_OBUF_inst O[9]
load net OutputWords_FF[6][10] -attr @rip(#000000) O[10] -pin OutputWords_FF[6]_i O[10] -pin OutputWords_FF_reg[6][17:0] D[10]
load net InputWords[4][10] -attr @rip(#000000) InputWords[4][10] -port InputWords[4][10] -pin OutputWords_FF[4]_i I1[10]
load net InputWords[4][15] -attr @rip(#000000) InputWords[4][15] -port InputWords[4][15] -pin OutputWords_FF[4]_i I1[15]
load net OutputWords[2][12] -attr @rip(#000000) 12 -port OutputWords[2][12] -pin OutputWords[2][17:0]_OBUF_inst O[12]
load net OutputWords[5]_OBUF[8] -attr @rip(#000000) 8 -pin OutputWords[5][17:0]_OBUF_inst I[8] -pin OutputWords_FF[4]_i I0[8] -pin OutputWords_FF_reg[5][17:0] Q[8]
load net OutputWords[6][13] -attr @rip(#000000) 13 -port OutputWords[6][13] -pin OutputWords[6][17:0]_OBUF_inst O[13]
load net OutputWords[7][1] -attr @rip(#000000) 1 -port OutputWords[7][1] -pin OutputWords[7][17:0]_OBUF_inst O[1]
load net OutputWords_FF[0][0] -attr @rip(#000000) O[0] -pin OutputWords_FF[0]_i O[0] -pin OutputWords_FF_reg[0][17:0] D[0]
load net OutputWords_FF[5][1] -attr @rip(#000000) O[1] -pin OutputWords_FF[5]_i O[1] -pin OutputWords_FF_reg[5][17:0] D[1]
load net InputWords[1][10] -attr @rip(#000000) InputWords[1][10] -port InputWords[1][10] -pin OutputWords_FF[1]_i I1[10]
load net OutputWords[0]_OBUF[4] -pin OutputWords[0][17:0]_OBUF_inst I[4] -pin OutputWords_FF_reg[0][17:0] Q[4]
load net OutputWords_FF[7][4] -attr @rip(#000000) O[4] -pin OutputWords_FF[7]_i O[4] -pin OutputWords_FF_reg[7][17:0] D[4]
load net OutputWords[2][9] -attr @rip(#000000) 9 -port OutputWords[2][9] -pin OutputWords[2][17:0]_OBUF_inst O[9]
load net OutputWords[6]_OBUF[3] -attr @rip(#000000) 3 -pin OutputWords[6][17:0]_OBUF_inst I[3] -pin OutputWords_FF[5]_i I0[3] -pin OutputWords_FF_reg[6][17:0] Q[3]
load net OutputWords_FF[2][11] -attr @rip(#000000) O[11] -pin OutputWords_FF[2]_i O[11] -pin OutputWords_FF_reg[2][17:0] D[11]
load net OutputWords_FF[5][16] -attr @rip(#000000) O[16] -pin OutputWords_FF[5]_i O[16] -pin OutputWords_FF_reg[5][17:0] D[16]
load net OutputWords_FF[6][8] -attr @rip(#000000) O[8] -pin OutputWords_FF[6]_i O[8] -pin OutputWords_FF_reg[6][17:0] D[8]
load net OutputWords[1][12] -attr @rip(#000000) 12 -port OutputWords[1][12] -pin OutputWords[1][17:0]_OBUF_inst O[12]
load net InputWords[5][8] -attr @rip(#000000) InputWords[5][8] -port InputWords[5][8] -pin OutputWords_FF[5]_i I1[8]
load net OutputWords[4]_OBUF[1] -attr @rip(#000000) 1 -pin OutputWords[4][17:0]_OBUF_inst I[1] -pin OutputWords_FF[3]_i I0[1] -pin OutputWords_FF_reg[4][17:0] Q[1]
load net OutputWords[5]_OBUF[13] -attr @rip(#000000) 13 -pin OutputWords[5][17:0]_OBUF_inst I[13] -pin OutputWords_FF[4]_i I0[13] -pin OutputWords_FF_reg[5][17:0] Q[13]
load net InputWords[3][1] -attr @rip(#000000) InputWords[3][1] -port InputWords[3][1] -pin OutputWords_FF[3]_i I1[1]
load net OutputWords[3][4] -attr @rip(#000000) 4 -port OutputWords[3][4] -pin OutputWords[3][17:0]_OBUF_inst O[4]
load net OutputWords_FF[7][12] -attr @rip(#000000) O[12] -pin OutputWords_FF[7]_i O[12] -pin OutputWords_FF_reg[7][17:0] D[12]
load net OutputWords[0]_OBUF[13] -pin OutputWords[0][17:0]_OBUF_inst I[13] -pin OutputWords_FF_reg[0][17:0] Q[13]
load net OutputWords[2]_OBUF[15] -attr @rip(#000000) 15 -pin OutputWords[2][17:0]_OBUF_inst I[15] -pin OutputWords_FF[1]_i I0[15] -pin OutputWords_FF_reg[2][17:0] Q[15]
load net OutputWords[3]_OBUF[14] -attr @rip(#000000) 14 -pin OutputWords[3][17:0]_OBUF_inst I[14] -pin OutputWords_FF[2]_i I0[14] -pin OutputWords_FF_reg[3][17:0] Q[14]
load net OutputWords[4][8] -attr @rip(#000000) 8 -port OutputWords[4][8] -pin OutputWords[4][17:0]_OBUF_inst O[8]
load net OutputWords[5][10] -attr @rip(#000000) 10 -port OutputWords[5][10] -pin OutputWords[5][17:0]_OBUF_inst O[10]
load net OutputWords_FF[4][10] -attr @rip(#000000) O[10] -pin OutputWords_FF[4]_i O[10] -pin OutputWords_FF_reg[4][17:0] D[10]
load net OutputWords[5][17] -attr @rip(#000000) 17 -port OutputWords[5][17] -pin OutputWords[5][17:0]_OBUF_inst O[17]
load net OutputWords_FF[0][3] -attr @rip(#000000) O[3] -pin OutputWords_FF[0]_i O[3] -pin OutputWords_FF_reg[0][17:0] D[3]
load net InputWords[6][13] -attr @rip(#000000) InputWords[6][13] -port InputWords[6][13] -pin OutputWords_FF[6]_i I1[13]
load net InputWords[7][1] -attr @rip(#000000) InputWords[7][1] -port InputWords[7][1] -pin OutputWords_FF[7]_i I1[1]
load net OutputWords[0]_OBUF[0] -pin OutputWords[0][17:0]_OBUF_inst I[0] -pin OutputWords_FF_reg[0][17:0] Q[0]
load net OutputWords[7]_OBUF[7] -attr @rip(#000000) 7 -pin OutputWords[7][17:0]_OBUF_inst I[7] -pin OutputWords_FF[6]_i I0[7] -pin OutputWords_FF_reg[7][17:0] Q[7]
load net OutputWords_FF[7][0] -attr @rip(#000000) O[0] -pin OutputWords_FF[7]_i O[0] -pin OutputWords_FF_reg[7][17:0] D[0]
load net InputWords[1][8] -attr @rip(#000000) InputWords[1][8] -port InputWords[1][8] -pin OutputWords_FF[1]_i I1[8]
load net PrevUnit_in[2] -attr @rip(#000000) PrevUnit_in[2] -pin OutputWords_FF[7]_i I0[2] -port PrevUnit_in[2]
load net OutputWords[5][7] -attr @rip(#000000) 7 -port OutputWords[5][7] -pin OutputWords[5][17:0]_OBUF_inst O[7]
load net OutputWords[7][15] -attr @rip(#000000) 15 -port OutputWords[7][15] -pin OutputWords[7][17:0]_OBUF_inst O[15]
load net OutputWords_FF[0]_i__0_n_0 -pin OutputWords_FF[7:0]_i__0 O[0] -pin OutputWords_FF_reg[0][17:0] RST
load net OutputWords_FF[3][4] -attr @rip(#000000) O[4] -pin OutputWords_FF[3]_i O[4] -pin OutputWords_FF_reg[3][17:0] D[4]
load net OutputWords[0][14] -attr @rip(#000000) 14 -port OutputWords[0][14] -pin OutputWords[0][17:0]_OBUF_inst O[14]
load net OutputWords[4][11] -attr @rip(#000000) 11 -port OutputWords[4][11] -pin OutputWords[4][17:0]_OBUF_inst O[11]
load net OutputWords_FF[4][2] -attr @rip(#000000) O[2] -pin OutputWords_FF[4]_i O[2] -pin OutputWords_FF_reg[4][17:0] D[2]
load net InputWords[2][8] -attr @rip(#000000) InputWords[2][8] -port InputWords[2][8] -pin OutputWords_FF[2]_i I1[8]
load net OutputWords[1]_OBUF[5] -attr @rip(#000000) 5 -pin OutputWords[1][17:0]_OBUF_inst I[5] -pin OutputWords_FF[0]_i I0[5] -pin OutputWords_FF_reg[1][17:0] Q[5]
load net OutputWords[3][0] -attr @rip(#000000) 0 -port OutputWords[3][0] -pin OutputWords[3][17:0]_OBUF_inst O[0]
load net OutputWords[7][10] -attr @rip(#000000) 10 -port OutputWords[7][10] -pin OutputWords[7][17:0]_OBUF_inst O[10]
load net OutputWords[7][8] -attr @rip(#000000) 8 -port OutputWords[7][8] -pin OutputWords[7][17:0]_OBUF_inst O[8]
load net OutputWords[1]_OBUF[0] -attr @rip(#000000) 0 -pin OutputWords[1][17:0]_OBUF_inst I[0] -pin OutputWords_FF[0]_i I0[0] -pin OutputWords_FF_reg[1][17:0] Q[0]
load net OutputWords_FF[4][9] -attr @rip(#000000) O[9] -pin OutputWords_FF[4]_i O[9] -pin OutputWords_FF_reg[4][17:0] D[9]
load net InputWords[0][13] -attr @rip(#000000) InputWords[0][13] -port InputWords[0][13] -pin OutputWords_FF[0]_i I1[13]
load net OutputWords[1]_OBUF[15] -attr @rip(#000000) 15 -pin OutputWords[1][17:0]_OBUF_inst I[15] -pin OutputWords_FF[0]_i I0[15] -pin OutputWords_FF_reg[1][17:0] Q[15]
load net OutputWords[4]_OBUF[10] -attr @rip(#000000) 10 -pin OutputWords[4][17:0]_OBUF_inst I[10] -pin OutputWords_FF[3]_i I0[10] -pin OutputWords_FF_reg[4][17:0] Q[10]
load net OutputWords_FF[1][15] -attr @rip(#000000) O[15] -pin OutputWords_FF[1]_i O[15] -pin OutputWords_FF_reg[1][17:0] D[15]
load net OutputWords_FF[6][14] -attr @rip(#000000) O[14] -pin OutputWords_FF[6]_i O[14] -pin OutputWords_FF_reg[6][17:0] D[14]
load net OutputWords[5]_OBUF[7] -attr @rip(#000000) 7 -pin OutputWords[5][17:0]_OBUF_inst I[7] -pin OutputWords_FF[4]_i I0[7] -pin OutputWords_FF_reg[5][17:0] Q[7]
load net OutputWords[6][12] -attr @rip(#000000) 12 -port OutputWords[6][12] -pin OutputWords[6][17:0]_OBUF_inst O[12]
load net OutputWords[7][0] -attr @rip(#000000) 0 -port OutputWords[7][0] -pin OutputWords[7][17:0]_OBUF_inst O[0]
load net InputWords[5][17] -attr @rip(#000000) InputWords[5][17] -port InputWords[5][17] -pin OutputWords_FF[5]_i I1[17]
load net OutputWords_FF[4][15] -attr @rip(#000000) O[15] -pin OutputWords_FF[4]_i O[15] -pin OutputWords_FF_reg[4][17:0] D[15]
load net OutputWords_FF[6][11] -attr @rip(#000000) O[11] -pin OutputWords_FF[6]_i O[11] -pin OutputWords_FF_reg[6][17:0] D[11]
load net OutputWords_FF[7][3] -attr @rip(#000000) O[3] -pin OutputWords_FF[7]_i O[3] -pin OutputWords_FF_reg[7][17:0] D[3]
load net InputWords[5][5] -attr @rip(#000000) InputWords[5][5] -port InputWords[5][5] -pin OutputWords_FF[5]_i I1[5]
load net OutputWords[6]_OBUF[2] -attr @rip(#000000) 2 -pin OutputWords[6][17:0]_OBUF_inst I[2] -pin OutputWords_FF[5]_i I0[2] -pin OutputWords_FF_reg[6][17:0] Q[2]
load net OutputWords_FF[3][14] -attr @rip(#000000) O[14] -pin OutputWords_FF[3]_i O[14] -pin OutputWords_FF_reg[3][17:0] D[14]
load net OutputWords[1][11] -attr @rip(#000000) 11 -port OutputWords[1][11] -pin OutputWords[1][17:0]_OBUF_inst O[11]
load net OutputWords[4]_OBUF[0] -attr @rip(#000000) 0 -pin OutputWords[4][17:0]_OBUF_inst I[0] -pin OutputWords_FF[3]_i I0[0] -pin OutputWords_FF_reg[4][17:0] Q[0]
load net OutputWords[0][9] -attr @rip(#000000) 9 -port OutputWords[0][9] -pin OutputWords[0][17:0]_OBUF_inst O[9]
load net InputWords[1][13] -attr @rip(#000000) InputWords[1][13] -port InputWords[1][13] -pin OutputWords_FF[1]_i I1[13]
load net OutputWords[0]_OBUF[7] -pin OutputWords[0][17:0]_OBUF_inst I[7] -pin OutputWords_FF_reg[0][17:0] Q[7]
load net OutputWords[3][12] -attr @rip(#000000) 12 -port OutputWords[3][12] -pin OutputWords[3][17:0]_OBUF_inst O[12]
load net OutputWords_FF[1][2] -attr @rip(#000000) O[2] -pin OutputWords_FF[1]_i O[2] -pin OutputWords_FF_reg[1][17:0] D[2]
load net OutputWords_FF[2][12] -attr @rip(#000000) O[12] -pin OutputWords_FF[2]_i O[12] -pin OutputWords_FF_reg[2][17:0] D[12]
load net OutputWords_FF[5][17] -attr @rip(#000000) O[17] -pin OutputWords_FF[5]_i O[17] -pin OutputWords_FF_reg[5][17:0] D[17]
load net OutputWords_FF[6][9] -attr @rip(#000000) O[9] -pin OutputWords_FF[6]_i O[9] -pin OutputWords_FF_reg[6][17:0] D[9]
load net InputWords[0][9] -attr @rip(#000000) InputWords[0][9] -port InputWords[0][9] -pin OutputWords_FF[0]_i I1[9]
load net InputWords[6][1] -attr @rip(#000000) InputWords[6][1] -port InputWords[6][1] -pin OutputWords_FF[6]_i I1[1]
load net OutputWords[0]_OBUF[12] -pin OutputWords[0][17:0]_OBUF_inst I[12] -pin OutputWords_FF_reg[0][17:0] Q[12]
load net OutputWords[2]_OBUF[14] -attr @rip(#000000) 14 -pin OutputWords[2][17:0]_OBUF_inst I[14] -pin OutputWords_FF[1]_i I0[14] -pin OutputWords_FF_reg[2][17:0] Q[14]
load net InputWords[3][2] -attr @rip(#000000) InputWords[3][2] -port InputWords[3][2] -pin OutputWords_FF[3]_i I1[2]
load net InputWords[1][5] -attr @rip(#000000) InputWords[1][5] -port InputWords[1][5] -pin OutputWords_FF[1]_i I1[5]
load net OutputWords_FF[7][13] -attr @rip(#000000) O[13] -pin OutputWords_FF[7]_i O[13] -pin OutputWords_FF_reg[7][17:0] D[13]
load net PrevUnit_in[15] -attr @rip(#000000) PrevUnit_in[15] -pin OutputWords_FF[7]_i I0[15] -port PrevUnit_in[15]
load net OutputWords[3]_OBUF[15] -attr @rip(#000000) 15 -pin OutputWords[3][17:0]_OBUF_inst I[15] -pin OutputWords_FF[2]_i I0[15] -pin OutputWords_FF_reg[3][17:0] Q[15]
load net OutputWords_FF[4][11] -attr @rip(#000000) O[11] -pin OutputWords_FF[4]_i O[11] -pin OutputWords_FF_reg[4][17:0] D[11]
load net InputWords[4][9] -attr @rip(#000000) InputWords[4][9] -port InputWords[4][9] -pin OutputWords_FF[4]_i I1[9]
load net OutputWords[3][7] -attr @rip(#000000) 7 -port OutputWords[3][7] -pin OutputWords[3][17:0]_OBUF_inst O[7]
load net InputWords[7][2] -attr @rip(#000000) InputWords[7][2] -port InputWords[7][2] -pin OutputWords_FF[7]_i I1[2]
load net OutputWords[0]_OBUF[1] -pin OutputWords[0][17:0]_OBUF_inst I[1] -pin OutputWords_FF_reg[0][17:0] Q[1]
load net OutputWords[5][6] -attr @rip(#000000) 6 -port OutputWords[5][6] -pin OutputWords[5][17:0]_OBUF_inst O[6]
load net OutputWords_FF[3][3] -attr @rip(#000000) O[3] -pin OutputWords_FF[3]_i O[3] -pin OutputWords_FF_reg[3][17:0] D[3]
load net OutputWords_FF[3][8] -attr @rip(#000000) O[8] -pin OutputWords_FF[3]_i O[8] -pin OutputWords_FF_reg[3][17:0] D[8]
load net OutputWords[4][10] -attr @rip(#000000) 10 -port OutputWords[4][10] -pin OutputWords[4][17:0]_OBUF_inst O[10]
load net OutputWords[5]_OBUF[2] -attr @rip(#000000) 2 -pin OutputWords[5][17:0]_OBUF_inst I[2] -pin OutputWords_FF[4]_i I0[2] -pin OutputWords_FF_reg[5][17:0] Q[2]
load net OutputWords_FF[4][6] -attr @rip(#000000) O[6] -pin OutputWords_FF[4]_i O[6] -pin OutputWords_FF_reg[4][17:0] D[6]
load net PrevUnit_in[10] -attr @rip(#000000) PrevUnit_in[10] -pin OutputWords_FF[7]_i I0[10] -port PrevUnit_in[10]
load net PrevUnit_in[3] -attr @rip(#000000) PrevUnit_in[3] -pin OutputWords_FF[7]_i I0[3] -port PrevUnit_in[3]
load net OutputWords[1]_OBUF[4] -attr @rip(#000000) 4 -pin OutputWords[1][17:0]_OBUF_inst I[4] -pin OutputWords_FF[0]_i I0[4] -pin OutputWords_FF_reg[1][17:0] Q[4]
load net OutputWords[1]_OBUF[9] -attr @rip(#000000) 9 -pin OutputWords[1][17:0]_OBUF_inst I[9] -pin OutputWords_FF[0]_i I0[9] -pin OutputWords_FF_reg[1][17:0] Q[9]
load net OutputWords[7][16] -attr @rip(#000000) 16 -port OutputWords[7][16] -pin OutputWords[7][17:0]_OBUF_inst O[16]
load net rst -pin OutputWords_FF[7:0]_i__0 S -port rst
netloc rst 1 0 1 NJ
load net OutputWords_FF[0][8] -attr @rip(#000000) O[8] -pin OutputWords_FF[0]_i O[8] -pin OutputWords_FF_reg[0][17:0] D[8]
load net OutputWords_FF[4][3] -attr @rip(#000000) O[3] -pin OutputWords_FF[4]_i O[3] -pin OutputWords_FF_reg[4][17:0] D[3]
load net InputWords[0][12] -attr @rip(#000000) InputWords[0][12] -port InputWords[0][12] -pin OutputWords_FF[0]_i I1[12]
load net OutputWords[3]_OBUF[16] -attr @rip(#000000) 16 -pin OutputWords[3][17:0]_OBUF_inst I[16] -pin OutputWords_FF[2]_i I0[16] -pin OutputWords_FF_reg[3][17:0] Q[16]
load net OutputWords[7][9] -attr @rip(#000000) 9 -port OutputWords[7][9] -pin OutputWords[7][17:0]_OBUF_inst O[9]
load net OutputWords_FF[7]_i__0_n_0 -pin OutputWords_FF[7:0]_i__0 O[7] -pin OutputWords_FF_reg[7][17:0] RST
load net OutputWords[0]_OBUF[10] -pin OutputWords[0][17:0]_OBUF_inst I[10] -pin OutputWords_FF_reg[0][17:0] Q[10]
load net OutputWords_FF[2][17] -attr @rip(#000000) O[17] -pin OutputWords_FF[2]_i O[17] -pin OutputWords_FF_reg[2][17:0] D[17]
load net InputWords[5][16] -attr @rip(#000000) InputWords[5][16] -port InputWords[5][16] -pin OutputWords_FF[5]_i I1[16]
load net OutputWords[6]_OBUF[12] -attr @rip(#000000) 12 -pin OutputWords[6][17:0]_OBUF_inst I[12] -pin OutputWords_FF[5]_i I0[12] -pin OutputWords_FF_reg[6][17:0] Q[12]
load net OutputWords[6]_OBUF[17] -attr @rip(#000000) 17 -pin OutputWords[6][17:0]_OBUF_inst I[17] -pin OutputWords_FF[5]_i I0[17] -pin OutputWords_FF_reg[6][17:0] Q[17]
load net OutputWords_FF[1][16] -attr @rip(#000000) O[16] -pin OutputWords_FF[1]_i O[16] -pin OutputWords_FF_reg[1][17:0] D[16]
load net OutputWords_FF[6][15] -attr @rip(#000000) O[15] -pin OutputWords_FF[6]_i O[15] -pin OutputWords_FF_reg[6][17:0] D[15]
load net OutputWords[2][7] -attr @rip(#000000) 7 -port OutputWords[2][7] -pin OutputWords[2][17:0]_OBUF_inst O[7]
load net OutputWords_FF[4][16] -attr @rip(#000000) O[16] -pin OutputWords_FF[4]_i O[16] -pin OutputWords_FF_reg[4][17:0] D[16]
load net OutputWords_FF[5][14] -attr @rip(#000000) O[14] -pin OutputWords_FF[5]_i O[14] -pin OutputWords_FF_reg[5][17:0] D[14]
load net OutputWords_FF[6][12] -attr @rip(#000000) O[12] -pin OutputWords_FF[6]_i O[12] -pin OutputWords_FF_reg[6][17:0] D[12]
load net InputWords[5][6] -attr @rip(#000000) InputWords[5][6] -port InputWords[5][6] -pin OutputWords_FF[5]_i I1[6]
load net OutputWords[1][7] -attr @rip(#000000) 7 -port OutputWords[1][7] -pin OutputWords[1][17:0]_OBUF_inst O[7]
load net OutputWords[2]_OBUF[5] -attr @rip(#000000) 5 -pin OutputWords[2][17:0]_OBUF_inst I[5] -pin OutputWords_FF[1]_i I0[5] -pin OutputWords_FF_reg[2][17:0] Q[5]
load net OutputWords[6][15] -attr @rip(#000000) 15 -port OutputWords[6][15] -pin OutputWords[6][17:0]_OBUF_inst O[15]
load net OutputWords[7][3] -attr @rip(#000000) 3 -port OutputWords[7][3] -pin OutputWords[7][17:0]_OBUF_inst O[3]
load net InputWords[1][12] -attr @rip(#000000) InputWords[1][12] -port InputWords[1][12] -pin OutputWords_FF[1]_i I1[12]
load net OutputWords[0]_OBUF[6] -pin OutputWords[0][17:0]_OBUF_inst I[6] -pin OutputWords_FF_reg[0][17:0] Q[6]
load net OutputWords[3][11] -attr @rip(#000000) 11 -port OutputWords[3][11] -pin OutputWords[3][17:0]_OBUF_inst O[11]
load net OutputWords_FF[1][1] -attr @rip(#000000) O[1] -pin OutputWords_FF[1]_i O[1] -pin OutputWords_FF_reg[1][17:0] D[1]
load net OutputWords_FF[3][15] -attr @rip(#000000) O[15] -pin OutputWords_FF[3]_i O[15] -pin OutputWords_FF_reg[3][17:0] D[15]
load net OutputWords_FF[7][6] -attr @rip(#000000) O[6] -pin OutputWords_FF[7]_i O[6] -pin OutputWords_FF_reg[7][17:0] D[6]
load net InputWords[6][0] -attr @rip(#000000) InputWords[6][0] -port InputWords[6][0] -pin OutputWords_FF[6]_i I1[0]
load net OutputWords[0]_OBUF[11] -pin OutputWords[0][17:0]_OBUF_inst I[11] -pin OutputWords_FF_reg[0][17:0] Q[11]
load net InputWords[0][8] -attr @rip(#000000) InputWords[0][8] -port InputWords[0][8] -pin OutputWords_FF[0]_i I1[8]
load net OutputWords[2]_OBUF[13] -attr @rip(#000000) 13 -pin OutputWords[2][17:0]_OBUF_inst I[13] -pin OutputWords_FF[1]_i I0[13] -pin OutputWords_FF_reg[2][17:0] Q[13]
load net OutputWords[3]_OBUF[12] -attr @rip(#000000) 12 -pin OutputWords[3][17:0]_OBUF_inst I[12] -pin OutputWords_FF[2]_i I0[12] -pin OutputWords_FF_reg[3][17:0] Q[12]
load net OutputWords_FF[0][13] -attr @rip(#000000) O[13] -pin OutputWords_FF[0]_i O[13] -pin OutputWords_FF_reg[0][17:0] D[13]
load net OutputWords[6]_OBUF[5] -attr @rip(#000000) 5 -pin OutputWords[6][17:0]_OBUF_inst I[5] -pin OutputWords_FF[5]_i I0[5] -pin OutputWords_FF_reg[6][17:0] Q[5]
load net OutputWords[1][14] -attr @rip(#000000) 14 -port OutputWords[1][14] -pin OutputWords[1][17:0]_OBUF_inst O[14]
load net OutputWords_FF[2][0] -attr @rip(#000000) O[0] -pin OutputWords_FF[2]_i O[0] -pin OutputWords_FF_reg[2][17:0] D[0]
load net InputWords[3][3] -attr @rip(#000000) InputWords[3][3] -port InputWords[3][3] -pin OutputWords_FF[3]_i I1[3]
load net InputWords[1][6] -attr @rip(#000000) InputWords[1][6] -port InputWords[1][6] -pin OutputWords_FF[1]_i I1[6]
load net InputWords[2][12] -attr @rip(#000000) InputWords[2][12] -port InputWords[2][12] -pin OutputWords_FF[2]_i I1[12]
load net InputWords[4][8] -attr @rip(#000000) InputWords[4][8] -port InputWords[4][8] -pin OutputWords_FF[4]_i I1[8]
load net InputWords[2][17] -attr @rip(#000000) InputWords[2][17] -port InputWords[2][17] -pin OutputWords_FF[2]_i I1[17]
load net OutputWords[3][6] -attr @rip(#000000) 6 -port OutputWords[3][6] -pin OutputWords[3][17:0]_OBUF_inst O[6]
load net PrevUnit_in[16] -attr @rip(#000000) PrevUnit_in[16] -pin OutputWords_FF[7]_i I0[16] -port PrevUnit_in[16]
load net OutputWords[3]_OBUF[4] -attr @rip(#000000) 4 -pin OutputWords[3][17:0]_OBUF_inst I[4] -pin OutputWords_FF[2]_i I0[4] -pin OutputWords_FF_reg[3][17:0] Q[4]
load net OutputWords[5][12] -attr @rip(#000000) 12 -port OutputWords[5][12] -pin OutputWords[5][17:0]_OBUF_inst O[12]
load net OutputWords[5][5] -attr @rip(#000000) 5 -port OutputWords[5][5] -pin OutputWords[5][17:0]_OBUF_inst O[5]
load net OutputWords_FF[3][7] -attr @rip(#000000) O[7] -pin OutputWords_FF[3]_i O[7] -pin OutputWords_FF_reg[3][17:0] D[7]
load net OutputWords_FF[4][12] -attr @rip(#000000) O[12] -pin OutputWords_FF[4]_i O[12] -pin OutputWords_FF_reg[4][17:0] D[12]
load net OutputWords[1][3] -attr @rip(#000000) 3 -port OutputWords[1][3] -pin OutputWords[1][17:0]_OBUF_inst O[3]
load net OutputWords[5]_OBUF[1] -attr @rip(#000000) 1 -pin OutputWords[5][17:0]_OBUF_inst I[1] -pin OutputWords_FF[4]_i I0[1] -pin OutputWords_FF_reg[5][17:0] Q[1]
load net OutputWords_FF[3][16] -attr @rip(#000000) O[16] -pin OutputWords_FF[3]_i O[16] -pin OutputWords_FF_reg[3][17:0] D[16]
load net OutputWords_FF[4][0] -attr @rip(#000000) O[0] -pin OutputWords_FF[4]_i O[0] -pin OutputWords_FF_reg[4][17:0] D[0]
load net InputWords[2][1] -attr @rip(#000000) InputWords[2][1] -port InputWords[2][1] -pin OutputWords_FF[2]_i I1[1]
load net InputWords[5][11] -attr @rip(#000000) InputWords[5][11] -port InputWords[5][11] -pin OutputWords_FF[5]_i I1[11]
load net OutputWords[1]_OBUF[3] -attr @rip(#000000) 3 -pin OutputWords[1][17:0]_OBUF_inst I[3] -pin OutputWords_FF[0]_i I0[3] -pin OutputWords_FF_reg[1][17:0] Q[3]
load net OutputWords[7][6] -attr @rip(#000000) 6 -port OutputWords[7][6] -pin OutputWords[7][17:0]_OBUF_inst O[6]
load net OutputWords[7]_OBUF[9] -attr @rip(#000000) 9 -pin OutputWords[7][17:0]_OBUF_inst I[9] -pin OutputWords_FF[6]_i I0[9] -pin OutputWords_FF_reg[7][17:0] Q[9]
load net OutputWords_FF[7][2] -attr @rip(#000000) O[2] -pin OutputWords_FF[7]_i O[2] -pin OutputWords_FF_reg[7][17:0] D[2]
load net OutputWords_FF[4][7] -attr @rip(#000000) O[7] -pin OutputWords_FF[4]_i O[7] -pin OutputWords_FF_reg[4][17:0] D[7]
load net PrevUnit_in[4] -attr @rip(#000000) PrevUnit_in[4] -pin OutputWords_FF[7]_i I0[4] -port PrevUnit_in[4]
load net InputWords[0][11] -attr @rip(#000000) InputWords[0][11] -port InputWords[0][11] -pin OutputWords_FF[0]_i I1[11]
load net OutputWords_FF[3][6] -attr @rip(#000000) O[6] -pin OutputWords_FF[3]_i O[6] -pin OutputWords_FF_reg[3][17:0] D[6]
load net OutputWords_FF[0][9] -attr @rip(#000000) O[9] -pin OutputWords_FF[0]_i O[9] -pin OutputWords_FF_reg[0][17:0] D[9]
load net OutputWords[3]_OBUF[17] -attr @rip(#000000) 17 -pin OutputWords[3][17:0]_OBUF_inst I[17] -pin OutputWords_FF[2]_i I0[17] -pin OutputWords_FF_reg[3][17:0] Q[17]
load net OutputWords[6]_OBUF[11] -attr @rip(#000000) 11 -pin OutputWords[6][17:0]_OBUF_inst I[11] -pin OutputWords_FF[5]_i I0[11] -pin OutputWords_FF_reg[6][17:0] Q[11]
load net OutputWords[6]_OBUF[16] -attr @rip(#000000) 16 -pin OutputWords[6][17:0]_OBUF_inst I[16] -pin OutputWords_FF[5]_i I0[16] -pin OutputWords_FF_reg[6][17:0] Q[16]
load net OutputWords[2][1] -attr @rip(#000000) 1 -port OutputWords[2][1] -pin OutputWords[2][17:0]_OBUF_inst O[1]
load net OutputWords[7]_OBUF[16] -attr @rip(#000000) 16 -pin OutputWords[7][17:0]_OBUF_inst I[16] -pin OutputWords_FF[6]_i I0[16] -pin OutputWords_FF_reg[7][17:0] Q[16]
load net OutputWords_FF[1][17] -attr @rip(#000000) O[17] -pin OutputWords_FF[1]_i O[17] -pin OutputWords_FF_reg[1][17:0] D[17]
load net OutputWords_FF[3][12] -attr @rip(#000000) O[12] -pin OutputWords_FF[3]_i O[12] -pin OutputWords_FF_reg[3][17:0] D[12]
load net OutputWords_FF[6][0] -attr @rip(#000000) O[0] -pin OutputWords_FF[6]_i O[0] -pin OutputWords_FF_reg[6][17:0] D[0]
load net OutputWords_FF[6][16] -attr @rip(#000000) O[16] -pin OutputWords_FF[6]_i O[16] -pin OutputWords_FF_reg[6][17:0] D[16]
load net OutputWords[1][6] -attr @rip(#000000) 6 -port OutputWords[1][6] -pin OutputWords[1][17:0]_OBUF_inst O[6]
load net OutputWords[2][8] -attr @rip(#000000) 8 -port OutputWords[2][8] -pin OutputWords[2][17:0]_OBUF_inst O[8]
load net OutputWords[2]_OBUF[4] -attr @rip(#000000) 4 -pin OutputWords[2][17:0]_OBUF_inst I[4] -pin OutputWords_FF[1]_i I0[4] -pin OutputWords_FF_reg[2][17:0] Q[4]
load net OutputWords[4][17] -attr @rip(#000000) 17 -port OutputWords[4][17] -pin OutputWords[4][17:0]_OBUF_inst O[17]
load net OutputWords[6][14] -attr @rip(#000000) 14 -port OutputWords[6][14] -pin OutputWords[6][17:0]_OBUF_inst O[14]
load net OutputWords[7][2] -attr @rip(#000000) 2 -port OutputWords[7][2] -pin OutputWords[7][17:0]_OBUF_inst O[2]
load net OutputWords_FF[4][17] -attr @rip(#000000) O[17] -pin OutputWords_FF[4]_i O[17] -pin OutputWords_FF_reg[4][17:0] D[17]
load net OutputWords_FF[5][15] -attr @rip(#000000) O[15] -pin OutputWords_FF[5]_i O[15] -pin OutputWords_FF_reg[5][17:0] D[15]
load net OutputWords_FF[7][5] -attr @rip(#000000) O[5] -pin OutputWords_FF[7]_i O[5] -pin OutputWords_FF_reg[7][17:0] D[5]
load net InputWords[0][7] -attr @rip(#000000) InputWords[0][7] -port InputWords[0][7] -pin OutputWords_FF[0]_i I1[7]
load net OutputWords[2]_OBUF[12] -attr @rip(#000000) 12 -pin OutputWords[2][17:0]_OBUF_inst I[12] -pin OutputWords_FF[1]_i I0[12] -pin OutputWords_FF_reg[2][17:0] Q[12]
load net InputWords[1][3] -attr @rip(#000000) InputWords[1][3] -port InputWords[1][3] -pin OutputWords_FF[1]_i I1[3]
load net OutputWords[6][3] -attr @rip(#000000) 3 -port OutputWords[6][3] -pin OutputWords[6][17:0]_OBUF_inst O[3]
load net OutputWords[6][8] -attr @rip(#000000) 8 -port OutputWords[6][8] -pin OutputWords[6][17:0]_OBUF_inst O[8]
load net OutputWords[6]_OBUF[4] -attr @rip(#000000) 4 -pin OutputWords[6][17:0]_OBUF_inst I[4] -pin OutputWords_FF[5]_i I0[4] -pin OutputWords_FF_reg[6][17:0] Q[4]
load net OutputWords[1][13] -attr @rip(#000000) 13 -port OutputWords[1][13] -pin OutputWords[1][17:0]_OBUF_inst O[13]
load net OutputWords[3]_OBUF[13] -attr @rip(#000000) 13 -pin OutputWords[3][17:0]_OBUF_inst I[13] -pin OutputWords_FF[2]_i I0[13] -pin OutputWords_FF_reg[3][17:0] Q[13]
load net OutputWords_FF[0][14] -attr @rip(#000000) O[14] -pin OutputWords_FF[0]_i O[14] -pin OutputWords_FF_reg[0][17:0] D[14]
load net OutputWords[0]_OBUF[9] -pin OutputWords[0][17:0]_OBUF_inst I[9] -pin OutputWords_FF_reg[0][17:0] Q[9]
load net InputWords[2][11] -attr @rip(#000000) InputWords[2][11] -port InputWords[2][11] -pin OutputWords_FF[2]_i I1[11]
load net InputWords[4][7] -attr @rip(#000000) InputWords[4][7] -port InputWords[4][7] -pin OutputWords_FF[4]_i I1[7]
load net OutputWords[3][14] -attr @rip(#000000) 14 -port OutputWords[3][14] -pin OutputWords[3][17:0]_OBUF_inst O[14]
load net OutputWords_FF[1][4] -attr @rip(#000000) O[4] -pin OutputWords_FF[1]_i O[4] -pin OutputWords_FF_reg[1][17:0] D[4]
load net InputWords[6][3] -attr @rip(#000000) InputWords[6][3] -port InputWords[6][3] -pin OutputWords_FF[6]_i I1[3]
load net InputWords[7][0] -attr @rip(#000000) InputWords[7][0] -port InputWords[7][0] -pin OutputWords_FF[7]_i I1[0]
load net OutputWords[3]_OBUF[3] -attr @rip(#000000) 3 -pin OutputWords[3][17:0]_OBUF_inst I[3] -pin OutputWords_FF[2]_i I0[3] -pin OutputWords_FF_reg[3][17:0] Q[3]
load net OutputWords[3]_OBUF[8] -attr @rip(#000000) 8 -pin OutputWords[3][17:0]_OBUF_inst I[8] -pin OutputWords_FF[2]_i I0[8] -pin OutputWords_FF_reg[3][17:0] Q[8]
load net OutputWords[5][11] -attr @rip(#000000) 11 -port OutputWords[5][11] -pin OutputWords[5][17:0]_OBUF_inst O[11]
load net OutputWords[5][4] -attr @rip(#000000) 4 -port OutputWords[5][4] -pin OutputWords[5][17:0]_OBUF_inst O[4]
load net OutputWords_FF[2][1] -attr @rip(#000000) O[1] -pin OutputWords_FF[2]_i O[1] -pin OutputWords_FF_reg[2][17:0] D[1]
load net InputWords[3][4] -attr @rip(#000000) InputWords[3][4] -port InputWords[3][4] -pin OutputWords_FF[3]_i I1[4]
load net OutputWords[1][2] -attr @rip(#000000) 2 -port OutputWords[1][2] -pin OutputWords[1][17:0]_OBUF_inst O[2]
load net PrevUnit_in[17] -attr @rip(#000000) PrevUnit_in[17] -pin OutputWords_FF[7]_i I0[17] -port PrevUnit_in[17]
load net InputWords[2][0] -attr @rip(#000000) InputWords[2][0] -port InputWords[2][0] -pin OutputWords_FF[2]_i I1[0]
load net InputWords[2][5] -attr @rip(#000000) InputWords[2][5] -port InputWords[2][5] -pin OutputWords_FF[2]_i I1[5]
load net InputWords[5][10] -attr @rip(#000000) InputWords[5][10] -port InputWords[5][10] -pin OutputWords_FF[5]_i I1[10]
load net OutputWords[1]_OBUF[2] -attr @rip(#000000) 2 -pin OutputWords[1][17:0]_OBUF_inst I[2] -pin OutputWords_FF[0]_i I0[2] -pin OutputWords_FF_reg[1][17:0] Q[2]
load net OutputWords_FF[1][10] -attr @rip(#000000) O[10] -pin OutputWords_FF[1]_i O[10] -pin OutputWords_FF_reg[1][17:0] D[10]
load net OutputWords_FF[4][13] -attr @rip(#000000) O[13] -pin OutputWords_FF[4]_i O[13] -pin OutputWords_FF_reg[4][17:0] D[13]
load net OutputWords_FF[7][1] -attr @rip(#000000) O[1] -pin OutputWords_FF[7]_i O[1] -pin OutputWords_FF_reg[7][17:0] D[1]
load net OutputWords[3][9] -attr @rip(#000000) 9 -port OutputWords[3][9] -pin OutputWords[3][17:0]_OBUF_inst O[9]
load net OutputWords_FF[0][6] -attr @rip(#000000) O[6] -pin OutputWords_FF[0]_i O[6] -pin OutputWords_FF_reg[0][17:0] D[6]
load net OutputWords_FF[3][17] -attr @rip(#000000) O[17] -pin OutputWords_FF[3]_i O[17] -pin OutputWords_FF_reg[3][17:0] D[17]
load net OutputWords_FF[4][1] -attr @rip(#000000) O[1] -pin OutputWords_FF[4]_i O[1] -pin OutputWords_FF_reg[4][17:0] D[1]
load net OutputWords[7][7] -attr @rip(#000000) 7 -port OutputWords[7][7] -pin OutputWords[7][17:0]_OBUF_inst O[7]
load net OutputWords_FF[3][5] -attr @rip(#000000) O[5] -pin OutputWords_FF[3]_i O[5] -pin OutputWords_FF_reg[3][17:0] D[5]
load net OutputWords[5]_OBUF[4] -attr @rip(#000000) 4 -pin OutputWords[5][17:0]_OBUF_inst I[4] -pin OutputWords_FF[4]_i I0[4] -pin OutputWords_FF_reg[5][17:0] Q[4]
load net PrevUnit_in[5] -attr @rip(#000000) PrevUnit_in[5] -pin OutputWords_FF[7]_i I0[5] -port PrevUnit_in[5]
load net OutputWords[6]_OBUF[10] -attr @rip(#000000) 10 -pin OutputWords[6][17:0]_OBUF_inst I[10] -pin OutputWords_FF[5]_i I0[10] -pin OutputWords_FF_reg[6][17:0] Q[10]
load net OutputWords[6]_OBUF[15] -attr @rip(#000000) 15 -pin OutputWords[6][17:0]_OBUF_inst I[15] -pin OutputWords_FF[5]_i I0[15] -pin OutputWords_FF_reg[6][17:0] Q[15]
load net OutputWords_FF[5][9] -attr @rip(#000000) O[9] -pin OutputWords_FF[5]_i O[9] -pin OutputWords_FF_reg[5][17:0] D[9]
load net OutputWords[7]_OBUF[10] -attr @rip(#000000) 10 -pin OutputWords[7][17:0]_OBUF_inst I[10] -pin OutputWords_FF[6]_i I0[10] -pin OutputWords_FF_reg[7][17:0] Q[10]
load net OutputWords_FF[6][4] -attr @rip(#000000) O[4] -pin OutputWords_FF[6]_i O[4] -pin OutputWords_FF_reg[6][17:0] D[4]
load net OutputWords[1][5] -attr @rip(#000000) 5 -port OutputWords[1][5] -pin OutputWords[1][17:0]_OBUF_inst O[5]
load net OutputWords[2][2] -attr @rip(#000000) 2 -port OutputWords[2][2] -pin OutputWords[2][17:0]_OBUF_inst O[2]
load net OutputWords[4][16] -attr @rip(#000000) 16 -port OutputWords[4][16] -pin OutputWords[4][17:0]_OBUF_inst O[16]
load net OutputWords[0][1] -attr @rip(#000000) 1 -port OutputWords[0][1] -pin OutputWords[0][17:0]_OBUF_inst O[1]
load net OutputWords[4]_OBUF[9] -attr @rip(#000000) 9 -pin OutputWords[4][17:0]_OBUF_inst I[9] -pin OutputWords_FF[3]_i I0[9] -pin OutputWords_FF_reg[4][17:0] Q[9]
load net OutputWords[7]_OBUF[17] -attr @rip(#000000) 17 -pin OutputWords[7][17:0]_OBUF_inst I[17] -pin OutputWords_FF[6]_i I0[17] -pin OutputWords_FF_reg[7][17:0] Q[17]
load net OutputWords_FF[3][13] -attr @rip(#000000) O[13] -pin OutputWords_FF[3]_i O[13] -pin OutputWords_FF_reg[3][17:0] D[13]
load net OutputWords_FF[6][1] -attr @rip(#000000) O[1] -pin OutputWords_FF[6]_i O[1] -pin OutputWords_FF_reg[6][17:0] D[1]
load net InputWords[0][1] -attr @rip(#000000) InputWords[0][1] -port InputWords[0][1] -pin OutputWords_FF[0]_i I1[1]
load net InputWords[0][6] -attr @rip(#000000) InputWords[0][6] -port InputWords[0][6] -pin OutputWords_FF[0]_i I1[6]
load net InputWords[7][11] -attr @rip(#000000) InputWords[7][11] -port InputWords[7][11] -pin OutputWords_FF[7]_i I1[11]
load net OutputWords[2]_OBUF[11] -attr @rip(#000000) 11 -pin OutputWords[2][17:0]_OBUF_inst I[11] -pin OutputWords_FF[1]_i I0[11] -pin OutputWords_FF_reg[2][17:0] Q[11]
load net OutputWords_FF[0][11] -attr @rip(#000000) O[11] -pin OutputWords_FF[0]_i O[11] -pin OutputWords_FF_reg[0][17:0] D[11]
load net OutputWords[6][7] -attr @rip(#000000) 7 -port OutputWords[6][7] -pin OutputWords[6][17:0]_OBUF_inst O[7]
load net InputWords[4][14] -attr @rip(#000000) InputWords[4][14] -port InputWords[4][14] -pin OutputWords_FF[4]_i I1[14]
load net OutputWords[2]_OBUF[7] -attr @rip(#000000) 7 -pin OutputWords[2][17:0]_OBUF_inst I[7] -pin OutputWords_FF[1]_i I0[7] -pin OutputWords_FF_reg[2][17:0] Q[7]
load net OutputWords[4][1] -attr @rip(#000000) 1 -port OutputWords[4][1] -pin OutputWords[4][17:0]_OBUF_inst O[1]
load net OutputWords[7][5] -attr @rip(#000000) 5 -port OutputWords[7][5] -pin OutputWords[7][17:0]_OBUF_inst O[5]
load net OutputWords_FF[5][0] -attr @rip(#000000) O[0] -pin OutputWords_FF[5]_i O[0] -pin OutputWords_FF_reg[5][17:0] D[0]
load net InputWords[4][1] -attr @rip(#000000) InputWords[4][1] -port InputWords[4][1] -pin OutputWords_FF[4]_i I1[1]
load net OutputWords[0]_OBUF[8] -pin OutputWords[0][17:0]_OBUF_inst I[8] -pin OutputWords_FF_reg[0][17:0] Q[8]
load net InputWords[2][10] -attr @rip(#000000) InputWords[2][10] -port InputWords[2][10] -pin OutputWords_FF[2]_i I1[10]
load net InputWords[4][6] -attr @rip(#000000) InputWords[4][6] -port InputWords[4][6] -pin OutputWords_FF[4]_i I1[6]
load net InputWords[7][9] -attr @rip(#000000) InputWords[7][9] -port InputWords[7][9] -pin OutputWords_FF[7]_i I1[9]
load net InputWords[1][4] -attr @rip(#000000) InputWords[1][4] -port InputWords[1][4] -pin OutputWords_FF[1]_i I1[4]
load net OutputWords[3][13] -attr @rip(#000000) 13 -port OutputWords[3][13] -pin OutputWords[3][17:0]_OBUF_inst O[13]
load net OutputWords[6][4] -attr @rip(#000000) 4 -port OutputWords[6][4] -pin OutputWords[6][17:0]_OBUF_inst O[4]
load net OutputWords_FF[1][3] -attr @rip(#000000) O[3] -pin OutputWords_FF[1]_i O[3] -pin OutputWords_FF_reg[1][17:0] D[3]
load net OutputWords_FF[7][8] -attr @rip(#000000) O[8] -pin OutputWords_FF[7]_i O[8] -pin OutputWords_FF_reg[7][17:0] D[8]
load net InputWords[6][2] -attr @rip(#000000) InputWords[6][2] -port InputWords[6][2] -pin OutputWords_FF[6]_i I1[2]
load net OutputWords[3]_OBUF[7] -attr @rip(#000000) 7 -pin OutputWords[3][17:0]_OBUF_inst I[7] -pin OutputWords_FF[2]_i I0[7] -pin OutputWords_FF_reg[3][17:0] Q[7]
load net OutputWords[5][3] -attr @rip(#000000) 3 -port OutputWords[5][3] -pin OutputWords[5][17:0]_OBUF_inst O[3]
load net OutputWords_FF[3][0] -attr @rip(#000000) O[0] -pin OutputWords_FF[3]_i O[0] -pin OutputWords_FF_reg[3][17:0] D[0]
load net OutputWords[1][1] -attr @rip(#000000) 1 -port OutputWords[1][1] -pin OutputWords[1][17:0]_OBUF_inst O[1]
load net OutputWords[6]_OBUF[7] -attr @rip(#000000) 7 -pin OutputWords[6][17:0]_OBUF_inst I[7] -pin OutputWords_FF[5]_i I0[7] -pin OutputWords_FF_reg[6][17:0] Q[7]
load net InputWords[2][4] -attr @rip(#000000) InputWords[2][4] -port InputWords[2][4] -pin OutputWords_FF[2]_i I1[4]
load net OutputWords[1]_OBUF[1] -attr @rip(#000000) 1 -pin OutputWords[1][17:0]_OBUF_inst I[1] -pin OutputWords_FF[0]_i I0[1] -pin OutputWords_FF_reg[1][17:0] Q[1]
load net OutputWords[1][16] -attr @rip(#000000) 16 -port OutputWords[1][16] -pin OutputWords[1][17:0]_OBUF_inst O[16]
load net OutputWords_FF[2][2] -attr @rip(#000000) O[2] -pin OutputWords_FF[2]_i O[2] -pin OutputWords_FF_reg[2][17:0] D[2]
load net InputWords[3][5] -attr @rip(#000000) InputWords[3][5] -port InputWords[3][5] -pin OutputWords_FF[3]_i I1[5]
load net OutputWords[3][8] -attr @rip(#000000) 8 -port OutputWords[3][8] -pin OutputWords[3][17:0]_OBUF_inst O[8]
load net OutputWords_FF[7][16] -attr @rip(#000000) O[16] -pin OutputWords_FF[7]_i O[16] -pin OutputWords_FF_reg[7][17:0] D[16]
load net ShiftEn -pin OutputWords_FF[0]_i S -pin OutputWords_FF[1]_i S -pin OutputWords_FF[2]_i S -pin OutputWords_FF[3]_i S -pin OutputWords_FF[4]_i S -pin OutputWords_FF[5]_i S -pin OutputWords_FF[6]_i S -pin OutputWords_FF[7]_i S -port ShiftEn
netloc ShiftEn 1 0 15 NJ N 280 420 NJ N 1060 380 NJ N 1680 380 NJ N 2360 380 NJ N 3120 380 NJ N 3900 380 NJ N 4700 460 NJ
load net OutputWords[0]_OBUF[17] -pin OutputWords[0][17:0]_OBUF_inst I[17] -pin OutputWords_FF_reg[0][17:0] Q[17]
load net OutputWords[3]_OBUF[6] -attr @rip(#000000) 6 -pin OutputWords[3][17:0]_OBUF_inst I[6] -pin OutputWords_FF[2]_i I0[6] -pin OutputWords_FF_reg[3][17:0] Q[6]
load net OutputWords[5][14] -attr @rip(#000000) 14 -port OutputWords[5][14] -pin OutputWords[5][17:0]_OBUF_inst O[14]
load net OutputWords[5]_OBUF[14] -attr @rip(#000000) 14 -pin OutputWords[5][17:0]_OBUF_inst I[14] -pin OutputWords_FF[4]_i I0[14] -pin OutputWords_FF_reg[5][17:0] Q[14]
load net OutputWords_FF[1][11] -attr @rip(#000000) O[11] -pin OutputWords_FF[1]_i O[11] -pin OutputWords_FF_reg[1][17:0] D[11]
load net OutputWords_FF[3][9] -attr @rip(#000000) O[9] -pin OutputWords_FF[3]_i O[9] -pin OutputWords_FF_reg[3][17:0] D[9]
load net OutputWords_FF[4][14] -attr @rip(#000000) O[14] -pin OutputWords_FF[4]_i O[14] -pin OutputWords_FF_reg[4][17:0] D[14]
load net OutputWords[5]_OBUF[3] -attr @rip(#000000) 3 -pin OutputWords[5][17:0]_OBUF_inst I[3] -pin OutputWords_FF[4]_i I0[3] -pin OutputWords_FF_reg[5][17:0] Q[3]
load net OutputWords_FF[0][7] -attr @rip(#000000) O[7] -pin OutputWords_FF[0]_i O[7] -pin OutputWords_FF_reg[0][17:0] D[7]
load net InputWords[5][13] -attr @rip(#000000) InputWords[5][13] -port InputWords[5][13] -pin OutputWords_FF[5]_i I1[13]
load net InputWords[7][5] -attr @rip(#000000) InputWords[7][5] -port InputWords[7][5] -pin OutputWords_FF[7]_i I1[5]
load net InputWords[6][12] -attr @rip(#000000) InputWords[6][12] -port InputWords[6][12] -pin OutputWords_FF[6]_i I1[12]
load net InputWords[2][3] -attr @rip(#000000) InputWords[2][3] -port InputWords[2][3] -pin OutputWords_FF[2]_i I1[3]
load net OutputWords[6]_OBUF[14] -attr @rip(#000000) 14 -pin OutputWords[6][17:0]_OBUF_inst I[14] -pin OutputWords_FF[5]_i I0[14] -pin OutputWords_FF_reg[6][17:0] Q[14]
load net PrevUnit_in[6] -attr @rip(#000000) PrevUnit_in[6] -pin OutputWords_FF[7]_i I0[6] -port PrevUnit_in[6]
load net OutputWords[0][13] -attr @rip(#000000) 13 -port OutputWords[0][13] -pin OutputWords[0][17:0]_OBUF_inst O[13]
load net OutputWords[1][4] -attr @rip(#000000) 4 -port OutputWords[1][4] -pin OutputWords[1][17:0]_OBUF_inst O[4]
load net OutputWords[4][15] -attr @rip(#000000) 15 -port OutputWords[4][15] -pin OutputWords[4][17:0]_OBUF_inst O[15]
load net OutputWords[0][5] -attr @rip(#000000) 5 -port OutputWords[0][5] -pin OutputWords[0][17:0]_OBUF_inst O[5]
load net OutputWords[1]_OBUF[12] -attr @rip(#000000) 12 -pin OutputWords[1][17:0]_OBUF_inst I[12] -pin OutputWords_FF[0]_i I0[12] -pin OutputWords_FF_reg[1][17:0] Q[12]
load net OutputWords[4]_OBUF[8] -attr @rip(#000000) 8 -pin OutputWords[4][17:0]_OBUF_inst I[8] -pin OutputWords_FF[3]_i I0[8] -pin OutputWords_FF_reg[4][17:0] Q[8]
load net OutputWords[7]_OBUF[11] -attr @rip(#000000) 11 -pin OutputWords[7][17:0]_OBUF_inst I[11] -pin OutputWords_FF[6]_i I0[11] -pin OutputWords_FF_reg[7][17:0] Q[11]
load net OutputWords_FF[6][5] -attr @rip(#000000) O[5] -pin OutputWords_FF[6]_i O[5] -pin OutputWords_FF_reg[6][17:0] D[5]
load net InputWords[0][0] -attr @rip(#000000) InputWords[0][0] -port InputWords[0][0] -pin OutputWords_FF[0]_i I1[0]
load net InputWords[7][10] -attr @rip(#000000) InputWords[7][10] -port InputWords[7][10] -pin OutputWords_FF[7]_i I1[10]
load net OutputWords[2]_OBUF[10] -attr @rip(#000000) 10 -pin OutputWords[2][17:0]_OBUF_inst I[10] -pin OutputWords_FF[1]_i I0[10] -pin OutputWords_FF_reg[2][17:0] Q[10]
load net InputWords[3][13] -attr @rip(#000000) InputWords[3][13] -port InputWords[3][13] -pin OutputWords_FF[3]_i I1[13]
load net InputWords[1][1] -attr @rip(#000000) InputWords[1][1] -port InputWords[1][1] -pin OutputWords_FF[1]_i I1[1]
load net InputWords[0][17] -attr @rip(#000000) InputWords[0][17] -port InputWords[0][17] -pin OutputWords_FF[0]_i I1[17]
load net OutputWords[0][2] -attr @rip(#000000) 2 -port OutputWords[0][2] -pin OutputWords[0][17:0]_OBUF_inst O[2]
load net OutputWords_FF[6][2] -attr @rip(#000000) O[2] -pin OutputWords_FF[6]_i O[2] -pin OutputWords_FF_reg[6][17:0] D[2]
load net PrevUnit_in[11] -attr @rip(#000000) PrevUnit_in[11] -pin OutputWords_FF[7]_i I0[11] -port PrevUnit_in[11]
load net InputWords[4][13] -attr @rip(#000000) InputWords[4][13] -port InputWords[4][13] -pin OutputWords_FF[4]_i I1[13]
load net OutputWords[2]_OBUF[6] -attr @rip(#000000) 6 -pin OutputWords[2][17:0]_OBUF_inst I[6] -pin OutputWords_FF[1]_i I0[6] -pin OutputWords_FF_reg[2][17:0] Q[6]
load net OutputWords[7][4] -attr @rip(#000000) 4 -port OutputWords[7][4] -pin OutputWords[7][17:0]_OBUF_inst O[4]
load net OutputWords_FF[0][12] -attr @rip(#000000) O[12] -pin OutputWords_FF[0]_i O[12] -pin OutputWords_FF_reg[0][17:0] D[12]
load net InputWords[7][8] -attr @rip(#000000) InputWords[7][8] -port InputWords[7][8] -pin OutputWords_FF[7]_i I1[8]
load net InputWords[4][0] -attr @rip(#000000) InputWords[4][0] -port InputWords[4][0] -pin OutputWords_FF[4]_i I1[0]
load net InputWords[4][5] -attr @rip(#000000) InputWords[4][5] -port InputWords[4][5] -pin OutputWords_FF[4]_i I1[5]
load net OutputWords_FF[7][7] -attr @rip(#000000) O[7] -pin OutputWords_FF[7]_i O[7] -pin OutputWords_FF_reg[7][17:0] D[7]
load net OutputWords[4][2] -attr @rip(#000000) 2 -port OutputWords[4][2] -pin OutputWords[4][17:0]_OBUF_inst O[2]
load net OutputWords[5][2] -attr @rip(#000000) 2 -port OutputWords[5][2] -pin OutputWords[5][17:0]_OBUF_inst O[2]
load net OutputWords[1][0] -attr @rip(#000000) 0 -port OutputWords[1][0] -pin OutputWords[1][17:0]_OBUF_inst O[0]
load net OutputWords[6][5] -attr @rip(#000000) 5 -port OutputWords[6][5] -pin OutputWords[6][17:0]_OBUF_inst O[5]
load net OutputWords[6]_OBUF[6] -attr @rip(#000000) 6 -pin OutputWords[6][17:0]_OBUF_inst I[6] -pin OutputWords_FF[5]_i I0[6] -pin OutputWords_FF_reg[6][17:0] Q[6]
load net OutputWords[1][15] -attr @rip(#000000) 15 -port OutputWords[1][15] -pin OutputWords[1][17:0]_OBUF_inst O[15]
load net OutputWords[3][16] -attr @rip(#000000) 16 -port OutputWords[3][16] -pin OutputWords[3][17:0]_OBUF_inst O[16]
load net OutputWords_FF[1][6] -attr @rip(#000000) O[6] -pin OutputWords_FF[1]_i O[6] -pin OutputWords_FF_reg[1][17:0] D[6]
load net OutputWords_FF[7][10] -attr @rip(#000000) O[10] -pin OutputWords_FF[7]_i O[10] -pin OutputWords_FF_reg[7][17:0] D[10]
load net InputWords[6][5] -attr @rip(#000000) InputWords[6][5] -port InputWords[6][5] -pin OutputWords_FF[6]_i I1[5]
load net OutputWords[0]_OBUF[16] -pin OutputWords[0][17:0]_OBUF_inst I[16] -pin OutputWords_FF_reg[0][17:0] Q[16]
load net OutputWords[3]_OBUF[5] -attr @rip(#000000) 5 -pin OutputWords[3][17:0]_OBUF_inst I[5] -pin OutputWords_FF[2]_i I0[5] -pin OutputWords_FF_reg[3][17:0] Q[5]
load net OutputWords[5][13] -attr @rip(#000000) 13 -port OutputWords[5][13] -pin OutputWords[5][17:0]_OBUF_inst O[13]
load net OutputWords_FF[2][3] -attr @rip(#000000) O[3] -pin OutputWords_FF[2]_i O[3] -pin OutputWords_FF_reg[2][17:0] D[3]
load net InputWords[3][6] -attr @rip(#000000) InputWords[3][6] -port InputWords[3][6] -pin OutputWords_FF[3]_i I1[6]
load net OutputWords[4]_OBUF[17] -attr @rip(#000000) 17 -pin OutputWords[4][17:0]_OBUF_inst I[17] -pin OutputWords_FF[3]_i I0[17] -pin OutputWords_FF_reg[4][17:0] Q[17]
load net OutputWords_FF[2][13] -attr @rip(#000000) O[13] -pin OutputWords_FF[2]_i O[13] -pin OutputWords_FF_reg[2][17:0] D[13]
load net OutputWords_FF[7][17] -attr @rip(#000000) O[17] -pin OutputWords_FF[7]_i O[17] -pin OutputWords_FF_reg[7][17:0] D[17]
load net InputWords[6][11] -attr @rip(#000000) InputWords[6][11] -port InputWords[6][11] -pin OutputWords_FF[6]_i I1[11]
load net InputWords[2][2] -attr @rip(#000000) InputWords[2][2] -port InputWords[2][2] -pin OutputWords_FF[2]_i I1[2]
load net InputWords[2][7] -attr @rip(#000000) InputWords[2][7] -port InputWords[2][7] -pin OutputWords_FF[2]_i I1[7]
load net InputWords[5][12] -attr @rip(#000000) InputWords[5][12] -port InputWords[5][12] -pin OutputWords_FF[5]_i I1[12]
load net OutputWords[5]_OBUF[15] -attr @rip(#000000) 15 -pin OutputWords[5][17:0]_OBUF_inst I[15] -pin OutputWords_FF[4]_i I0[15] -pin OutputWords_FF_reg[5][17:0] Q[15]
load net OutputWords[6]_OBUF[13] -attr @rip(#000000) 13 -pin OutputWords[6][17:0]_OBUF_inst I[13] -pin OutputWords_FF[5]_i I0[13] -pin OutputWords_FF_reg[6][17:0] Q[13]
load net OutputWords_FF[1][12] -attr @rip(#000000) O[12] -pin OutputWords_FF[1]_i O[12] -pin OutputWords_FF_reg[1][17:0] D[12]
load net OutputWords_FF[0][10] -attr @rip(#000000) O[10] -pin OutputWords_FF[0]_i O[10] -pin OutputWords_FF_reg[0][17:0] D[10]
load net InputWords[7][6] -attr @rip(#000000) InputWords[7][6] -port InputWords[7][6] -pin OutputWords_FF[7]_i I1[6]
load net OutputWords_FF[1][0] -attr @rip(#000000) O[0] -pin OutputWords_FF[1]_i O[0] -pin OutputWords_FF_reg[1][17:0] D[0]
load net OutputWords[0][12] -attr @rip(#000000) 12 -port OutputWords[0][12] -pin OutputWords[0][17:0]_OBUF_inst O[12]
load net OutputWords[2][0] -attr @rip(#000000) 0 -port OutputWords[2][0] -pin OutputWords[2][17:0]_OBUF_inst O[0]
load net OutputWords[2]_OBUF[1] -attr @rip(#000000) 1 -pin OutputWords[2][17:0]_OBUF_inst I[1] -pin OutputWords_FF[1]_i I0[1] -pin OutputWords_FF_reg[2][17:0] Q[1]
load net OutputWords[4][14] -attr @rip(#000000) 14 -port OutputWords[4][14] -pin OutputWords[4][17:0]_OBUF_inst O[14]
load net PrevUnit_in[7] -attr @rip(#000000) PrevUnit_in[7] -pin OutputWords_FF[7]_i I0[7] -port PrevUnit_in[7]
load net OutputWords[4]_OBUF[7] -attr @rip(#000000) 7 -pin OutputWords[4][17:0]_OBUF_inst I[7] -pin OutputWords_FF[3]_i I0[7] -pin OutputWords_FF_reg[4][17:0] Q[7]
load net OutputWords_FF[1][9] -attr @rip(#000000) O[9] -pin OutputWords_FF[1]_i O[9] -pin OutputWords_FF_reg[1][17:0] D[9]
load net InputWords[0][16] -attr @rip(#000000) InputWords[0][16] -port InputWords[0][16] -pin OutputWords_FF[0]_i I1[16]
load net OutputWords[1]_OBUF[13] -attr @rip(#000000) 13 -pin OutputWords[1][17:0]_OBUF_inst I[13] -pin OutputWords_FF[0]_i I0[13] -pin OutputWords_FF_reg[1][17:0] Q[13]
load net OutputWords[0][6] -attr @rip(#000000) 6 -port OutputWords[0][6] -pin OutputWords[0][17:0]_OBUF_inst O[6]
load net InputWords[3][12] -attr @rip(#000000) InputWords[3][12] -port InputWords[3][12] -pin OutputWords_FF[3]_i I1[12]
load net InputWords[7][16] -attr @rip(#000000) InputWords[7][16] -port InputWords[7][16] -pin OutputWords_FF[7]_i I1[16]
load net OutputWords_FF[6][6] -attr @rip(#000000) O[6] -pin OutputWords_FF[6]_i O[6] -pin OutputWords_FF_reg[6][17:0] D[6]
load net InputWords[4][12] -attr @rip(#000000) InputWords[4][12] -port InputWords[4][12] -pin OutputWords_FF[4]_i I1[12]
load net OutputWords[0][3] -attr @rip(#000000) 3 -port OutputWords[0][3] -pin OutputWords[0][17:0]_OBUF_inst O[3]
load net InputWords[7][7] -attr @rip(#000000) InputWords[7][7] -port InputWords[7][7] -pin OutputWords_FF[7]_i I1[7]
load net InputWords[1][2] -attr @rip(#000000) InputWords[1][2] -port InputWords[1][2] -pin OutputWords_FF[1]_i I1[2]
load net InputWords[4][4] -attr @rip(#000000) InputWords[4][4] -port InputWords[4][4] -pin OutputWords_FF[4]_i I1[4]
load net OutputWords[7][12] -attr @rip(#000000) 12 -port OutputWords[7][12] -pin OutputWords[7][17:0]_OBUF_inst O[12]
load net OutputWords_FF[2][8] -attr @rip(#000000) O[8] -pin OutputWords_FF[2]_i O[8] -pin OutputWords_FF_reg[2][17:0] D[8]
load net OutputWords_FF[6][3] -attr @rip(#000000) O[3] -pin OutputWords_FF[6]_i O[3] -pin OutputWords_FF_reg[6][17:0] D[3]
load net PrevUnit_in[12] -attr @rip(#000000) PrevUnit_in[12] -pin OutputWords_FF[7]_i I0[12] -port PrevUnit_in[12]
load net InputWords[5][3] -attr @rip(#000000) InputWords[5][3] -port InputWords[5][3] -pin OutputWords_FF[5]_i I1[3]
load net OutputWords[3]_OBUF[0] -attr @rip(#000000) 0 -pin OutputWords[3][17:0]_OBUF_inst I[0] -pin OutputWords_FF[2]_i I0[0] -pin OutputWords_FF_reg[3][17:0] Q[0]
load net OutputWords[5][1] -attr @rip(#000000) 1 -port OutputWords[5][1] -pin OutputWords[5][17:0]_OBUF_inst O[1]
load net OutputWords[6][9] -attr @rip(#000000) 9 -port OutputWords[6][9] -pin OutputWords[6][17:0]_OBUF_inst O[9]
load net OutputWords[4][3] -attr @rip(#000000) 3 -port OutputWords[4][3] -pin OutputWords[4][17:0]_OBUF_inst O[3]
load net OutputWords[5]_OBUF[9] -attr @rip(#000000) 9 -pin OutputWords[5][17:0]_OBUF_inst I[9] -pin OutputWords_FF[4]_i I0[9] -pin OutputWords_FF_reg[5][17:0] Q[9]
load net OutputWords[3][15] -attr @rip(#000000) 15 -port OutputWords[3][15] -pin OutputWords[3][17:0]_OBUF_inst O[15]
load net OutputWords[6][6] -attr @rip(#000000) 6 -port OutputWords[6][6] -pin OutputWords[6][17:0]_OBUF_inst O[6]
load net OutputWords_FF[1][5] -attr @rip(#000000) O[5] -pin OutputWords_FF[1]_i O[5] -pin OutputWords_FF_reg[1][17:0] D[5]
load net OutputWords_FF[3]_i__0_n_0 -pin OutputWords_FF[7:0]_i__0 O[3] -pin OutputWords_FF_reg[3][17:0] RST
load net InputWords[6][4] -attr @rip(#000000) InputWords[6][4] -port InputWords[6][4] -pin OutputWords_FF[6]_i I1[4]
load net OutputWords[0]_OBUF[15] -pin OutputWords[0][17:0]_OBUF_inst I[15] -pin OutputWords_FF_reg[0][17:0] Q[15]
load net OutputWords[3]_OBUF[9] -attr @rip(#000000) 9 -pin OutputWords[3][17:0]_OBUF_inst I[9] -pin OutputWords_FF[2]_i I0[9] -pin OutputWords_FF_reg[3][17:0] Q[9]
load net OutputWords_FF[0][17] -attr @rip(#000000) O[17] -pin OutputWords_FF[0]_i O[17] -pin OutputWords_FF_reg[0][17:0] D[17]
load net OutputWords_FF[3][2] -attr @rip(#000000) O[2] -pin OutputWords_FF[3]_i O[2] -pin OutputWords_FF_reg[3][17:0] D[2]
load net OutputWords[4]_OBUF[16] -attr @rip(#000000) 16 -pin OutputWords[4][17:0]_OBUF_inst I[16] -pin OutputWords_FF[3]_i I0[16] -pin OutputWords_FF_reg[4][17:0] Q[16]
load net OutputWords[6]_OBUF[9] -attr @rip(#000000) 9 -pin OutputWords[6][17:0]_OBUF_inst I[9] -pin OutputWords_FF[5]_i I0[9] -pin OutputWords_FF_reg[6][17:0] Q[9]
load net OutputWords_FF[7][11] -attr @rip(#000000) O[11] -pin OutputWords_FF[7]_i O[11] -pin OutputWords_FF_reg[7][17:0] D[11]
load net InputWords[6][10] -attr @rip(#000000) InputWords[6][10] -port InputWords[6][10] -pin OutputWords_FF[6]_i I1[10]
load net InputWords[2][6] -attr @rip(#000000) InputWords[2][6] -port InputWords[2][6] -pin OutputWords_FF[2]_i I1[6]
load net InputWords[7][3] -attr @rip(#000000) InputWords[7][3] -port InputWords[7][3] -pin OutputWords_FF[7]_i I1[3]
load net OutputWords[2][17] -attr @rip(#000000) 17 -port OutputWords[2][17] -pin OutputWords[2][17:0]_OBUF_inst O[17]
load net OutputWords[7]_OBUF[4] -attr @rip(#000000) 4 -pin OutputWords[7][17:0]_OBUF_inst I[4] -pin OutputWords_FF[6]_i I0[4] -pin OutputWords_FF_reg[7][17:0] Q[4]
load net OutputWords_FF[2][4] -attr @rip(#000000) O[4] -pin OutputWords_FF[2]_i O[4] -pin OutputWords_FF_reg[2][17:0] D[4]
load net InputWords[2][16] -attr @rip(#000000) InputWords[2][16] -port InputWords[2][16] -pin OutputWords_FF[2]_i I1[16]
load net InputWords[6][17] -attr @rip(#000000) InputWords[6][17] -port InputWords[6][17] -pin OutputWords_FF[6]_i I1[17]
load net InputWords[1][15] -attr @rip(#000000) InputWords[1][15] -port InputWords[1][15] -pin OutputWords_FF[1]_i I1[15]
load net InputWords[3][7] -attr @rip(#000000) InputWords[3][7] -port InputWords[3][7] -pin OutputWords_FF[3]_i I1[7]
load net OutputWords_FF[2][14] -attr @rip(#000000) O[14] -pin OutputWords_FF[2]_i O[14] -pin OutputWords_FF_reg[2][17:0] D[14]
load net OutputWords[5][16] -attr @rip(#000000) 16 -port OutputWords[5][16] -pin OutputWords[5][17:0]_OBUF_inst O[16]
load net OutputWords[5]_OBUF[16] -attr @rip(#000000) 16 -pin OutputWords[5][17:0]_OBUF_inst I[16] -pin OutputWords_FF[4]_i I0[16] -pin OutputWords_FF_reg[5][17:0] Q[16]
load net OutputWords_FF[1][13] -attr @rip(#000000) O[13] -pin OutputWords_FF[1]_i O[13] -pin OutputWords_FF_reg[1][17:0] D[13]
load net OutputWords[0][11] -attr @rip(#000000) 11 -port OutputWords[0][11] -pin OutputWords[0][17:0]_OBUF_inst O[11]
load net OutputWords[2]_OBUF[0] -attr @rip(#000000) 0 -pin OutputWords[2][17:0]_OBUF_inst I[0] -pin OutputWords_FF[1]_i I0[0] -pin OutputWords_FF_reg[2][17:0] Q[0]
load net OutputWords[1]_OBUF[10] -attr @rip(#000000) 10 -pin OutputWords[1][17:0]_OBUF_inst I[10] -pin OutputWords_FF[0]_i I0[10] -pin OutputWords_FF_reg[1][17:0] Q[10]
load net OutputWords[4]_OBUF[6] -attr @rip(#000000) 6 -pin OutputWords[4][17:0]_OBUF_inst I[6] -pin OutputWords_FF[3]_i I0[6] -pin OutputWords_FF_reg[4][17:0] Q[6]
load net PrevUnit_in[8] -attr @rip(#000000) PrevUnit_in[8] -pin OutputWords_FF[7]_i I0[8] -port PrevUnit_in[8]
load net InputWords[0][10] -attr @rip(#000000) InputWords[0][10] -port InputWords[0][10] -pin OutputWords_FF[0]_i I1[10]
load net InputWords[0][15] -attr @rip(#000000) InputWords[0][15] -port InputWords[0][15] -pin OutputWords_FF[0]_i I1[15]
load net OutputWords_FF[4]_i__0_n_0 -pin OutputWords_FF[7:0]_i__0 O[4] -pin OutputWords_FF_reg[4][17:0] RST
load net InputWords[4][11] -attr @rip(#000000) InputWords[4][11] -port InputWords[4][11] -pin OutputWords_FF[4]_i I1[11]
load net OutputWords[7]_OBUF[0] -attr @rip(#000000) 0 -pin OutputWords[7][17:0]_OBUF_inst I[0] -pin OutputWords_FF[6]_i I0[0] -pin OutputWords_FF_reg[7][17:0] Q[0]
load net InputWords[7][17] -attr @rip(#000000) InputWords[7][17] -port InputWords[7][17] -pin OutputWords_FF[7]_i I1[17]
load net InputWords[4][3] -attr @rip(#000000) InputWords[4][3] -port InputWords[4][3] -pin OutputWords_FF[4]_i I1[3]
load net OutputWords[0][7] -attr @rip(#000000) 7 -port OutputWords[0][7] -pin OutputWords[0][17:0]_OBUF_inst O[7]
load net OutputWords[6][16] -attr @rip(#000000) 16 -port OutputWords[6][16] -pin OutputWords[6][17:0]_OBUF_inst O[16]
load net OutputWords[7][11] -attr @rip(#000000) 11 -port OutputWords[7][11] -pin OutputWords[7][17:0]_OBUF_inst O[11]
load net OutputWords_FF[6][7] -attr @rip(#000000) O[7] -pin OutputWords_FF[6]_i O[7] -pin OutputWords_FF_reg[6][17:0] D[7]
load net OutputWords[2][5] -attr @rip(#000000) 5 -port OutputWords[2][5] -pin OutputWords[2][17:0]_OBUF_inst O[5]
load net OutputWords[5][0] -attr @rip(#000000) 0 -port OutputWords[5][0] -pin OutputWords[5][17:0]_OBUF_inst O[0]
load net OutputWords[0][4] -attr @rip(#000000) 4 -port OutputWords[0][4] -pin OutputWords[0][17:0]_OBUF_inst O[4]
load net InputWords[3][15] -attr @rip(#000000) InputWords[3][15] -port InputWords[3][15] -pin OutputWords_FF[3]_i I1[15]
load net OutputWords_FF[2][9] -attr @rip(#000000) O[9] -pin OutputWords_FF[2]_i O[9] -pin OutputWords_FF_reg[2][17:0] D[9]
load net OutputWords_FF[5][12] -attr @rip(#000000) O[12] -pin OutputWords_FF[5]_i O[12] -pin OutputWords_FF_reg[5][17:0] D[12]
load net PrevUnit_in[13] -attr @rip(#000000) PrevUnit_in[13] -pin OutputWords_FF[7]_i I0[13] -port PrevUnit_in[13]
load net InputWords[5][4] -attr @rip(#000000) InputWords[5][4] -port InputWords[5][4] -pin OutputWords_FF[5]_i I1[4]
load net OutputWords_FF[6][17] -attr @rip(#000000) O[17] -pin OutputWords_FF[6]_i O[17] -pin OutputWords_FF_reg[6][17:0] D[17]
load net OutputWords_FF[7][9] -attr @rip(#000000) O[9] -pin OutputWords_FF[7]_i O[9] -pin OutputWords_FF_reg[7][17:0] D[9]
load net OutputWords[3]_OBUF[10] -attr @rip(#000000) 10 -pin OutputWords[3][17:0]_OBUF_inst I[10] -pin OutputWords_FF[2]_i I0[10] -pin OutputWords_FF_reg[3][17:0] Q[10]
load net OutputWords[4][4] -attr @rip(#000000) 4 -port OutputWords[4][4] -pin OutputWords[4][17:0]_OBUF_inst O[4]
load net OutputWords_FF[3][1] -attr @rip(#000000) O[1] -pin OutputWords_FF[3]_i O[1] -pin OutputWords_FF_reg[3][17:0] D[1]
load net OutputWords[4]_OBUF[15] -attr @rip(#000000) 15 -pin OutputWords[4][17:0]_OBUF_inst I[15] -pin OutputWords_FF[3]_i I0[15] -pin OutputWords_FF_reg[4][17:0] Q[15]
load net OutputWords[5]_OBUF[0] -attr @rip(#000000) 0 -pin OutputWords[5][17:0]_OBUF_inst I[0] -pin OutputWords_FF[4]_i I0[0] -pin OutputWords_FF_reg[5][17:0] Q[0]
load net OutputWords[6]_OBUF[8] -attr @rip(#000000) 8 -pin OutputWords[6][17:0]_OBUF_inst I[8] -pin OutputWords_FF[5]_i I0[8] -pin OutputWords_FF_reg[6][17:0] Q[8]
load net OutputWords[1][17] -attr @rip(#000000) 17 -port OutputWords[1][17] -pin OutputWords[1][17:0]_OBUF_inst O[17]
load net OutputWords[2][11] -attr @rip(#000000) 11 -port OutputWords[2][11] -pin OutputWords[2][17:0]_OBUF_inst O[11]
load net OutputWords[2][16] -attr @rip(#000000) 16 -port OutputWords[2][16] -pin OutputWords[2][17:0]_OBUF_inst O[16]
load net OutputWords[7]_OBUF[3] -attr @rip(#000000) 3 -pin OutputWords[7][17:0]_OBUF_inst I[3] -pin OutputWords_FF[6]_i I0[3] -pin OutputWords_FF_reg[7][17:0] Q[3]
load net InputWords[2][15] -attr @rip(#000000) InputWords[2][15] -port InputWords[2][15] -pin OutputWords_FF[2]_i I1[15]
load net InputWords[1][14] -attr @rip(#000000) InputWords[1][14] -port InputWords[1][14] -pin OutputWords_FF[1]_i I1[14]
load net OutputWords_FF[1][8] -attr @rip(#000000) O[8] -pin OutputWords_FF[1]_i O[8] -pin OutputWords_FF_reg[1][17:0] D[8]
load net InputWords[6][7] -attr @rip(#000000) InputWords[6][7] -port InputWords[6][7] -pin OutputWords_FF[6]_i I1[7]
load net InputWords[3][11] -attr @rip(#000000) InputWords[3][11] -port InputWords[3][11] -pin OutputWords_FF[3]_i I1[11]
load net InputWords[7][4] -attr @rip(#000000) InputWords[7][4] -port InputWords[7][4] -pin OutputWords_FF[7]_i I1[4]
load net OutputWords[5][15] -attr @rip(#000000) 15 -port OutputWords[5][15] -pin OutputWords[5][17:0]_OBUF_inst O[15]
load net OutputWords_FF[2][5] -attr @rip(#000000) O[5] -pin OutputWords_FF[2]_i O[5] -pin OutputWords_FF_reg[2][17:0] D[5]
load net InputWords[3][8] -attr @rip(#000000) InputWords[3][8] -port InputWords[3][8] -pin OutputWords_FF[3]_i I1[8]
load net OutputWords[0][10] -attr @rip(#000000) 10 -port OutputWords[0][10] -pin OutputWords[0][17:0]_OBUF_inst O[10]
load net InputWords[5][0] -attr @rip(#000000) InputWords[5][0] -port InputWords[5][0] -pin OutputWords_FF[5]_i I1[0]
load net OutputWords_FF[2][15] -attr @rip(#000000) O[15] -pin OutputWords_FF[2]_i O[15] -pin OutputWords_FF_reg[2][17:0] D[15]
load net OutputWords[4]_OBUF[5] -attr @rip(#000000) 5 -pin OutputWords[4][17:0]_OBUF_inst I[5] -pin OutputWords_FF[3]_i I0[5] -pin OutputWords_FF_reg[4][17:0] Q[5]
load net OutputWords[5]_OBUF[17] -attr @rip(#000000) 17 -pin OutputWords[5][17:0]_OBUF_inst I[17] -pin OutputWords_FF[4]_i I0[17] -pin OutputWords_FF_reg[5][17:0] Q[17]
load net OutputWords[4][0] -attr @rip(#000000) 0 -port OutputWords[4][0] -pin OutputWords[4][17:0]_OBUF_inst O[0]
load net OutputWords[1]_OBUF[11] -attr @rip(#000000) 11 -pin OutputWords[1][17:0]_OBUF_inst I[11] -pin OutputWords_FF[0]_i I0[11] -pin OutputWords_FF_reg[1][17:0] Q[11]
load net InputWords[6][8] -attr @rip(#000000) InputWords[6][8] -port InputWords[6][8] -pin OutputWords_FF[6]_i I1[8]
load net OutputWords[2]_OBUF[3] -attr @rip(#000000) 3 -pin OutputWords[2][17:0]_OBUF_inst I[3] -pin OutputWords_FF[1]_i I0[3] -pin OutputWords_FF_reg[2][17:0] Q[3]
load net OutputWords_FF[6]_i__0_n_0 -pin OutputWords_FF[7:0]_i__0 O[6] -pin OutputWords_FF_reg[6][17:0] RST
load net PrevUnit_in[9] -attr @rip(#000000) PrevUnit_in[9] -pin OutputWords_FF[7]_i I0[9] -port PrevUnit_in[9]
load net InputWords[1][0] -attr @rip(#000000) InputWords[1][0] -port InputWords[1][0] -pin OutputWords_FF[1]_i I1[0]
load net InputWords[4][2] -attr @rip(#000000) InputWords[4][2] -port InputWords[4][2] -pin OutputWords_FF[4]_i I1[2]
load net OutputWords[4][9] -attr @rip(#000000) 9 -port OutputWords[4][9] -pin OutputWords[4][17:0]_OBUF_inst O[9]
load net OutputWords[6][0] -attr @rip(#000000) 0 -port OutputWords[6][0] -pin OutputWords[6][17:0]_OBUF_inst O[0]
load net OutputWords_FF[5][8] -attr @rip(#000000) O[8] -pin OutputWords_FF[5]_i O[8] -pin OutputWords_FF_reg[5][17:0] D[8]
load netBundle @InputWords_8 18 InputWords[3][17] InputWords[3][16] InputWords[3][15] InputWords[3][14] InputWords[3][13] InputWords[3][12] InputWords[3][11] InputWords[3][10] InputWords[3][9] InputWords[3][8] InputWords[3][7] InputWords[3][6] InputWords[3][5] InputWords[3][4] InputWords[3][3] InputWords[3][2] InputWords[3][1] InputWords[3][0] -autobundled
netbloc @InputWords_8 1 0 9 NJ 220 320 210 N 210 N 210 N 210 N 210 N 210 N 210 2880
load netBundle @OutputWords_27 18 OutputWords[4][17] OutputWords[4][16] OutputWords[4][15] OutputWords[4][14] OutputWords[4][13] OutputWords[4][12] OutputWords[4][11] OutputWords[4][10] OutputWords[4][9] OutputWords[4][8] OutputWords[4][7] OutputWords[4][6] OutputWords[4][5] OutputWords[4][4] OutputWords[4][3] OutputWords[4][2] OutputWords[4][1] OutputWords[4][0] -autobundled
netbloc @OutputWords_27 1 17 1 NJ
load netBundle @OutputWords_FF_37 8 OutputWords_FF[7]_i__0_n_0 OutputWords_FF[6]_i__0_n_0 OutputWords_FF[5]_i__0_n_0 OutputWords_FF[4]_i__0_n_0 OutputWords_FF[3]_i__0_n_0 OutputWords_FF[2]_i__0_n_0 OutputWords_FF[1]_i__0_n_0 OutputWords_FF[0]_i__0_n_0 -autobundled
netbloc @OutputWords_FF_37 1 1 15 NJ N NJ 470 1100 N NJ 460 1680 N 2040 470 NJ N 2780 480 NJ N 3540 490 NJ N NJ 490 4820 N 5180 480 NJ
load netBundle @InputWords_57 18 InputWords[6][17] InputWords[6][16] InputWords[6][15] InputWords[6][14] InputWords[6][13] InputWords[6][12] InputWords[6][11] InputWords[6][10] InputWords[6][9] InputWords[6][8] InputWords[6][7] InputWords[6][6] InputWords[6][5] InputWords[6][4] InputWords[6][3] InputWords[6][2] InputWords[6][1] InputWords[6][0] -autobundled
netbloc @InputWords_57 1 0 3 NJ 300 420 290 800
load netBundle @OutputWords_1 18 OutputWords[3]_OBUF[17] OutputWords[3]_OBUF[16] OutputWords[3]_OBUF[15] OutputWords[3]_OBUF[14] OutputWords[3]_OBUF[13] OutputWords[3]_OBUF[12] OutputWords[3]_OBUF[11] OutputWords[3]_OBUF[10] OutputWords[3]_OBUF[9] OutputWords[3]_OBUF[8] OutputWords[3]_OBUF[7] OutputWords[3]_OBUF[6] OutputWords[3]_OBUF[5] OutputWords[3]_OBUF[4] OutputWords[3]_OBUF[3] OutputWords[3]_OBUF[2] OutputWords[3]_OBUF[1] OutputWords[3]_OBUF[0] -autobundled
netbloc @OutputWords_1 1 10 7 3620 250 3900 210 N 210 N 210 N 210 N 210 5920
load netBundle @OutputWords_29 18 OutputWords[0][17] OutputWords[0][16] OutputWords[0][15] OutputWords[0][14] OutputWords[0][13] OutputWords[0][12] OutputWords[0][11] OutputWords[0][10] OutputWords[0][9] OutputWords[0][8] OutputWords[0][7] OutputWords[0][6] OutputWords[0][5] OutputWords[0][4] OutputWords[0][3] OutputWords[0][2] OutputWords[0][1] OutputWords[0][0] -autobundled
netbloc @OutputWords_29 1 17 1 NJ
load netBundle @OutputWords_FF_21 18 OutputWords_FF[1][17] OutputWords_FF[1][16] OutputWords_FF[1][15] OutputWords_FF[1][14] OutputWords_FF[1][13] OutputWords_FF[1][12] OutputWords_FF[1][11] OutputWords_FF[1][10] OutputWords_FF[1][9] OutputWords_FF[1][8] OutputWords_FF[1][7] OutputWords_FF[1][6] OutputWords_FF[1][5] OutputWords_FF[1][4] OutputWords_FF[1][3] OutputWords_FF[1][2] OutputWords_FF[1][1] OutputWords_FF[1][0] -autobundled
netbloc @OutputWords_FF_21 1 13 1 4780
load netBundle @OutputWords_35 18 OutputWords[5]_OBUF[17] OutputWords[5]_OBUF[16] OutputWords[5]_OBUF[15] OutputWords[5]_OBUF[14] OutputWords[5]_OBUF[13] OutputWords[5]_OBUF[12] OutputWords[5]_OBUF[11] OutputWords[5]_OBUF[10] OutputWords[5]_OBUF[9] OutputWords[5]_OBUF[8] OutputWords[5]_OBUF[7] OutputWords[5]_OBUF[6] OutputWords[5]_OBUF[5] OutputWords[5]_OBUF[4] OutputWords[5]_OBUF[3] OutputWords[5]_OBUF[2] OutputWords[5]_OBUF[1] OutputWords[5]_OBUF[0] -autobundled
netbloc @OutputWords_35 1 6 11 2100 410 2380 400 2860 410 3140 400 3640 410 3920 400 4440 410 4720 380 N 380 N 380 5900
load netBundle @InputWords 18 InputWords[5][17] InputWords[5][16] InputWords[5][15] InputWords[5][14] InputWords[5][13] InputWords[5][12] InputWords[5][11] InputWords[5][10] InputWords[5][9] InputWords[5][8] InputWords[5][7] InputWords[5][6] InputWords[5][5] InputWords[5][4] InputWords[5][3] InputWords[5][2] InputWords[5][1] InputWords[5][0] -autobundled
netbloc @InputWords 1 0 5 NJ 320 NJ 310 NJ 310 NJ 310 NJ
load netBundle @InputWords_13 18 InputWords[2][17] InputWords[2][16] InputWords[2][15] InputWords[2][14] InputWords[2][13] InputWords[2][12] InputWords[2][11] InputWords[2][10] InputWords[2][9] InputWords[2][8] InputWords[2][7] InputWords[2][6] InputWords[2][5] InputWords[2][4] InputWords[2][3] InputWords[2][2] InputWords[2][1] InputWords[2][0] -autobundled
netbloc @InputWords_13 1 0 11 NJ 240 340 230 N 230 N 230 N 230 N 230 N 230 N 230 N 230 N 230 3580
load netBundle @InputWords_41 18 InputWords[1][17] InputWords[1][16] InputWords[1][15] InputWords[1][14] InputWords[1][13] InputWords[1][12] InputWords[1][11] InputWords[1][10] InputWords[1][9] InputWords[1][8] InputWords[1][7] InputWords[1][6] InputWords[1][5] InputWords[1][4] InputWords[1][3] InputWords[1][2] InputWords[1][1] InputWords[1][0] -autobundled
netbloc @InputWords_41 1 0 13 NJ 260 360 250 N 250 N 250 N 250 N 250 N 250 N 250 N 250 N 250 3600 230 N 230 4460
load netBundle @OutputWords_FF_53 18 OutputWords_FF[6][17] OutputWords_FF[6][16] OutputWords_FF[6][15] OutputWords_FF[6][14] OutputWords_FF[6][13] OutputWords_FF[6][12] OutputWords_FF[6][11] OutputWords_FF[6][10] OutputWords_FF[6][9] OutputWords_FF[6][8] OutputWords_FF[6][7] OutputWords_FF[6][6] OutputWords_FF[6][5] OutputWords_FF[6][4] OutputWords_FF[6][3] OutputWords_FF[6][2] OutputWords_FF[6][1] OutputWords_FF[6][0] -autobundled
netbloc @OutputWords_FF_53 1 3 1 1040
load netBundle @OutputWords_FF_1 18 OutputWords_FF[7][17] OutputWords_FF[7][16] OutputWords_FF[7][15] OutputWords_FF[7][14] OutputWords_FF[7][13] OutputWords_FF[7][12] OutputWords_FF[7][11] OutputWords_FF[7][10] OutputWords_FF[7][9] OutputWords_FF[7][8] OutputWords_FF[7][7] OutputWords_FF[7][6] OutputWords_FF[7][5] OutputWords_FF[7][4] OutputWords_FF[7][3] OutputWords_FF[7][2] OutputWords_FF[7][1] OutputWords_FF[7][0] -autobundled
netbloc @OutputWords_FF_1 1 1 1 380
load netBundle @OutputWords_FF_23 18 OutputWords_FF[3][17] OutputWords_FF[3][16] OutputWords_FF[3][15] OutputWords_FF[3][14] OutputWords_FF[3][13] OutputWords_FF[3][12] OutputWords_FF[3][11] OutputWords_FF[3][10] OutputWords_FF[3][9] OutputWords_FF[3][8] OutputWords_FF[3][7] OutputWords_FF[3][6] OutputWords_FF[3][5] OutputWords_FF[3][4] OutputWords_FF[3][3] OutputWords_FF[3][2] OutputWords_FF[3][1] OutputWords_FF[3][0] -autobundled
netbloc @OutputWords_FF_23 1 9 1 3180
load netBundle @OutputWords_43 18 OutputWords[7]_OBUF[17] OutputWords[7]_OBUF[16] OutputWords[7]_OBUF[15] OutputWords[7]_OBUF[14] OutputWords[7]_OBUF[13] OutputWords[7]_OBUF[12] OutputWords[7]_OBUF[11] OutputWords[7]_OBUF[10] OutputWords[7]_OBUF[9] OutputWords[7]_OBUF[8] OutputWords[7]_OBUF[7] OutputWords[7]_OBUF[6] OutputWords[7]_OBUF[5] OutputWords[7]_OBUF[4] OutputWords[7]_OBUF[3] OutputWords[7]_OBUF[2] OutputWords[7]_OBUF[1] OutputWords[7]_OBUF[0] -autobundled
netbloc @OutputWords_43 1 2 15 780 450 NJ 440 NJ 440 NJ 440 NJ 450 2440 440 2800 450 3200 440 3580 450 3980 440 4380 450 4740 400 N 400 N 400 5820
load netBundle @InputWords_1 18 InputWords[7][17] InputWords[7][16] InputWords[7][15] InputWords[7][14] InputWords[7][13] InputWords[7][12] InputWords[7][11] InputWords[7][10] InputWords[7][9] InputWords[7][8] InputWords[7][7] InputWords[7][6] InputWords[7][5] InputWords[7][4] InputWords[7][3] InputWords[7][2] InputWords[7][1] InputWords[7][0] -autobundled
netbloc @InputWords_1 1 0 1 NJ
load netBundle @OutputWords_FF_3 18 OutputWords_FF[0][17] OutputWords_FF[0][16] OutputWords_FF[0][15] OutputWords_FF[0][14] OutputWords_FF[0][13] OutputWords_FF[0][12] OutputWords_FF[0][11] OutputWords_FF[0][10] OutputWords_FF[0][9] OutputWords_FF[0][8] OutputWords_FF[0][7] OutputWords_FF[0][6] OutputWords_FF[0][5] OutputWords_FF[0][4] OutputWords_FF[0][3] OutputWords_FF[0][2] OutputWords_FF[0][1] OutputWords_FF[0][0] -autobundled
netbloc @OutputWords_FF_3 1 15 1 5460
load netBundle @OutputWords_15 18 OutputWords[2]_OBUF[17] OutputWords[2]_OBUF[16] OutputWords[2]_OBUF[15] OutputWords[2]_OBUF[14] OutputWords[2]_OBUF[13] OutputWords[2]_OBUF[12] OutputWords[2]_OBUF[11] OutputWords[2]_OBUF[10] OutputWords[2]_OBUF[9] OutputWords[2]_OBUF[8] OutputWords[2]_OBUF[7] OutputWords[2]_OBUF[6] OutputWords[2]_OBUF[5] OutputWords[2]_OBUF[4] OutputWords[2]_OBUF[3] OutputWords[2]_OBUF[2] OutputWords[2]_OBUF[1] OutputWords[2]_OBUF[0] -autobundled
netbloc @OutputWords_15 1 12 5 4420 270 4700 230 N 230 N 230 5860
load netBundle @OutputWords_39 18 OutputWords[7][17] OutputWords[7][16] OutputWords[7][15] OutputWords[7][14] OutputWords[7][13] OutputWords[7][12] OutputWords[7][11] OutputWords[7][10] OutputWords[7][9] OutputWords[7][8] OutputWords[7][7] OutputWords[7][6] OutputWords[7][5] OutputWords[7][4] OutputWords[7][3] OutputWords[7][2] OutputWords[7][1] OutputWords[7][0] -autobundled
netbloc @OutputWords_39 1 17 1 NJ
load netBundle @OutputWords_45 18 OutputWords[1]_OBUF[17] OutputWords[1]_OBUF[16] OutputWords[1]_OBUF[15] OutputWords[1]_OBUF[14] OutputWords[1]_OBUF[13] OutputWords[1]_OBUF[12] OutputWords[1]_OBUF[11] OutputWords[1]_OBUF[10] OutputWords[1]_OBUF[9] OutputWords[1]_OBUF[8] OutputWords[1]_OBUF[7] OutputWords[1]_OBUF[6] OutputWords[1]_OBUF[5] OutputWords[1]_OBUF[4] OutputWords[1]_OBUF[3] OutputWords[1]_OBUF[2] OutputWords[1]_OBUF[1] OutputWords[1]_OBUF[0] -autobundled
netbloc @OutputWords_45 1 14 3 5200 440 N 440 5840
load netBundle @OutputWords_FF 18 OutputWords_FF[5][17] OutputWords_FF[5][16] OutputWords_FF[5][15] OutputWords_FF[5][14] OutputWords_FF[5][13] OutputWords_FF[5][12] OutputWords_FF[5][11] OutputWords_FF[5][10] OutputWords_FF[5][9] OutputWords_FF[5][8] OutputWords_FF[5][7] OutputWords_FF[5][6] OutputWords_FF[5][5] OutputWords_FF[5][4] OutputWords_FF[5][3] OutputWords_FF[5][2] OutputWords_FF[5][1] OutputWords_FF[5][0] -autobundled
netbloc @OutputWords_FF 1 5 1 1700
load netBundle @OutputWords_51 18 OutputWords[4]_OBUF[17] OutputWords[4]_OBUF[16] OutputWords[4]_OBUF[15] OutputWords[4]_OBUF[14] OutputWords[4]_OBUF[13] OutputWords[4]_OBUF[12] OutputWords[4]_OBUF[11] OutputWords[4]_OBUF[10] OutputWords[4]_OBUF[9] OutputWords[4]_OBUF[8] OutputWords[4]_OBUF[7] OutputWords[4]_OBUF[6] OutputWords[4]_OBUF[5] OutputWords[4]_OBUF[4] OutputWords[4]_OBUF[3] OutputWords[4]_OBUF[2] OutputWords[4]_OBUF[1] OutputWords[4]_OBUF[0] -autobundled
netbloc @OutputWords_51 1 8 9 2840 500 3220 460 3560 470 4000 460 4360 470 4800 440 5180 460 N 460 5920
load netBundle @OutputWords_FF_10 18 OutputWords_FF[4][17] OutputWords_FF[4][16] OutputWords_FF[4][15] OutputWords_FF[4][14] OutputWords_FF[4][13] OutputWords_FF[4][12] OutputWords_FF[4][11] OutputWords_FF[4][10] OutputWords_FF[4][9] OutputWords_FF[4][8] OutputWords_FF[4][7] OutputWords_FF[4][6] OutputWords_FF[4][5] OutputWords_FF[4][4] OutputWords_FF[4][3] OutputWords_FF[4][2] OutputWords_FF[4][1] OutputWords_FF[4][0] -autobundled
netbloc @OutputWords_FF_10 1 7 1 2420
load netBundle @OutputWords_17 18 OutputWords[0]_OBUF[17] OutputWords[0]_OBUF[16] OutputWords[0]_OBUF[15] OutputWords[0]_OBUF[14] OutputWords[0]_OBUF[13] OutputWords[0]_OBUF[12] OutputWords[0]_OBUF[11] OutputWords[0]_OBUF[10] OutputWords[0]_OBUF[9] OutputWords[0]_OBUF[8] OutputWords[0]_OBUF[7] OutputWords[0]_OBUF[6] OutputWords[0]_OBUF[5] OutputWords[0]_OBUF[4] OutputWords[0]_OBUF[3] OutputWords[0]_OBUF[2] OutputWords[0]_OBUF[1] OutputWords[0]_OBUF[0] -autobundled
netbloc @OutputWords_17 1 16 1 5880
load netBundle @OutputWords_FF_33 18 OutputWords_FF[2][17] OutputWords_FF[2][16] OutputWords_FF[2][15] OutputWords_FF[2][14] OutputWords_FF[2][13] OutputWords_FF[2][12] OutputWords_FF[2][11] OutputWords_FF[2][10] OutputWords_FF[2][9] OutputWords_FF[2][8] OutputWords_FF[2][7] OutputWords_FF[2][6] OutputWords_FF[2][5] OutputWords_FF[2][4] OutputWords_FF[2][3] OutputWords_FF[2][2] OutputWords_FF[2][1] OutputWords_FF[2][0] -autobundled
netbloc @OutputWords_FF_33 1 11 1 3940
load netBundle @OutputWords_47 18 OutputWords[2][17] OutputWords[2][16] OutputWords[2][15] OutputWords[2][14] OutputWords[2][13] OutputWords[2][12] OutputWords[2][11] OutputWords[2][10] OutputWords[2][9] OutputWords[2][8] OutputWords[2][7] OutputWords[2][6] OutputWords[2][5] OutputWords[2][4] OutputWords[2][3] OutputWords[2][2] OutputWords[2][1] OutputWords[2][0] -autobundled
netbloc @OutputWords_47 1 17 1 NJ
load netBundle @InputWords_6 18 InputWords[4][17] InputWords[4][16] InputWords[4][15] InputWords[4][14] InputWords[4][13] InputWords[4][12] InputWords[4][11] InputWords[4][10] InputWords[4][9] InputWords[4][8] InputWords[4][7] InputWords[4][6] InputWords[4][5] InputWords[4][4] InputWords[4][3] InputWords[4][2] InputWords[4][1] InputWords[4][0] -autobundled
netbloc @InputWords_6 1 0 7 NJ 200 300 190 N 190 N 190 N 190 N 190 2120
load netBundle @OutputWords 18 OutputWords[6]_OBUF[17] OutputWords[6]_OBUF[16] OutputWords[6]_OBUF[15] OutputWords[6]_OBUF[14] OutputWords[6]_OBUF[13] OutputWords[6]_OBUF[12] OutputWords[6]_OBUF[11] OutputWords[6]_OBUF[10] OutputWords[6]_OBUF[9] OutputWords[6]_OBUF[8] OutputWords[6]_OBUF[7] OutputWords[6]_OBUF[6] OutputWords[6]_OBUF[5] OutputWords[6]_OBUF[4] OutputWords[6]_OBUF[3] OutputWords[6]_OBUF[2] OutputWords[6]_OBUF[1] OutputWords[6]_OBUF[0] -autobundled
netbloc @OutputWords 1 4 13 1440 420 NJ 420 NJ 430 NJ 420 NJ 430 NJ 420 NJ 430 NJ 420 NJ 430 NJ 420 NJ 420 NJ 420 NJ
load netBundle @OutputWords_19 18 OutputWords[6][17] OutputWords[6][16] OutputWords[6][15] OutputWords[6][14] OutputWords[6][13] OutputWords[6][12] OutputWords[6][11] OutputWords[6][10] OutputWords[6][9] OutputWords[6][8] OutputWords[6][7] OutputWords[6][6] OutputWords[6][5] OutputWords[6][4] OutputWords[6][3] OutputWords[6][2] OutputWords[6][1] OutputWords[6][0] -autobundled
netbloc @OutputWords_19 1 17 1 NJ
load netBundle @OutputWords_25 18 OutputWords[5][17] OutputWords[5][16] OutputWords[5][15] OutputWords[5][14] OutputWords[5][13] OutputWords[5][12] OutputWords[5][11] OutputWords[5][10] OutputWords[5][9] OutputWords[5][8] OutputWords[5][7] OutputWords[5][6] OutputWords[5][5] OutputWords[5][4] OutputWords[5][3] OutputWords[5][2] OutputWords[5][1] OutputWords[5][0] -autobundled
netbloc @OutputWords_25 1 17 1 NJ
load netBundle @PrevUnit_in 18 PrevUnit_in[17] PrevUnit_in[16] PrevUnit_in[15] PrevUnit_in[14] PrevUnit_in[13] PrevUnit_in[12] PrevUnit_in[11] PrevUnit_in[10] PrevUnit_in[9] PrevUnit_in[8] PrevUnit_in[7] PrevUnit_in[6] PrevUnit_in[5] PrevUnit_in[4] PrevUnit_in[3] PrevUnit_in[2] PrevUnit_in[1] PrevUnit_in[0] -autobundled
netbloc @PrevUnit_in 1 0 1 NJ
load netBundle @OutputWords_31 18 OutputWords[3][17] OutputWords[3][16] OutputWords[3][15] OutputWords[3][14] OutputWords[3][13] OutputWords[3][12] OutputWords[3][11] OutputWords[3][10] OutputWords[3][9] OutputWords[3][8] OutputWords[3][7] OutputWords[3][6] OutputWords[3][5] OutputWords[3][4] OutputWords[3][3] OutputWords[3][2] OutputWords[3][1] OutputWords[3][0] -autobundled
netbloc @OutputWords_31 1 17 1 NJ
load netBundle @InputWords_49 18 InputWords[0][17] InputWords[0][16] InputWords[0][15] InputWords[0][14] InputWords[0][13] InputWords[0][12] InputWords[0][11] InputWords[0][10] InputWords[0][9] InputWords[0][8] InputWords[0][7] InputWords[0][6] InputWords[0][5] InputWords[0][4] InputWords[0][3] InputWords[0][2] InputWords[0][1] InputWords[0][0] -autobundled
netbloc @InputWords_49 1 0 15 NJ 280 400 270 N 270 N 270 N 270 N 270 N 270 N 270 N 270 N 270 N 270 3920 250 NJ 250 NJ 250 5220
load netBundle @OutputWords_55 18 OutputWords[1][17] OutputWords[1][16] OutputWords[1][15] OutputWords[1][14] OutputWords[1][13] OutputWords[1][12] OutputWords[1][11] OutputWords[1][10] OutputWords[1][9] OutputWords[1][8] OutputWords[1][7] OutputWords[1][6] OutputWords[1][5] OutputWords[1][4] OutputWords[1][3] OutputWords[1][2] OutputWords[1][1] OutputWords[1][0] -autobundled
netbloc @OutputWords_55 1 17 1 NJ
levelinfo -pg 1 -140 140 490 920 1150 1560 1770 2240 2510 3000 3270 3780 4070 4580 4870 5340 5530 5950 6240 -top -30 -bot 630
show
zoom 0.208262
scrollpos 73 -42
#
# initialize ictrl to current module ShiftUnit work:ShiftUnit:NOFILE
ictrl init topinfo |
ictrl layer glayer install
ictrl layer glayer config ibundle 1
ictrl layer glayer config nbundle 0
ictrl layer glayer config pbundle 0
ictrl layer glayer config cache 1
