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
module new DataBRAM_ConvUnitInterface work:DataBRAM_ConvUnitInterface:NOFILE -nosplit
load symbol RTL_MUX31 work MUX pin S input.bot pinBus I0 input.left [17:0] pinBus I1 input.left [17:0] pinBus O output.right [17:0] fillcolor 1
load symbol OBUF hdi_primitives[17:0] BUF pinBus O output [17:0] pinBus I input [17:0] fillcolor 1 sandwich 3 prop @bundle 18
load symbol RTL_REG_SYNC__BREG_1 work[17:0]sswws GEN pin C input.clk.left pin CE input.left pinBus D input.left [17:0] pinBus Q output.right [17:0] pin RST input.top fillcolor 1 sandwich 3 prop @bundle 18
load symbol RTL_MUX work[7:0]ssws MUX pin I0 input.left pin I1 input.left pinBus O output.right [7:0] pin S input.bot fillcolor 1 sandwich 3 prop @bundle 8
load port clk input -pg 1 -y 2910
load port rst input -pg 1 -y 2490
load portBus BRAMWord[1][7] input [17:0] -attr @name BRAMWord[1][7][17:0] -pg 1 -y 2200
load portBus TowardsConvUnit[2][3] output [17:0] -attr @name TowardsConvUnit[2][3][17:0] -pg 1 -y 1130
load portBus BRAMWord[0][7] input [17:0] -attr @name BRAMWord[0][7][17:0] -pg 1 -y 2180
load portBus BRAMWord[1][0] input [17:0] -attr @name BRAMWord[1][0][17:0] -pg 1 -y 660
load portBus TowardsConvUnit[0][1] output [17:0] -attr @name TowardsConvUnit[0][1][17:0] -pg 1 -y 230
load portBus TowardsConvUnit[0][4] output [17:0] -attr @name TowardsConvUnit[0][4][17:0] -pg 1 -y 1280
load portBus TowardsConvUnit[3][5] output [17:0] -attr @name TowardsConvUnit[3][5][17:0] -pg 1 -y 4130
load portBus BRAMWord[0][4] input [17:0] -attr @name BRAMWord[0][4][17:0] -pg 1 -y 1520
load portBus BRAMWord[1][6] input [17:0] -attr @name BRAMWord[1][6][17:0] -pg 1 -y 1980
load portBus TowardsConvUnit[3][2] output [17:0] -attr @name TowardsConvUnit[3][2][17:0] -pg 1 -y 3230
load portBus BRAMWord[0][1] input [17:0] -attr @name BRAMWord[0][1][17:0] -pg 1 -y 860
load portBus MuxSelect[0] input [0:0] -attr @name MuxSelect[0][0:0] -pg 1 -y 1120
load portBus TowardsConvUnit[0][3] output [17:0] -attr @name TowardsConvUnit[0][3][17:0] -pg 1 -y 980
load portBus TowardsConvUnit[1][2] output [17:0] -attr @name TowardsConvUnit[1][2][17:0] -pg 1 -y 3080
load portBus TowardsConvUnit[1][5] output [17:0] -attr @name TowardsConvUnit[1][5][17:0] -pg 1 -y 3980
load portBus TowardsConvUnit[2][2] output [17:0] -attr @name TowardsConvUnit[2][2][17:0] -pg 1 -y 830
load portBus TowardsConvUnit[2][7] output [17:0] -attr @name TowardsConvUnit[2][7][17:0] -pg 1 -y 2330
load portBus BRAMWord[1][5] input [17:0] -attr @name BRAMWord[1][5][17:0] -pg 1 -y 1760
load portBus TowardsConvUnit[0][2] output [17:0] -attr @name TowardsConvUnit[0][2][17:0] -pg 1 -y 680
load portBus TowardsConvUnit[1][1] output [17:0] -attr @name TowardsConvUnit[1][1][17:0] -pg 1 -y 2630
load portBus TowardsConvUnit[2][0] output [17:0] -attr @name TowardsConvUnit[2][0][17:0] -pg 1 -y 380
load portBus TowardsConvUnit[2][1] output [17:0] -attr @name TowardsConvUnit[2][1][17:0] -pg 1 -y 530
load portBus TowardsConvUnit[3][6] output [17:0] -attr @name TowardsConvUnit[3][6][17:0] -pg 1 -y 4280
load portBus BRAMWord[0][5] input [17:0] -attr @name BRAMWord[0][5][17:0] -pg 1 -y 1740
load portBus BRAMWord[1][4] input [17:0] -attr @name BRAMWord[1][4][17:0] -pg 1 -y 1540
load portBus TowardsConvUnit[0][7] output [17:0] -attr @name TowardsConvUnit[0][7][17:0] -pg 1 -y 2180
load portBus TowardsConvUnit[1][6] output [17:0] -attr @name TowardsConvUnit[1][6][17:0] -pg 1 -y 4580
load portBus TowardsConvUnit[2][6] output [17:0] -attr @name TowardsConvUnit[2][6][17:0] -pg 1 -y 2030
load portBus TowardsConvUnit[3][3] output [17:0] -attr @name TowardsConvUnit[3][3][17:0] -pg 1 -y 3530
load portBus BRAMWord[0][2] input [17:0] -attr @name BRAMWord[0][2][17:0] -pg 1 -y 1080
load portBus TowardsConvUnit[1][0] output [17:0] -attr @name TowardsConvUnit[1][0][17:0] -pg 1 -y 2480
load portBus TowardsConvUnit[1][3] output [17:0] -attr @name TowardsConvUnit[1][3][17:0] -pg 1 -y 3380
load portBus TowardsConvUnit[3][0] output [17:0] -attr @name TowardsConvUnit[3][0][17:0] -pg 1 -y 2780
load portBus BRAMWord[1][3] input [17:0] -attr @name BRAMWord[1][3][17:0] -pg 1 -y 1320
load portBus LoadEnable input [0:3] -attr @name LoadEnable[0:3] -pg 1 -y 2930
load portBus MuxSelect[1] input [0:0] -attr @name MuxSelect[1][0:0] -pg 1 -y 1340
load portBus TowardsConvUnit[2][5] output [17:0] -attr @name TowardsConvUnit[2][5][17:0] -pg 1 -y 1730
load portBus TowardsConvUnit[0][0] output [17:0] -attr @name TowardsConvUnit[0][0][17:0] -pg 1 -y 80
load portBus TowardsConvUnit[3][7] output [17:0] -attr @name TowardsConvUnit[3][7][17:0] -pg 1 -y 4430
load portBus BRAMWord[0][6] input [17:0] -attr @name BRAMWord[0][6][17:0] -pg 1 -y 1960
load portBus BRAMWord[1][2] input [17:0] -attr @name BRAMWord[1][2][17:0] -pg 1 -y 1100
load portBus TowardsConvUnit[0][6] output [17:0] -attr @name TowardsConvUnit[0][6][17:0] -pg 1 -y 1880
load portBus TowardsConvUnit[1][7] output [17:0] -attr @name TowardsConvUnit[1][7][17:0] -pg 1 -y 4730
load portBus TowardsConvUnit[3][4] output [17:0] -attr @name TowardsConvUnit[3][4][17:0] -pg 1 -y 3830
load portBus BRAMWord[0][3] input [17:0] -attr @name BRAMWord[0][3][17:0] -pg 1 -y 1300
load portBus TowardsConvUnit[2][4] output [17:0] -attr @name TowardsConvUnit[2][4][17:0] -pg 1 -y 1430
load portBus TowardsConvUnit[3][1] output [17:0] -attr @name TowardsConvUnit[3][1][17:0] -pg 1 -y 2930
load portBus BRAMWord[0][0] input [17:0] -attr @name BRAMWord[0][0][17:0] -pg 1 -y 640
load portBus BRAMWord[1][1] input [17:0] -attr @name BRAMWord[1][1][17:0] -pg 1 -y 880
load portBus TowardsConvUnit[0][5] output [17:0] -attr @name TowardsConvUnit[0][5][17:0] -pg 1 -y 1580
load portBus TowardsConvUnit[1][4] output [17:0] -attr @name TowardsConvUnit[1][4][17:0] -pg 1 -y 3680
load inst TowardsConvUnit_FF_reg[1][7][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 4730
load inst TowardsConvUnit_FF_reg[1][1][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 2630
load inst BRAMWord[0][4]_i RTL_MUX31 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[17:0] -pinBusAttr I0 @attr S=1'b0 -pinBusAttr I1 @name I1[17:0] -pinBusAttr I1 @attr S=1'b1 -pinBusAttr O @name O[17:0] -pg 1 -lvl 1 -y 1440
load inst TowardsConvUnit_FF_reg[1][4][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 3680
load inst TowardsConvUnit_FF_reg[1][3][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 3380
load inst TowardsConvUnit_FF_reg[0][2][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 680
load inst TowardsConvUnit[2][5][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 1730
load inst TowardsConvUnit[2][1][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 530
load inst TowardsConvUnit_FF[1][7:0]_i RTL_MUX work[7:0]ssws -attr @cell(#000000) RTL_MUX -pinAttr I0 @attr S=1'b0 -pinAttr I1 @attr S=default -pg 1 -lvl 1 -y 2550
load inst TowardsConvUnit_FF_reg[3][3][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 3530
load inst TowardsConvUnit_FF_reg[0][4][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 1280
load inst TowardsConvUnit[3][3][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 3530
load inst TowardsConvUnit[1][5][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 3980
load inst TowardsConvUnit[3][7][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 4430
load inst TowardsConvUnit[0][6][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 1880
load inst TowardsConvUnit_FF_reg[0][3][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 980
load inst TowardsConvUnit[3][0][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 2780
load inst TowardsConvUnit_FF_reg[0][7][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 2180
load inst TowardsConvUnit_FF_reg[2][2][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 830
load inst TowardsConvUnit_FF[3][7:0]_i RTL_MUX work[7:0]ssws -attr @cell(#000000) RTL_MUX -pinAttr I0 @attr S=1'b0 -pinAttr I1 @attr S=default -pg 1 -lvl 1 -y 2810
load inst BRAMWord[0][7]_i RTL_MUX31 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[17:0] -pinBusAttr I0 @attr S=1'b0 -pinBusAttr I1 @name I1[17:0] -pinBusAttr I1 @attr S=1'b1 -pinBusAttr O @name O[17:0] -pg 1 -lvl 1 -y 2160
load inst TowardsConvUnit_FF_reg[2][7][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 2330
load inst TowardsConvUnit[2][6][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 2030
load inst TowardsConvUnit_FF[0][7:0]_i RTL_MUX work[7:0]ssws -attr @cell(#000000) RTL_MUX -pinAttr I0 @attr S=1'b0 -pinAttr I1 @attr S=default -pg 1 -lvl 1 -y 2420
load inst TowardsConvUnit[0][7][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 2180
load inst BRAMWord[0][5]_i__0 RTL_MUX31 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[17:0] -pinBusAttr I0 @attr S=1'b0 -pinBusAttr I1 @name I1[17:0] -pinBusAttr I1 @attr S=1'b1 -pinBusAttr O @name O[17:0] -pg 1 -lvl 1 -y 1800
load inst TowardsConvUnit_FF_reg[1][5][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 3980
load inst BRAMWord[0][0]_i RTL_MUX31 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[17:0] -pinBusAttr I0 @attr S=1'b0 -pinBusAttr I1 @name I1[17:0] -pinBusAttr I1 @attr S=1'b1 -pinBusAttr O @name O[17:0] -pg 1 -lvl 1 -y 480
load inst TowardsConvUnit_FF_reg[3][4][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 3830
load inst TowardsConvUnit_FF_reg[3][7][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 4430
load inst TowardsConvUnit[3][6][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 4280
load inst TowardsConvUnit_FF_reg[3][1][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 2930
load inst TowardsConvUnit[0][1][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 230
load inst BRAMWord[0][6]_i__0 RTL_MUX31 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[17:0] -pinBusAttr I0 @attr S=1'b0 -pinBusAttr I1 @name I1[17:0] -pinBusAttr I1 @attr S=1'b1 -pinBusAttr O @name O[17:0] -pg 1 -lvl 1 -y 1920
load inst TowardsConvUnit_FF_reg[2][4][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 1430
load inst BRAMWord[0][3]_i__0 RTL_MUX31 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[17:0] -pinBusAttr I0 @attr S=1'b0 -pinBusAttr I1 @name I1[17:0] -pinBusAttr I1 @attr S=1'b1 -pinBusAttr O @name O[17:0] -pg 1 -lvl 1 -y 1320
load inst TowardsConvUnit[3][5][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 4130
load inst TowardsConvUnit_FF_reg[1][2][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 3080
load inst TowardsConvUnit_FF_reg[2][3][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 1130
load inst TowardsConvUnit[2][2][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 830
load inst TowardsConvUnit[1][4][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 3680
load inst TowardsConvUnit_FF_reg[2][6][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 2030
load inst TowardsConvUnit[2][7][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 2330
load inst TowardsConvUnit[0][2][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 680
load inst TowardsConvUnit_FF_reg[1][6][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 4580
load inst TowardsConvUnit_FF_reg[2][0][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 380
load inst TowardsConvUnit[1][3][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 3380
load inst TowardsConvUnit[1][1][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 2630
load inst TowardsConvUnit[0][4][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 1280
load inst TowardsConvUnit_FF_reg[0][0][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 80
load inst TowardsConvUnit[3][2][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 3230
load inst TowardsConvUnit[1][7][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 4730
load inst TowardsConvUnit[0][3][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 980
load inst TowardsConvUnit_FF_reg[0][1][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 230
load inst TowardsConvUnit[1][6][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 4580
load inst TowardsConvUnit_FF_reg[2][5][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 1730
load inst TowardsConvUnit_FF_reg[0][5][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 1580
load inst BRAMWord[0][4]_i__0 RTL_MUX31 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[17:0] -pinBusAttr I0 @attr S=1'b0 -pinBusAttr I1 @name I1[17:0] -pinBusAttr I1 @attr S=1'b1 -pinBusAttr O @name O[17:0] -pg 1 -lvl 1 -y 1560
load inst TowardsConvUnit[3][1][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 2930
load inst TowardsConvUnit_FF_reg[1][0][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 2480
load inst BRAMWord[0][1]_i__0 RTL_MUX31 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[17:0] -pinBusAttr I0 @attr S=1'b0 -pinBusAttr I1 @name I1[17:0] -pinBusAttr I1 @attr S=1'b1 -pinBusAttr O @name O[17:0] -pg 1 -lvl 1 -y 840
load inst TowardsConvUnit_FF_reg[3][0][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 2780
load inst BRAMWord[0][5]_i RTL_MUX31 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[17:0] -pinBusAttr I0 @attr S=1'b0 -pinBusAttr I1 @name I1[17:0] -pinBusAttr I1 @attr S=1'b1 -pinBusAttr O @name O[17:0] -pg 1 -lvl 1 -y 1680
load inst TowardsConvUnit[0][0][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 80
load inst TowardsConvUnit_FF_reg[3][5][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 4130
load inst TowardsConvUnit_FF_reg[3][6][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 4280
load inst TowardsConvUnit[2][3][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 1130
load inst TowardsConvUnit_FF_reg[3][2][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 3230
load inst TowardsConvUnit[0][5][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 1580
load inst TowardsConvUnit[2][0][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 380
load inst TowardsConvUnit[1][0][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 2480
load inst TowardsConvUnit_FF[2][7:0]_i RTL_MUX work[7:0]ssws -attr @cell(#000000) RTL_MUX -pinAttr I0 @attr S=1'b0 -pinAttr I1 @attr S=default -pg 1 -lvl 1 -y 2680
load inst TowardsConvUnit[2][4][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 1430
load inst TowardsConvUnit[1][2][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 3080
load inst BRAMWord[0][2]_i__0 RTL_MUX31 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[17:0] -pinBusAttr I0 @attr S=1'b0 -pinBusAttr I1 @name I1[17:0] -pinBusAttr I1 @attr S=1'b1 -pinBusAttr O @name O[17:0] -pg 1 -lvl 1 -y 960
load inst BRAMWord[0][2]_i RTL_MUX31 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[17:0] -pinBusAttr I0 @attr S=1'b0 -pinBusAttr I1 @name I1[17:0] -pinBusAttr I1 @attr S=1'b1 -pinBusAttr O @name O[17:0] -pg 1 -lvl 1 -y 1080
load inst BRAMWord[0][6]_i RTL_MUX31 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[17:0] -pinBusAttr I0 @attr S=1'b0 -pinBusAttr I1 @name I1[17:0] -pinBusAttr I1 @attr S=1'b1 -pinBusAttr O @name O[17:0] -pg 1 -lvl 1 -y 2040
load inst BRAMWord[0][3]_i RTL_MUX31 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[17:0] -pinBusAttr I0 @attr S=1'b0 -pinBusAttr I1 @name I1[17:0] -pinBusAttr I1 @attr S=1'b1 -pinBusAttr O @name O[17:0] -pg 1 -lvl 1 -y 1200
load inst TowardsConvUnit[3][4][17:0]_OBUF_inst OBUF hdi_primitives[17:0] -attr @cell(#000000) OBUF -pg 1 -lvl 3 -y 3830
load inst TowardsConvUnit_FF_reg[2][1][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 530
load inst BRAMWord[0][0]_i__0 RTL_MUX31 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[17:0] -pinBusAttr I0 @attr S=1'b0 -pinBusAttr I1 @name I1[17:0] -pinBusAttr I1 @attr S=1'b1 -pinBusAttr O @name O[17:0] -pg 1 -lvl 1 -y 600
load inst BRAMWord[0][1]_i RTL_MUX31 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[17:0] -pinBusAttr I0 @attr S=1'b0 -pinBusAttr I1 @name I1[17:0] -pinBusAttr I1 @attr S=1'b1 -pinBusAttr O @name O[17:0] -pg 1 -lvl 1 -y 720
load inst TowardsConvUnit_FF_reg[0][6][17:0] RTL_REG_SYNC__BREG_1 work[17:0]sswws -attr @cell(#000000) RTL_REG_SYNC -pg 1 -lvl 2 -y 1880
load inst BRAMWord[0][7]_i__0 RTL_MUX31 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[17:0] -pinBusAttr I0 @attr S=1'b0 -pinBusAttr I1 @name I1[17:0] -pinBusAttr I1 @attr S=1'b1 -pinBusAttr O @name O[17:0] -pg 1 -lvl 1 -y 2280
load net TowardsConvUnit[0][5]_OBUF[3] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[0][5][17:0] Q[3]
load net TowardsConvUnit[1][0][15] -attr @rip 15 -port TowardsConvUnit[1][0][15] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst O[15]
load net BRAMWord[0][2][5] -attr @rip BRAMWord[0][2][5] -port BRAMWord[0][2][5] -pin BRAMWord[0][2]_i I0[5] -pin BRAMWord[0][2]_i__0 I0[5]
load net BRAMWord[0][2]0_out[16] -attr @rip O[16] -pin BRAMWord[0][2]_i O[16] -pin TowardsConvUnit_FF_reg[0][2][17:0] D[16] -pin TowardsConvUnit_FF_reg[2][2][17:0] D[16]
load net TowardsConvUnit[1][5][14] -attr @rip 14 -port TowardsConvUnit[1][5][14] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst O[14]
load net BRAMWord[1][2][0] -attr @rip BRAMWord[1][2][0] -pin BRAMWord[0][2]_i I1[0] -pin BRAMWord[0][2]_i__0 I1[0] -port BRAMWord[1][2][0]
load net TowardsConvUnit[1][1][0] -attr @rip 0 -port TowardsConvUnit[1][1][0] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst O[0]
load net BRAMWord[0][2]0_out[6] -attr @rip O[6] -pin BRAMWord[0][2]_i O[6] -pin TowardsConvUnit_FF_reg[0][2][17:0] D[6] -pin TowardsConvUnit_FF_reg[2][2][17:0] D[6]
load net TowardsConvUnit[1][4][3] -attr @rip 3 -port TowardsConvUnit[1][4][3] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst O[3]
load net TowardsConvUnit[2][2][8] -attr @rip 8 -port TowardsConvUnit[2][2][8] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst O[8]
load net TowardsConvUnit[2][7]_OBUF[12] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[2][7][17:0] Q[12]
load net TowardsConvUnit[3][3][6] -attr @rip 6 -port TowardsConvUnit[3][3][6] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst O[6]
load net TowardsConvUnit[0][4]_OBUF[16] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[0][4][17:0] Q[16]
load net TowardsConvUnit[3][6]_OBUF[15] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[3][6][17:0] Q[15]
load net BRAMWord[0][4]_i__0_n_10 -attr @rip O[7] -pin BRAMWord[0][4]_i__0 O[7] -pin TowardsConvUnit_FF_reg[1][4][17:0] D[7] -pin TowardsConvUnit_FF_reg[3][4][17:0] D[7]
load net BRAMWord[0][3][15] -attr @rip BRAMWord[0][3][15] -port BRAMWord[0][3][15] -pin BRAMWord[0][3]_i I0[15] -pin BRAMWord[0][3]_i__0 I0[15]
load net TowardsConvUnit[2][0][2] -attr @rip 2 -port TowardsConvUnit[2][0][2] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst O[2]
load net TowardsConvUnit[3][6][2] -attr @rip 2 -port TowardsConvUnit[3][6][2] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst O[2]
load net BRAMWord[0][7][13] -attr @rip BRAMWord[0][7][13] -port BRAMWord[0][7][13] -pin BRAMWord[0][7]_i I0[13] -pin BRAMWord[0][7]_i__0 I0[13]
load net BRAMWord[0][4]_i__0_n_11 -attr @rip O[6] -pin BRAMWord[0][4]_i__0 O[6] -pin TowardsConvUnit_FF_reg[1][4][17:0] D[6] -pin TowardsConvUnit_FF_reg[3][4][17:0] D[6]
load net BRAMWord[0][0][16] -attr @rip BRAMWord[0][0][16] -port BRAMWord[0][0][16] -pin BRAMWord[0][0]_i I0[16] -pin BRAMWord[0][0]_i__0 I0[16]
load net TowardsConvUnit[2][3]_OBUF[1] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[2][3][17:0] Q[1]
load net TowardsConvUnit[2][6][12] -attr @rip 12 -port TowardsConvUnit[2][6][12] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst O[12]
load net BRAMWord[0][4]_i__0_n_12 -attr @rip O[5] -pin BRAMWord[0][4]_i__0 O[5] -pin TowardsConvUnit_FF_reg[1][4][17:0] D[5] -pin TowardsConvUnit_FF_reg[3][4][17:0] D[5]
load net BRAMWord[0][4]_i__0_n_13 -attr @rip O[4] -pin BRAMWord[0][4]_i__0 O[4] -pin TowardsConvUnit_FF_reg[1][4][17:0] D[4] -pin TowardsConvUnit_FF_reg[3][4][17:0] D[4]
load net BRAMWord[0][5]0_out[0] -attr @rip O[0] -pin BRAMWord[0][5]_i O[0] -pin TowardsConvUnit_FF_reg[0][5][17:0] D[0] -pin TowardsConvUnit_FF_reg[2][5][17:0] D[0]
load net TowardsConvUnit[0][1][16] -attr @rip 16 -port TowardsConvUnit[0][1][16] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst O[16]
load net TowardsConvUnit[1][3]_OBUF[12] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[1][3][17:0] Q[12]
load net BRAMWord[0][4]_i__0_n_14 -attr @rip O[3] -pin BRAMWord[0][4]_i__0 O[3] -pin TowardsConvUnit_FF_reg[1][4][17:0] D[3] -pin TowardsConvUnit_FF_reg[3][4][17:0] D[3]
load net BRAMWord[0][3]0_out[16] -attr @rip O[16] -pin BRAMWord[0][3]_i O[16] -pin TowardsConvUnit_FF_reg[0][3][17:0] D[16] -pin TowardsConvUnit_FF_reg[2][3][17:0] D[16]
load net TowardsConvUnit[3][0][14] -attr @rip 14 -port TowardsConvUnit[3][0][14] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst O[14]
load net BRAMWord[0][4]_i__0_n_15 -attr @rip O[2] -pin BRAMWord[0][4]_i__0 O[2] -pin TowardsConvUnit_FF_reg[1][4][17:0] D[2] -pin TowardsConvUnit_FF_reg[3][4][17:0] D[2]
load net BRAMWord[0][7]0_out[8] -attr @rip O[8] -pin BRAMWord[0][7]_i O[8] -pin TowardsConvUnit_FF_reg[0][7][17:0] D[8] -pin TowardsConvUnit_FF_reg[2][7][17:0] D[8]
load net BRAMWord[0][4]_i__0_n_16 -attr @rip O[1] -pin BRAMWord[0][4]_i__0 O[1] -pin TowardsConvUnit_FF_reg[1][4][17:0] D[1] -pin TowardsConvUnit_FF_reg[3][4][17:0] D[1]
load net TowardsConvUnit[0][5]_OBUF[13] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[0][5][17:0] Q[13]
load net TowardsConvUnit[2][4][9] -attr @rip 9 -port TowardsConvUnit[2][4][9] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst O[9]
load net BRAMWord[0][4]_i__0_n_17 -attr @rip O[0] -pin BRAMWord[0][4]_i__0 O[0] -pin TowardsConvUnit_FF_reg[1][4][17:0] D[0] -pin TowardsConvUnit_FF_reg[3][4][17:0] D[0]
load net TowardsConvUnit[0][7]_OBUF[15] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[0][7][17:0] Q[15]
load net BRAMWord[0][2]0_out[15] -attr @rip O[15] -pin BRAMWord[0][2]_i O[15] -pin TowardsConvUnit_FF_reg[0][2][17:0] D[15] -pin TowardsConvUnit_FF_reg[2][2][17:0] D[15]
load net TowardsConvUnit[0][5]_OBUF[4] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[0][5][17:0] Q[4]
load net TowardsConvUnit[0][4]_OBUF[8] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[0][4][17:0] Q[8]
load net TowardsConvUnit[0][4]_OBUF[13] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[0][4][17:0] Q[13]
load net TowardsConvUnit[1][4][2] -attr @rip 2 -port TowardsConvUnit[1][4][2] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst O[2]
load net TowardsConvUnit[1][5][15] -attr @rip 15 -port TowardsConvUnit[1][5][15] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst O[15]
load net TowardsConvUnit[3][6]_OBUF[12] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[3][6][17:0] Q[12]
load net BRAMWord[0][2][8] -attr @rip BRAMWord[0][2][8] -port BRAMWord[0][2][8] -pin BRAMWord[0][2]_i I0[8] -pin BRAMWord[0][2]_i__0 I0[8]
load net BRAMWord[1][2][1] -attr @rip BRAMWord[1][2][1] -pin BRAMWord[0][2]_i I1[1] -pin BRAMWord[0][2]_i__0 I1[1] -port BRAMWord[1][2][1]
load net TowardsConvUnit[3][3][5] -attr @rip 5 -port TowardsConvUnit[3][3][5] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst O[5]
load net BRAMWord[1][7][7] -attr @rip BRAMWord[1][7][7] -pin BRAMWord[0][7]_i I1[7] -pin BRAMWord[0][7]_i__0 I1[7] -port BRAMWord[1][7][7]
load net TowardsConvUnit[2][2][9] -attr @rip 9 -port TowardsConvUnit[2][2][9] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst O[9]
load net BRAMWord[1][5][5] -attr @rip BRAMWord[1][5][5] -pin BRAMWord[0][5]_i I1[5] -pin BRAMWord[0][5]_i__0 I1[5] -port BRAMWord[1][5][5]
load net TowardsConvUnit[2][0][1] -attr @rip 1 -port TowardsConvUnit[2][0][1] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst O[1]
load net TowardsConvUnit[0][1][13] -attr @rip 13 -port TowardsConvUnit[0][1][13] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst O[13]
load net BRAMWord[0][3][16] -attr @rip BRAMWord[0][3][16] -port BRAMWord[0][3][16] -pin BRAMWord[0][3]_i I0[16] -pin BRAMWord[0][3]_i__0 I0[16]
load net TowardsConvUnit[3][6][3] -attr @rip 3 -port TowardsConvUnit[3][6][3] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst O[3]
load net BRAMWord[0][7][14] -attr @rip BRAMWord[0][7][14] -port BRAMWord[0][7][14] -pin BRAMWord[0][7]_i I0[14] -pin BRAMWord[0][7]_i__0 I0[14]
load net BRAMWord[0][0][17] -attr @rip BRAMWord[0][0][17] -port BRAMWord[0][0][17] -pin BRAMWord[0][0]_i I0[17] -pin BRAMWord[0][0]_i__0 I0[17]
load net TowardsConvUnit[1][3]_OBUF[11] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[1][3][17:0] Q[11]
load net TowardsConvUnit[2][3]_OBUF[2] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[2][3][17:0] Q[2]
load net TowardsConvUnit[3][0][13] -attr @rip 13 -port TowardsConvUnit[3][0][13] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst O[13]
load net TowardsConvUnit[2][6][15] -attr @rip 15 -port TowardsConvUnit[2][6][15] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst O[15]
load net BRAMWord[0][7]0_out[7] -attr @rip O[7] -pin BRAMWord[0][7]_i O[7] -pin TowardsConvUnit_FF_reg[0][7][17:0] D[7] -pin TowardsConvUnit_FF_reg[2][7][17:0] D[7]
load net TowardsConvUnit[0][5]_OBUF[12] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[0][5][17:0] Q[12]
load net BRAMWord[0][3]0_out[17] -attr @rip O[17] -pin BRAMWord[0][3]_i O[17] -pin TowardsConvUnit_FF_reg[0][3][17:0] D[17] -pin TowardsConvUnit_FF_reg[2][3][17:0] D[17]
load net TowardsConvUnit[3][0][8] -attr @rip 8 -port TowardsConvUnit[3][0][8] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst O[8]
load net TowardsConvUnit[0][7]_OBUF[14] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[0][7][17:0] Q[14]
load net LoadEnable[1] -attr @rip LoadEnable[1] -port LoadEnable[1] -pin TowardsConvUnit_FF_reg[1][0][17:0] CE -pin TowardsConvUnit_FF_reg[1][1][17:0] CE -pin TowardsConvUnit_FF_reg[1][2][17:0] CE -pin TowardsConvUnit_FF_reg[1][3][17:0] CE -pin TowardsConvUnit_FF_reg[1][4][17:0] CE -pin TowardsConvUnit_FF_reg[1][5][17:0] CE -pin TowardsConvUnit_FF_reg[1][6][17:0] CE -pin TowardsConvUnit_FF_reg[1][7][17:0] CE
load net TowardsConvUnit[1][0][17] -attr @rip 17 -port TowardsConvUnit[1][0][17] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst O[17]
load net BRAMWord[0][2][7] -attr @rip BRAMWord[0][2][7] -port BRAMWord[0][2][7] -pin BRAMWord[0][2]_i I0[7] -pin BRAMWord[0][2]_i__0 I0[7]
load net TowardsConvUnit[0][4]_OBUF[14] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[0][4][17:0] Q[14]
load net TowardsConvUnit[0][4]_OBUF[9] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[0][4][17:0] Q[9]
load net TowardsConvUnit[3][6]_OBUF[13] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[3][6][17:0] Q[13]
load net BRAMWord[0][3][13] -attr @rip BRAMWord[0][3][13] -port BRAMWord[0][3][13] -pin BRAMWord[0][3]_i I0[13] -pin BRAMWord[0][3]_i__0 I0[13]
load net BRAMWord[1][2][2] -attr @rip BRAMWord[1][2][2] -pin BRAMWord[0][2]_i I1[2] -pin BRAMWord[0][2]_i__0 I1[2] -port BRAMWord[1][2][2]
load net TowardsConvUnit[2][3][4] -attr @rip 4 -port TowardsConvUnit[2][3][4] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst O[4]
load net BRAMWord[1][7][8] -attr @rip BRAMWord[1][7][8] -pin BRAMWord[0][7]_i I1[8] -pin BRAMWord[0][7]_i__0 I1[8] -port BRAMWord[1][7][8]
load net TowardsConvUnit[0][5]_OBUF[9] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[0][5][17:0] Q[9]
load net TowardsConvUnit[1][4][5] -attr @rip 5 -port TowardsConvUnit[1][4][5] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst O[5]
load net BRAMWord[1][5][6] -attr @rip BRAMWord[1][5][6] -pin BRAMWord[0][5]_i I1[6] -pin BRAMWord[0][5]_i__0 I1[6] -port BRAMWord[1][5][6]
load net TowardsConvUnit[3][3][8] -attr @rip 8 -port TowardsConvUnit[3][3][8] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst O[8]
load net TowardsConvUnit[0][1][14] -attr @rip 14 -port TowardsConvUnit[0][1][14] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst O[14]
load net TowardsConvUnit[1][3]_OBUF[10] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[1][3][17:0] Q[10]
load net BRAMWord[1][0][13] -attr @rip BRAMWord[1][0][13] -pin BRAMWord[0][0]_i I1[13] -pin BRAMWord[0][0]_i__0 I1[13] -port BRAMWord[1][0][13]
load net TowardsConvUnit[1][0]_OBUF[16] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[1][0][17:0] Q[16]
load net BRAMWord[0][3][3] -attr @rip BRAMWord[0][3][3] -port BRAMWord[0][3][3] -pin BRAMWord[0][3]_i I0[3] -pin BRAMWord[0][3]_i__0 I0[3]
load net BRAMWord[0][7][15] -attr @rip BRAMWord[0][7][15] -port BRAMWord[0][7][15] -pin BRAMWord[0][7]_i I0[15] -pin BRAMWord[0][7]_i__0 I0[15]
load net BRAMWord[1][4][0] -attr @rip BRAMWord[1][4][0] -pin BRAMWord[0][4]_i I1[0] -pin BRAMWord[0][4]_i__0 I1[0] -port BRAMWord[1][4][0]
load net TowardsConvUnit[2][6][14] -attr @rip 14 -port TowardsConvUnit[2][6][14] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst O[14]
load net BRAMWord[0][7]0_out[6] -attr @rip O[6] -pin BRAMWord[0][7]_i O[6] -pin TowardsConvUnit_FF_reg[0][7][17:0] D[6] -pin TowardsConvUnit_FF_reg[2][7][17:0] D[6]
load net TowardsConvUnit[0][5]_OBUF[11] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[0][5][17:0] Q[11]
load net TowardsConvUnit[3][1]_OBUF[17] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[3][1][17:0] Q[17]
load net TowardsConvUnit[1][0][12] -attr @rip 12 -port TowardsConvUnit[1][0][12] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst O[12]
load net LoadEnable[0] -attr @rip LoadEnable[0] -port LoadEnable[0] -pin TowardsConvUnit_FF_reg[0][0][17:0] CE -pin TowardsConvUnit_FF_reg[0][1][17:0] CE -pin TowardsConvUnit_FF_reg[0][2][17:0] CE -pin TowardsConvUnit_FF_reg[0][3][17:0] CE -pin TowardsConvUnit_FF_reg[0][4][17:0] CE -pin TowardsConvUnit_FF_reg[0][5][17:0] CE -pin TowardsConvUnit_FF_reg[0][6][17:0] CE -pin TowardsConvUnit_FF_reg[0][7][17:0] CE
load net TowardsConvUnit[2][0][8] -attr @rip 8 -port TowardsConvUnit[2][0][8] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst O[8]
load net TowardsConvUnit[2][2]_OBUF[10] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[2][2][17:0] Q[10]
load net TowardsConvUnit[3][0][9] -attr @rip 9 -port TowardsConvUnit[3][0][9] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst O[9]
load net BRAMWord[0][4][1] -attr @rip BRAMWord[0][4][1] -port BRAMWord[0][4][1] -pin BRAMWord[0][4]_i I0[1] -pin BRAMWord[0][4]_i__0 I0[1]
load net TowardsConvUnit[0][7]_OBUF[17] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[0][7][17:0] Q[17]
load net TowardsConvUnit[0][4]_OBUF[6] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[0][4][17:0] Q[6]
load net TowardsConvUnit[0][1][11] -attr @rip 11 -port TowardsConvUnit[0][1][11] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst O[11]
load net TowardsConvUnit[1][4][4] -attr @rip 4 -port TowardsConvUnit[1][4][4] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst O[4]
load net BRAMWord[0][3][14] -attr @rip BRAMWord[0][3][14] -port BRAMWord[0][3][14] -pin BRAMWord[0][3]_i I0[14] -pin BRAMWord[0][3]_i__0 I0[14]
load net BRAMWord[1][2][17] -attr @rip BRAMWord[1][2][17] -pin BRAMWord[0][2]_i I1[17] -pin BRAMWord[0][2]_i__0 I1[17] -port BRAMWord[1][2][17]
load net BRAMWord[1][2][3] -attr @rip BRAMWord[1][2][3] -pin BRAMWord[0][2]_i I1[3] -pin BRAMWord[0][2]_i__0 I1[3] -port BRAMWord[1][2][3]
load net TowardsConvUnit[2][3][5] -attr @rip 5 -port TowardsConvUnit[2][3][5] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst O[5]
load net TowardsConvUnit[3][3][7] -attr @rip 7 -port TowardsConvUnit[3][3][7] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst O[7]
load net BRAMWord[0][2][13] -attr @rip BRAMWord[0][2][13] -port BRAMWord[0][2][13] -pin BRAMWord[0][2]_i I0[13] -pin BRAMWord[0][2]_i__0 I0[13]
load net BRAMWord[1][5][17] -attr @rip BRAMWord[1][5][17] -pin BRAMWord[0][5]_i I1[17] -pin BRAMWord[0][5]_i__0 I1[17] -port BRAMWord[1][5][17]
load net BRAMWord[1][7][9] -attr @rip BRAMWord[1][7][9] -pin BRAMWord[0][7]_i I1[9] -pin BRAMWord[0][7]_i__0 I1[9] -port BRAMWord[1][7][9]
load net BRAMWord[1][5][7] -attr @rip BRAMWord[1][5][7] -pin BRAMWord[0][5]_i I1[7] -pin BRAMWord[0][5]_i__0 I1[7] -port BRAMWord[1][5][7]
load net BRAMWord[0][3][2] -attr @rip BRAMWord[0][3][2] -port BRAMWord[0][3][2] -pin BRAMWord[0][3]_i I0[2] -pin BRAMWord[0][3]_i__0 I0[2]
load net TowardsConvUnit[0][5]_OBUF[10] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[0][5][17:0] Q[10]
load net BRAMWord[1][0][14] -attr @rip BRAMWord[1][0][14] -pin BRAMWord[0][0]_i I1[14] -pin BRAMWord[0][0]_i__0 I1[14] -port BRAMWord[1][0][14]
load net BRAMWord[0][7]0_out[5] -attr @rip O[5] -pin BRAMWord[0][7]_i O[5] -pin TowardsConvUnit_FF_reg[0][7][17:0] D[5] -pin TowardsConvUnit_FF_reg[2][7][17:0] D[5]
load net TowardsConvUnit[1][0]_OBUF[17] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[1][0][17:0] Q[17]
load net BRAMWord[0][7][16] -attr @rip BRAMWord[0][7][16] -port BRAMWord[0][7][16] -pin BRAMWord[0][7]_i I0[16] -pin BRAMWord[0][7]_i__0 I0[16]
load net BRAMWord[1][4][1] -attr @rip BRAMWord[1][4][1] -pin BRAMWord[0][4]_i I1[1] -pin BRAMWord[0][4]_i__0 I1[1] -port BRAMWord[1][4][1]
load net TowardsConvUnit[1][0][11] -attr @rip 11 -port TowardsConvUnit[1][0][11] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst O[11]
load net BRAMWord[0][1][14] -attr @rip BRAMWord[0][1][14] -port BRAMWord[0][1][14] -pin BRAMWord[0][1]_i I0[14] -pin BRAMWord[0][1]_i__0 I0[14]
load net TowardsConvUnit[2][0][7] -attr @rip 7 -port TowardsConvUnit[2][0][7] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst O[7]
load net BRAMWord[0][2]_i__0_n_10 -attr @rip O[7] -pin BRAMWord[0][2]_i__0 O[7] -pin TowardsConvUnit_FF_reg[1][2][17:0] D[7] -pin TowardsConvUnit_FF_reg[3][2][17:0] D[7]
load net TowardsConvUnit[2][6][17] -attr @rip 17 -port TowardsConvUnit[2][6][17] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst O[17]
load net BRAMWord[0][2]_i__0_n_11 -attr @rip O[6] -pin BRAMWord[0][2]_i__0 O[6] -pin TowardsConvUnit_FF_reg[1][2][17:0] D[6] -pin TowardsConvUnit_FF_reg[3][2][17:0] D[6]
load net TowardsConvUnit[2][2]_OBUF[11] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[2][2][17:0] Q[11]
load net TowardsConvUnit[0][7]_OBUF[16] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[0][7][17:0] Q[16]
load net BRAMWord[0][2]_i__0_n_12 -attr @rip O[5] -pin BRAMWord[0][2]_i__0 O[5] -pin TowardsConvUnit_FF_reg[1][2][17:0] D[5] -pin TowardsConvUnit_FF_reg[3][2][17:0] D[5]
load net BRAMWord[0][4][2] -attr @rip BRAMWord[0][4][2] -port BRAMWord[0][4][2] -pin BRAMWord[0][4]_i I0[2] -pin BRAMWord[0][4]_i__0 I0[2]
load net BRAMWord[0][2]_i__0_n_13 -attr @rip O[4] -pin BRAMWord[0][2]_i__0 O[4] -pin TowardsConvUnit_FF_reg[1][2][17:0] D[4] -pin TowardsConvUnit_FF_reg[3][2][17:0] D[4]
load net BRAMWord[0][2]_i__0_n_14 -attr @rip O[3] -pin BRAMWord[0][2]_i__0 O[3] -pin TowardsConvUnit_FF_reg[1][2][17:0] D[3] -pin TowardsConvUnit_FF_reg[3][2][17:0] D[3]
load net TowardsConvUnit_FF[2][7] -pin TowardsConvUnit_FF[2][7:0]_i O[7] -pin TowardsConvUnit_FF_reg[2][7][17:0] RST
load net BRAMWord[0][2]_i__0_n_15 -attr @rip O[2] -pin BRAMWord[0][2]_i__0 O[2] -pin TowardsConvUnit_FF_reg[1][2][17:0] D[2] -pin TowardsConvUnit_FF_reg[3][2][17:0] D[2]
load net TowardsConvUnit[0][4]_OBUF[7] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[0][4][17:0] Q[7]
load net BRAMWord[0][2]_i__0_n_16 -attr @rip O[1] -pin BRAMWord[0][2]_i__0 O[1] -pin TowardsConvUnit_FF_reg[1][2][17:0] D[1] -pin TowardsConvUnit_FF_reg[3][2][17:0] D[1]
load net TowardsConvUnit[2][3][2] -attr @rip 2 -port TowardsConvUnit[2][3][2] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst O[2]
load net TowardsConvUnit[0][2]_OBUF[6] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[0][2][17:0] Q[6]
load net BRAMWord[0][0][1] -attr @rip BRAMWord[0][0][1] -port BRAMWord[0][0][1] -pin BRAMWord[0][0]_i I0[1] -pin BRAMWord[0][0]_i__0 I0[1]
load net TowardsConvUnit[0][5]_OBUF[7] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[0][5][17:0] Q[7]
load net BRAMWord[0][2]_i__0_n_17 -attr @rip O[0] -pin BRAMWord[0][2]_i__0 O[0] -pin TowardsConvUnit_FF_reg[1][2][17:0] D[0] -pin TowardsConvUnit_FF_reg[3][2][17:0] D[0]
load net BRAMWord[0][2][9] -attr @rip BRAMWord[0][2][9] -port BRAMWord[0][2][9] -pin BRAMWord[0][2]_i I0[9] -pin BRAMWord[0][2]_i__0 I0[9]
load net TowardsConvUnit[0][1][12] -attr @rip 12 -port TowardsConvUnit[0][1][12] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst O[12]
load net BRAMWord[0][2][12] -attr @rip BRAMWord[0][2][12] -port BRAMWord[0][2][12] -pin BRAMWord[0][2]_i I0[12] -pin BRAMWord[0][2]_i__0 I0[12]
load net BRAMWord[1][5][16] -attr @rip BRAMWord[1][5][16] -pin BRAMWord[0][5]_i I1[16] -pin BRAMWord[0][5]_i__0 I1[16] -port BRAMWord[1][5][16]
load net TowardsConvUnit[1][0]_OBUF[14] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[1][0][17:0] Q[14]
load net BRAMWord[1][0][11] -attr @rip BRAMWord[1][0][11] -pin BRAMWord[0][0]_i I1[11] -pin BRAMWord[0][0]_i__0 I1[11] -port BRAMWord[1][0][11]
load net BRAMWord[0][3][1] -attr @rip BRAMWord[0][3][1] -port BRAMWord[0][3][1] -pin BRAMWord[0][3]_i I0[1] -pin BRAMWord[0][3]_i__0 I0[1]
load net TowardsConvUnit[3][7]_OBUF[17] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[3][7][17:0] Q[17]
load net BRAMWord[1][5][8] -attr @rip BRAMWord[1][5][8] -pin BRAMWord[0][5]_i I1[8] -pin BRAMWord[0][5]_i__0 I1[8] -port BRAMWord[1][5][8]
load net TowardsConvUnit[1][1][17] -attr @rip 17 -port TowardsConvUnit[1][1][17] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst O[17]
load net TowardsConvUnit[0][7]_OBUF[11] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[0][7][17:0] Q[11]
load net BRAMWord[0][1][13] -attr @rip BRAMWord[0][1][13] -port BRAMWord[0][1][13] -pin BRAMWord[0][1]_i I0[13] -pin BRAMWord[0][1]_i__0 I0[13]
load net TowardsConvUnit[2][0][6] -attr @rip 6 -port TowardsConvUnit[2][0][6] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst O[6]
load net TowardsConvUnit[2][6][16] -attr @rip 16 -port TowardsConvUnit[2][6][16] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst O[16]
load net TowardsConvUnit[3][1][1] -attr @rip 1 -port TowardsConvUnit[3][1][1] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst O[1]
load net TowardsConvUnit[0][4]_OBUF[4] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[0][4][17:0] Q[4]
load net TowardsConvUnit[1][0][14] -attr @rip 14 -port TowardsConvUnit[1][0][14] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst O[14]
load net TowardsConvUnit[0][7]_OBUF[3] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[0][7][17:0] Q[3]
load net TowardsConvUnit[2][2]_OBUF[12] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[2][2][17:0] Q[12]
load net TowardsConvUnit_FF[2][6] -pin TowardsConvUnit_FF[2][7:0]_i O[6] -pin TowardsConvUnit_FF_reg[2][6][17:0] RST
load net BRAMWord[1][5][1] -attr @rip BRAMWord[1][5][1] -pin BRAMWord[0][5]_i I1[1] -pin BRAMWord[0][5]_i__0 I1[1] -port BRAMWord[1][5][1]
load net TowardsConvUnit[1][7]_OBUF[3] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[1][7][17:0] Q[3]
load net TowardsConvUnit[2][3][3] -attr @rip 3 -port TowardsConvUnit[2][3][3] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst O[3]
load net TowardsConvUnit[0][2]_OBUF[7] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[0][2][17:0] Q[7]
load net BRAMWord[0][0][2] -attr @rip BRAMWord[0][0][2] -port BRAMWord[0][0][2] -pin BRAMWord[0][0]_i I0[2] -pin BRAMWord[0][0]_i__0 I0[2]
load net BRAMWord[0][2][11] -attr @rip BRAMWord[0][2][11] -port BRAMWord[0][2][11] -pin BRAMWord[0][2]_i I0[11] -pin BRAMWord[0][2]_i__0 I0[11]
load net BRAMWord[1][5][15] -attr @rip BRAMWord[1][5][15] -pin BRAMWord[0][5]_i I1[15] -pin BRAMWord[0][5]_i__0 I1[15] -port BRAMWord[1][5][15]
load net TowardsConvUnit[0][5]_OBUF[8] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[0][5][17:0] Q[8]
load net TowardsConvUnit[1][2][3] -attr @rip 3 -port TowardsConvUnit[1][2][3] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst O[3]
load net TowardsConvUnit[0][2][0] -attr @rip 0 -port TowardsConvUnit[0][2][0] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst O[0]
load net TowardsConvUnit[2][5][2] -attr @rip 2 -port TowardsConvUnit[2][5][2] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst O[2]
load net BRAMWord[0][3][0] -attr @rip BRAMWord[0][3][0] -port BRAMWord[0][3][0] -pin BRAMWord[0][3]_i I0[0] -pin BRAMWord[0][3]_i__0 I0[0]
load net TowardsConvUnit[2][7]_OBUF[16] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[2][7][17:0] Q[16]
load net TowardsConvUnit[1][0]_OBUF[15] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[1][0][17:0] Q[15]
load net BRAMWord[1][0][12] -attr @rip BRAMWord[1][0][12] -pin BRAMWord[0][0]_i I1[12] -pin BRAMWord[0][0]_i__0 I1[12] -port BRAMWord[1][0][12]
load net TowardsConvUnit[1][1][16] -attr @rip 16 -port TowardsConvUnit[1][1][16] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst O[16]
load net TowardsConvUnit[1][1][5] -attr @rip 5 -port TowardsConvUnit[1][1][5] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst O[5]
load net TowardsConvUnit[3][3][9] -attr @rip 9 -port TowardsConvUnit[3][3][9] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst O[9]
load net TowardsConvUnit[0][7]_OBUF[10] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[0][7][17:0] Q[10]
load net TowardsConvUnit[3][1]_OBUF[14] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[3][1][17:0] Q[14]
load net BRAMWord[0][1][12] -attr @rip BRAMWord[0][1][12] -port BRAMWord[0][1][12] -pin BRAMWord[0][1]_i I0[12] -pin BRAMWord[0][1]_i__0 I0[12]
load net TowardsConvUnit[2][0][5] -attr @rip 5 -port TowardsConvUnit[2][0][5] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst O[5]
load net TowardsConvUnit[2][4][0] -attr @rip 0 -port TowardsConvUnit[2][4][0] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst O[0]
load net TowardsConvUnit[1][0][13] -attr @rip 13 -port TowardsConvUnit[1][0][13] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst O[13]
load net BRAMWord[0][4][0] -attr @rip BRAMWord[0][4][0] -port BRAMWord[0][4][0] -pin BRAMWord[0][4]_i I0[0] -pin BRAMWord[0][4]_i__0 I0[0]
load net TowardsConvUnit[1][6][1] -attr @rip 1 -port TowardsConvUnit[1][6][1] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst O[1]
load net BRAMWord[1][4][5] -attr @rip BRAMWord[1][4][5] -pin BRAMWord[0][4]_i I1[5] -pin BRAMWord[0][4]_i__0 I1[5] -port BRAMWord[1][4][5]
load net TowardsConvUnit[3][1][2] -attr @rip 2 -port TowardsConvUnit[3][1][2] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst O[2]
load net TowardsConvUnit[0][4]_OBUF[5] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[0][4][17:0] Q[5]
load net TowardsConvUnit[0][7]_OBUF[4] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[0][7][17:0] Q[4]
load net TowardsConvUnit[2][2]_OBUF[13] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[2][2][17:0] Q[13]
load net BRAMWord[0][5]_i__0_n_0 -attr @rip O[17] -pin BRAMWord[0][5]_i__0 O[17] -pin TowardsConvUnit_FF_reg[1][5][17:0] D[17] -pin TowardsConvUnit_FF_reg[3][5][17:0] D[17]
load net BRAMWord[0][5]_i__0_n_1 -attr @rip O[16] -pin BRAMWord[0][5]_i__0 O[16] -pin TowardsConvUnit_FF_reg[1][5][17:0] D[16] -pin TowardsConvUnit_FF_reg[3][5][17:0] D[16]
load net TowardsConvUnit[1][4][1] -attr @rip 1 -port TowardsConvUnit[1][4][1] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst O[1]
load net TowardsConvUnit[1][7]_OBUF[2] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[1][7][17:0] Q[2]
load net BRAMWord[1][2][14] -attr @rip BRAMWord[1][2][14] -pin BRAMWord[0][2]_i I1[14] -pin BRAMWord[0][2]_i__0 I1[14] -port BRAMWord[1][2][14]
load net BRAMWord[0][5]_i__0_n_2 -attr @rip O[15] -pin BRAMWord[0][5]_i__0 O[15] -pin TowardsConvUnit_FF_reg[1][5][17:0] D[15] -pin TowardsConvUnit_FF_reg[3][5][17:0] D[15]
load net BRAMWord[1][5][2] -attr @rip BRAMWord[1][5][2] -pin BRAMWord[0][5]_i I1[2] -pin BRAMWord[0][5]_i__0 I1[2] -port BRAMWord[1][5][2]
load net TowardsConvUnit[0][1][10] -attr @rip 10 -port TowardsConvUnit[0][1][10] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst O[10]
load net BRAMWord[0][2][10] -attr @rip BRAMWord[0][2][10] -port BRAMWord[0][2][10] -pin BRAMWord[0][2]_i I0[10] -pin BRAMWord[0][2]_i__0 I0[10]
load net BRAMWord[1][5][14] -attr @rip BRAMWord[1][5][14] -pin BRAMWord[0][5]_i I1[14] -pin BRAMWord[0][5]_i__0 I1[14] -port BRAMWord[1][5][14]
load net BRAMWord[0][5]_i__0_n_3 -attr @rip O[14] -pin BRAMWord[0][5]_i__0 O[14] -pin TowardsConvUnit_FF_reg[1][5][17:0] D[14] -pin TowardsConvUnit_FF_reg[3][5][17:0] D[14]
load net TowardsConvUnit[1][2][2] -attr @rip 2 -port TowardsConvUnit[1][2][2] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst O[2]
load net TowardsConvUnit[1][0]_OBUF[12] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[1][0][17:0] Q[12]
load net BRAMWord[0][5]_i__0_n_4 -attr @rip O[13] -pin BRAMWord[0][5]_i__0 O[13] -pin TowardsConvUnit_FF_reg[1][5][17:0] D[13] -pin TowardsConvUnit_FF_reg[3][5][17:0] D[13]
load net TowardsConvUnit[0][2]_OBUF[8] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[0][2][17:0] Q[8]
load net BRAMWord[0][5]_i__0_n_5 -attr @rip O[12] -pin BRAMWord[0][5]_i__0 O[12] -pin TowardsConvUnit_FF_reg[1][5][17:0] D[12] -pin TowardsConvUnit_FF_reg[3][5][17:0] D[12]
load net TowardsConvUnit[3][7]_OBUF[15] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[3][7][17:0] Q[15]
load net BRAMWord[0][5]_i__0_n_6 -attr @rip O[11] -pin BRAMWord[0][5]_i__0 O[11] -pin TowardsConvUnit_FF_reg[1][5][17:0] D[11] -pin TowardsConvUnit_FF_reg[3][5][17:0] D[11]
load net TowardsConvUnit[1][1][15] -attr @rip 15 -port TowardsConvUnit[1][1][15] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst O[15]
load net TowardsConvUnit[2][5][3] -attr @rip 3 -port TowardsConvUnit[2][5][3] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst O[3]
load net BRAMWord[0][5]_i__0_n_7 -attr @rip O[10] -pin BRAMWord[0][5]_i__0 O[10] -pin TowardsConvUnit_FF_reg[1][5][17:0] D[10] -pin TowardsConvUnit_FF_reg[3][5][17:0] D[10]
load net TowardsConvUnit[2][1][10] -attr @rip 10 -port TowardsConvUnit[2][1][10] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst O[10]
load net TowardsConvUnit[2][7]_OBUF[17] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[2][7][17:0] Q[17]
load net TowardsConvUnit[3][1]_OBUF[13] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[3][1][17:0] Q[13]
load net BRAMWord[1][4][12] -attr @rip BRAMWord[1][4][12] -pin BRAMWord[0][4]_i I1[12] -pin BRAMWord[0][4]_i__0 I1[12] -port BRAMWord[1][4][12]
load net BRAMWord[0][5]_i__0_n_8 -attr @rip O[9] -pin BRAMWord[0][5]_i__0 O[9] -pin TowardsConvUnit_FF_reg[1][5][17:0] D[9] -pin TowardsConvUnit_FF_reg[3][5][17:0] D[9]
load net BRAMWord[0][1][11] -attr @rip BRAMWord[0][1][11] -port BRAMWord[0][1][11] -pin BRAMWord[0][1]_i I0[11] -pin BRAMWord[0][1]_i__0 I0[11]
load net TowardsConvUnit[1][1][6] -attr @rip 6 -port TowardsConvUnit[1][1][6] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst O[6]
load net BRAMWord[0][5]_i__0_n_9 -attr @rip O[8] -pin BRAMWord[0][5]_i__0 O[8] -pin TowardsConvUnit_FF_reg[1][5][17:0] D[8] -pin TowardsConvUnit_FF_reg[3][5][17:0] D[8]
load net TowardsConvUnit[2][7][10] -attr @rip 10 -port TowardsConvUnit[2][7][10] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst O[10]
load net TowardsConvUnit[0][7]_OBUF[13] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[0][7][17:0] Q[13]
load net TowardsConvUnit[0][7]_OBUF[1] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[0][7][17:0] Q[1]
load net TowardsConvUnit[1][6][0] -attr @rip 0 -port TowardsConvUnit[1][6][0] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst O[0]
load net BRAMWord[1][4][4] -attr @rip BRAMWord[1][4][4] -pin BRAMWord[0][4]_i I1[4] -pin BRAMWord[0][4]_i__0 I1[4] -port BRAMWord[1][4][4]
load net TowardsConvUnit[2][3]_OBUF[7] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[2][3][17:0] Q[7]
load net TowardsConvUnit[1][4][0] -attr @rip 0 -port TowardsConvUnit[1][4][0] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst O[0]
load net TowardsConvUnit[1][7]_OBUF[1] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[1][7][17:0] Q[1]
load net TowardsConvUnit[2][2]_OBUF[14] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[2][2][17:0] Q[14]
load net BRAMWord[0][7][4] -attr @rip BRAMWord[0][7][4] -port BRAMWord[0][7][4] -pin BRAMWord[0][7]_i I0[4] -pin BRAMWord[0][7]_i__0 I0[4]
load net BRAMWord[1][2][13] -attr @rip BRAMWord[1][2][13] -pin BRAMWord[0][2]_i I1[13] -pin BRAMWord[0][2]_i__0 I1[13] -port BRAMWord[1][2][13]
load net BRAMWord[0][0][0] -attr @rip BRAMWord[0][0][0] -port BRAMWord[0][0][0] -pin BRAMWord[0][0]_i I0[0] -pin BRAMWord[0][0]_i__0 I0[0]
load net BRAMWord[1][5][13] -attr @rip BRAMWord[1][5][13] -pin BRAMWord[0][5]_i I1[13] -pin BRAMWord[0][5]_i__0 I1[13] -port BRAMWord[1][5][13]
load net TowardsConvUnit[1][2][1] -attr @rip 1 -port TowardsConvUnit[1][2][1] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst O[1]
load net BRAMWord[1][5][3] -attr @rip BRAMWord[1][5][3] -pin BRAMWord[0][5]_i I1[3] -pin BRAMWord[0][5]_i__0 I1[3] -port BRAMWord[1][5][3]
load net TowardsConvUnit[1][2]_OBUF[6] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[1][2][17:0] Q[6]
load net TowardsConvUnit[2][5][0] -attr @rip 0 -port TowardsConvUnit[2][5][0] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst O[0]
load net TowardsConvUnit[1][0]_OBUF[13] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[1][0][17:0] Q[13]
load net TowardsConvUnit[1][1][14] -attr @rip 14 -port TowardsConvUnit[1][1][14] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst O[14]
load net TowardsConvUnit[0][2]_OBUF[9] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[0][2][17:0] Q[9]
load net BRAMWord[0][7]0_out[9] -attr @rip O[9] -pin BRAMWord[0][7]_i O[9] -pin TowardsConvUnit_FF_reg[0][7][17:0] D[9] -pin TowardsConvUnit_FF_reg[2][7][17:0] D[9]
load net TowardsConvUnit[3][7]_OBUF[16] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[3][7][17:0] Q[16]
load net BRAMWord[0][1][10] -attr @rip BRAMWord[0][1][10] -port BRAMWord[0][1][10] -pin BRAMWord[0][1]_i I0[10] -pin BRAMWord[0][1]_i__0 I0[10]
load net BRAMWord[1][4][11] -attr @rip BRAMWord[1][4][11] -pin BRAMWord[0][4]_i I1[11] -pin BRAMWord[0][4]_i__0 I1[11] -port BRAMWord[1][4][11]
load net TowardsConvUnit[2][1][11] -attr @rip 11 -port TowardsConvUnit[2][1][11] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst O[11]
load net TowardsConvUnit[1][1][7] -attr @rip 7 -port TowardsConvUnit[1][1][7] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst O[7]
load net TowardsConvUnit[0][7]_OBUF[12] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[0][7][17:0] Q[12]
load net TowardsConvUnit[3][1]_OBUF[16] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[3][1][17:0] Q[16]
load net BRAMWord[1][4][3] -attr @rip BRAMWord[1][4][3] -pin BRAMWord[0][4]_i I1[3] -pin BRAMWord[0][4]_i__0 I1[3] -port BRAMWord[1][4][3]
load net TowardsConvUnit[2][4][2] -attr @rip 2 -port TowardsConvUnit[2][4][2] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst O[2]
load net TowardsConvUnit[3][1][0] -attr @rip 0 -port TowardsConvUnit[3][1][0] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst O[0]
load net BRAMWord[0][2]_i__0_n_0 -attr @rip O[17] -pin BRAMWord[0][2]_i__0 O[17] -pin TowardsConvUnit_FF_reg[1][2][17:0] D[17] -pin TowardsConvUnit_FF_reg[3][2][17:0] D[17]
load net TowardsConvUnit[0][7]_OBUF[2] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[0][7][17:0] Q[2]
load net BRAMWord[0][2]_i__0_n_1 -attr @rip O[16] -pin BRAMWord[0][2]_i__0 O[16] -pin TowardsConvUnit_FF_reg[1][2][17:0] D[16] -pin TowardsConvUnit_FF_reg[3][2][17:0] D[16]
load net TowardsConvUnit[2][3]_OBUF[8] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[2][3][17:0] Q[8]
load net TowardsConvUnit[2][5]_OBUF[9] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[2][5][17:0] Q[9]
load net BRAMWord[0][2]_i__0_n_2 -attr @rip O[15] -pin BRAMWord[0][2]_i__0 O[15] -pin TowardsConvUnit_FF_reg[1][2][17:0] D[15] -pin TowardsConvUnit_FF_reg[3][2][17:0] D[15]
load net TowardsConvUnit[1][6][3] -attr @rip 3 -port TowardsConvUnit[1][6][3] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst O[3]
load net TowardsConvUnit[1][7]_OBUF[0] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[1][7][17:0] Q[0]
load net BRAMWord[0][2]_i__0_n_3 -attr @rip O[14] -pin BRAMWord[0][2]_i__0 O[14] -pin TowardsConvUnit_FF_reg[1][2][17:0] D[14] -pin TowardsConvUnit_FF_reg[3][2][17:0] D[14]
load net BRAMWord[0][2]_i__0_n_4 -attr @rip O[13] -pin BRAMWord[0][2]_i__0 O[13] -pin TowardsConvUnit_FF_reg[1][2][17:0] D[13] -pin TowardsConvUnit_FF_reg[3][2][17:0] D[13]
load net BRAMWord[1][5][12] -attr @rip BRAMWord[1][5][12] -pin BRAMWord[0][5]_i I1[12] -pin BRAMWord[0][5]_i__0 I1[12] -port BRAMWord[1][5][12]
load net TowardsConvUnit[1][2][0] -attr @rip 0 -port TowardsConvUnit[1][2][0] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst O[0]
load net TowardsConvUnit[2][2]_OBUF[15] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[2][2][17:0] Q[15]
load net BRAMWord[0][2]_i__0_n_5 -attr @rip O[12] -pin BRAMWord[0][2]_i__0 O[12] -pin TowardsConvUnit_FF_reg[1][2][17:0] D[12] -pin TowardsConvUnit_FF_reg[3][2][17:0] D[12]
load net TowardsConvUnit[1][0]_OBUF[10] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[1][0][17:0] Q[10]
load net BRAMWord[0][7][5] -attr @rip BRAMWord[0][7][5] -port BRAMWord[0][7][5] -pin BRAMWord[0][7]_i I0[5] -pin BRAMWord[0][7]_i__0 I0[5]
load net TowardsConvUnit[1][2]_OBUF[5] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[1][2][17:0] Q[5]
load net BRAMWord[0][2]_i__0_n_6 -attr @rip O[11] -pin BRAMWord[0][2]_i__0 O[11] -pin TowardsConvUnit_FF_reg[1][2][17:0] D[11] -pin TowardsConvUnit_FF_reg[3][2][17:0] D[11]
load net BRAMWord[0][7]0_out[0] -attr @rip O[0] -pin BRAMWord[0][7]_i O[0] -pin TowardsConvUnit_FF_reg[0][7][17:0] D[0] -pin TowardsConvUnit_FF_reg[2][7][17:0] D[0]
load net BRAMWord[0][2]_i__0_n_7 -attr @rip O[10] -pin BRAMWord[0][2]_i__0 O[10] -pin TowardsConvUnit_FF_reg[1][2][17:0] D[10] -pin TowardsConvUnit_FF_reg[3][2][17:0] D[10]
load net BRAMWord[1][5][4] -attr @rip BRAMWord[1][5][4] -pin BRAMWord[0][5]_i I1[4] -pin BRAMWord[0][5]_i__0 I1[4] -port BRAMWord[1][5][4]
load net BRAMWord[1][2][16] -attr @rip BRAMWord[1][2][16] -pin BRAMWord[0][2]_i I1[16] -pin BRAMWord[0][2]_i__0 I1[16] -port BRAMWord[1][2][16]
load net TowardsConvUnit[1][1][13] -attr @rip 13 -port TowardsConvUnit[1][1][13] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst O[13]
load net TowardsConvUnit[2][5][1] -attr @rip 1 -port TowardsConvUnit[2][5][1] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst O[1]
load net BRAMWord[0][2]_i__0_n_8 -attr @rip O[9] -pin BRAMWord[0][2]_i__0 O[9] -pin TowardsConvUnit_FF_reg[1][2][17:0] D[9] -pin TowardsConvUnit_FF_reg[3][2][17:0] D[9]
load net TowardsConvUnit[0][5][17] -attr @rip 17 -port TowardsConvUnit[0][5][17] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst O[17]
load net BRAMWord[0][2]_i__0_n_9 -attr @rip O[8] -pin BRAMWord[0][2]_i__0 O[8] -pin TowardsConvUnit_FF_reg[1][2][17:0] D[8] -pin TowardsConvUnit_FF_reg[3][2][17:0] D[8]
load net BRAMWord[0][0][5] -attr @rip BRAMWord[0][0][5] -port BRAMWord[0][0][5] -pin BRAMWord[0][0]_i I0[5] -pin BRAMWord[0][0]_i__0 I0[5]
load net BRAMWord[0][6][0] -attr @rip BRAMWord[0][6][0] -port BRAMWord[0][6][0] -pin BRAMWord[0][6]_i I0[0] -pin BRAMWord[0][6]_i__0 I0[0]
load net TowardsConvUnit[2][1][12] -attr @rip 12 -port TowardsConvUnit[2][1][12] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst O[12]
load net TowardsConvUnit[3][1]_OBUF[15] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[3][1][17:0] Q[15]
load net BRAMWord[1][4][14] -attr @rip BRAMWord[1][4][14] -pin BRAMWord[0][4]_i I1[14] -pin BRAMWord[0][4]_i__0 I1[14] -port BRAMWord[1][4][14]
load net TowardsConvUnit[1][0][10] -attr @rip 10 -port TowardsConvUnit[1][0][10] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst O[10]
load net BRAMWord[0][1][5] -attr @rip BRAMWord[0][1][5] -port BRAMWord[0][1][5] -pin BRAMWord[0][1]_i I0[5] -pin BRAMWord[0][1]_i__0 I0[5]
load net TowardsConvUnit[1][1][8] -attr @rip 8 -port TowardsConvUnit[1][1][8] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst O[8]
load net TowardsConvUnit[2][3][16] -attr @rip 16 -port TowardsConvUnit[2][3][16] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst O[16]
load net BRAMWord[1][4][2] -attr @rip BRAMWord[1][4][2] -pin BRAMWord[0][4]_i I1[2] -pin BRAMWord[0][4]_i__0 I1[2] -port BRAMWord[1][4][2]
load net TowardsConvUnit[1][6][6] -attr @rip 6 -port TowardsConvUnit[1][6][6] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst O[6]
load net TowardsConvUnit[2][4][1] -attr @rip 1 -port TowardsConvUnit[2][4][1] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst O[1]
load net TowardsConvUnit[3][0][1] -attr @rip 1 -port TowardsConvUnit[3][0][1] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst O[1]
load net TowardsConvUnit[0][3][6] -attr @rip 6 -port TowardsConvUnit[0][3][6] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst O[6]
load net TowardsConvUnit[1][6][2] -attr @rip 2 -port TowardsConvUnit[1][6][2] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst O[2]
load net TowardsConvUnit[1][4][10] -attr @rip 10 -port TowardsConvUnit[1][4][10] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst O[10]
load net TowardsConvUnit[2][3]_OBUF[9] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[2][3][17:0] Q[9]
load net TowardsConvUnit[3][2][15] -attr @rip 15 -port TowardsConvUnit[3][2][15] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst O[15]
load net BRAMWord[1][5][11] -attr @rip BRAMWord[1][5][11] -pin BRAMWord[0][5]_i I1[11] -pin BRAMWord[0][5]_i__0 I1[11] -port BRAMWord[1][5][11]
load net TowardsConvUnit[3][1][5] -attr @rip 5 -port TowardsConvUnit[3][1][5] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst O[5]
load net TowardsConvUnit[0][7]_OBUF[7] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[0][7][17:0] Q[7]
load net TowardsConvUnit[2][2]_OBUF[16] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[2][2][17:0] Q[16]
load net TowardsConvUnit[1][0]_OBUF[11] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[1][0][17:0] Q[11]
load net BRAMWord[0][7][6] -attr @rip BRAMWord[0][7][6] -port BRAMWord[0][7][6] -pin BRAMWord[0][7]_i I0[6] -pin BRAMWord[0][7]_i__0 I0[6]
load net BRAMWord[1][2][15] -attr @rip BRAMWord[1][2][15] -pin BRAMWord[0][2]_i I1[15] -pin BRAMWord[0][2]_i__0 I1[15] -port BRAMWord[1][2][15]
load net TowardsConvUnit[1][1][12] -attr @rip 12 -port TowardsConvUnit[1][1][12] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst O[12]
load net TowardsConvUnit[1][1][1] -attr @rip 1 -port TowardsConvUnit[1][1][1] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst O[1]
load net TowardsConvUnit[0][5][16] -attr @rip 16 -port TowardsConvUnit[0][5][16] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst O[16]
load net TowardsConvUnit[3][1]_OBUF[10] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[3][1][17:0] Q[10]
load net TowardsConvUnit[1][2]_OBUF[8] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[1][2][17:0] Q[8]
load net TowardsConvUnit[1][7]_OBUF[7] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[1][7][17:0] Q[7]
load net TowardsConvUnit[3][5]_OBUF[8] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[3][5][17:0] Q[8]
load net BRAMWord[0][0][6] -attr @rip BRAMWord[0][0][6] -port BRAMWord[0][0][6] -pin BRAMWord[0][0]_i I0[6] -pin BRAMWord[0][0]_i__0 I0[6]
load net TowardsConvUnit[1][2][7] -attr @rip 7 -port TowardsConvUnit[1][2][7] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst O[7]
load net TowardsConvUnit[1][4]_OBUF[8] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[1][4][17:0] Q[8]
load net BRAMWord[1][4][13] -attr @rip BRAMWord[1][4][13] -pin BRAMWord[0][4]_i I1[13] -pin BRAMWord[0][4]_i__0 I1[13] -port BRAMWord[1][4][13]
load net BRAMWord[0][1][4] -attr @rip BRAMWord[0][1][4] -port BRAMWord[0][1][4] -pin BRAMWord[0][1]_i I0[4] -pin BRAMWord[0][1]_i__0 I0[4]
load net TowardsConvUnit[2][3][15] -attr @rip 15 -port TowardsConvUnit[2][3][15] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst O[15]
load net TowardsConvUnit[2][1][13] -attr @rip 13 -port TowardsConvUnit[2][1][13] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst O[13]
load net TowardsConvUnit[3][0][0] -attr @rip 0 -port TowardsConvUnit[3][0][0] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst O[0]
load net TowardsConvUnit[0][4][17] -attr @rip 17 -port TowardsConvUnit[0][4][17] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst O[17]
load net TowardsConvUnit[1][6][7] -attr @rip 7 -port TowardsConvUnit[1][6][7] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst O[7]
load net TowardsConvUnit[0][5]_OBUF[1] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[0][5][17:0] Q[1]
load net TowardsConvUnit[0][3][7] -attr @rip 7 -port TowardsConvUnit[0][3][7] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst O[7]
load net TowardsConvUnit[2][0][9] -attr @rip 9 -port TowardsConvUnit[2][0][9] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst O[9]
load net TowardsConvUnit[2][4][10] -attr @rip 10 -port TowardsConvUnit[2][4][10] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst O[10]
load net TowardsConvUnit[2][4][4] -attr @rip 4 -port TowardsConvUnit[2][4][4] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst O[4]
load net BRAMWord[1][5][10] -attr @rip BRAMWord[1][5][10] -pin BRAMWord[0][5]_i I1[10] -pin BRAMWord[0][5]_i__0 I1[10] -port BRAMWord[1][5][10]
load net TowardsConvUnit[3][2][16] -attr @rip 16 -port TowardsConvUnit[3][2][16] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst O[16]
load net BRAMWord[1][4][9] -attr @rip BRAMWord[1][4][9] -pin BRAMWord[0][4]_i I1[9] -pin BRAMWord[0][4]_i__0 I1[9] -port BRAMWord[1][4][9]
load net TowardsConvUnit[1][1][11] -attr @rip 11 -port TowardsConvUnit[1][1][11] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst O[11]
load net TowardsConvUnit[3][1][6] -attr @rip 6 -port TowardsConvUnit[3][1][6] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst O[6]
load net TowardsConvUnit[0][7]_OBUF[8] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[0][7][17:0] Q[8]
load net TowardsConvUnit[0][5][15] -attr @rip 15 -port TowardsConvUnit[0][5][15] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst O[15]
load net TowardsConvUnit[2][2]_OBUF[17] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[2][2][17:0] Q[17]
load net TowardsConvUnit[3][7][10] -attr @rip 10 -port TowardsConvUnit[3][7][10] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst O[10]
load net BRAMWord[0][3]0_out[10] -attr @rip O[10] -pin BRAMWord[0][3]_i O[10] -pin TowardsConvUnit_FF_reg[0][3][17:0] D[10] -pin TowardsConvUnit_FF_reg[2][3][17:0] D[10]
load net BRAMWord[0][7][7] -attr @rip BRAMWord[0][7][7] -port BRAMWord[0][7][7] -pin BRAMWord[0][7]_i I0[7] -pin BRAMWord[0][7]_i__0 I0[7]
load net TowardsConvUnit[1][1][2] -attr @rip 2 -port TowardsConvUnit[1][1][2] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst O[2]
load net TowardsConvUnit[1][2]_OBUF[7] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[1][2][17:0] Q[7]
load net BRAMWord[0][0][3] -attr @rip BRAMWord[0][0][3] -port BRAMWord[0][0][3] -pin BRAMWord[0][0]_i I0[3] -pin BRAMWord[0][0]_i__0 I0[3]
load net TowardsConvUnit[1][7]_OBUF[6] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[1][7][17:0] Q[6]
load net TowardsConvUnit[0][3]_OBUF[11] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[0][3][17:0] Q[11]
load net TowardsConvUnit[1][2][6] -attr @rip 6 -port TowardsConvUnit[1][2][6] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst O[6]
load net TowardsConvUnit[1][4]_OBUF[7] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[1][4][17:0] Q[7]
load net TowardsConvUnit[1][5][11] -attr @rip 11 -port TowardsConvUnit[1][5][11] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst O[11]
load net BRAMWord[0][1][3] -attr @rip BRAMWord[0][1][3] -port BRAMWord[0][1][3] -pin BRAMWord[0][1]_i I0[3] -pin BRAMWord[0][1]_i__0 I0[3]
load net TowardsConvUnit[3][5]_OBUF[9] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[3][5][17:0] Q[9]
load net TowardsConvUnit[1][6][4] -attr @rip 4 -port TowardsConvUnit[1][6][4] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst O[4]
load net TowardsConvUnit[2][3]_OBUF[3] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[2][3][17:0] Q[3]
load net TowardsConvUnit[0][3][4] -attr @rip 4 -port TowardsConvUnit[0][3][4] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst O[4]
load net TowardsConvUnit[3][2][6] -attr @rip 6 -port TowardsConvUnit[3][2][6] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst O[6]
load net BRAMWord[0][2][0] -attr @rip BRAMWord[0][2][0] -port BRAMWord[0][2][0] -pin BRAMWord[0][2]_i I0[0] -pin BRAMWord[0][2]_i__0 I0[0]
load net TowardsConvUnit[0][4][16] -attr @rip 16 -port TowardsConvUnit[0][4][16] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst O[16]
load net TowardsConvUnit[0][3]_OBUF[3] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[0][3][17:0] Q[3]
load net TowardsConvUnit[2][1][14] -attr @rip 14 -port TowardsConvUnit[2][1][14] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst O[14]
load net BRAMWord[1][4][16] -attr @rip BRAMWord[1][4][16] -pin BRAMWord[0][4]_i I1[16] -pin BRAMWord[0][4]_i__0 I1[16] -port BRAMWord[1][4][16]
load net BRAMWord[0][1]0_out[10] -attr @rip O[10] -pin BRAMWord[0][1]_i O[10] -pin TowardsConvUnit_FF_reg[0][1][17:0] D[10] -pin TowardsConvUnit_FF_reg[2][1][17:0] D[10]
load net BRAMWord[0][7][0] -attr @rip BRAMWord[0][7][0] -port BRAMWord[0][7][0] -pin BRAMWord[0][7]_i I0[0] -pin BRAMWord[0][7]_i__0 I0[0]
load net TowardsConvUnit[2][4][3] -attr @rip 3 -port TowardsConvUnit[2][4][3] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst O[3]
load net TowardsConvUnit[3][0][3] -attr @rip 3 -port TowardsConvUnit[3][0][3] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst O[3]
load net TowardsConvUnit[0][5]_OBUF[2] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[0][5][17:0] Q[2]
load net TowardsConvUnit[2][4][11] -attr @rip 11 -port TowardsConvUnit[2][4][11] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst O[11]
load net TowardsConvUnit[3][1][3] -attr @rip 3 -port TowardsConvUnit[3][1][3] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst O[3]
load net TowardsConvUnit[0][7]_OBUF[5] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[0][7][17:0] Q[5]
load net BRAMWord[1][4][8] -attr @rip BRAMWord[1][4][8] -pin BRAMWord[0][4]_i I1[8] -pin BRAMWord[0][4]_i__0 I1[8] -port BRAMWord[1][4][8]
load net TowardsConvUnit[1][1][10] -attr @rip 10 -port TowardsConvUnit[1][1][10] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst O[10]
load net TowardsConvUnit[1][4][12] -attr @rip 12 -port TowardsConvUnit[1][4][12] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst O[12]
load net TowardsConvUnit[3][2][17] -attr @rip 17 -port TowardsConvUnit[3][2][17] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst O[17]
load net TowardsConvUnit_FF[0][2] -pin TowardsConvUnit_FF[0][7:0]_i O[2] -pin TowardsConvUnit_FF_reg[0][2][17:0] RST
load net TowardsConvUnit[1][7]_OBUF[5] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[1][7][17:0] Q[5]
load net TowardsConvUnit[2][6]_OBUF[17] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[2][6][17:0] Q[17]
load net TowardsConvUnit[3][7][11] -attr @rip 11 -port TowardsConvUnit[3][7][11] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst O[11]
load net TowardsConvUnit[0][2]_OBUF[17] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[0][2][17:0] Q[17]
load net BRAMWord[0][3]0_out[11] -attr @rip O[11] -pin BRAMWord[0][3]_i O[11] -pin TowardsConvUnit_FF_reg[0][3][17:0] D[11] -pin TowardsConvUnit_FF_reg[2][3][17:0] D[11]
load net TowardsConvUnit[1][1][3] -attr @rip 3 -port TowardsConvUnit[1][1][3] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst O[3]
load net TowardsConvUnit[0][3]_OBUF[10] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[0][3][17:0] Q[10]
load net BRAMWord[0][0][4] -attr @rip BRAMWord[0][0][4] -port BRAMWord[0][0][4] -pin BRAMWord[0][0]_i I0[4] -pin BRAMWord[0][0]_i__0 I0[4]
load net TowardsConvUnit[1][2][5] -attr @rip 5 -port TowardsConvUnit[1][2][5] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst O[5]
load net TowardsConvUnit[1][5][10] -attr @rip 10 -port TowardsConvUnit[1][5][10] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst O[10]
load net TowardsConvUnit[3][1]_OBUF[12] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[3][1][17:0] Q[12]
load net BRAMWord[0][1][2] -attr @rip BRAMWord[0][1][2] -port BRAMWord[0][1][2] -pin BRAMWord[0][1]_i I0[2] -pin BRAMWord[0][1]_i__0 I0[2]
load net BRAMWord[0][0]0_out[3] -attr @rip O[3] -pin BRAMWord[0][0]_i O[3] -pin TowardsConvUnit_FF_reg[0][0][17:0] D[3] -pin TowardsConvUnit_FF_reg[2][0][17:0] D[3]
load net TowardsConvUnit[1][0]_OBUF[8] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[1][0][17:0] Q[8]
load net TowardsConvUnit[1][6][5] -attr @rip 5 -port TowardsConvUnit[1][6][5] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst O[5]
load net TowardsConvUnit[2][3]_OBUF[4] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[2][3][17:0] Q[4]
load net TowardsConvUnit[0][2][6] -attr @rip 6 -port TowardsConvUnit[0][2][6] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst O[6]
load net BRAMWord[1][4][15] -attr @rip BRAMWord[1][4][15] -pin BRAMWord[0][4]_i I1[15] -pin BRAMWord[0][4]_i__0 I1[15] -port BRAMWord[1][4][15]
load net TowardsConvUnit[0][3][5] -attr @rip 5 -port TowardsConvUnit[0][3][5] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst O[5]
load net TowardsConvUnit[2][3][17] -attr @rip 17 -port TowardsConvUnit[2][3][17] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst O[17]
load net TowardsConvUnit[3][2][7] -attr @rip 7 -port TowardsConvUnit[3][2][7] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst O[7]
load net BRAMWord[0][2][1] -attr @rip BRAMWord[0][2][1] -port BRAMWord[0][2][1] -pin BRAMWord[0][2]_i I0[1] -pin BRAMWord[0][2]_i__0 I0[1]
load net TowardsConvUnit[0][3]_OBUF[4] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[0][3][17:0] Q[4]
load net TowardsConvUnit[1][6][13] -attr @rip 13 -port TowardsConvUnit[1][6][13] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst O[13]
load net TowardsConvUnit[2][1][15] -attr @rip 15 -port TowardsConvUnit[2][1][15] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst O[15]
load net TowardsConvUnit[3][0][2] -attr @rip 2 -port TowardsConvUnit[3][0][2] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst O[2]
load net TowardsConvUnit[3][5]_OBUF[5] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[3][5][17:0] Q[5]
load net BRAMWord[0][1]0_out[11] -attr @rip O[11] -pin BRAMWord[0][1]_i O[11] -pin TowardsConvUnit_FF_reg[0][1][17:0] D[11] -pin TowardsConvUnit_FF_reg[2][1][17:0] D[11]
load net BRAMWord[0][7][1] -attr @rip BRAMWord[0][7][1] -port BRAMWord[0][7][1] -pin BRAMWord[0][7]_i I0[1] -pin BRAMWord[0][7]_i__0 I0[1]
load net TowardsConvUnit[2][6][7] -attr @rip 7 -port TowardsConvUnit[2][6][7] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst O[7]
load net BRAMWord[0][6]0_out[10] -attr @rip O[10] -pin BRAMWord[0][6]_i O[10] -pin TowardsConvUnit_FF_reg[0][6][17:0] D[10] -pin TowardsConvUnit_FF_reg[2][6][17:0] D[10]
load net TowardsConvUnit[2][4][12] -attr @rip 12 -port TowardsConvUnit[2][4][12] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst O[12]
load net TowardsConvUnit[0][7][14] -attr @rip 14 -port TowardsConvUnit[0][7][14] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst O[14]
load net BRAMWord[1][4][7] -attr @rip BRAMWord[1][4][7] -pin BRAMWord[0][4]_i I1[7] -pin BRAMWord[0][4]_i__0 I1[7] -port BRAMWord[1][4][7]
load net TowardsConvUnit[1][4][11] -attr @rip 11 -port TowardsConvUnit[1][4][11] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst O[11]
load net TowardsConvUnit[3][1][4] -attr @rip 4 -port TowardsConvUnit[3][1][4] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst O[4]
load net TowardsConvUnit[0][7]_OBUF[6] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[0][7][17:0] Q[6]
load net TowardsConvUnit[1][7]_OBUF[4] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[1][7][17:0] Q[4]
load net TowardsConvUnit_FF[0][3] -pin TowardsConvUnit_FF[0][7:0]_i O[3] -pin TowardsConvUnit_FF_reg[0][3][17:0] RST
load net TowardsConvUnit[1][2][4] -attr @rip 4 -port TowardsConvUnit[1][2][4] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst O[4]
load net TowardsConvUnit[3][1]_OBUF[11] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[3][1][17:0] Q[11]
load net TowardsConvUnit[3][7][12] -attr @rip 12 -port TowardsConvUnit[3][7][12] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst O[12]
load net BRAMWord[0][1][1] -attr @rip BRAMWord[0][1][1] -port BRAMWord[0][1][1] -pin BRAMWord[0][1]_i I0[1] -pin BRAMWord[0][1]_i__0 I0[1]
load net BRAMWord[0][3]0_out[12] -attr @rip O[12] -pin BRAMWord[0][3]_i O[12] -pin TowardsConvUnit_FF_reg[0][3][17:0] D[12] -pin TowardsConvUnit_FF_reg[2][3][17:0] D[12]
load net TowardsConvUnit[1][1][4] -attr @rip 4 -port TowardsConvUnit[1][1][4] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst O[4]
load net TowardsConvUnit[1][2]_OBUF[9] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[1][2][17:0] Q[9]
load net TowardsConvUnit[0][3][2] -attr @rip 2 -port TowardsConvUnit[0][3][2] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst O[2]
load net TowardsConvUnit[0][3]_OBUF[13] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[0][3][17:0] Q[13]
load net BRAMWord[0][0]0_out[2] -attr @rip O[2] -pin BRAMWord[0][0]_i O[2] -pin TowardsConvUnit_FF_reg[0][0][17:0] D[2] -pin TowardsConvUnit_FF_reg[2][0][17:0] D[2]
load net TowardsConvUnit[0][3]_OBUF[1] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[0][3][17:0] Q[1]
load net TowardsConvUnit[1][0]_OBUF[7] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[1][0][17:0] Q[7]
load net TowardsConvUnit[1][4]_OBUF[9] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[1][4][17:0] Q[9]
load net TowardsConvUnit[1][5][13] -attr @rip 13 -port TowardsConvUnit[1][5][13] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst O[13]
load net TowardsConvUnit[0][2][5] -attr @rip 5 -port TowardsConvUnit[0][2][5] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst O[5]
load net TowardsConvUnit[2][3]_OBUF[5] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[2][3][17:0] Q[5]
load net TowardsConvUnit[3][4]_OBUF[12] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[3][4][17:0] Q[12]
load net TowardsConvUnit[0][5]_OBUF[0] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[0][5][17:0] Q[0]
load net TowardsConvUnit[3][2][8] -attr @rip 8 -port TowardsConvUnit[3][2][8] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst O[8]
load net TowardsConvUnit[3][5]_OBUF[4] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[3][5][17:0] Q[4]
load net BRAMWord[0][2][2] -attr @rip BRAMWord[0][2][2] -port BRAMWord[0][2][2] -pin BRAMWord[0][2]_i I0[2] -pin BRAMWord[0][2]_i__0 I0[2]
load net TowardsConvUnit[1][6][14] -attr @rip 14 -port TowardsConvUnit[1][6][14] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst O[14]
load net TowardsConvUnit[2][1][16] -attr @rip 16 -port TowardsConvUnit[2][1][16] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst O[16]
load net TowardsConvUnit[0][7][13] -attr @rip 13 -port TowardsConvUnit[0][7][13] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst O[13]
load net BRAMWord[1][4][6] -attr @rip BRAMWord[1][4][6] -pin BRAMWord[0][4]_i I1[6] -pin BRAMWord[0][4]_i__0 I1[6] -port BRAMWord[1][4][6]
load net BRAMWord[0][7][2] -attr @rip BRAMWord[0][7][2] -port BRAMWord[0][7][2] -pin BRAMWord[0][7]_i I0[2] -pin BRAMWord[0][7]_i__0 I0[2]
load net TowardsConvUnit[2][6][8] -attr @rip 8 -port TowardsConvUnit[2][6][8] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst O[8]
load net TowardsConvUnit[3][0][5] -attr @rip 5 -port TowardsConvUnit[3][0][5] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst O[5]
load net TowardsConvUnit[2][4][13] -attr @rip 13 -port TowardsConvUnit[2][4][13] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst O[13]
load net TowardsConvUnit_FF[0][0] -pin TowardsConvUnit_FF[0][7:0]_i O[0] -pin TowardsConvUnit_FF_reg[0][0][17:0] RST
load net BRAMWord[0][5][1] -attr @rip BRAMWord[0][5][1] -port BRAMWord[0][5][1] -pin BRAMWord[0][5]_i I0[1] -pin BRAMWord[0][5]_i__0 I0[1]
load net MuxSelect[0][0] -attr @rip MuxSelect[0][0] -pin BRAMWord[0][0]_i S -pin BRAMWord[0][1]_i S -pin BRAMWord[0][2]_i S -pin BRAMWord[0][3]_i S -pin BRAMWord[0][4]_i S -pin BRAMWord[0][5]_i S -pin BRAMWord[0][6]_i S -pin BRAMWord[0][7]_i S -port MuxSelect[0][0]
netloc MuxSelect[0][0] 1 0 1 100
load net TowardsConvUnit[2][4][15] -attr @rip 15 -port TowardsConvUnit[2][4][15] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst O[15]
load net TowardsConvUnit[0][2]_OBUF[15] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[0][2][17:0] Q[15]
load net TowardsConvUnit[1][4][14] -attr @rip 14 -port TowardsConvUnit[1][4][14] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst O[14]
load net TowardsConvUnit[1][4]_OBUF[4] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[1][4][17:0] Q[4]
load net BRAMWord[0][1][0] -attr @rip BRAMWord[0][1][0] -port BRAMWord[0][1][0] -pin BRAMWord[0][1]_i I0[0] -pin BRAMWord[0][1]_i__0 I0[0]
load net TowardsConvUnit[2][3][11] -attr @rip 11 -port TowardsConvUnit[2][3][11] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst O[11]
load net TowardsConvUnit[3][7][13] -attr @rip 13 -port TowardsConvUnit[3][7][13] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst O[13]
load net BRAMWord[0][3]0_out[13] -attr @rip O[13] -pin BRAMWord[0][3]_i O[13] -pin TowardsConvUnit_FF_reg[0][3][17:0] D[13] -pin TowardsConvUnit_FF_reg[2][3][17:0] D[13]
load net TowardsConvUnit_FF[3][5] -pin TowardsConvUnit_FF[3][7:0]_i O[5] -pin TowardsConvUnit_FF_reg[3][5][17:0] RST
load net TowardsConvUnit[0][3]_OBUF[12] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[0][3][17:0] Q[12]
load net BRAMWord[0][0]0_out[1] -attr @rip O[1] -pin BRAMWord[0][0]_i O[1] -pin TowardsConvUnit_FF_reg[0][0][17:0] D[1] -pin TowardsConvUnit_FF_reg[2][0][17:0] D[1]
load net TowardsConvUnit[1][5][12] -attr @rip 12 -port TowardsConvUnit[1][5][12] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst O[12]
load net TowardsConvUnit[3][5][11] -attr @rip 11 -port TowardsConvUnit[3][5][11] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst O[11]
load net BRAMWord[1][5][9] -attr @rip BRAMWord[1][5][9] -pin BRAMWord[0][5]_i I1[9] -pin BRAMWord[0][5]_i__0 I1[9] -port BRAMWord[1][5][9]
load net TowardsConvUnit[0][7][0] -attr @rip 0 -port TowardsConvUnit[0][7][0] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst O[0]
load net TowardsConvUnit[0][3][3] -attr @rip 3 -port TowardsConvUnit[0][3][3] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst O[3]
load net TowardsConvUnit[0][3]_OBUF[2] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[0][3][17:0] Q[2]
load net TowardsConvUnit[2][3]_OBUF[6] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[2][3][17:0] Q[6]
load net TowardsConvUnit[3][4]_OBUF[0] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[3][4][17:0] Q[0]
load net TowardsConvUnit[3][4]_OBUF[13] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[3][4][17:0] Q[13]
load net TowardsConvUnit[0][2][10] -attr @rip 10 -port TowardsConvUnit[0][2][10] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst O[10]
load net TowardsConvUnit[0][2][8] -attr @rip 8 -port TowardsConvUnit[0][2][8] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst O[8]
load net BRAMWord[1][4][17] -attr @rip BRAMWord[1][4][17] -pin BRAMWord[0][4]_i I1[17] -pin BRAMWord[0][4]_i__0 I1[17] -port BRAMWord[1][4][17]
load net TowardsConvUnit[3][2][9] -attr @rip 9 -port TowardsConvUnit[3][2][9] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst O[9]
load net BRAMWord[0][2][3] -attr @rip BRAMWord[0][2][3] -port BRAMWord[0][2][3] -pin BRAMWord[0][2]_i I0[3] -pin BRAMWord[0][2]_i__0 I0[3]
load net TowardsConvUnit[1][6][15] -attr @rip 15 -port TowardsConvUnit[1][6][15] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst O[15]
load net TowardsConvUnit[3][0][4] -attr @rip 4 -port TowardsConvUnit[3][0][4] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst O[4]
load net TowardsConvUnit[3][7][9] -attr @rip 9 -port TowardsConvUnit[3][7][9] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst O[9]
load net TowardsConvUnit[3][5]_OBUF[7] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[3][5][17:0] Q[7]
load net BRAMWord[0][7][3] -attr @rip BRAMWord[0][7][3] -port BRAMWord[0][7][3] -pin BRAMWord[0][7]_i I0[3] -pin BRAMWord[0][7]_i__0 I0[3]
load net TowardsConvUnit[2][6][9] -attr @rip 9 -port TowardsConvUnit[2][6][9] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst O[9]
load net BRAMWord[0][5][0] -attr @rip BRAMWord[0][5][0] -port BRAMWord[0][5][0] -pin BRAMWord[0][5]_i I0[0] -pin BRAMWord[0][5]_i__0 I0[0]
load net BRAMWord[0][6]0_out[12] -attr @rip O[12] -pin BRAMWord[0][6]_i O[12] -pin TowardsConvUnit_FF_reg[0][6][17:0] D[12] -pin TowardsConvUnit_FF_reg[2][6][17:0] D[12]
load net BRAMWord[0][0]_i__0_n_10 -attr @rip O[7] -pin BRAMWord[0][0]_i__0 O[7] -pin TowardsConvUnit_FF_reg[1][0][17:0] D[7] -pin TowardsConvUnit_FF_reg[3][0][17:0] D[7]
load net TowardsConvUnit[1][1]_OBUF[1] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[1][1][17:0] Q[1]
load net TowardsConvUnit[2][4][14] -attr @rip 14 -port TowardsConvUnit[2][4][14] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst O[14]
load net TowardsConvUnit[2][6]_OBUF[9] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[2][6][17:0] Q[9]
load net TowardsConvUnit_FF[0][1] -pin TowardsConvUnit_FF[0][7:0]_i O[1] -pin TowardsConvUnit_FF_reg[0][1][17:0] RST
load net TowardsConvUnit[0][7][16] -attr @rip 16 -port TowardsConvUnit[0][7][16] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst O[16]
load net BRAMWord[0][0]_i__0_n_11 -attr @rip O[6] -pin BRAMWord[0][0]_i__0 O[6] -pin TowardsConvUnit_FF_reg[1][0][17:0] D[6] -pin TowardsConvUnit_FF_reg[3][0][17:0] D[6]
load net TowardsConvUnit[1][4][13] -attr @rip 13 -port TowardsConvUnit[1][4][13] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst O[13]
load net TowardsConvUnit[1][7][8] -attr @rip 8 -port TowardsConvUnit[1][7][8] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst O[8]
load net BRAMWord[0][0]_i__0_n_12 -attr @rip O[5] -pin BRAMWord[0][0]_i__0 O[5] -pin TowardsConvUnit_FF_reg[1][0][17:0] D[5] -pin TowardsConvUnit_FF_reg[3][0][17:0] D[5]
load net TowardsConvUnit[1][4]_OBUF[3] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[1][4][17:0] Q[3]
load net BRAMWord[0][0]_i__0_n_13 -attr @rip O[4] -pin BRAMWord[0][0]_i__0 O[4] -pin TowardsConvUnit_FF_reg[1][0][17:0] D[4] -pin TowardsConvUnit_FF_reg[3][0][17:0] D[4]
load net TowardsConvUnit[0][2]_OBUF[16] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[0][2][17:0] Q[16]
load net BRAMWord[0][0]_i__0_n_14 -attr @rip O[3] -pin BRAMWord[0][0]_i__0 O[3] -pin TowardsConvUnit_FF_reg[1][0][17:0] D[3] -pin TowardsConvUnit_FF_reg[3][0][17:0] D[3]
load net BRAMWord[0][0]_i__0_n_15 -attr @rip O[2] -pin BRAMWord[0][0]_i__0 O[2] -pin TowardsConvUnit_FF_reg[1][0][17:0] D[2] -pin TowardsConvUnit_FF_reg[3][0][17:0] D[2]
load net TowardsConvUnit[0][3][0] -attr @rip 0 -port TowardsConvUnit[0][3][0] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst O[0]
load net TowardsConvUnit[1][4][17] -attr @rip 17 -port TowardsConvUnit[1][4][17] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst O[17]
load net TowardsConvUnit[2][3][12] -attr @rip 12 -port TowardsConvUnit[2][3][12] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst O[12]
load net BRAMWord[0][0]0_out[0] -attr @rip O[0] -pin BRAMWord[0][0]_i O[0] -pin TowardsConvUnit_FF_reg[0][0][17:0] D[0] -pin TowardsConvUnit_FF_reg[2][0][17:0] D[0]
load net BRAMWord[0][0]_i__0_n_16 -attr @rip O[1] -pin BRAMWord[0][0]_i__0 O[1] -pin TowardsConvUnit_FF_reg[1][0][17:0] D[1] -pin TowardsConvUnit_FF_reg[3][0][17:0] D[1]
load net TowardsConvUnit[1][6]_OBUF[0] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[1][6][17:0] Q[0]
load net TowardsConvUnit[3][5][10] -attr @rip 10 -port TowardsConvUnit[3][5][10] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst O[10]
load net TowardsConvUnit[3][7][14] -attr @rip 14 -port TowardsConvUnit[3][7][14] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst O[14]
load net BRAMWord[0][0]_i__0_n_17 -attr @rip O[0] -pin BRAMWord[0][0]_i__0 O[0] -pin TowardsConvUnit_FF_reg[1][0][17:0] D[0] -pin TowardsConvUnit_FF_reg[3][0][17:0] D[0]
load net TowardsConvUnit[3][1]_OBUF[9] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[3][1][17:0] Q[9]
load net TowardsConvUnit_FF[3][6] -pin TowardsConvUnit_FF[3][7:0]_i O[6] -pin TowardsConvUnit_FF_reg[3][6][17:0] RST
load net TowardsConvUnit[0][6]_OBUF[0] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[0][6][17:0] Q[0]
load net TowardsConvUnit[3][4]_OBUF[10] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[3][4][17:0] Q[10]
load net TowardsConvUnit[3][7]_OBUF[10] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[3][7][17:0] Q[10]
load net BRAMWord[0][5]0_out[16] -attr @rip O[16] -pin BRAMWord[0][5]_i O[16] -pin TowardsConvUnit_FF_reg[0][5][17:0] D[16] -pin TowardsConvUnit_FF_reg[2][5][17:0] D[16]
load net TowardsConvUnit[0][7][1] -attr @rip 1 -port TowardsConvUnit[0][7][1] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst O[1]
load net TowardsConvUnit[1][0]_OBUF[9] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[1][0][17:0] Q[9]
load net TowardsConvUnit[0][2][7] -attr @rip 7 -port TowardsConvUnit[0][2][7] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst O[7]
load net TowardsConvUnit[1][6][8] -attr @rip 8 -port TowardsConvUnit[1][6][8] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst O[8]
load net TowardsConvUnit[0][2][11] -attr @rip 11 -port TowardsConvUnit[0][2][11] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst O[11]
load net TowardsConvUnit[3][5]_OBUF[6] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[3][5][17:0] Q[6]
load net BRAMWord[0][2][4] -attr @rip BRAMWord[0][2][4] -port BRAMWord[0][2][4] -pin BRAMWord[0][2]_i I0[4] -pin BRAMWord[0][2]_i__0 I0[4]
load net TowardsConvUnit[1][6][16] -attr @rip 16 -port TowardsConvUnit[1][6][16] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst O[16]
load net BRAMWord[0][6]0_out[11] -attr @rip O[11] -pin BRAMWord[0][6]_i O[11] -pin TowardsConvUnit_FF_reg[0][6][17:0] D[11] -pin TowardsConvUnit_FF_reg[2][6][17:0] D[11]
load net TowardsConvUnit[1][1]_OBUF[0] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[1][1][17:0] Q[0]
load net TowardsConvUnit[2][6]_OBUF[8] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[2][6][17:0] Q[8]
load net TowardsConvUnit[0][7][15] -attr @rip 15 -port TowardsConvUnit[0][7][15] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst O[15]
load net BRAMWord[0][1]0_out[14] -attr @rip O[14] -pin BRAMWord[0][1]_i O[14] -pin TowardsConvUnit_FF_reg[0][1][17:0] D[14] -pin TowardsConvUnit_FF_reg[2][1][17:0] D[14]
load net TowardsConvUnit[1][7][7] -attr @rip 7 -port TowardsConvUnit[1][7][7] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst O[7]
load net TowardsConvUnit[3][0][7] -attr @rip 7 -port TowardsConvUnit[3][0][7] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst O[7]
load net BRAMWord[1][3][17] -attr @rip BRAMWord[1][3][17] -pin BRAMWord[0][3]_i I1[17] -pin BRAMWord[0][3]_i__0 I1[17] -port BRAMWord[1][3][17]
load net TowardsConvUnit[2][4][17] -attr @rip 17 -port TowardsConvUnit[2][4][17] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst O[17]
load net TowardsConvUnit[0][6][17] -attr @rip 17 -port TowardsConvUnit[0][6][17] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst O[17]
load net BRAMWord[1][3][0] -attr @rip BRAMWord[1][3][0] -pin BRAMWord[0][3]_i I1[0] -pin BRAMWord[0][3]_i__0 I1[0] -port BRAMWord[1][3][0]
load net TowardsConvUnit[1][4]_OBUF[6] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[1][4][17:0] Q[6]
load net TowardsConvUnit_FF[0][6] -pin TowardsConvUnit_FF[0][7:0]_i O[6] -pin TowardsConvUnit_FF_reg[0][6][17:0] RST
load net TowardsConvUnit[0][3][1] -attr @rip 1 -port TowardsConvUnit[0][3][1] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst O[1]
load net TowardsConvUnit[0][2][2] -attr @rip 2 -port TowardsConvUnit[0][2][2] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst O[2]
load net TowardsConvUnit[2][3][13] -attr @rip 13 -port TowardsConvUnit[2][3][13] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst O[13]
load net TowardsConvUnit[3][1]_OBUF[8] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[3][1][17:0] Q[8]
load net TowardsConvUnit[0][3]_OBUF[0] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[0][3][17:0] Q[0]
load net TowardsConvUnit[3][7][15] -attr @rip 15 -port TowardsConvUnit[3][7][15] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst O[15]
load net BRAMWord[0][4]0_out[1] -attr @rip O[1] -pin BRAMWord[0][4]_i O[1] -pin TowardsConvUnit_FF_reg[0][4][17:0] D[1] -pin TowardsConvUnit_FF_reg[2][4][17:0] D[1]
load net TowardsConvUnit[3][0]_OBUF[8] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[3][0][17:0] Q[8]
load net TowardsConvUnit[3][5]_OBUF[1] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[3][5][17:0] Q[1]
load net TowardsConvUnit_FF[3][7] -pin TowardsConvUnit_FF[3][7:0]_i O[7] -pin TowardsConvUnit_FF_reg[3][7][17:0] RST
load net TowardsConvUnit[0][6]_OBUF[1] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[0][6][17:0] Q[1]
load net TowardsConvUnit[2][6][3] -attr @rip 3 -port TowardsConvUnit[2][6][3] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst O[3]
load net TowardsConvUnit[3][4]_OBUF[11] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[3][4][17:0] Q[11]
load net BRAMWord[0][5]0_out[17] -attr @rip O[17] -pin BRAMWord[0][5]_i O[17] -pin TowardsConvUnit_FF_reg[0][5][17:0] D[17] -pin TowardsConvUnit_FF_reg[2][5][17:0] D[17]
load net BRAMWord[1][0][7] -attr @rip BRAMWord[1][0][7] -pin BRAMWord[0][0]_i I1[7] -pin BRAMWord[0][0]_i__0 I1[7] -port BRAMWord[1][0][7]
load net TowardsConvUnit[0][7][2] -attr @rip 2 -port TowardsConvUnit[0][7][2] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst O[2]
load net TowardsConvUnit[1][0][7] -attr @rip 7 -port TowardsConvUnit[1][0][7] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst O[7]
load net BRAMWord[0][0]0_out[7] -attr @rip O[7] -pin BRAMWord[0][0]_i O[7] -pin TowardsConvUnit_FF_reg[0][0][17:0] D[7] -pin TowardsConvUnit_FF_reg[2][0][17:0] D[7]
load net TowardsConvUnit[1][6][9] -attr @rip 9 -port TowardsConvUnit[1][6][9] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst O[9]
load net TowardsConvUnit[0][2][12] -attr @rip 12 -port TowardsConvUnit[0][2][12] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst O[12]
load net TowardsConvUnit[1][6][17] -attr @rip 17 -port TowardsConvUnit[1][6][17] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst O[17]
load net TowardsConvUnit[3][0][6] -attr @rip 6 -port TowardsConvUnit[3][0][6] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst O[6]
load net BRAMWord[1][3][16] -attr @rip BRAMWord[1][3][16] -pin BRAMWord[0][3]_i I1[16] -pin BRAMWord[0][3]_i__0 I1[16] -port BRAMWord[1][3][16]
load net BRAMWord[0][1]0_out[15] -attr @rip O[15] -pin BRAMWord[0][1]_i O[15] -pin TowardsConvUnit_FF_reg[0][1][17:0] D[15] -pin TowardsConvUnit_FF_reg[2][1][17:0] D[15]
load net TowardsConvUnit[3][1][16] -attr @rip 16 -port TowardsConvUnit[3][1][16] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst O[16]
load net BRAMWord[1][1][12] -attr @rip BRAMWord[1][1][12] -pin BRAMWord[0][1]_i I1[12] -pin BRAMWord[0][1]_i__0 I1[12] -port BRAMWord[1][1][12]
load net BRAMWord[0][6]0_out[14] -attr @rip O[14] -pin BRAMWord[0][6]_i O[14] -pin TowardsConvUnit_FF_reg[0][6][17:0] D[14] -pin TowardsConvUnit_FF_reg[2][6][17:0] D[14]
load net TowardsConvUnit[2][4][16] -attr @rip 16 -port TowardsConvUnit[2][4][16] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst O[16]
load net TowardsConvUnit[0][0]_OBUF[6] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[0][0][17:0] Q[6]
load net TowardsConvUnit[0][6][16] -attr @rip 16 -port TowardsConvUnit[0][6][16] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst O[16]
load net TowardsConvUnit[1][4][15] -attr @rip 15 -port TowardsConvUnit[1][4][15] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst O[15]
load net TowardsConvUnit[1][4]_OBUF[5] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[1][4][17:0] Q[5]
load net TowardsConvUnit[3][4][10] -attr @rip 10 -port TowardsConvUnit[3][4][10] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst O[10]
load net TowardsConvUnit[0][2][1] -attr @rip 1 -port TowardsConvUnit[0][2][1] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst O[1]
load net TowardsConvUnit[3][1]_OBUF[7] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[3][1][17:0] Q[7]
load net TowardsConvUnit_FF[0][7] -pin TowardsConvUnit_FF[0][7:0]_i O[7] -pin TowardsConvUnit_FF_reg[0][7][17:0] RST
load net BRAMWord[0][4]0_out[0] -attr @rip O[0] -pin BRAMWord[0][4]_i O[0] -pin TowardsConvUnit_FF_reg[0][4][17:0] D[0] -pin TowardsConvUnit_FF_reg[2][4][17:0] D[0]
load net TowardsConvUnit[2][3][14] -attr @rip 14 -port TowardsConvUnit[2][3][14] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst O[14]
load net TowardsConvUnit[3][0]_OBUF[7] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[3][0][17:0] Q[7]
load net TowardsConvUnit[3][5]_OBUF[0] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[3][5][17:0] Q[0]
load net TowardsConvUnit[1][3][13] -attr @rip 13 -port TowardsConvUnit[1][3][13] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst O[13]
load net TowardsConvUnit[3][7][16] -attr @rip 16 -port TowardsConvUnit[3][7][16] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst O[16]
load net BRAMWord[1][0][6] -attr @rip BRAMWord[1][0][6] -pin BRAMWord[0][0]_i I1[6] -pin BRAMWord[0][0]_i__0 I1[6] -port BRAMWord[1][0][6]
load net TowardsConvUnit[2][2][17] -attr @rip 17 -port TowardsConvUnit[2][2][17] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst O[17]
load net TowardsConvUnit[2][6][4] -attr @rip 4 -port TowardsConvUnit[2][6][4] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst O[4]
load net TowardsConvUnit[3][7][6] -attr @rip 6 -port TowardsConvUnit[3][7][6] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst O[6]
load net TowardsConvUnit[3][7]_OBUF[12] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[3][7][17:0] Q[12]
load net TowardsConvUnit[1][0][6] -attr @rip 6 -port TowardsConvUnit[1][0][6] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst O[6]
load net TowardsConvUnit[0][7][3] -attr @rip 3 -port TowardsConvUnit[0][7][3] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst O[3]
load net BRAMWord[0][0]0_out[6] -attr @rip O[6] -pin BRAMWord[0][0]_i O[6] -pin TowardsConvUnit_FF_reg[0][0][17:0] D[6] -pin TowardsConvUnit_FF_reg[2][0][17:0] D[6]
load net BRAMWord[0][7]0_out[16] -attr @rip O[16] -pin BRAMWord[0][7]_i O[16] -pin TowardsConvUnit_FF_reg[0][7][17:0] D[16] -pin TowardsConvUnit_FF_reg[2][7][17:0] D[16]
load net TowardsConvUnit[1][2]_OBUF[0] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[1][2][17:0] Q[0]
load net TowardsConvUnit[0][7][5] -attr @rip 5 -port TowardsConvUnit[0][7][5] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst O[5]
load net BRAMWord[0][1]0_out[12] -attr @rip O[12] -pin BRAMWord[0][1]_i O[12] -pin TowardsConvUnit_FF_reg[0][1][17:0] D[12] -pin TowardsConvUnit_FF_reg[2][1][17:0] D[12]
load net TowardsConvUnit[3][4]_OBUF[16] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[3][4][17:0] Q[16]
load net BRAMWord[1][3][15] -attr @rip BRAMWord[1][3][15] -pin BRAMWord[0][3]_i I1[15] -pin BRAMWord[0][3]_i__0 I1[15] -port BRAMWord[1][3][15]
load net TowardsConvUnit[0][2][13] -attr @rip 13 -port TowardsConvUnit[0][2][13] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst O[13]
load net TowardsConvUnit[1][4]_OBUF[0] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[1][4][17:0] Q[0]
load net BRAMWord[0][0]0_out[14] -attr @rip O[14] -pin BRAMWord[0][0]_i O[14] -pin TowardsConvUnit_FF_reg[0][0][17:0] D[14] -pin TowardsConvUnit_FF_reg[2][0][17:0] D[14]
load net TowardsConvUnit[0][5][7] -attr @rip 7 -port TowardsConvUnit[0][5][7] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst O[7]
load net BRAMWord[0][7]_i__0_n_0 -attr @rip O[17] -pin BRAMWord[0][7]_i__0 O[17] -pin TowardsConvUnit_FF_reg[1][7][17:0] D[17] -pin TowardsConvUnit_FF_reg[3][7][17:0] D[17]
load net BRAMWord[0][6]0_out[13] -attr @rip O[13] -pin BRAMWord[0][6]_i O[13] -pin TowardsConvUnit_FF_reg[0][6][17:0] D[13] -pin TowardsConvUnit_FF_reg[2][6][17:0] D[13]
load net BRAMWord[0][7]_i__0_n_1 -attr @rip O[16] -pin BRAMWord[0][7]_i__0 O[16] -pin TowardsConvUnit_FF_reg[1][7][17:0] D[16] -pin TowardsConvUnit_FF_reg[3][7][17:0] D[16]
load net TowardsConvUnit[0][7][17] -attr @rip 17 -port TowardsConvUnit[0][7][17] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst O[17]
load net TowardsConvUnit[0][6][15] -attr @rip 15 -port TowardsConvUnit[0][6][15] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst O[15]
load net TowardsConvUnit[1][7][9] -attr @rip 9 -port TowardsConvUnit[1][7][9] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst O[9]
load net TowardsConvUnit[3][1][17] -attr @rip 17 -port TowardsConvUnit[3][1][17] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst O[17]
load net BRAMWord[0][7]_i__0_n_2 -attr @rip O[15] -pin BRAMWord[0][7]_i__0 O[15] -pin TowardsConvUnit_FF_reg[1][7][17:0] D[15] -pin TowardsConvUnit_FF_reg[3][7][17:0] D[15]
load net BRAMWord[1][1][13] -attr @rip BRAMWord[1][1][13] -pin BRAMWord[0][1]_i I1[13] -pin BRAMWord[0][1]_i__0 I1[13] -port BRAMWord[1][1][13]
load net TowardsConvUnit_FF[0][4] -pin TowardsConvUnit_FF[0][7:0]_i O[4] -pin TowardsConvUnit_FF_reg[0][4][17:0] RST
load net BRAMWord[0][7]_i__0_n_3 -attr @rip O[14] -pin BRAMWord[0][7]_i__0 O[14] -pin TowardsConvUnit_FF_reg[1][7][17:0] D[14] -pin TowardsConvUnit_FF_reg[3][7][17:0] D[14]
load net TowardsConvUnit[0][0]_OBUF[7] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[0][0][17:0] Q[7]
load net TowardsConvUnit[1][4][16] -attr @rip 16 -port TowardsConvUnit[1][4][16] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst O[16]
load net TowardsConvUnit[3][1]_OBUF[6] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[3][1][17:0] Q[6]
load net BRAMWord[0][7]_i__0_n_4 -attr @rip O[13] -pin BRAMWord[0][7]_i__0 O[13] -pin TowardsConvUnit_FF_reg[1][7][17:0] D[13] -pin TowardsConvUnit_FF_reg[3][7][17:0] D[13]
load net BRAMWord[0][5][10] -attr @rip BRAMWord[0][5][10] -port BRAMWord[0][5][10] -pin BRAMWord[0][5]_i I0[10] -pin BRAMWord[0][5]_i__0 I0[10]
load net TowardsConvUnit[0][3][11] -attr @rip 11 -port TowardsConvUnit[0][3][11] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst O[11]
load net BRAMWord[0][7]_i__0_n_5 -attr @rip O[12] -pin BRAMWord[0][7]_i__0 O[12] -pin TowardsConvUnit_FF_reg[1][7][17:0] D[12] -pin TowardsConvUnit_FF_reg[3][7][17:0] D[12]
load net TowardsConvUnit[3][0]_OBUF[6] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[3][0][17:0] Q[6]
load net BRAMWord[0][7]_i__0_n_6 -attr @rip O[11] -pin BRAMWord[0][7]_i__0 O[11] -pin TowardsConvUnit_FF_reg[1][7][17:0] D[11] -pin TowardsConvUnit_FF_reg[3][7][17:0] D[11]
load net BRAMWord[1][3][2] -attr @rip BRAMWord[1][3][2] -pin BRAMWord[0][3]_i I1[2] -pin BRAMWord[0][3]_i__0 I1[2] -port BRAMWord[1][3][2]
load net TowardsConvUnit[1][3][12] -attr @rip 12 -port TowardsConvUnit[1][3][12] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst O[12]
load net BRAMWord[0][7]_i__0_n_7 -attr @rip O[10] -pin BRAMWord[0][7]_i__0 O[10] -pin TowardsConvUnit_FF_reg[1][7][17:0] D[10] -pin TowardsConvUnit_FF_reg[3][7][17:0] D[10]
load net TowardsConvUnit[0][2][4] -attr @rip 4 -port TowardsConvUnit[0][2][4] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst O[4]
load net TowardsConvUnit[1][6]_OBUF[9] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[1][6][17:0] Q[9]
load net TowardsConvUnit[2][2][16] -attr @rip 16 -port TowardsConvUnit[2][2][16] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst O[16]
load net BRAMWord[0][7]_i__0_n_8 -attr @rip O[9] -pin BRAMWord[0][7]_i__0 O[9] -pin TowardsConvUnit_FF_reg[1][7][17:0] D[9] -pin TowardsConvUnit_FF_reg[3][7][17:0] D[9]
load net BRAMWord[0][3]0_out[0] -attr @rip O[0] -pin BRAMWord[0][3]_i O[0] -pin TowardsConvUnit_FF_reg[0][3][17:0] D[0] -pin TowardsConvUnit_FF_reg[2][3][17:0] D[0]
load net TowardsConvUnit[3][7][17] -attr @rip 17 -port TowardsConvUnit[3][7][17] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst O[17]
load net TowardsConvUnit[3][7][5] -attr @rip 5 -port TowardsConvUnit[3][7][5] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst O[5]
load net TowardsConvUnit[3][7]_OBUF[11] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[3][7][17:0] Q[11]
load net TowardsConvUnit[0][7]_OBUF[0] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[0][7][17:0] Q[0]
load net BRAMWord[0][7]_i__0_n_9 -attr @rip O[8] -pin BRAMWord[0][7]_i__0 O[8] -pin TowardsConvUnit_FF_reg[1][7][17:0] D[8] -pin TowardsConvUnit_FF_reg[3][7][17:0] D[8]
load net BRAMWord[0][4]0_out[3] -attr @rip O[3] -pin BRAMWord[0][4]_i O[3] -pin TowardsConvUnit_FF_reg[0][4][17:0] D[3] -pin TowardsConvUnit_FF_reg[2][4][17:0] D[3]
load net TowardsConvUnit[1][1][9] -attr @rip 9 -port TowardsConvUnit[1][1][9] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst O[9]
load net TowardsConvUnit[3][2]_OBUF[9] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[3][2][17:0] Q[9]
load net TowardsConvUnit[3][5]_OBUF[3] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[3][5][17:0] Q[3]
load net BRAMWord[0][0]0_out[5] -attr @rip O[5] -pin BRAMWord[0][0]_i O[5] -pin TowardsConvUnit_FF_reg[0][0][17:0] D[5] -pin TowardsConvUnit_FF_reg[2][0][17:0] D[5]
load net TowardsConvUnit[0][0][2] -attr @rip 2 -port TowardsConvUnit[0][0][2] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst O[2]
load net TowardsConvUnit[2][6][5] -attr @rip 5 -port TowardsConvUnit[2][6][5] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst O[5]
load net TowardsConvUnit[0][7][4] -attr @rip 4 -port TowardsConvUnit[0][7][4] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst O[4]
load net BRAMWord[1][0][9] -attr @rip BRAMWord[1][0][9] -pin BRAMWord[0][0]_i I1[9] -pin BRAMWord[0][0]_i__0 I1[9] -port BRAMWord[1][0][9]
load net BRAMWord[0][7]0_out[17] -attr @rip O[17] -pin BRAMWord[0][7]_i O[17] -pin TowardsConvUnit_FF_reg[0][7][17:0] D[17] -pin TowardsConvUnit_FF_reg[2][7][17:0] D[17]
load net TowardsConvUnit[1][7][4] -attr @rip 4 -port TowardsConvUnit[1][7][4] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst O[4]
load net TowardsConvUnit[2][3]_OBUF[11] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[2][3][17:0] Q[11]
load net BRAMWord[1][3][14] -attr @rip BRAMWord[1][3][14] -pin BRAMWord[0][3]_i I1[14] -pin BRAMWord[0][3]_i__0 I1[14] -port BRAMWord[1][3][14]
load net TowardsConvUnit[1][0][9] -attr @rip 9 -port TowardsConvUnit[1][0][9] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst O[9]
load net BRAMWord[0][1]0_out[13] -attr @rip O[13] -pin BRAMWord[0][1]_i O[13] -pin TowardsConvUnit_FF_reg[0][1][17:0] D[13] -pin TowardsConvUnit_FF_reg[2][1][17:0] D[13]
load net BRAMWord[0][0]0_out[13] -attr @rip O[13] -pin BRAMWord[0][0]_i O[13] -pin TowardsConvUnit_FF_reg[0][0][17:0] D[13] -pin TowardsConvUnit_FF_reg[2][0][17:0] D[13]
load net TowardsConvUnit[0][5][6] -attr @rip 6 -port TowardsConvUnit[0][5][6] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst O[6]
load net TowardsConvUnit[3][4]_OBUF[17] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[3][4][17:0] Q[17]
load net TowardsConvUnit[0][2][14] -attr @rip 14 -port TowardsConvUnit[0][2][14] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst O[14]
load net BRAMWord[1][1][10] -attr @rip BRAMWord[1][1][10] -pin BRAMWord[0][1]_i I1[10] -pin BRAMWord[0][1]_i__0 I1[10] -port BRAMWord[1][1][10]
load net TowardsConvUnit[0][0]_OBUF[4] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[0][0][17:0] Q[4]
load net TowardsConvUnit[0][6][14] -attr @rip 14 -port TowardsConvUnit[0][6][14] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst O[14]
load net TowardsConvUnit[2][7][0] -attr @rip 0 -port TowardsConvUnit[2][7][0] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst O[0]
load net BRAMWord[0][6]0_out[3] -attr @rip O[3] -pin BRAMWord[0][6]_i O[3] -pin TowardsConvUnit_FF_reg[0][6][17:0] D[3] -pin TowardsConvUnit_FF_reg[2][6][17:0] D[3]
load net TowardsConvUnit[3][1]_OBUF[5] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[3][1][17:0] Q[5]
load net BRAMWord[0][6]0_out[16] -attr @rip O[16] -pin BRAMWord[0][6]_i O[16] -pin TowardsConvUnit_FF_reg[0][6][17:0] D[16] -pin TowardsConvUnit_FF_reg[2][6][17:0] D[16]
load net BRAMWord[0][1][15] -attr @rip BRAMWord[0][1][15] -port BRAMWord[0][1][15] -pin BRAMWord[0][1]_i I0[15] -pin BRAMWord[0][1]_i__0 I0[15]
load net TowardsConvUnit[1][1]_OBUF[5] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[1][1][17:0] Q[5]
load net TowardsConvUnit_FF[0][5] -pin TowardsConvUnit_FF[0][7:0]_i O[5] -pin TowardsConvUnit_FF_reg[0][5][17:0] RST
load net BRAMWord[0][5]0_out[12] -attr @rip O[12] -pin BRAMWord[0][5]_i O[12] -pin TowardsConvUnit_FF_reg[0][5][17:0] D[12] -pin TowardsConvUnit_FF_reg[2][5][17:0] D[12]
load net TowardsConvUnit[3][0]_OBUF[5] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[3][0][17:0] Q[5]
load net BRAMWord[1][3][1] -attr @rip BRAMWord[1][3][1] -pin BRAMWord[0][3]_i I1[1] -pin BRAMWord[0][3]_i__0 I1[1] -port BRAMWord[1][3][1]
load net TowardsConvUnit[3][4][12] -attr @rip 12 -port TowardsConvUnit[3][4][12] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst O[12]
load net TowardsConvUnit[0][3][12] -attr @rip 12 -port TowardsConvUnit[0][3][12] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst O[12]
load net TowardsConvUnit[0][2][3] -attr @rip 3 -port TowardsConvUnit[0][2][3] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst O[3]
load net BRAMWord[0][4]0_out[2] -attr @rip O[2] -pin BRAMWord[0][4]_i O[2] -pin TowardsConvUnit_FF_reg[0][4][17:0] D[2] -pin TowardsConvUnit_FF_reg[2][4][17:0] D[2]
load net TowardsConvUnit[3][2]_OBUF[8] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[3][2][17:0] Q[8]
load net TowardsConvUnit[3][5]_OBUF[2] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[3][5][17:0] Q[2]
load net BRAMWord[0][0]0_out[4] -attr @rip O[4] -pin BRAMWord[0][0]_i O[4] -pin TowardsConvUnit_FF_reg[0][0][17:0] D[4] -pin TowardsConvUnit_FF_reg[2][0][17:0] D[4]
load net BRAMWord[0][7]0_out[14] -attr @rip O[14] -pin BRAMWord[0][7]_i O[14] -pin TowardsConvUnit_FF_reg[0][7][17:0] D[14] -pin TowardsConvUnit_FF_reg[2][7][17:0] D[14]
load net TowardsConvUnit[0][0][1] -attr @rip 1 -port TowardsConvUnit[0][0][1] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst O[1]
load net TowardsConvUnit[1][3][15] -attr @rip 15 -port TowardsConvUnit[1][3][15] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst O[15]
load net BRAMWord[1][0][8] -attr @rip BRAMWord[1][0][8] -pin BRAMWord[0][0]_i I1[8] -pin BRAMWord[0][0]_i__0 I1[8] -port BRAMWord[1][0][8]
load net TowardsConvUnit[0][6]_OBUF[4] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[0][6][17:0] Q[4]
load net TowardsConvUnit[1][7][3] -attr @rip 3 -port TowardsConvUnit[1][7][3] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst O[3]
load net TowardsConvUnit[2][3]_OBUF[10] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[2][3][17:0] Q[10]
load net TowardsConvUnit[2][6][6] -attr @rip 6 -port TowardsConvUnit[2][6][6] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst O[6]
load net TowardsConvUnit[3][4]_OBUF[14] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[3][4][17:0] Q[14]
load net TowardsConvUnit[3][7][8] -attr @rip 8 -port TowardsConvUnit[3][7][8] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst O[8]
load net TowardsConvUnit[3][7]_OBUF[14] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[3][7][17:0] Q[14]
load net BRAMWord[1][3][13] -attr @rip BRAMWord[1][3][13] -pin BRAMWord[0][3]_i I1[13] -pin BRAMWord[0][3]_i__0 I1[13] -port BRAMWord[1][3][13]
load net TowardsConvUnit[1][0][8] -attr @rip 8 -port TowardsConvUnit[1][0][8] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst O[8]
load net TowardsConvUnit[1][2]_OBUF[2] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[1][2][17:0] Q[2]
load net TowardsConvUnit[0][7][7] -attr @rip 7 -port TowardsConvUnit[0][7][7] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst O[7]
load net BRAMWord[0][5][8] -attr @rip BRAMWord[0][5][8] -port BRAMWord[0][5][8] -pin BRAMWord[0][5]_i I0[8] -pin BRAMWord[0][5]_i__0 I0[8]
load net BRAMWord[0][6]0_out[2] -attr @rip O[2] -pin BRAMWord[0][6]_i O[2] -pin TowardsConvUnit_FF_reg[0][6][17:0] D[2] -pin TowardsConvUnit_FF_reg[2][6][17:0] D[2]
load net TowardsConvUnit[1][0]_OBUF[0] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[1][0][17:0] Q[0]
load net TowardsConvUnit[0][2][15] -attr @rip 15 -port TowardsConvUnit[0][2][15] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst O[15]
load net BRAMWord[1][1][11] -attr @rip BRAMWord[1][1][11] -pin BRAMWord[0][1]_i I1[11] -pin BRAMWord[0][1]_i__0 I1[11] -port BRAMWord[1][1][11]
load net TowardsConvUnit[1][4]_OBUF[2] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[1][4][17:0] Q[2]
load net TowardsConvUnit_FF[1][4] -pin TowardsConvUnit_FF[1][7:0]_i O[4] -pin TowardsConvUnit_FF_reg[1][4][17:0] RST
load net BRAMWord[0][0]0_out[16] -attr @rip O[16] -pin BRAMWord[0][0]_i O[16] -pin TowardsConvUnit_FF_reg[0][0][17:0] D[16] -pin TowardsConvUnit_FF_reg[2][0][17:0] D[16]
load net TowardsConvUnit[0][5][9] -attr @rip 9 -port TowardsConvUnit[0][5][9] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst O[9]
load net TowardsConvUnit[0][0]_OBUF[5] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[0][0][17:0] Q[5]
load net TowardsConvUnit[1][5]_OBUF[10] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[1][5][17:0] Q[10]
load net TowardsConvUnit[2][7][1] -attr @rip 1 -port TowardsConvUnit[2][7][1] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst O[1]
load net TowardsConvUnit[3][1]_OBUF[4] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[3][1][17:0] Q[4]
load net BRAMWord[0][6]0_out[15] -attr @rip O[15] -pin BRAMWord[0][6]_i O[15] -pin TowardsConvUnit_FF_reg[0][6][17:0] D[15] -pin TowardsConvUnit_FF_reg[2][6][17:0] D[15]
load net TowardsConvUnit[1][1]_OBUF[4] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[1][1][17:0] Q[4]
load net BRAMWord[0][7][8] -attr @rip BRAMWord[0][7][8] -port BRAMWord[0][7][8] -pin BRAMWord[0][7]_i I0[8] -pin BRAMWord[0][7]_i__0 I0[8]
load net BRAMWord[0][1][16] -attr @rip BRAMWord[0][1][16] -port BRAMWord[0][1][16] -pin BRAMWord[0][1]_i I0[16] -pin BRAMWord[0][1]_i__0 I0[16]
load net TowardsConvUnit[3][4][11] -attr @rip 11 -port TowardsConvUnit[3][4][11] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst O[11]
load net BRAMWord[0][5]0_out[13] -attr @rip O[13] -pin BRAMWord[0][5]_i O[13] -pin TowardsConvUnit_FF_reg[0][5][17:0] D[13] -pin TowardsConvUnit_FF_reg[2][5][17:0] D[13]
load net TowardsConvUnit[1][0][3] -attr @rip 3 -port TowardsConvUnit[1][0][3] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst O[3]
load net TowardsConvUnit[3][2]_OBUF[7] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[3][2][17:0] Q[7]
load net TowardsConvUnit[0][0][0] -attr @rip 0 -port TowardsConvUnit[0][0][0] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst O[0]
load net TowardsConvUnit[1][3][14] -attr @rip 14 -port TowardsConvUnit[1][3][14] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst O[14]
load net BRAMWord[0][3]0_out[2] -attr @rip O[2] -pin BRAMWord[0][3]_i O[2] -pin TowardsConvUnit_FF_reg[0][3][17:0] D[2] -pin TowardsConvUnit_FF_reg[2][3][17:0] D[2]
load net BRAMWord[0][7]0_out[15] -attr @rip O[15] -pin BRAMWord[0][7]_i O[15] -pin TowardsConvUnit_FF_reg[0][7][17:0] D[15] -pin TowardsConvUnit_FF_reg[2][7][17:0] D[15]
load net TowardsConvUnit[3][7][7] -attr @rip 7 -port TowardsConvUnit[3][7][7] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst O[7]
load net TowardsConvUnit[3][7]_OBUF[13] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[3][7][17:0] Q[13]
load net BRAMWord[0][4]0_out[5] -attr @rip O[5] -pin BRAMWord[0][4]_i O[5] -pin TowardsConvUnit_FF_reg[0][4][17:0] D[5] -pin TowardsConvUnit_FF_reg[2][4][17:0] D[5]
load net BRAMWord[1][3][12] -attr @rip BRAMWord[1][3][12] -pin BRAMWord[0][3]_i I1[12] -pin BRAMWord[0][3]_i__0 I1[12] -port BRAMWord[1][3][12]
load net TowardsConvUnit[2][0]_OBUF[4] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[2][0][17:0] Q[4]
load net TowardsConvUnit[2][2][2] -attr @rip 2 -port TowardsConvUnit[2][2][2] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst O[2]
load net TowardsConvUnit[0][2]_OBUF[10] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[0][2][17:0] Q[10]
load net TowardsConvUnit[0][6]_OBUF[5] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[0][6][17:0] Q[5]
load net TowardsConvUnit[1][2]_OBUF[1] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[1][2][17:0] Q[1]
load net TowardsConvUnit[3][4]_OBUF[15] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[3][4][17:0] Q[15]
load net BRAMWord[0][4][11] -attr @rip BRAMWord[0][4][11] -port BRAMWord[0][4][11] -pin BRAMWord[0][4]_i I0[11] -pin BRAMWord[0][4]_i__0 I0[11]
load net TowardsConvUnit[0][7][6] -attr @rip 6 -port TowardsConvUnit[0][7][6] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst O[6]
load net TowardsConvUnit[0][4][0] -attr @rip 0 -port TowardsConvUnit[0][4][0] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst O[0]
load net TowardsConvUnit[0][0]_OBUF[2] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[0][0][17:0] Q[2]
load net TowardsConvUnit[1][7][6] -attr @rip 6 -port TowardsConvUnit[1][7][6] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst O[6]
load net TowardsConvUnit[3][6]_OBUF[17] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[3][6][17:0] Q[17]
load net BRAMWord[0][5][9] -attr @rip BRAMWord[0][5][9] -port BRAMWord[0][5][9] -pin BRAMWord[0][5]_i I0[9] -pin BRAMWord[0][5]_i__0 I0[9]
load net TowardsConvUnit[1][4]_OBUF[1] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[1][4][17:0] Q[1]
load net TowardsConvUnit_FF[1][3] -pin TowardsConvUnit_FF[1][7:0]_i O[3] -pin TowardsConvUnit_FF_reg[1][3][17:0] RST
load net BRAMWord[0][0]0_out[15] -attr @rip O[15] -pin BRAMWord[0][0]_i O[15] -pin TowardsConvUnit_FF_reg[0][0][17:0] D[15] -pin TowardsConvUnit_FF_reg[2][0][17:0] D[15]
load net TowardsConvUnit[0][5][8] -attr @rip 8 -port TowardsConvUnit[0][5][8] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst O[8]
load net TowardsConvUnit[3][1]_OBUF[3] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[3][1][17:0] Q[3]
load net TowardsConvUnit[0][2][16] -attr @rip 16 -port TowardsConvUnit[0][2][16] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst O[16]
load net TowardsConvUnit[1][1]_OBUF[3] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[1][1][17:0] Q[3]
load net BRAMWord[0][0][11] -attr @rip BRAMWord[0][0][11] -port BRAMWord[0][0][11] -pin BRAMWord[0][0]_i I0[11] -pin BRAMWord[0][0]_i__0 I0[11]
load net TowardsConvUnit[2][3][10] -attr @rip 10 -port TowardsConvUnit[2][3][10] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst O[10]
load net BRAMWord[0][6]0_out[5] -attr @rip O[5] -pin BRAMWord[0][6]_i O[5] -pin TowardsConvUnit_FF_reg[0][6][17:0] D[5] -pin TowardsConvUnit_FF_reg[2][6][17:0] D[5]
load net TowardsConvUnit[2][1][4] -attr @rip 4 -port TowardsConvUnit[2][1][4] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst O[4]
load net TowardsConvUnit[0][3][10] -attr @rip 10 -port TowardsConvUnit[0][3][10] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst O[10]
load net BRAMWord[0][7][9] -attr @rip BRAMWord[0][7][9] -port BRAMWord[0][7][9] -pin BRAMWord[0][7]_i I0[9] -pin BRAMWord[0][7]_i__0 I0[9]
load net BRAMWord[1][0][2] -attr @rip BRAMWord[1][0][2] -pin BRAMWord[0][0]_i I1[2] -pin BRAMWord[0][0]_i__0 I1[2] -port BRAMWord[1][0][2]
load net TowardsConvUnit[3][5][9] -attr @rip 9 -port TowardsConvUnit[3][5][9] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst O[9]
load net TowardsConvUnit[3][5]_OBUF[17] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[3][5][17:0] Q[17]
load net BRAMWord[0][1][17] -attr @rip BRAMWord[0][1][17] -port BRAMWord[0][1][17] -pin BRAMWord[0][1]_i I0[17] -pin BRAMWord[0][1]_i__0 I0[17]
load net TowardsConvUnit[3][7][2] -attr @rip 2 -port TowardsConvUnit[3][7][2] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst O[2]
load net BRAMWord[0][5]0_out[14] -attr @rip O[14] -pin BRAMWord[0][5]_i O[14] -pin TowardsConvUnit_FF_reg[0][5][17:0] D[14] -pin TowardsConvUnit_FF_reg[2][5][17:0] D[14]
load net TowardsConvUnit[1][0][2] -attr @rip 2 -port TowardsConvUnit[1][0][2] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst O[2]
load net TowardsConvUnit[3][2]_OBUF[6] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[3][2][17:0] Q[6]
load net BRAMWord[0][7]0_out[12] -attr @rip O[12] -pin BRAMWord[0][7]_i O[12] -pin TowardsConvUnit_FF_reg[0][7][17:0] D[12] -pin TowardsConvUnit_FF_reg[2][7][17:0] D[12]
load net TowardsConvUnit[2][6]_OBUF[2] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[2][6][17:0] Q[2]
load net BRAMWord[0][3]0_out[1] -attr @rip O[1] -pin BRAMWord[0][3]_i O[1] -pin TowardsConvUnit_FF_reg[0][3][17:0] D[1] -pin TowardsConvUnit_FF_reg[2][3][17:0] D[1]
load net BRAMWord[0][6][10] -attr @rip BRAMWord[0][6][10] -port BRAMWord[0][6][10] -pin BRAMWord[0][6]_i I0[10] -pin BRAMWord[0][6]_i__0 I0[10]
load net TowardsConvUnit[0][6]_OBUF[2] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[0][6][17:0] Q[2]
load net BRAMWord[0][1]_i__0_n_10 -attr @rip O[7] -pin BRAMWord[0][1]_i__0 O[7] -pin TowardsConvUnit_FF_reg[1][1][17:0] D[7] -pin TowardsConvUnit_FF_reg[3][1][17:0] D[7]
load net BRAMWord[0][4]0_out[4] -attr @rip O[4] -pin BRAMWord[0][4]_i O[4] -pin TowardsConvUnit_FF_reg[0][4][17:0] D[4] -pin TowardsConvUnit_FF_reg[2][4][17:0] D[4]
load net TowardsConvUnit[2][2][1] -attr @rip 1 -port TowardsConvUnit[2][2][1] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst O[1]
load net BRAMWord[0][1]_i__0_n_11 -attr @rip O[6] -pin BRAMWord[0][1]_i__0 O[6] -pin TowardsConvUnit_FF_reg[1][1][17:0] D[6] -pin TowardsConvUnit_FF_reg[3][1][17:0] D[6]
load net BRAMWord[0][0]0_out[10] -attr @rip O[10] -pin BRAMWord[0][0]_i O[10] -pin TowardsConvUnit_FF_reg[0][0][17:0] D[10] -pin TowardsConvUnit_FF_reg[2][0][17:0] D[10]
load net TowardsConvUnit[1][6]_OBUF[6] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[1][6][17:0] Q[6]
load net TowardsConvUnit[3][0]_OBUF[12] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[3][0][17:0] Q[12]
load net BRAMWord[0][4][10] -attr @rip BRAMWord[0][4][10] -port BRAMWord[0][4][10] -pin BRAMWord[0][4]_i I0[10] -pin BRAMWord[0][4]_i__0 I0[10]
load net BRAMWord[0][5][6] -attr @rip BRAMWord[0][5][6] -port BRAMWord[0][5][6] -pin BRAMWord[0][5]_i I0[6] -pin BRAMWord[0][5]_i__0 I0[6]
load net BRAMWord[0][1]_i__0_n_12 -attr @rip O[5] -pin BRAMWord[0][1]_i__0 O[5] -pin TowardsConvUnit_FF_reg[1][1][17:0] D[5] -pin TowardsConvUnit_FF_reg[3][1][17:0] D[5]
load net BRAMWord[0][6]_i__0_n_10 -attr @rip O[7] -pin BRAMWord[0][6]_i__0 O[7] -pin TowardsConvUnit_FF_reg[1][6][17:0] D[7] -pin TowardsConvUnit_FF_reg[3][6][17:0] D[7]
load net TowardsConvUnit[2][0]_OBUF[5] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[2][0][17:0] Q[5]
load net BRAMWord[0][1]_i__0_n_13 -attr @rip O[4] -pin BRAMWord[0][1]_i__0 O[4] -pin TowardsConvUnit_FF_reg[1][1][17:0] D[4] -pin TowardsConvUnit_FF_reg[3][1][17:0] D[4]
load net BRAMWord[0][6]_i__0_n_11 -attr @rip O[6] -pin BRAMWord[0][6]_i__0 O[6] -pin TowardsConvUnit_FF_reg[1][6][17:0] D[6] -pin TowardsConvUnit_FF_reg[3][6][17:0] D[6]
load net TowardsConvUnit[1][7][5] -attr @rip 5 -port TowardsConvUnit[1][7][5] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst O[5]
load net TowardsConvUnit[3][6]_OBUF[16] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[3][6][17:0] Q[16]
load net BRAMWord[0][1]_i__0_n_14 -attr @rip O[3] -pin BRAMWord[0][1]_i__0 O[3] -pin TowardsConvUnit_FF_reg[1][1][17:0] D[3] -pin TowardsConvUnit_FF_reg[3][1][17:0] D[3]
load net BRAMWord[0][6]_i__0_n_12 -attr @rip O[5] -pin BRAMWord[0][6]_i__0 O[5] -pin TowardsConvUnit_FF_reg[1][6][17:0] D[5] -pin TowardsConvUnit_FF_reg[3][6][17:0] D[5]
load net TowardsConvUnit[1][3][0] -attr @rip 0 -port TowardsConvUnit[1][3][0] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst O[0]
load net TowardsConvUnit[0][0]_OBUF[3] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[0][0][17:0] Q[3]
load net BRAMWord[0][1]_i__0_n_15 -attr @rip O[2] -pin BRAMWord[0][1]_i__0 O[2] -pin TowardsConvUnit_FF_reg[1][1][17:0] D[2] -pin TowardsConvUnit_FF_reg[3][1][17:0] D[2]
load net BRAMWord[0][6]_i__0_n_13 -attr @rip O[4] -pin BRAMWord[0][6]_i__0 O[4] -pin TowardsConvUnit_FF_reg[1][6][17:0] D[4] -pin TowardsConvUnit_FF_reg[3][6][17:0] D[4]
load net TowardsConvUnit[0][3]_OBUF[9] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[0][3][17:0] Q[9]
load net TowardsConvUnit[1][2]_OBUF[4] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[1][2][17:0] Q[4]
load net TowardsConvUnit[3][1]_OBUF[2] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[3][1][17:0] Q[2]
load net TowardsConvUnit[0][7][9] -attr @rip 9 -port TowardsConvUnit[0][7][9] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst O[9]
load net BRAMWord[0][1]_i__0_n_16 -attr @rip O[1] -pin BRAMWord[0][1]_i__0 O[1] -pin TowardsConvUnit_FF_reg[1][1][17:0] D[1] -pin TowardsConvUnit_FF_reg[3][1][17:0] D[1]
load net BRAMWord[0][6]_i__0_n_14 -attr @rip O[3] -pin BRAMWord[0][6]_i__0 O[3] -pin TowardsConvUnit_FF_reg[1][6][17:0] D[3] -pin TowardsConvUnit_FF_reg[3][6][17:0] D[3]
load net TowardsConvUnit[1][1]_OBUF[2] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[1][1][17:0] Q[2]
load net TowardsConvUnit[2][3][9] -attr @rip 9 -port TowardsConvUnit[2][3][9] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst O[9]
load net BRAMWord[0][0][10] -attr @rip BRAMWord[0][0][10] -port BRAMWord[0][0][10] -pin BRAMWord[0][0]_i I0[10] -pin BRAMWord[0][0]_i__0 I0[10]
load net BRAMWord[0][1]_i__0_n_17 -attr @rip O[0] -pin BRAMWord[0][1]_i__0 O[0] -pin TowardsConvUnit_FF_reg[1][1][17:0] D[0] -pin TowardsConvUnit_FF_reg[3][1][17:0] D[0]
load net BRAMWord[0][1]0_out[16] -attr @rip O[16] -pin BRAMWord[0][1]_i O[16] -pin TowardsConvUnit_FF_reg[0][1][17:0] D[16] -pin TowardsConvUnit_FF_reg[2][1][17:0] D[16]
load net BRAMWord[0][6]_i__0_n_15 -attr @rip O[2] -pin BRAMWord[0][6]_i__0 O[2] -pin TowardsConvUnit_FF_reg[1][6][17:0] D[2] -pin TowardsConvUnit_FF_reg[3][6][17:0] D[2]
load net BRAMWord[0][6]0_out[4] -attr @rip O[4] -pin BRAMWord[0][6]_i O[4] -pin TowardsConvUnit_FF_reg[0][6][17:0] D[4] -pin TowardsConvUnit_FF_reg[2][6][17:0] D[4]
load net BRAMWord[0][6]_i__0_n_16 -attr @rip O[1] -pin BRAMWord[0][6]_i__0 O[1] -pin TowardsConvUnit_FF_reg[1][6][17:0] D[1] -pin TowardsConvUnit_FF_reg[3][6][17:0] D[1]
load net TowardsConvUnit[1][0]_OBUF[2] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[1][0][17:0] Q[2]
load net TowardsConvUnit[0][2][17] -attr @rip 17 -port TowardsConvUnit[0][2][17] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst O[17]
load net TowardsConvUnit_FF[1][6] -pin TowardsConvUnit_FF[1][7:0]_i O[6] -pin TowardsConvUnit_FF_reg[1][6][17:0] RST
load net BRAMWord[0][6]_i__0_n_17 -attr @rip O[0] -pin BRAMWord[0][6]_i__0 O[0] -pin TowardsConvUnit_FF_reg[1][6][17:0] D[0] -pin TowardsConvUnit_FF_reg[3][6][17:0] D[0]
load net TowardsConvUnit[1][5]_OBUF[12] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[1][5][17:0] Q[12]
load net TowardsConvUnit[3][5][8] -attr @rip 8 -port TowardsConvUnit[3][5][8] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst O[8]
load net TowardsConvUnit[3][6][1] -attr @rip 1 -port TowardsConvUnit[3][6][1] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst O[1]
load net BRAMWord[0][6]0_out[17] -attr @rip O[17] -pin BRAMWord[0][6]_i O[17] -pin TowardsConvUnit_FF_reg[0][6][17:0] D[17] -pin TowardsConvUnit_FF_reg[2][6][17:0] D[17]
load net TowardsConvUnit[2][1][5] -attr @rip 5 -port TowardsConvUnit[2][1][5] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst O[5]
load net TowardsConvUnit[3][7][1] -attr @rip 1 -port TowardsConvUnit[3][7][1] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst O[1]
load net BRAMWord[1][0][3] -attr @rip BRAMWord[1][0][3] -pin BRAMWord[0][0]_i I1[3] -pin BRAMWord[0][0]_i__0 I1[3] -port BRAMWord[1][0][3]
load net TowardsConvUnit[3][2]_OBUF[5] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[3][2][17:0] Q[5]
load net TowardsConvUnit[2][0]_OBUF[15] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[2][0][17:0] Q[15]
load net BRAMWord[0][5]0_out[15] -attr @rip O[15] -pin BRAMWord[0][5]_i O[15] -pin TowardsConvUnit_FF_reg[0][5][17:0] D[15] -pin TowardsConvUnit_FF_reg[2][5][17:0] D[15]
load net BRAMWord[0][7]0_out[13] -attr @rip O[13] -pin BRAMWord[0][7]_i O[13] -pin TowardsConvUnit_FF_reg[0][7][17:0] D[13] -pin TowardsConvUnit_FF_reg[2][7][17:0] D[13]
load net TowardsConvUnit[1][0][5] -attr @rip 5 -port TowardsConvUnit[1][0][5] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst O[5]
load net TowardsConvUnit[0][3][15] -attr @rip 15 -port TowardsConvUnit[0][3][15] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst O[15]
load net TowardsConvUnit[2][0]_OBUF[2] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[2][0][17:0] Q[2]
load net TowardsConvUnit[2][1]_OBUF[13] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[2][1][17:0] Q[13]
load net TowardsConvUnit[2][2][0] -attr @rip 0 -port TowardsConvUnit[2][2][0] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst O[0]
load net TowardsConvUnit[2][6]_OBUF[3] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[2][6][17:0] Q[3]
load net BRAMWord[0][6][11] -attr @rip BRAMWord[0][6][11] -port BRAMWord[0][6][11] -pin BRAMWord[0][6]_i I0[11] -pin BRAMWord[0][6]_i__0 I0[11]
load net TowardsConvUnit[0][6]_OBUF[3] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[0][6][17:0] Q[3]
load net TowardsConvUnit[1][6]_OBUF[5] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[1][6][17:0] Q[5]
load net TowardsConvUnit[0][0]_OBUF[0] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[0][0][17:0] Q[0]
load net BRAMWord[0][3]0_out[4] -attr @rip O[4] -pin BRAMWord[0][3]_i O[4] -pin TowardsConvUnit_FF_reg[0][3][17:0] D[4] -pin TowardsConvUnit_FF_reg[2][3][17:0] D[4]
load net TowardsConvUnit[3][0]_OBUF[13] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[3][0][17:0] Q[13]
load net BRAMWord[0][5][7] -attr @rip BRAMWord[0][5][7] -port BRAMWord[0][5][7] -pin BRAMWord[0][5]_i I0[7] -pin BRAMWord[0][5]_i__0 I0[7]
load net BRAMWord[0][4]0_out[7] -attr @rip O[7] -pin BRAMWord[0][4]_i O[7] -pin TowardsConvUnit_FF_reg[0][4][17:0] D[7] -pin TowardsConvUnit_FF_reg[2][4][17:0] D[7]
load net TowardsConvUnit[0][0][6] -attr @rip 6 -port TowardsConvUnit[0][0][6] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst O[6]
load net BRAMWord[0][0]0_out[9] -attr @rip O[9] -pin BRAMWord[0][0]_i O[9] -pin TowardsConvUnit_FF_reg[0][0][17:0] D[9] -pin TowardsConvUnit_FF_reg[2][0][17:0] D[9]
load net TowardsConvUnit[1][2]_OBUF[3] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[1][2][17:0] Q[3]
load net TowardsConvUnit[3][1]_OBUF[1] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[3][1][17:0] Q[1]
load net TowardsConvUnit[0][7][8] -attr @rip 8 -port TowardsConvUnit[0][7][8] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst O[8]
load net TowardsConvUnit[0][4][2] -attr @rip 2 -port TowardsConvUnit[0][4][2] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst O[2]
load net TowardsConvUnit[1][3][1] -attr @rip 1 -port TowardsConvUnit[1][3][1] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst O[1]
load net TowardsConvUnit[2][3][8] -attr @rip 8 -port TowardsConvUnit[2][3][8] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst O[8]
load net TowardsConvUnit[1][0]_OBUF[1] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[1][0][17:0] Q[1]
load net TowardsConvUnit[3][5]_OBUF[16] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[3][5][17:0] Q[16]
load net TowardsConvUnit_FF[1][5] -pin TowardsConvUnit_FF[1][7:0]_i O[5] -pin TowardsConvUnit_FF_reg[1][5][17:0] RST
load net TowardsConvUnit[0][6]_OBUF[11] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[0][6][17:0] Q[11]
load net BRAMWord[0][1]0_out[17] -attr @rip O[17] -pin BRAMWord[0][1]_i O[17] -pin TowardsConvUnit_FF_reg[0][1][17:0] D[17] -pin TowardsConvUnit_FF_reg[2][1][17:0] D[17]
load net TowardsConvUnit[1][5]_OBUF[11] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[1][5][17:0] Q[11]
load net TowardsConvUnit[3][4]_OBUF[8] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[3][4][17:0] Q[8]
load net TowardsConvUnit[3][5][7] -attr @rip 7 -port TowardsConvUnit[3][5][7] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst O[7]
load net TowardsConvUnit[3][6][0] -attr @rip 0 -port TowardsConvUnit[3][6][0] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst O[0]
load net TowardsConvUnit[2][5]_OBUF[0] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[2][5][17:0] Q[0]
load net TowardsConvUnit[3][2]_OBUF[4] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[3][2][17:0] Q[4]
load net BRAMWord[0][6]0_out[7] -attr @rip O[7] -pin BRAMWord[0][6]_i O[7] -pin TowardsConvUnit_FF_reg[0][6][17:0] D[7] -pin TowardsConvUnit_FF_reg[2][6][17:0] D[7]
load net BRAMWord[0][7]0_out[10] -attr @rip O[10] -pin BRAMWord[0][7]_i O[10] -pin TowardsConvUnit_FF_reg[0][7][17:0] D[10] -pin TowardsConvUnit_FF_reg[2][7][17:0] D[10]
load net TowardsConvUnit[1][3][11] -attr @rip 11 -port TowardsConvUnit[1][3][11] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst O[11]
load net TowardsConvUnit[2][1][6] -attr @rip 6 -port TowardsConvUnit[2][1][6] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst O[6]
load net TowardsConvUnit[0][1][6] -attr @rip 6 -port TowardsConvUnit[0][1][6] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst O[6]
load net BRAMWord[1][3][9] -attr @rip BRAMWord[1][3][9] -pin BRAMWord[0][3]_i I1[9] -pin BRAMWord[0][3]_i__0 I1[9] -port BRAMWord[1][3][9]
load net BRAMWord[1][0][4] -attr @rip BRAMWord[1][0][4] -pin BRAMWord[0][0]_i I1[4] -pin BRAMWord[0][0]_i__0 I1[4] -port BRAMWord[1][0][4]
load net TowardsConvUnit[2][6]_OBUF[0] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[2][6][17:0] Q[0]
load net TowardsConvUnit[1][1]_OBUF[9] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[1][1][17:0] Q[9]
load net TowardsConvUnit[2][0]_OBUF[16] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[2][0][17:0] Q[16]
load net TowardsConvUnit[3][7][4] -attr @rip 4 -port TowardsConvUnit[3][7][4] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst O[4]
load net TowardsConvUnit[1][0][4] -attr @rip 4 -port TowardsConvUnit[1][0][4] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst O[4]
load net TowardsConvUnit[2][1]_OBUF[12] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[2][1][17:0] Q[12]
load net TowardsConvUnit[3][0]_OBUF[9] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[3][0][17:0] Q[9]
load net TowardsConvUnit[0][3]_OBUF[15] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[0][3][17:0] Q[15]
load net TowardsConvUnit[3][0]_OBUF[10] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[3][0][17:0] Q[10]
load net BRAMWord[0][5][4] -attr @rip BRAMWord[0][5][4] -port BRAMWord[0][5][4] -pin BRAMWord[0][5]_i I0[4] -pin BRAMWord[0][5]_i__0 I0[4]
load net TowardsConvUnit[0][3][16] -attr @rip 16 -port TowardsConvUnit[0][3][16] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst O[16]
load net TowardsConvUnit[1][3]_OBUF[9] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[1][3][17:0] Q[9]
load net TowardsConvUnit[2][0]_OBUF[3] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[2][0][17:0] Q[3]
load net BRAMWord[0][3]0_out[3] -attr @rip O[3] -pin BRAMWord[0][3]_i O[3] -pin TowardsConvUnit_FF_reg[0][3][17:0] D[3] -pin TowardsConvUnit_FF_reg[2][3][17:0] D[3]
load net BRAMWord[0][5][17] -attr @rip BRAMWord[0][5][17] -port BRAMWord[0][5][17] -pin BRAMWord[0][5]_i I0[17] -pin BRAMWord[0][5]_i__0 I0[17]
load net BRAMWord[0][6][12] -attr @rip BRAMWord[0][6][12] -port BRAMWord[0][6][12] -pin BRAMWord[0][6]_i I0[12] -pin BRAMWord[0][6]_i__0 I0[12]
load net BRAMWord[0][4]0_out[6] -attr @rip O[6] -pin BRAMWord[0][4]_i O[6] -pin TowardsConvUnit_FF_reg[0][4][17:0] D[6] -pin TowardsConvUnit_FF_reg[2][4][17:0] D[6]
load net TowardsConvUnit_FF[1][0] -pin TowardsConvUnit_FF[1][7:0]_i O[0] -pin TowardsConvUnit_FF_reg[1][0][17:0] RST
load net BRAMWord[0][0]0_out[12] -attr @rip O[12] -pin BRAMWord[0][0]_i O[12] -pin TowardsConvUnit_FF_reg[0][0][17:0] D[12] -pin TowardsConvUnit_FF_reg[2][0][17:0] D[12]
load net TowardsConvUnit[0][0][5] -attr @rip 5 -port TowardsConvUnit[0][0][5] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst O[5]
load net TowardsConvUnit[0][0]_OBUF[1] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[0][0][17:0] Q[1]
load net BRAMWord[0][0]0_out[8] -attr @rip O[8] -pin BRAMWord[0][0]_i O[8] -pin TowardsConvUnit_FF_reg[0][0][17:0] D[8] -pin TowardsConvUnit_FF_reg[2][0][17:0] D[8]
load net TowardsConvUnit[0][3]_OBUF[7] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[0][3][17:0] Q[7]
load net TowardsConvUnit[1][6]_OBUF[8] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[1][6][17:0] Q[8]
load net TowardsConvUnit[3][1]_OBUF[0] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[3][1][17:0] Q[0]
load net TowardsConvUnit[0][4][1] -attr @rip 1 -port TowardsConvUnit[0][4][1] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst O[1]
load net BRAMWord[0][4]0_out[12] -attr @rip O[12] -pin BRAMWord[0][4]_i O[12] -pin TowardsConvUnit_FF_reg[0][4][17:0] D[12] -pin TowardsConvUnit_FF_reg[2][4][17:0] D[12]
load net TowardsConvUnit[2][3][7] -attr @rip 7 -port TowardsConvUnit[2][3][7] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst O[7]
load net TowardsConvUnit[0][2]_OBUF[13] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[0][2][17:0] Q[13]
load net TowardsConvUnit[0][6]_OBUF[8] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[0][6][17:0] Q[8]
load net TowardsConvUnit[3][0]_OBUF[0] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[3][0][17:0] Q[0]
load net TowardsConvUnit[1][3][2] -attr @rip 2 -port TowardsConvUnit[1][3][2] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst O[2]
load net TowardsConvUnit[3][5]_OBUF[15] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[3][5][17:0] Q[15]
load net TowardsConvUnit[3][4]_OBUF[7] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[3][4][17:0] Q[7]
load net TowardsConvUnit[3][5][6] -attr @rip 6 -port TowardsConvUnit[3][5][6] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst O[6]
load net TowardsConvUnit[0][6]_OBUF[12] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[0][6][17:0] Q[12]
load net TowardsConvUnit[3][2]_OBUF[3] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[3][2][17:0] Q[3]
load net BRAMWord[0][6]0_out[6] -attr @rip O[6] -pin BRAMWord[0][6]_i O[6] -pin TowardsConvUnit_FF_reg[0][6][17:0] D[6] -pin TowardsConvUnit_FF_reg[2][6][17:0] D[6]
load net TowardsConvUnit[1][0]_OBUF[4] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[1][0][17:0] Q[4]
load net TowardsConvUnit[0][0]_OBUF[17] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[0][0][17:0] Q[17]
load net TowardsConvUnit[1][3][10] -attr @rip 10 -port TowardsConvUnit[1][3][10] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst O[10]
load net TowardsConvUnit[1][5]_OBUF[14] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[1][5][17:0] Q[14]
load net BRAMWord[0][7]0_out[11] -attr @rip O[11] -pin BRAMWord[0][7]_i O[11] -pin TowardsConvUnit_FF_reg[0][7][17:0] D[11] -pin TowardsConvUnit_FF_reg[2][7][17:0] D[11]
load net TowardsConvUnit[1][1]_OBUF[8] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[1][1][17:0] Q[8]
load net TowardsConvUnit[2][1][7] -attr @rip 7 -port TowardsConvUnit[2][1][7] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst O[7]
load net TowardsConvUnit[3][7][3] -attr @rip 3 -port TowardsConvUnit[3][7][3] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst O[3]
load net TowardsConvUnit[0][1][7] -attr @rip 7 -port TowardsConvUnit[0][1][7] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst O[7]
load net TowardsConvUnit[0][3][13] -attr @rip 13 -port TowardsConvUnit[0][3][13] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst O[13]
load net BRAMWord[1][0][5] -attr @rip BRAMWord[1][0][5] -pin BRAMWord[0][0]_i I1[5] -pin BRAMWord[0][0]_i__0 I1[5] -port BRAMWord[1][0][5]
load net TowardsConvUnit[2][0]_OBUF[0] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[2][0][17:0] Q[0]
load net TowardsConvUnit[2][1]_OBUF[11] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[2][1][17:0] Q[11]
load net TowardsConvUnit[2][6]_OBUF[1] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[2][6][17:0] Q[1]
load net TowardsConvUnit[0][3]_OBUF[14] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[0][3][17:0] Q[14]
load net TowardsConvUnit[2][0]_OBUF[17] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[2][0][17:0] Q[17]
load net TowardsConvUnit[1][3]_OBUF[8] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[1][3][17:0] Q[8]
load net TowardsConvUnit[3][0]_OBUF[11] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[3][0][17:0] Q[11]
load net BRAMWord[0][5][5] -attr @rip BRAMWord[0][5][5] -port BRAMWord[0][5][5] -pin BRAMWord[0][5]_i I0[5] -pin BRAMWord[0][5]_i__0 I0[5]
load net BRAMWord[0][0]0_out[11] -attr @rip O[11] -pin BRAMWord[0][0]_i O[11] -pin TowardsConvUnit_FF_reg[0][0][17:0] D[11] -pin TowardsConvUnit_FF_reg[2][0][17:0] D[11]
load net TowardsConvUnit[0][0][4] -attr @rip 4 -port TowardsConvUnit[0][0][4] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst O[4]
load net BRAMWord[0][6][13] -attr @rip BRAMWord[0][6][13] -port BRAMWord[0][6][13] -pin BRAMWord[0][6]_i I0[13] -pin BRAMWord[0][6]_i__0 I0[13]
load net TowardsConvUnit[1][6]_OBUF[7] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[1][6][17:0] Q[7]
load net BRAMWord[0][4]0_out[11] -attr @rip O[11] -pin BRAMWord[0][4]_i O[11] -pin TowardsConvUnit_FF_reg[0][4][17:0] D[11] -pin TowardsConvUnit_FF_reg[2][4][17:0] D[11]
load net TowardsConvUnit[2][3][6] -attr @rip 6 -port TowardsConvUnit[2][3][6] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst O[6]
load net TowardsConvUnit[0][3]_OBUF[8] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[0][3][17:0] Q[8]
load net BRAMWord[0][3]0_out[6] -attr @rip O[6] -pin BRAMWord[0][3]_i O[6] -pin TowardsConvUnit_FF_reg[0][3][17:0] D[6] -pin TowardsConvUnit_FF_reg[2][3][17:0] D[6]
load net BRAMWord[0][4]0_out[9] -attr @rip O[9] -pin BRAMWord[0][4]_i O[9] -pin TowardsConvUnit_FF_reg[0][4][17:0] D[9] -pin TowardsConvUnit_FF_reg[2][4][17:0] D[9]
load net TowardsConvUnit[2][1][0] -attr @rip 0 -port TowardsConvUnit[2][1][0] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst O[0]
load net TowardsConvUnit[2][2][6] -attr @rip 6 -port TowardsConvUnit[2][2][6] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst O[6]
load net TowardsConvUnit[3][5]_OBUF[14] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[3][5][17:0] Q[14]
load net TowardsConvUnit[0][6]_OBUF[9] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[0][6][17:0] Q[9]
load net TowardsConvUnit[0][2]_OBUF[14] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[0][2][17:0] Q[14]
load net TowardsConvUnit[3][4]_OBUF[6] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[3][4][17:0] Q[6]
load net TowardsConvUnit[3][5][5] -attr @rip 5 -port TowardsConvUnit[3][5][5] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst O[5]
load net TowardsConvUnit[3][6][10] -attr @rip 10 -port TowardsConvUnit[3][6][10] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst O[10]
load net TowardsConvUnit[0][4][4] -attr @rip 4 -port TowardsConvUnit[0][4][4] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst O[4]
load net TowardsConvUnit[1][3][3] -attr @rip 3 -port TowardsConvUnit[1][3][3] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst O[3]
load net BRAMWord[0][5]0_out[10] -attr @rip O[10] -pin BRAMWord[0][5]_i O[10] -pin TowardsConvUnit_FF_reg[0][5][17:0] D[10] -pin TowardsConvUnit_FF_reg[2][5][17:0] D[10]
load net TowardsConvUnit[2][3]_OBUF[17] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[2][3][17:0] Q[17]
load net TowardsConvUnit[3][2]_OBUF[2] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[3][2][17:0] Q[2]
load net TowardsConvUnit[1][0]_OBUF[3] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[1][0][17:0] Q[3]
load net TowardsConvUnit[0][6]_OBUF[13] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[0][6][17:0] Q[13]
load net BRAMWord[1][3][7] -attr @rip BRAMWord[1][3][7] -pin BRAMWord[0][3]_i I1[7] -pin BRAMWord[0][3]_i__0 I1[7] -port BRAMWord[1][3][7]
load net TowardsConvUnit[1][5]_OBUF[13] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[1][5][17:0] Q[13]
load net TowardsConvUnit[1][1]_OBUF[7] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[1][1][17:0] Q[7]
load net BRAMWord[0][0][15] -attr @rip BRAMWord[0][0][15] -port BRAMWord[0][0][15] -pin BRAMWord[0][0]_i I0[15] -pin BRAMWord[0][0]_i__0 I0[15]
load net BRAMWord[0][1]0_out[8] -attr @rip O[8] -pin BRAMWord[0][1]_i O[8] -pin TowardsConvUnit_FF_reg[0][1][17:0] D[8] -pin TowardsConvUnit_FF_reg[2][1][17:0] D[8]
load net TowardsConvUnit[2][1]_OBUF[10] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[2][1][17:0] Q[10]
load net BRAMWord[0][6]0_out[9] -attr @rip O[9] -pin BRAMWord[0][6]_i O[9] -pin TowardsConvUnit_FF_reg[0][6][17:0] D[9] -pin TowardsConvUnit_FF_reg[2][6][17:0] D[9]
load net TowardsConvUnit[1][6]_OBUF[2] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[1][6][17:0] Q[2]
load net TowardsConvUnit[0][1][8] -attr @rip 8 -port TowardsConvUnit[0][1][8] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst O[8]
load net BRAMWord[0][5][2] -attr @rip BRAMWord[0][5][2] -port BRAMWord[0][5][2] -pin BRAMWord[0][5]_i I0[2] -pin BRAMWord[0][5]_i__0 I0[2]
load net TowardsConvUnit[0][3][14] -attr @rip 14 -port TowardsConvUnit[0][3][14] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst O[14]
load net TowardsConvUnit[2][0]_OBUF[1] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[2][0][17:0] Q[1]
load net BRAMWord[0][5][15] -attr @rip BRAMWord[0][5][15] -port BRAMWord[0][5][15] -pin BRAMWord[0][5]_i I0[15] -pin BRAMWord[0][5]_i__0 I0[15]
load net TowardsConvUnit_FF[2][2] -pin TowardsConvUnit_FF[2][7:0]_i O[2] -pin TowardsConvUnit_FF_reg[2][2][17:0] RST
load net TowardsConvUnit[0][3]_OBUF[5] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[0][3][17:0] Q[5]
load net TowardsConvUnit[0][0][3] -attr @rip 3 -port TowardsConvUnit[0][0][3] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst O[3]
load net TowardsConvUnit[0][3]_OBUF[17] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[0][3][17:0] Q[17]
load net BRAMWord[0][4]0_out[10] -attr @rip O[10] -pin BRAMWord[0][4]_i O[10] -pin TowardsConvUnit_FF_reg[0][4][17:0] D[10] -pin TowardsConvUnit_FF_reg[2][4][17:0] D[10]
load net TowardsConvUnit[2][6]_OBUF[6] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[2][6][17:0] Q[6]
load net TowardsConvUnit[2][7][14] -attr @rip 14 -port TowardsConvUnit[2][7][14] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst O[14]
load net TowardsConvUnit[0][6]_OBUF[6] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[0][6][17:0] Q[6]
load net TowardsConvUnit[0][2]_OBUF[11] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[0][2][17:0] Q[11]
load net BRAMWord[0][3]0_out[5] -attr @rip O[5] -pin BRAMWord[0][3]_i O[5] -pin TowardsConvUnit_FF_reg[0][3][17:0] D[5] -pin TowardsConvUnit_FF_reg[2][3][17:0] D[5]
load net BRAMWord[0][6][14] -attr @rip BRAMWord[0][6][14] -port BRAMWord[0][6][14] -pin BRAMWord[0][6]_i I0[14] -pin BRAMWord[0][6]_i__0 I0[14]
load net BRAMWord[0][4]0_out[8] -attr @rip O[8] -pin BRAMWord[0][4]_i O[8] -pin TowardsConvUnit_FF_reg[0][4][17:0] D[8] -pin TowardsConvUnit_FF_reg[2][4][17:0] D[8]
load net TowardsConvUnit[2][2][5] -attr @rip 5 -port TowardsConvUnit[2][2][5] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst O[5]
load net TowardsConvUnit[3][5]_OBUF[13] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[3][5][17:0] Q[13]
load net TowardsConvUnit_FF[1][2] -pin TowardsConvUnit_FF[1][7:0]_i O[2] -pin TowardsConvUnit_FF_reg[1][2][17:0] RST
load net TowardsConvUnit[3][0]_OBUF[16] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[3][0][17:0] Q[16]
load net TowardsConvUnit[3][4]_OBUF[5] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[3][4][17:0] Q[5]
load net TowardsConvUnit[3][5][4] -attr @rip 4 -port TowardsConvUnit[3][5][4] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst O[4]
load net BRAMWord[0][4]_i__0_n_0 -attr @rip O[17] -pin BRAMWord[0][4]_i__0 O[17] -pin TowardsConvUnit_FF_reg[1][4][17:0] D[17] -pin TowardsConvUnit_FF_reg[3][4][17:0] D[17]
load net TowardsConvUnit[0][4][3] -attr @rip 3 -port TowardsConvUnit[0][4][3] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst O[3]
load net TowardsConvUnit[2][1][1] -attr @rip 1 -port TowardsConvUnit[2][1][1] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst O[1]
load net BRAMWord[0][4]_i__0_n_1 -attr @rip O[16] -pin BRAMWord[0][4]_i__0 O[16] -pin TowardsConvUnit_FF_reg[1][4][17:0] D[16] -pin TowardsConvUnit_FF_reg[3][4][17:0] D[16]
load net TowardsConvUnit[2][3]_OBUF[16] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[2][3][17:0] Q[16]
load net TowardsConvUnit[3][2]_OBUF[1] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[3][2][17:0] Q[1]
load net TowardsConvUnit[3][3]_OBUF[5] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[3][3][17:0] Q[5]
load net BRAMWord[0][4]_i__0_n_2 -attr @rip O[15] -pin BRAMWord[0][4]_i__0 O[15] -pin TowardsConvUnit_FF_reg[1][4][17:0] D[15] -pin TowardsConvUnit_FF_reg[3][4][17:0] D[15]
load net TowardsConvUnit[1][3][4] -attr @rip 4 -port TowardsConvUnit[1][3][4] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst O[4]
load net BRAMWord[0][4]_i__0_n_3 -attr @rip O[14] -pin BRAMWord[0][4]_i__0 O[14] -pin TowardsConvUnit_FF_reg[1][4][17:0] D[14] -pin TowardsConvUnit_FF_reg[3][4][17:0] D[14]
load net BRAMWord[0][5]0_out[11] -attr @rip O[11] -pin BRAMWord[0][5]_i O[11] -pin TowardsConvUnit_FF_reg[0][5][17:0] D[11] -pin TowardsConvUnit_FF_reg[2][5][17:0] D[11]
load net TowardsConvUnit[3][4][17] -attr @rip 17 -port TowardsConvUnit[3][4][17] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst O[17]
load net BRAMWord[0][4]_i__0_n_4 -attr @rip O[13] -pin BRAMWord[0][4]_i__0 O[13] -pin TowardsConvUnit_FF_reg[1][4][17:0] D[13] -pin TowardsConvUnit_FF_reg[3][4][17:0] D[13]
load net TowardsConvUnit[1][1]_OBUF[6] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[1][1][17:0] Q[6]
load net BRAMWord[1][3][8] -attr @rip BRAMWord[1][3][8] -pin BRAMWord[0][3]_i I1[8] -pin BRAMWord[0][3]_i__0 I1[8] -port BRAMWord[1][3][8]
load net TowardsConvUnit[1][0][1] -attr @rip 1 -port TowardsConvUnit[1][0][1] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst O[1]
load net BRAMWord[0][0][14] -attr @rip BRAMWord[0][0][14] -port BRAMWord[0][0][14] -pin BRAMWord[0][0]_i I0[14] -pin BRAMWord[0][0]_i__0 I0[14]
load net TowardsConvUnit[0][6]_OBUF[14] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[0][6][17:0] Q[14]
load net BRAMWord[0][4]_i__0_n_5 -attr @rip O[12] -pin BRAMWord[0][4]_i__0 O[12] -pin TowardsConvUnit_FF_reg[1][4][17:0] D[12] -pin TowardsConvUnit_FF_reg[3][4][17:0] D[12]
load net BRAMWord[0][1]0_out[7] -attr @rip O[7] -pin BRAMWord[0][1]_i O[7] -pin TowardsConvUnit_FF_reg[0][1][17:0] D[7] -pin TowardsConvUnit_FF_reg[2][1][17:0] D[7]
load net TowardsConvUnit[3][7]_OBUF[8] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[3][7][17:0] Q[8]
load net BRAMWord[0][4]_i__0_n_6 -attr @rip O[11] -pin BRAMWord[0][4]_i__0 O[11] -pin TowardsConvUnit_FF_reg[1][4][17:0] D[11] -pin TowardsConvUnit_FF_reg[3][4][17:0] D[11]
load net BRAMWord[0][6]0_out[8] -attr @rip O[8] -pin BRAMWord[0][6]_i O[8] -pin TowardsConvUnit_FF_reg[0][6][17:0] D[8] -pin TowardsConvUnit_FF_reg[2][6][17:0] D[8]
load net TowardsConvUnit[1][0]_OBUF[6] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[1][0][17:0] Q[6]
load net TowardsConvUnit[1][6]_OBUF[1] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[1][6][17:0] Q[1]
load net BRAMWord[0][4]_i__0_n_7 -attr @rip O[10] -pin BRAMWord[0][4]_i__0 O[10] -pin TowardsConvUnit_FF_reg[1][4][17:0] D[10] -pin TowardsConvUnit_FF_reg[3][4][17:0] D[10]
load net TowardsConvUnit[1][5]_OBUF[16] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[1][5][17:0] Q[16]
load net BRAMWord[1][6][1] -attr @rip BRAMWord[1][6][1] -pin BRAMWord[0][6]_i I1[1] -pin BRAMWord[0][6]_i__0 I1[1] -port BRAMWord[1][6][1]
load net BRAMWord[0][4]_i__0_n_8 -attr @rip O[9] -pin BRAMWord[0][4]_i__0 O[9] -pin TowardsConvUnit_FF_reg[1][4][17:0] D[9] -pin TowardsConvUnit_FF_reg[3][4][17:0] D[9]
load net BRAMWord[0][4]_i__0_n_9 -attr @rip O[8] -pin BRAMWord[0][4]_i__0 O[8] -pin TowardsConvUnit_FF_reg[1][4][17:0] D[8] -pin TowardsConvUnit_FF_reg[3][4][17:0] D[8]
load net TowardsConvUnit[0][1][9] -attr @rip 9 -port TowardsConvUnit[0][1][9] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst O[9]
load net BRAMWord[0][5][3] -attr @rip BRAMWord[0][5][3] -port BRAMWord[0][5][3] -pin BRAMWord[0][5]_i I0[3] -pin BRAMWord[0][5]_i__0 I0[3]
load net TowardsConvUnit[0][3]_OBUF[16] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[0][3][17:0] Q[16]
load net BRAMWord[0][5][16] -attr @rip BRAMWord[0][5][16] -port BRAMWord[0][5][16] -pin BRAMWord[0][5]_i I0[16] -pin BRAMWord[0][5]_i__0 I0[16]
load net TowardsConvUnit_FF[2][3] -pin TowardsConvUnit_FF[2][7:0]_i O[3] -pin TowardsConvUnit_FF_reg[2][3][17:0] RST
load net TowardsConvUnit[2][7][13] -attr @rip 13 -port TowardsConvUnit[2][7][13] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst O[13]
load net TowardsConvUnit[0][3]_OBUF[6] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[0][3][17:0] Q[6]
load net BRAMWord[0][0]_i__0_n_0 -attr @rip O[17] -pin BRAMWord[0][0]_i__0 O[17] -pin TowardsConvUnit_FF_reg[1][0][17:0] D[17] -pin TowardsConvUnit_FF_reg[3][0][17:0] D[17]
load net BRAMWord[0][0]_i__0_n_1 -attr @rip O[16] -pin BRAMWord[0][0]_i__0 O[16] -pin TowardsConvUnit_FF_reg[1][0][17:0] D[16] -pin TowardsConvUnit_FF_reg[3][0][17:0] D[16]
load net TowardsConvUnit[2][2][4] -attr @rip 4 -port TowardsConvUnit[2][2][4] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst O[4]
load net TowardsConvUnit[2][6]_OBUF[7] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[2][6][17:0] Q[7]
load net TowardsConvUnit[3][5]_OBUF[12] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[3][5][17:0] Q[12]
load net TowardsConvUnit_FF[1][1] -pin TowardsConvUnit_FF[1][7:0]_i O[1] -pin TowardsConvUnit_FF_reg[1][1][17:0] RST
load net BRAMWord[0][6][15] -attr @rip BRAMWord[0][6][15] -port BRAMWord[0][6][15] -pin BRAMWord[0][6]_i I0[15] -pin BRAMWord[0][6]_i__0 I0[15]
load net TowardsConvUnit[0][6]_OBUF[7] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[0][6][17:0] Q[7]
load net BRAMWord[0][0]_i__0_n_2 -attr @rip O[15] -pin BRAMWord[0][0]_i__0 O[15] -pin TowardsConvUnit_FF_reg[1][0][17:0] D[15] -pin TowardsConvUnit_FF_reg[3][0][17:0] D[15]
load net TowardsConvUnit[0][2]_OBUF[12] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[0][2][17:0] Q[12]
load net TowardsConvUnit[3][4]_OBUF[4] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[3][4][17:0] Q[4]
load net TowardsConvUnit[3][5][3] -attr @rip 3 -port TowardsConvUnit[3][5][3] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst O[3]
load net BRAMWord[0][0]_i__0_n_3 -attr @rip O[14] -pin BRAMWord[0][0]_i__0 O[14] -pin TowardsConvUnit_FF_reg[1][0][17:0] D[14] -pin TowardsConvUnit_FF_reg[3][0][17:0] D[14]
load net BRAMWord[0][0]_i__0_n_4 -attr @rip O[13] -pin BRAMWord[0][0]_i__0 O[13] -pin TowardsConvUnit_FF_reg[1][0][17:0] D[13] -pin TowardsConvUnit_FF_reg[3][0][17:0] D[13]
load net BRAMWord[0][3]0_out[8] -attr @rip O[8] -pin BRAMWord[0][3]_i O[8] -pin TowardsConvUnit_FF_reg[0][3][17:0] D[8] -pin TowardsConvUnit_FF_reg[2][3][17:0] D[8]
load net TowardsConvUnit[3][0]_OBUF[17] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[3][0][17:0] Q[17]
load net TowardsConvUnit[3][2]_OBUF[0] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[3][2][17:0] Q[0]
load net TowardsConvUnit[3][3]_OBUF[4] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[3][3][17:0] Q[4]
load net BRAMWord[0][0]_i__0_n_5 -attr @rip O[12] -pin BRAMWord[0][0]_i__0 O[12] -pin TowardsConvUnit_FF_reg[1][0][17:0] D[12] -pin TowardsConvUnit_FF_reg[3][0][17:0] D[12]
load net TowardsConvUnit[2][1][2] -attr @rip 2 -port TowardsConvUnit[2][1][2] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst O[2]
load net TowardsConvUnit[2][4]_OBUF[6] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[2][4][17:0] Q[6]
load net TowardsConvUnit[0][6][0] -attr @rip 0 -port TowardsConvUnit[0][6][0] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst O[0]
load net BRAMWord[1][3][5] -attr @rip BRAMWord[1][3][5] -pin BRAMWord[0][3]_i I1[5] -pin BRAMWord[0][3]_i__0 I1[5] -port BRAMWord[1][3][5]
load net BRAMWord[1][0][0] -attr @rip BRAMWord[1][0][0] -pin BRAMWord[0][0]_i I1[0] -pin BRAMWord[0][0]_i__0 I1[0] -port BRAMWord[1][0][0]
load net BRAMWord[0][0]_i__0_n_6 -attr @rip O[11] -pin BRAMWord[0][0]_i__0 O[11] -pin TowardsConvUnit_FF_reg[1][0][17:0] D[11] -pin TowardsConvUnit_FF_reg[3][0][17:0] D[11]
load net TowardsConvUnit[0][1][2] -attr @rip 2 -port TowardsConvUnit[0][1][2] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst O[2]
load net BRAMWord[0][0]_i__0_n_7 -attr @rip O[10] -pin BRAMWord[0][0]_i__0 O[10] -pin TowardsConvUnit_FF_reg[1][0][17:0] D[10] -pin TowardsConvUnit_FF_reg[3][0][17:0] D[10]
load net TowardsConvUnit[0][4][6] -attr @rip 6 -port TowardsConvUnit[0][4][6] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst O[6]
load net TowardsConvUnit[1][3][5] -attr @rip 5 -port TowardsConvUnit[1][3][5] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst O[5]
load net TowardsConvUnit[1][0][0] -attr @rip 0 -port TowardsConvUnit[1][0][0] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst O[0]
load net BRAMWord[0][0]_i__0_n_8 -attr @rip O[9] -pin BRAMWord[0][0]_i__0 O[9] -pin TowardsConvUnit_FF_reg[1][0][17:0] D[9] -pin TowardsConvUnit_FF_reg[3][0][17:0] D[9]
load net BRAMWord[0][0][13] -attr @rip BRAMWord[0][0][13] -port BRAMWord[0][0][13] -pin BRAMWord[0][0]_i I0[13] -pin BRAMWord[0][0]_i__0 I0[13]
load net TowardsConvUnit[1][1]_OBUF[10] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[1][1][17:0] Q[10]
load net TowardsConvUnit[1][0]_OBUF[5] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[1][0][17:0] Q[5]
load net BRAMWord[0][0]_i__0_n_9 -attr @rip O[8] -pin BRAMWord[0][0]_i__0 O[8] -pin TowardsConvUnit_FF_reg[1][0][17:0] D[8] -pin TowardsConvUnit_FF_reg[3][0][17:0] D[8]
load net TowardsConvUnit[1][5][0] -attr @rip 0 -port TowardsConvUnit[1][5][0] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst O[0]
load net TowardsConvUnit[0][6]_OBUF[15] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[0][6][17:0] Q[15]
load net TowardsConvUnit[1][3]_OBUF[5] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[1][3][17:0] Q[5]
load net TowardsConvUnit[1][5]_OBUF[15] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[1][5][17:0] Q[15]
load net TowardsConvUnit[3][7]_OBUF[9] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[3][7][17:0] Q[9]
load net BRAMWord[0][5][13] -attr @rip BRAMWord[0][5][13] -port BRAMWord[0][5][13] -pin BRAMWord[0][5]_i I0[13] -pin BRAMWord[0][5]_i__0 I0[13]
load net BRAMWord[1][6][0] -attr @rip BRAMWord[1][6][0] -pin BRAMWord[0][6]_i I1[0] -pin BRAMWord[0][6]_i__0 I1[0] -port BRAMWord[1][6][0]
load net <const0> -ground -pin TowardsConvUnit_FF[0][7:0]_i I1 -pin TowardsConvUnit_FF[1][7:0]_i I1 -pin TowardsConvUnit_FF[2][7:0]_i I1 -pin TowardsConvUnit_FF[3][7:0]_i I1
load net TowardsConvUnit[3][2]_OBUF[16] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[3][2][17:0] Q[16]
load net TowardsConvUnit[1][6]_OBUF[4] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[1][6][17:0] Q[4]
load net BRAMWord[1][1][4] -attr @rip BRAMWord[1][1][4] -pin BRAMWord[0][1]_i I1[4] -pin BRAMWord[0][1]_i__0 I1[4] -port BRAMWord[1][1][4]
load net TowardsConvUnit[1][7][11] -attr @rip 11 -port TowardsConvUnit[1][7][11] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst O[11]
load net TowardsConvUnit[2][6]_OBUF[4] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[2][6][17:0] Q[4]
load net TowardsConvUnit[2][7][12] -attr @rip 12 -port TowardsConvUnit[2][7][12] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst O[12]
load net TowardsConvUnit_FF[2][4] -pin TowardsConvUnit_FF[2][7:0]_i O[4] -pin TowardsConvUnit_FF_reg[2][4][17:0] RST
load net TowardsConvUnit[2][2][3] -attr @rip 3 -port TowardsConvUnit[2][2][3] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst O[3]
load net TowardsConvUnit[3][5]_OBUF[11] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[3][5][17:0] Q[11]
load net BRAMWord[0][4][9] -attr @rip BRAMWord[0][4][9] -port BRAMWord[0][4][9] -pin BRAMWord[0][4]_i I0[9] -pin BRAMWord[0][4]_i__0 I0[9]
load net BRAMWord[0][1]_i__0_n_0 -attr @rip O[17] -pin BRAMWord[0][1]_i__0 O[17] -pin TowardsConvUnit_FF_reg[1][1][17:0] D[17] -pin TowardsConvUnit_FF_reg[3][1][17:0] D[17]
load net TowardsConvUnit[3][0]_OBUF[14] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[3][0][17:0] Q[14]
load net TowardsConvUnit[3][4]_OBUF[3] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[3][4][17:0] Q[3]
load net BRAMWord[0][1]_i__0_n_1 -attr @rip O[16] -pin BRAMWord[0][1]_i__0 O[16] -pin TowardsConvUnit_FF_reg[1][1][17:0] D[16] -pin TowardsConvUnit_FF_reg[3][1][17:0] D[16]
load net BRAMWord[0][3]0_out[7] -attr @rip O[7] -pin BRAMWord[0][3]_i O[7] -pin TowardsConvUnit_FF_reg[0][3][17:0] D[7] -pin TowardsConvUnit_FF_reg[2][3][17:0] D[7]
load net BRAMWord[0][6][16] -attr @rip BRAMWord[0][6][16] -port BRAMWord[0][6][16] -pin BRAMWord[0][6]_i I0[16] -pin BRAMWord[0][6]_i__0 I0[16]
load net BRAMWord[0][1]_i__0_n_2 -attr @rip O[15] -pin BRAMWord[0][1]_i__0 O[15] -pin TowardsConvUnit_FF_reg[1][1][17:0] D[15] -pin TowardsConvUnit_FF_reg[3][1][17:0] D[15]
load net TowardsConvUnit[3][3]_OBUF[3] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[3][3][17:0] Q[3]
load net BRAMWord[0][1]_i__0_n_3 -attr @rip O[14] -pin BRAMWord[0][1]_i__0 O[14] -pin TowardsConvUnit_FF_reg[1][1][17:0] D[14] -pin TowardsConvUnit_FF_reg[3][1][17:0] D[14]
load net TowardsConvUnit[0][0][9] -attr @rip 9 -port TowardsConvUnit[0][0][9] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst O[9]
load net BRAMWord[0][1]_i__0_n_4 -attr @rip O[13] -pin BRAMWord[0][1]_i__0 O[13] -pin TowardsConvUnit_FF_reg[1][1][17:0] D[13] -pin TowardsConvUnit_FF_reg[3][1][17:0] D[13]
load net TowardsConvUnit[2][4]_OBUF[17] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[2][4][17:0] Q[17]
load net TowardsConvUnit[3][4][15] -attr @rip 15 -port TowardsConvUnit[3][4][15] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst O[15]
load net TowardsConvUnit[0][4][5] -attr @rip 5 -port TowardsConvUnit[0][4][5] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst O[5]
load net BRAMWord[0][1]_i__0_n_5 -attr @rip O[12] -pin BRAMWord[0][1]_i__0 O[12] -pin TowardsConvUnit_FF_reg[1][1][17:0] D[12] -pin TowardsConvUnit_FF_reg[3][1][17:0] D[12]
load net TowardsConvUnit[2][1][3] -attr @rip 3 -port TowardsConvUnit[2][1][3] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst O[3]
load net TowardsConvUnit[2][4]_OBUF[7] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[2][4][17:0] Q[7]
load net BRAMWord[1][3][6] -attr @rip BRAMWord[1][3][6] -pin BRAMWord[0][3]_i I1[6] -pin BRAMWord[0][3]_i__0 I1[6] -port BRAMWord[1][3][6]
load net BRAMWord[1][0][1] -attr @rip BRAMWord[1][0][1] -pin BRAMWord[0][0]_i I1[1] -pin BRAMWord[0][0]_i__0 I1[1] -port BRAMWord[1][0][1]
load net BRAMWord[0][0][12] -attr @rip BRAMWord[0][0][12] -port BRAMWord[0][0][12] -pin BRAMWord[0][0]_i I0[12] -pin BRAMWord[0][0]_i__0 I0[12]
load net BRAMWord[0][1]_i__0_n_6 -attr @rip O[11] -pin BRAMWord[0][1]_i__0 O[11] -pin TowardsConvUnit_FF_reg[1][1][17:0] D[11] -pin TowardsConvUnit_FF_reg[3][1][17:0] D[11]
load net TowardsConvUnit[0][1][3] -attr @rip 3 -port TowardsConvUnit[0][1][3] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst O[3]
load net TowardsConvUnit[1][5]_OBUF[3] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[1][5][17:0] Q[3]
load net TowardsConvUnit[3][0]_OBUF[4] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[3][0][17:0] Q[4]
load net TowardsConvUnit[3][7]_OBUF[6] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[3][7][17:0] Q[6]
load net BRAMWord[0][1]_i__0_n_7 -attr @rip O[10] -pin BRAMWord[0][1]_i__0 O[10] -pin TowardsConvUnit_FF_reg[1][1][17:0] D[10] -pin TowardsConvUnit_FF_reg[3][1][17:0] D[10]
load net TowardsConvUnit[1][3][6] -attr @rip 6 -port TowardsConvUnit[1][3][6] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst O[6]
load net BRAMWord[0][1]_i__0_n_8 -attr @rip O[9] -pin BRAMWord[0][1]_i__0 O[9] -pin TowardsConvUnit_FF_reg[1][1][17:0] D[9] -pin TowardsConvUnit_FF_reg[3][1][17:0] D[9]
load net TowardsConvUnit[1][3]_OBUF[4] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[1][3][17:0] Q[4]
load net BRAMWord[0][3][4] -attr @rip BRAMWord[0][3][4] -port BRAMWord[0][3][4] -pin BRAMWord[0][3]_i I0[4] -pin BRAMWord[0][3]_i__0 I0[4]
load net BRAMWord[0][1]_i__0_n_9 -attr @rip O[8] -pin BRAMWord[0][1]_i__0 O[8] -pin TowardsConvUnit_FF_reg[1][1][17:0] D[8] -pin TowardsConvUnit_FF_reg[3][1][17:0] D[8]
load net TowardsConvUnit[1][3][8] -attr @rip 8 -port TowardsConvUnit[1][3][8] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst O[8]
load net TowardsConvUnit[0][0][12] -attr @rip 12 -port TowardsConvUnit[0][0][12] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst O[12]
load net TowardsConvUnit[0][6]_OBUF[16] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[0][6][17:0] Q[16]
load net BRAMWord[0][1]0_out[9] -attr @rip O[9] -pin BRAMWord[0][1]_i O[9] -pin TowardsConvUnit_FF_reg[0][1][17:0] D[9] -pin TowardsConvUnit_FF_reg[2][1][17:0] D[9]
load net BRAMWord[0][5][14] -attr @rip BRAMWord[0][5][14] -port BRAMWord[0][5][14] -pin BRAMWord[0][5]_i I0[14] -pin BRAMWord[0][5]_i__0 I0[14]
load net TowardsConvUnit[0][5][0] -attr @rip 0 -port TowardsConvUnit[0][5][0] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst O[0]
load net TowardsConvUnit[1][6]_OBUF[3] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[1][6][17:0] Q[3]
load net TowardsConvUnit[2][1]_OBUF[0] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[2][1][17:0] Q[0]
load net TowardsConvUnit[2][5]_OBUF[5] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[2][5][17:0] Q[5]
load net <const1> -power -pin TowardsConvUnit_FF[0][7:0]_i I0 -pin TowardsConvUnit_FF[1][7:0]_i I0 -pin TowardsConvUnit_FF[2][7:0]_i I0 -pin TowardsConvUnit_FF[3][7:0]_i I0
load net BRAMWord[1][1][3] -attr @rip BRAMWord[1][1][3] -pin BRAMWord[0][1]_i I1[3] -pin BRAMWord[0][1]_i__0 I1[3] -port BRAMWord[1][1][3]
load net TowardsConvUnit[1][7][10] -attr @rip 10 -port TowardsConvUnit[1][7][10] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst O[10]
load net TowardsConvUnit[2][7][11] -attr @rip 11 -port TowardsConvUnit[2][7][11] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst O[11]
load net TowardsConvUnit[3][2]_OBUF[17] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[3][2][17:0] Q[17]
load net BRAMWord[1][6][3] -attr @rip BRAMWord[1][6][3] -pin BRAMWord[0][6]_i I1[3] -pin BRAMWord[0][6]_i__0 I1[3] -port BRAMWord[1][6][3]
load net TowardsConvUnit[0][3][17] -attr @rip 17 -port TowardsConvUnit[0][3][17] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst O[17]
load net TowardsConvUnit[2][6]_OBUF[5] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[2][6][17:0] Q[5]
load net TowardsConvUnit[3][5]_OBUF[10] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[3][5][17:0] Q[10]
load net BRAMWord[1][6][12] -attr @rip BRAMWord[1][6][12] -pin BRAMWord[0][6]_i I1[12] -pin BRAMWord[0][6]_i__0 I1[12] -port BRAMWord[1][6][12]
load net BRAMWord[0][4][8] -attr @rip BRAMWord[0][4][8] -port BRAMWord[0][4][8] -pin BRAMWord[0][4]_i I0[8] -pin BRAMWord[0][4]_i__0 I0[8]
load net BRAMWord[1][2][10] -attr @rip BRAMWord[1][2][10] -pin BRAMWord[0][2]_i I1[10] -pin BRAMWord[0][2]_i__0 I1[10] -port BRAMWord[1][2][10]
load net TowardsConvUnit[3][3][0] -attr @rip 0 -port TowardsConvUnit[3][3][0] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst O[0]
load net TowardsConvUnit[3][4][3] -attr @rip 3 -port TowardsConvUnit[3][4][3] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst O[3]
load net TowardsConvUnit[3][4]_OBUF[2] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[3][4][17:0] Q[2]
load net TowardsConvUnit_FF[2][5] -pin TowardsConvUnit_FF[2][7:0]_i O[5] -pin TowardsConvUnit_FF_reg[2][5][17:0] RST
load net TowardsConvUnit[2][3]_OBUF[13] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[2][3][17:0] Q[13]
load net TowardsConvUnit[3][0]_OBUF[15] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[3][0][17:0] Q[15]
load net TowardsConvUnit[3][3]_OBUF[2] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[3][3][17:0] Q[2]
load net TowardsConvUnit[0][5][13] -attr @rip 13 -port TowardsConvUnit[0][5][13] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst O[13]
load net BRAMWord[0][6][17] -attr @rip BRAMWord[0][6][17] -port BRAMWord[0][6][17] -pin BRAMWord[0][6]_i I0[17] -pin BRAMWord[0][6]_i__0 I0[17]
load net BRAMWord[1][3][3] -attr @rip BRAMWord[1][3][3] -pin BRAMWord[0][3]_i I1[3] -pin BRAMWord[0][3]_i__0 I1[3] -port BRAMWord[1][3][3]
load net TowardsConvUnit[0][0][8] -attr @rip 8 -port TowardsConvUnit[0][0][8] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst O[8]
load net BRAMWord[0][1]0_out[4] -attr @rip O[4] -pin BRAMWord[0][1]_i O[4] -pin TowardsConvUnit_FF_reg[0][1][17:0] D[4] -pin TowardsConvUnit_FF_reg[2][1][17:0] D[4]
load net TowardsConvUnit[0][1]_OBUF[17] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[0][1][17:0] Q[17]
load net TowardsConvUnit[1][5]_OBUF[2] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[1][5][17:0] Q[2]
load net TowardsConvUnit[3][0]_OBUF[3] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[3][0][17:0] Q[3]
load net TowardsConvUnit[3][4][16] -attr @rip 16 -port TowardsConvUnit[3][4][16] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst O[16]
load net TowardsConvUnit[2][4]_OBUF[8] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[2][4][17:0] Q[8]
load net TowardsConvUnit[3][3][13] -attr @rip 13 -port TowardsConvUnit[3][3][13] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst O[13]
load net TowardsConvUnit[0][1][4] -attr @rip 4 -port TowardsConvUnit[0][1][4] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst O[4]
load net TowardsConvUnit[3][7]_OBUF[7] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[3][7][17:0] Q[7]
load net BRAMWord[0][5][11] -attr @rip BRAMWord[0][5][11] -port BRAMWord[0][5][11] -pin BRAMWord[0][5]_i I0[11] -pin BRAMWord[0][5]_i__0 I0[11]
load net BRAMWord[1][1][5] -attr @rip BRAMWord[1][1][5] -pin BRAMWord[0][1]_i I1[5] -pin BRAMWord[0][1]_i__0 I1[5] -port BRAMWord[1][1][5]
load net TowardsConvUnit[1][3][7] -attr @rip 7 -port TowardsConvUnit[1][3][7] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst O[7]
load net BRAMWord[0][6][6] -attr @rip BRAMWord[0][6][6] -port BRAMWord[0][6][6] -pin BRAMWord[0][6]_i I0[6] -pin BRAMWord[0][6]_i__0 I0[6]
load net BRAMWord[0][3][5] -attr @rip BRAMWord[0][3][5] -port BRAMWord[0][3][5] -pin BRAMWord[0][3]_i I0[5] -pin BRAMWord[0][3]_i__0 I0[5]
load net TowardsConvUnit[0][4][14] -attr @rip 14 -port TowardsConvUnit[0][4][14] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst O[14]
load net TowardsConvUnit[0][0][13] -attr @rip 13 -port TowardsConvUnit[0][0][13] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst O[13]
load net BRAMWord[1][1][2] -attr @rip BRAMWord[1][1][2] -pin BRAMWord[0][1]_i I1[2] -pin BRAMWord[0][1]_i__0 I1[2] -port BRAMWord[1][1][2]
load net TowardsConvUnit[0][6]_OBUF[17] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[0][6][17:0] Q[17]
load net TowardsConvUnit[1][3]_OBUF[7] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[1][3][17:0] Q[7]
load net TowardsConvUnit[1][5]_OBUF[17] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[1][5][17:0] Q[17]
load net BRAMWord[1][6][2] -attr @rip BRAMWord[1][6][2] -pin BRAMWord[0][6]_i I1[2] -pin BRAMWord[0][6]_i__0 I1[2] -port BRAMWord[1][6][2]
load net BRAMWord[0][0][9] -attr @rip BRAMWord[0][0][9] -port BRAMWord[0][0][9] -pin BRAMWord[0][0]_i I0[9] -pin BRAMWord[0][0]_i__0 I0[9]
load net TowardsConvUnit[0][5][1] -attr @rip 1 -port TowardsConvUnit[0][5][1] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst O[1]
load net TowardsConvUnit[1][6]_OBUF[10] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[1][6][17:0] Q[10]
load net TowardsConvUnit[2][1]_OBUF[1] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[2][1][17:0] Q[1]
load net TowardsConvUnit[2][5]_OBUF[6] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[2][5][17:0] Q[6]
load net BRAMWord[1][6][11] -attr @rip BRAMWord[1][6][11] -pin BRAMWord[0][6]_i I1[11] -pin BRAMWord[0][6]_i__0 I1[11] -port BRAMWord[1][6][11]
load net BRAMWord[0][4][7] -attr @rip BRAMWord[0][4][7] -port BRAMWord[0][4][7] -pin BRAMWord[0][4]_i I0[7] -pin BRAMWord[0][4]_i__0 I0[7]
load net TowardsConvUnit[2][5]_OBUF[17] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[2][5][17:0] Q[17]
load net TowardsConvUnit[3][4][2] -attr @rip 2 -port TowardsConvUnit[3][4][2] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst O[2]
load net TowardsConvUnit[3][4]_OBUF[1] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[3][4][17:0] Q[1]
load net TowardsConvUnit[3][1][9] -attr @rip 9 -port TowardsConvUnit[3][1][9] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst O[9]
load net BRAMWord[1][2][11] -attr @rip BRAMWord[1][2][11] -pin BRAMWord[0][2]_i I1[11] -pin BRAMWord[0][2]_i__0 I1[11] -port BRAMWord[1][2][11]
load net TowardsConvUnit[2][3]_OBUF[12] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[2][3][17:0] Q[12]
load net TowardsConvUnit[3][3][1] -attr @rip 1 -port TowardsConvUnit[3][3][1] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst O[1]
load net TowardsConvUnit[0][0]_OBUF[11] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[0][0][17:0] Q[11]
load net TowardsConvUnit[0][0][7] -attr @rip 7 -port TowardsConvUnit[0][0][7] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst O[7]
load net TowardsConvUnit[2][4]_OBUF[15] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[2][4][17:0] Q[15]
load net TowardsConvUnit[3][4][13] -attr @rip 13 -port TowardsConvUnit[3][4][13] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst O[13]
load net TowardsConvUnit[0][5][14] -attr @rip 14 -port TowardsConvUnit[0][5][14] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst O[14]
load net TowardsConvUnit[2][6]_OBUF[15] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[2][6][17:0] Q[15]
load net TowardsConvUnit[3][6][17] -attr @rip 17 -port TowardsConvUnit[3][6][17] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst O[17]
load net BRAMWord[0][1]0_out[3] -attr @rip O[3] -pin BRAMWord[0][1]_i O[3] -pin TowardsConvUnit_FF_reg[0][1][17:0] D[3] -pin TowardsConvUnit_FF_reg[2][1][17:0] D[3]
load net BRAMWord[0][3]0_out[9] -attr @rip O[9] -pin BRAMWord[0][3]_i O[9] -pin TowardsConvUnit_FF_reg[0][3][17:0] D[9] -pin TowardsConvUnit_FF_reg[2][3][17:0] D[9]
load net TowardsConvUnit[0][1]_OBUF[16] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[0][1][17:0] Q[16]
load net BRAMWord[1][3][4] -attr @rip BRAMWord[1][3][4] -pin BRAMWord[0][3]_i I1[4] -pin BRAMWord[0][3]_i__0 I1[4] -port BRAMWord[1][3][4]
load net TowardsConvUnit[3][0]_OBUF[2] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[3][0][17:0] Q[2]
load net TowardsConvUnit[3][3][12] -attr @rip 12 -port TowardsConvUnit[3][3][12] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst O[12]
load net TowardsConvUnit[1][3][16] -attr @rip 16 -port TowardsConvUnit[1][3][16] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst O[16]
load net TowardsConvUnit[2][4]_OBUF[9] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[2][4][17:0] Q[9]
load net TowardsConvUnit[0][1][5] -attr @rip 5 -port TowardsConvUnit[0][1][5] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst O[5]
load net BRAMWord[0][6][5] -attr @rip BRAMWord[0][6][5] -port BRAMWord[0][6][5] -pin BRAMWord[0][6]_i I0[5] -pin BRAMWord[0][6]_i__0 I0[5]
load net TowardsConvUnit[0][1]_OBUF[9] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[0][1][17:0] Q[9]
load net TowardsConvUnit[1][5]_OBUF[5] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[1][5][17:0] Q[5]
load net TowardsConvUnit[2][1][17] -attr @rip 17 -port TowardsConvUnit[2][1][17] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst O[17]
load net TowardsConvUnit[3][3]_OBUF[9] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[3][3][17:0] Q[9]
load net BRAMWord[0][5][12] -attr @rip BRAMWord[0][5][12] -port BRAMWord[0][5][12] -pin BRAMWord[0][5]_i I0[12] -pin BRAMWord[0][5]_i__0 I0[12]
load net BRAMWord[1][1][6] -attr @rip BRAMWord[1][1][6] -pin BRAMWord[0][1]_i I1[6] -pin BRAMWord[0][1]_i__0 I1[6] -port BRAMWord[1][1][6]
load net BRAMWord[1][1][1] -attr @rip BRAMWord[1][1][1] -pin BRAMWord[0][1]_i I1[1] -pin BRAMWord[0][1]_i__0 I1[1] -port BRAMWord[1][1][1]
load net TowardsConvUnit[1][3]_OBUF[6] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[1][3][17:0] Q[6]
load net BRAMWord[0][0][8] -attr @rip BRAMWord[0][0][8] -port BRAMWord[0][0][8] -pin BRAMWord[0][0]_i I0[8] -pin BRAMWord[0][0]_i__0 I0[8]
load net BRAMWord[0][3][6] -attr @rip BRAMWord[0][3][6] -port BRAMWord[0][3][6] -pin BRAMWord[0][3]_i I0[6] -pin BRAMWord[0][3]_i__0 I0[6]
load net TowardsConvUnit[0][4][15] -attr @rip 15 -port TowardsConvUnit[0][4][15] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst O[15]
load net TowardsConvUnit[1][5][3] -attr @rip 3 -port TowardsConvUnit[1][5][3] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst O[3]
load net TowardsConvUnit[0][0][14] -attr @rip 14 -port TowardsConvUnit[0][0][14] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst O[14]
load net TowardsConvUnit[3][7]_OBUF[3] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[3][7][17:0] Q[3]
load net BRAMWord[1][6][10] -attr @rip BRAMWord[1][6][10] -pin BRAMWord[0][6]_i I1[10] -pin BRAMWord[0][6]_i__0 I1[10] -port BRAMWord[1][6][10]
load net BRAMWord[0][4][6] -attr @rip BRAMWord[0][4][6] -port BRAMWord[0][4][6] -pin BRAMWord[0][4]_i I0[6] -pin BRAMWord[0][4]_i__0 I0[6]
load net TowardsConvUnit[0][5][2] -attr @rip 2 -port TowardsConvUnit[0][5][2] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst O[2]
load net TowardsConvUnit[1][6]_OBUF[11] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[1][6][17:0] Q[11]
load net TowardsConvUnit[2][1]_OBUF[2] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[2][1][17:0] Q[2]
load net TowardsConvUnit[2][2]_OBUF[4] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[2][2][17:0] Q[4]
load net TowardsConvUnit[2][5]_OBUF[16] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[2][5][17:0] Q[16]
load net TowardsConvUnit[2][5]_OBUF[7] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[2][5][17:0] Q[7]
load net TowardsConvUnit[3][4][1] -attr @rip 1 -port TowardsConvUnit[3][4][1] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst O[1]
load net TowardsConvUnit[3][1][8] -attr @rip 8 -port TowardsConvUnit[3][1][8] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst O[8]
load net BRAMWord[1][6][5] -attr @rip BRAMWord[1][6][5] -pin BRAMWord[0][6]_i I1[5] -pin BRAMWord[0][6]_i__0 I1[5] -port BRAMWord[1][6][5]
load net TowardsConvUnit[2][6][10] -attr @rip 10 -port TowardsConvUnit[2][6][10] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst O[10]
load net TowardsConvUnit[0][5][11] -attr @rip 11 -port TowardsConvUnit[0][5][11] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst O[11]
load net TowardsConvUnit[2][4]_OBUF[2] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[2][4][17:0] Q[2]
load net BRAMWord[1][2][12] -attr @rip BRAMWord[1][2][12] -pin BRAMWord[0][2]_i I1[12] -pin BRAMWord[0][2]_i__0 I1[12] -port BRAMWord[1][2][12]
load net TowardsConvUnit[3][3][2] -attr @rip 2 -port TowardsConvUnit[3][3][2] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst O[2]
load net TowardsConvUnit[0][0]_OBUF[12] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[0][0][17:0] Q[12]
load net TowardsConvUnit[2][7][17] -attr @rip 17 -port TowardsConvUnit[2][7][17] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst O[17]
load net TowardsConvUnit[2][3]_OBUF[15] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[2][3][17:0] Q[15]
load net TowardsConvUnit[2][4]_OBUF[16] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[2][4][17:0] Q[16]
load net TowardsConvUnit[3][0]_OBUF[1] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[3][0][17:0] Q[1]
load net TowardsConvUnit[3][4][14] -attr @rip 14 -port TowardsConvUnit[3][4][14] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst O[14]
load net TowardsConvUnit[2][6]_OBUF[16] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[2][6][17:0] Q[16]
load net TowardsConvUnit[3][3][11] -attr @rip 11 -port TowardsConvUnit[3][3][11] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst O[11]
load net BRAMWord[0][0]0_out[17] -attr @rip O[17] -pin BRAMWord[0][0]_i O[17] -pin TowardsConvUnit_FF_reg[0][0][17:0] D[17] -pin TowardsConvUnit_FF_reg[2][0][17:0] D[17]
load net TowardsConvUnit[1][3]_OBUF[1] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[1][3][17:0] Q[1]
load net BRAMWord[0][1]0_out[6] -attr @rip O[6] -pin BRAMWord[0][1]_i O[6] -pin TowardsConvUnit_FF_reg[0][1][17:0] D[6] -pin TowardsConvUnit_FF_reg[2][1][17:0] D[6]
load net MuxSelect[1][0] -attr @rip MuxSelect[1][0] -pin BRAMWord[0][0]_i__0 S -pin BRAMWord[0][1]_i__0 S -pin BRAMWord[0][2]_i__0 S -pin BRAMWord[0][3]_i__0 S -pin BRAMWord[0][4]_i__0 S -pin BRAMWord[0][5]_i__0 S -pin BRAMWord[0][6]_i__0 S -pin BRAMWord[0][7]_i__0 S -port MuxSelect[1][0]
netloc MuxSelect[1][0] 1 0 1 60
load net TowardsConvUnit[0][0]_OBUF[8] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[0][0][17:0] Q[8]
load net TowardsConvUnit[1][3][17] -attr @rip 17 -port TowardsConvUnit[1][3][17] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst O[17]
load net TowardsConvUnit[1][5]_OBUF[4] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[1][5][17:0] Q[4]
load net TowardsConvUnit[3][2]_OBUF[12] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[3][2][17:0] Q[12]
load net TowardsConvUnit[3][3]_OBUF[8] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[3][3][17:0] Q[8]
load net TowardsConvUnit[0][4][12] -attr @rip 12 -port TowardsConvUnit[0][4][12] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst O[12]
load net TowardsConvUnit[0][6][4] -attr @rip 4 -port TowardsConvUnit[0][6][4] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst O[4]
load net BRAMWord[1][1][0] -attr @rip BRAMWord[1][1][0] -pin BRAMWord[0][1]_i I1[0] -pin BRAMWord[0][1]_i__0 I1[0] -port BRAMWord[1][1][0]
load net TowardsConvUnit[1][4]_OBUF[16] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[1][4][17:0] Q[16]
load net BRAMWord[1][1][7] -attr @rip BRAMWord[1][1][7] -pin BRAMWord[0][1]_i I1[7] -pin BRAMWord[0][1]_i__0 I1[7] -port BRAMWord[1][1][7]
load net BRAMWord[0][0][7] -attr @rip BRAMWord[0][0][7] -port BRAMWord[0][0][7] -pin BRAMWord[0][0]_i I0[7] -pin BRAMWord[0][0]_i__0 I0[7]
load net TowardsConvUnit[1][3][9] -attr @rip 9 -port TowardsConvUnit[1][3][9] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst O[9]
load net TowardsConvUnit_FF[2][0] -pin TowardsConvUnit_FF[2][7:0]_i O[0] -pin TowardsConvUnit_FF_reg[2][0][17:0] RST
load net BRAMWord[0][6][8] -attr @rip BRAMWord[0][6][8] -port BRAMWord[0][6][8] -pin BRAMWord[0][6]_i I0[8] -pin BRAMWord[0][6]_i__0 I0[8]
load net TowardsConvUnit[1][1]_OBUF[14] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[1][1][17:0] Q[14]
load net TowardsConvUnit[3][7]_OBUF[2] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[3][7][17:0] Q[2]
load net BRAMWord[0][4][5] -attr @rip BRAMWord[0][4][5] -port BRAMWord[0][4][5] -pin BRAMWord[0][4]_i I0[5] -pin BRAMWord[0][4]_i__0 I0[5]
load net BRAMWord[0][3][7] -attr @rip BRAMWord[0][3][7] -port BRAMWord[0][3][7] -pin BRAMWord[0][3]_i I0[7] -pin BRAMWord[0][3]_i__0 I0[7]
load net TowardsConvUnit[1][5][4] -attr @rip 4 -port TowardsConvUnit[1][5][4] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst O[4]
load net TowardsConvUnit[2][5]_OBUF[15] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[2][5][17:0] Q[15]
load net TowardsConvUnit[3][4][0] -attr @rip 0 -port TowardsConvUnit[3][4][0] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst O[0]
load net TowardsConvUnit[0][0][15] -attr @rip 15 -port TowardsConvUnit[0][0][15] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst O[15]
load net TowardsConvUnit[2][5][9] -attr @rip 9 -port TowardsConvUnit[2][5][9] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst O[9]
load net TowardsConvUnit[3][1][7] -attr @rip 7 -port TowardsConvUnit[3][1][7] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst O[7]
load net BRAMWord[1][6][4] -attr @rip BRAMWord[1][6][4] -pin BRAMWord[0][6]_i I1[4] -pin BRAMWord[0][6]_i__0 I1[4] -port BRAMWord[1][6][4]
load net TowardsConvUnit[0][5][3] -attr @rip 3 -port TowardsConvUnit[0][5][3] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst O[3]
load net TowardsConvUnit[1][6]_OBUF[12] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[1][6][17:0] Q[12]
load net TowardsConvUnit[2][1]_OBUF[3] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[2][1][17:0] Q[3]
load net TowardsConvUnit[2][2]_OBUF[5] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[2][2][17:0] Q[5]
load net TowardsConvUnit[2][5]_OBUF[8] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[2][5][17:0] Q[8]
load net TowardsConvUnit[2][4]_OBUF[13] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[2][4][17:0] Q[13]
load net TowardsConvUnit[2][6][11] -attr @rip 11 -port TowardsConvUnit[2][6][11] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst O[11]
load net TowardsConvUnit[0][5][12] -attr @rip 12 -port TowardsConvUnit[0][5][12] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst O[12]
load net TowardsConvUnit[2][4]_OBUF[3] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[2][4][17:0] Q[3]
load net TowardsConvUnit[2][6]_OBUF[13] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[2][6][17:0] Q[13]
load net TowardsConvUnit[2][7][16] -attr @rip 16 -port TowardsConvUnit[2][7][16] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst O[16]
load net TowardsConvUnit[3][6][15] -attr @rip 15 -port TowardsConvUnit[3][6][15] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst O[15]
load net BRAMWord[1][7][17] -attr @rip BRAMWord[1][7][17] -pin BRAMWord[0][7]_i I1[17] -pin BRAMWord[0][7]_i__0 I1[17] -port BRAMWord[1][7][17]
load net TowardsConvUnit[2][3]_OBUF[14] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[2][3][17:0] Q[14]
load net TowardsConvUnit[3][3][3] -attr @rip 3 -port TowardsConvUnit[3][3][3] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst O[3]
load net TowardsConvUnit[3][3][10] -attr @rip 10 -port TowardsConvUnit[3][3][10] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst O[10]
load net TowardsConvUnit[1][3]_OBUF[0] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[1][3][17:0] Q[0]
load net TowardsConvUnit[0][7]_OBUF[9] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[0][7][17:0] Q[9]
load net TowardsConvUnit[1][2][8] -attr @rip 8 -port TowardsConvUnit[1][2][8] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst O[8]
load net BRAMWord[0][1]0_out[5] -attr @rip O[5] -pin BRAMWord[0][1]_i O[5] -pin TowardsConvUnit_FF_reg[0][1][17:0] D[5] -pin TowardsConvUnit_FF_reg[2][1][17:0] D[5]
load net TowardsConvUnit[0][1]_OBUF[7] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[0][1][17:0] Q[7]
load net TowardsConvUnit[2][7]_OBUF[9] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[2][7][17:0] Q[9]
load net TowardsConvUnit[3][3]_OBUF[7] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[3][3][17:0] Q[7]
load net TowardsConvUnit[2][5]_OBUF[1] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[2][5][17:0] Q[1]
load net TowardsConvUnit[0][6][3] -attr @rip 3 -port TowardsConvUnit[0][6][3] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst O[3]
load net TowardsConvUnit[0][0]_OBUF[9] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[0][0][17:0] Q[9]
load net TowardsConvUnit[3][2]_OBUF[13] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[3][2][17:0] Q[13]
load net TowardsConvUnit[0][4][13] -attr @rip 13 -port TowardsConvUnit[0][4][13] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst O[13]
load net TowardsConvUnit[1][5][1] -attr @rip 1 -port TowardsConvUnit[1][5][1] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst O[1]
load net TowardsConvUnit[3][5][16] -attr @rip 16 -port TowardsConvUnit[3][5][16] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst O[16]
load net BRAMWord[0][6][7] -attr @rip BRAMWord[0][6][7] -port BRAMWord[0][6][7] -pin BRAMWord[0][6]_i I0[7] -pin BRAMWord[0][6]_i__0 I0[7]
load net TowardsConvUnit[1][1]_OBUF[13] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[1][1][17:0] Q[13]
load net TowardsConvUnit[1][4]_OBUF[17] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[1][4][17:0] Q[17]
load net TowardsConvUnit[1][5]_OBUF[7] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[1][5][17:0] Q[7]
load net BRAMWord[1][1][8] -attr @rip BRAMWord[1][1][8] -pin BRAMWord[0][1]_i I1[8] -pin BRAMWord[0][1]_i__0 I1[8] -port BRAMWord[1][1][8]
load net BRAMWord[0][4][4] -attr @rip BRAMWord[0][4][4] -port BRAMWord[0][4][4] -pin BRAMWord[0][4]_i I0[4] -pin BRAMWord[0][4]_i__0 I0[4]
load net TowardsConvUnit[2][1][9] -attr @rip 9 -port TowardsConvUnit[2][1][9] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst O[9]
load net TowardsConvUnit[2][5][11] -attr @rip 11 -port TowardsConvUnit[2][5][11] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst O[11]
load net TowardsConvUnit[2][5]_OBUF[14] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[2][5][17:0] Q[14]
load net TowardsConvUnit_FF[2][1] -pin TowardsConvUnit_FF[2][7:0]_i O[1] -pin TowardsConvUnit_FF_reg[2][1][17:0] RST
load net TowardsConvUnit[2][5][8] -attr @rip 8 -port TowardsConvUnit[2][5][8] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst O[8]
load net BRAMWord[0][3][8] -attr @rip BRAMWord[0][3][8] -port BRAMWord[0][3][8] -pin BRAMWord[0][3]_i I0[8] -pin BRAMWord[0][3]_i__0 I0[8]
load net TowardsConvUnit[0][0][16] -attr @rip 16 -port TowardsConvUnit[0][0][16] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst O[16]
load net TowardsConvUnit[3][7]_OBUF[5] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[3][7][17:0] Q[5]
load net TowardsConvUnit[0][5][4] -attr @rip 4 -port TowardsConvUnit[0][5][4] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst O[4]
load net TowardsConvUnit[1][6]_OBUF[13] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[1][6][17:0] Q[13]
load net TowardsConvUnit[2][1]_OBUF[4] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[2][1][17:0] Q[4]
load net TowardsConvUnit[2][2]_OBUF[6] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[2][2][17:0] Q[6]
load net TowardsConvUnit[0][0]_OBUF[10] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[0][0][17:0] Q[10]
load net TowardsConvUnit[2][7][15] -attr @rip 15 -port TowardsConvUnit[2][7][15] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst O[15]
load net BRAMWord[0][1]0_out[0] -attr @rip O[0] -pin BRAMWord[0][1]_i O[0] -pin TowardsConvUnit_FF_reg[0][1][17:0] D[0] -pin TowardsConvUnit_FF_reg[2][1][17:0] D[0]
load net BRAMWord[1][7][16] -attr @rip BRAMWord[1][7][16] -pin BRAMWord[0][7]_i I1[16] -pin BRAMWord[0][7]_i__0 I1[16] -port BRAMWord[1][7][16]
load net BRAMWord[1][6][7] -attr @rip BRAMWord[1][6][7] -pin BRAMWord[0][6]_i I1[7] -pin BRAMWord[0][6]_i__0 I1[7] -port BRAMWord[1][6][7]
load net TowardsConvUnit[1][2][17] -attr @rip 17 -port TowardsConvUnit[1][2][17] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst O[17]
load net TowardsConvUnit[2][4]_OBUF[14] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[2][4][17:0] Q[14]
load net BRAMWord[0][6]0_out[1] -attr @rip O[1] -pin BRAMWord[0][6]_i O[1] -pin TowardsConvUnit_FF_reg[0][6][17:0] D[1] -pin TowardsConvUnit_FF_reg[2][6][17:0] D[1]
load net TowardsConvUnit[2][0]_OBUF[8] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[2][0][17:0] Q[8]
load net TowardsConvUnit[2][4]_OBUF[4] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[2][4][17:0] Q[4]
load net TowardsConvUnit[2][6]_OBUF[14] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[2][6][17:0] Q[14]
load net TowardsConvUnit[3][6][16] -attr @rip 16 -port TowardsConvUnit[3][6][16] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst O[16]
load net TowardsConvUnit[3][6]_OBUF[9] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[3][6][17:0] Q[9]
load net TowardsConvUnit[0][1][0] -attr @rip 0 -port TowardsConvUnit[0][1][0] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst O[0]
load net BRAMWord[1][6][16] -attr @rip BRAMWord[1][6][16] -pin BRAMWord[0][6]_i I1[16] -pin BRAMWord[0][6]_i__0 I1[16] -port BRAMWord[1][6][16]
load net TowardsConvUnit[3][3][4] -attr @rip 4 -port TowardsConvUnit[3][3][4] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst O[4]
load net TowardsConvUnit_FF[3][4] -pin TowardsConvUnit_FF[3][7:0]_i O[4] -pin TowardsConvUnit_FF_reg[3][4][17:0] RST
load net TowardsConvUnit[2][0]_OBUF[10] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[2][0][17:0] Q[10]
load net BRAMWord[0][6][2] -attr @rip BRAMWord[0][6][2] -port BRAMWord[0][6][2] -pin BRAMWord[0][6]_i I0[2] -pin BRAMWord[0][6]_i__0 I0[2]
load net TowardsConvUnit[2][7]_OBUF[8] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[2][7][17:0] Q[8]
load net TowardsConvUnit[3][3]_OBUF[6] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[3][3][17:0] Q[6]
load net TowardsConvUnit[0][4][10] -attr @rip 10 -port TowardsConvUnit[0][4][10] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst O[10]
load net TowardsConvUnit[1][2][9] -attr @rip 9 -port TowardsConvUnit[1][2][9] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst O[9]
load net TowardsConvUnit_FF[1][7] -pin TowardsConvUnit_FF[1][7:0]_i O[7] -pin TowardsConvUnit_FF_reg[1][7][17:0] RST
load net TowardsConvUnit[0][6][2] -attr @rip 2 -port TowardsConvUnit[0][6][2] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst O[2]
load net TowardsConvUnit[0][1]_OBUF[8] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[0][1][17:0] Q[8]
load net TowardsConvUnit[1][3]_OBUF[3] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[1][3][17:0] Q[3]
load net TowardsConvUnit[1][4]_OBUF[14] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[1][4][17:0] Q[14]
load net TowardsConvUnit[1][7]_OBUF[14] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[1][7][17:0] Q[14]
load net TowardsConvUnit[2][5]_OBUF[2] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[2][5][17:0] Q[2]
load net TowardsConvUnit[1][1]_OBUF[12] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[1][1][17:0] Q[12]
load net TowardsConvUnit[1][5]_OBUF[6] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[1][5][17:0] Q[6]
load net TowardsConvUnit[3][2]_OBUF[14] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[3][2][17:0] Q[14]
load net BRAMWord[0][4][3] -attr @rip BRAMWord[0][4][3] -port BRAMWord[0][4][3] -pin BRAMWord[0][4]_i I0[3] -pin BRAMWord[0][4]_i__0 I0[3]
load net TowardsConvUnit[1][5][2] -attr @rip 2 -port TowardsConvUnit[1][5][2] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst O[2]
load net TowardsConvUnit[2][1][8] -attr @rip 8 -port TowardsConvUnit[2][1][8] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst O[8]
load net TowardsConvUnit[2][5]_OBUF[13] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[2][5][17:0] Q[13]
load net TowardsConvUnit[3][5][17] -attr @rip 17 -port TowardsConvUnit[3][5][17] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst O[17]
load net TowardsConvUnit[2][5][7] -attr @rip 7 -port TowardsConvUnit[2][5][7] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst O[7]
load net TowardsConvUnit[3][3][14] -attr @rip 14 -port TowardsConvUnit[3][3][14] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst O[14]
load net BRAMWord[1][1][9] -attr @rip BRAMWord[1][1][9] -pin BRAMWord[0][1]_i I1[9] -pin BRAMWord[0][1]_i__0 I1[9] -port BRAMWord[1][1][9]
load net BRAMWord[0][2]0_out[5] -attr @rip O[5] -pin BRAMWord[0][2]_i O[5] -pin TowardsConvUnit_FF_reg[0][2][17:0] D[5] -pin TowardsConvUnit_FF_reg[2][2][17:0] D[5]
load net TowardsConvUnit[2][5][12] -attr @rip 12 -port TowardsConvUnit[2][5][12] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst O[12]
load net TowardsConvUnit[3][7]_OBUF[4] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[3][7][17:0] Q[4]
load net BRAMWord[0][3][9] -attr @rip BRAMWord[0][3][9] -port BRAMWord[0][3][9] -pin BRAMWord[0][3]_i I0[9] -pin BRAMWord[0][3]_i__0 I0[9]
load net TowardsConvUnit[2][4]_OBUF[11] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[2][4][17:0] Q[11]
load net TowardsConvUnit[0][0][17] -attr @rip 17 -port TowardsConvUnit[0][0][17] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst O[17]
load net TowardsConvUnit[0][5][10] -attr @rip 10 -port TowardsConvUnit[0][5][10] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst O[10]
load net TowardsConvUnit[1][7]_OBUF[8] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[1][7][17:0] Q[8]
load net TowardsConvUnit[2][6]_OBUF[11] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[2][6][17:0] Q[11]
load net TowardsConvUnit[3][6][13] -attr @rip 13 -port TowardsConvUnit[3][6][13] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst O[13]
load net TowardsConvUnit[0][5][5] -attr @rip 5 -port TowardsConvUnit[0][5][5] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst O[5]
load net TowardsConvUnit[0][6][9] -attr @rip 9 -port TowardsConvUnit[0][6][9] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst O[9]
load net BRAMWord[1][6][6] -attr @rip BRAMWord[1][6][6] -pin BRAMWord[0][6]_i I1[6] -pin BRAMWord[0][6]_i__0 I1[6] -port BRAMWord[1][6][6]
load net TowardsConvUnit[1][5][8] -attr @rip 8 -port TowardsConvUnit[1][5][8] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst O[8]
load net TowardsConvUnit[1][6]_OBUF[14] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[1][6][17:0] Q[14]
load net TowardsConvUnit[2][1]_OBUF[5] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[2][1][17:0] Q[5]
load net TowardsConvUnit[2][2]_OBUF[7] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[2][2][17:0] Q[7]
load net BRAMWord[0][6]0_out[0] -attr @rip O[0] -pin BRAMWord[0][6]_i O[0] -pin TowardsConvUnit_FF_reg[0][6][17:0] D[0] -pin TowardsConvUnit_FF_reg[2][6][17:0] D[0]
load net BRAMWord[1][6][15] -attr @rip BRAMWord[1][6][15] -pin BRAMWord[0][6]_i I1[15] -pin BRAMWord[0][6]_i__0 I1[15] -port BRAMWord[1][6][15]
load net TowardsConvUnit_FF[3][3] -pin TowardsConvUnit_FF[3][7:0]_i O[3] -pin TowardsConvUnit_FF_reg[3][3][17:0] RST
load net TowardsConvUnit[2][0]_OBUF[9] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[2][0][17:0] Q[9]
load net TowardsConvUnit[2][4]_OBUF[5] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[2][4][17:0] Q[5]
load net TowardsConvUnit[0][1][1] -attr @rip 1 -port TowardsConvUnit[0][1][1] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst O[1]
load net BRAMWord[0][6][1] -attr @rip BRAMWord[0][6][1] -port BRAMWord[0][6][1] -pin BRAMWord[0][6]_i I0[1] -pin BRAMWord[0][6]_i__0 I0[1]
load net TowardsConvUnit[2][7]_OBUF[7] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[2][7][17:0] Q[7]
load net TowardsConvUnit[0][0]_OBUF[15] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[0][0][17:0] Q[15]
load net TowardsConvUnit[2][0]_OBUF[11] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[2][0][17:0] Q[11]
load net TowardsConvUnit[0][6][1] -attr @rip 1 -port TowardsConvUnit[0][6][1] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst O[1]
load net TowardsConvUnit[1][3]_OBUF[2] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[1][3][17:0] Q[2]
load net TowardsConvUnit[2][0][16] -attr @rip 16 -port TowardsConvUnit[2][0][16] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst O[16]
load net TowardsConvUnit[0][4][11] -attr @rip 11 -port TowardsConvUnit[0][4][11] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst O[11]
load net TowardsConvUnit[1][7]_OBUF[13] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[1][7][17:0] Q[13]
load net BRAMWord[0][2]0_out[14] -attr @rip O[14] -pin BRAMWord[0][2]_i O[14] -pin TowardsConvUnit_FF_reg[0][2][17:0] D[14] -pin TowardsConvUnit_FF_reg[2][2][17:0] D[14]
load net TowardsConvUnit[1][1]_OBUF[11] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[1][1][17:0] Q[11]
load net TowardsConvUnit[1][4]_OBUF[15] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[1][4][17:0] Q[15]
load net TowardsConvUnit[2][5]_OBUF[12] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[2][5][17:0] Q[12]
load net TowardsConvUnit[2][5]_OBUF[3] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[2][5][17:0] Q[3]
load net TowardsConvUnit[2][5][6] -attr @rip 6 -port TowardsConvUnit[2][5][6] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst O[6]
load net TowardsConvUnit[3][2]_OBUF[15] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[3][2][17:0] Q[15]
load net BRAMWord[0][2]0_out[4] -attr @rip O[4] -pin BRAMWord[0][2]_i O[4] -pin TowardsConvUnit_FF_reg[0][2][17:0] D[4] -pin TowardsConvUnit_FF_reg[2][2][17:0] D[4]
load net TowardsConvUnit[1][5]_OBUF[9] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[1][5][17:0] Q[9]
load net TowardsConvUnit[3][3][15] -attr @rip 15 -port TowardsConvUnit[3][3][15] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst O[15]
load net TowardsConvUnit[0][1]_OBUF[11] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[0][1][17:0] Q[11]
load net TowardsConvUnit[1][5][7] -attr @rip 7 -port TowardsConvUnit[1][5][7] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst O[7]
load net TowardsConvUnit[2][4]_OBUF[12] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[2][4][17:0] Q[12]
load net TowardsConvUnit[1][7]_OBUF[9] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[1][7][17:0] Q[9]
load net TowardsConvUnit[2][0]_OBUF[6] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[2][0][17:0] Q[6]
load net TowardsConvUnit[2][1]_OBUF[17] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[2][1][17:0] Q[17]
load net TowardsConvUnit[2][6]_OBUF[12] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[2][6][17:0] Q[12]
load net TowardsConvUnit[3][6][14] -attr @rip 14 -port TowardsConvUnit[3][6][14] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst O[14]
load net TowardsConvUnit[3][6]_OBUF[7] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[3][6][17:0] Q[7]
load net BRAMWord[0][2][14] -attr @rip BRAMWord[0][2][14] -port BRAMWord[0][2][14] -pin BRAMWord[0][2]_i I0[14] -pin BRAMWord[0][2]_i__0 I0[14]
load net BRAMWord[1][6][14] -attr @rip BRAMWord[1][6][14] -pin BRAMWord[0][6]_i I1[14] -pin BRAMWord[0][6]_i__0 I1[14] -port BRAMWord[1][6][14]
load net TowardsConvUnit[1][6]_OBUF[15] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[1][6][17:0] Q[15]
load net TowardsConvUnit[2][1]_OBUF[6] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[2][1][17:0] Q[6]
load net TowardsConvUnit[2][2]_OBUF[8] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[2][2][17:0] Q[8]
load net TowardsConvUnit_FF[3][2] -pin TowardsConvUnit_FF[3][7:0]_i O[2] -pin TowardsConvUnit_FF_reg[3][2][17:0] RST
load net BRAMWord[0][1]0_out[2] -attr @rip O[2] -pin BRAMWord[0][1]_i O[2] -pin TowardsConvUnit_FF_reg[0][1][17:0] D[2] -pin TowardsConvUnit_FF_reg[2][1][17:0] D[2]
load net BRAMWord[1][6][9] -attr @rip BRAMWord[1][6][9] -pin BRAMWord[0][6]_i I1[9] -pin BRAMWord[0][6]_i__0 I1[9] -port BRAMWord[1][6][9]
load net TowardsConvUnit[1][4]_OBUF[12] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[1][4][17:0] Q[12]
load net BRAMWord[0][4]0_out[17] -attr @rip O[17] -pin BRAMWord[0][4]_i O[17] -pin TowardsConvUnit_FF_reg[0][4][17:0] D[17] -pin TowardsConvUnit_FF_reg[2][4][17:0] D[17]
load net TowardsConvUnit[0][0]_OBUF[16] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[0][0][17:0] Q[16]
load net TowardsConvUnit[2][0]_OBUF[12] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[2][0][17:0] Q[12]
load net BRAMWord[0][2]0_out[13] -attr @rip O[13] -pin BRAMWord[0][2]_i O[13] -pin TowardsConvUnit_FF_reg[0][2][17:0] D[13] -pin TowardsConvUnit_FF_reg[2][2][17:0] D[13]
load net BRAMWord[0][6][4] -attr @rip BRAMWord[0][6][4] -port BRAMWord[0][6][4] -pin BRAMWord[0][6]_i I0[4] -pin BRAMWord[0][6]_i__0 I0[4]
load net TowardsConvUnit[2][0][17] -attr @rip 17 -port TowardsConvUnit[2][0][17] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst O[17]
load net rst -pin TowardsConvUnit_FF[0][7:0]_i S -pin TowardsConvUnit_FF[1][7:0]_i S -pin TowardsConvUnit_FF[2][7:0]_i S -pin TowardsConvUnit_FF[3][7:0]_i S -port rst
netloc rst 1 0 1 40
load net TowardsConvUnit[2][5]_OBUF[11] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[2][5][17:0] Q[11]
load net TowardsConvUnit[1][7][16] -attr @rip 16 -port TowardsConvUnit[1][7][16] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst O[16]
load net TowardsConvUnit[2][5][5] -attr @rip 5 -port TowardsConvUnit[2][5][5] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst O[5]
load net BRAMWord[0][2]0_out[3] -attr @rip O[3] -pin BRAMWord[0][2]_i O[3] -pin TowardsConvUnit_FF_reg[0][2][17:0] D[3] -pin TowardsConvUnit_FF_reg[2][2][17:0] D[3]
load net TowardsConvUnit[0][4]_OBUF[11] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[0][4][17:0] Q[11]
load net TowardsConvUnit[1][7]_OBUF[16] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[1][7][17:0] Q[16]
load net TowardsConvUnit[2][5][10] -attr @rip 10 -port TowardsConvUnit[2][5][10] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst O[10]
load net TowardsConvUnit[2][5]_OBUF[4] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[2][5][17:0] Q[4]
load net TowardsConvUnit[1][5]_OBUF[8] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[1][5][17:0] Q[8]
load net TowardsConvUnit[3][3][16] -attr @rip 16 -port TowardsConvUnit[3][3][16] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst O[16]
load net TowardsConvUnit[3][6][11] -attr @rip 11 -port TowardsConvUnit[3][6][11] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst O[11]
load net TowardsConvUnit[0][1]_OBUF[10] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[0][1][17:0] Q[10]
load net TowardsConvUnit[1][2][14] -attr @rip 14 -port TowardsConvUnit[1][2][14] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst O[14]
load net TowardsConvUnit[1][5][6] -attr @rip 6 -port TowardsConvUnit[1][5][6] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst O[6]
load net TowardsConvUnit[2][1]_OBUF[16] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[2][1][17:0] Q[16]
load net BRAMWord[1][6][13] -attr @rip BRAMWord[1][6][13] -pin BRAMWord[0][6]_i I1[13] -pin BRAMWord[0][6]_i__0 I1[13] -port BRAMWord[1][6][13]
load net TowardsConvUnit_FF[3][1] -pin TowardsConvUnit_FF[3][7:0]_i O[1] -pin TowardsConvUnit_FF_reg[3][1][17:0] RST
load net TowardsConvUnit[2][0]_OBUF[7] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[2][0][17:0] Q[7]
load net TowardsConvUnit[3][6]_OBUF[8] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[3][6][17:0] Q[8]
load net BRAMWord[0][1]0_out[1] -attr @rip O[1] -pin BRAMWord[0][1]_i O[1] -pin TowardsConvUnit_FF_reg[0][1][17:0] D[1] -pin TowardsConvUnit_FF_reg[2][1][17:0] D[1]
load net BRAMWord[0][2][15] -attr @rip BRAMWord[0][2][15] -port BRAMWord[0][2][15] -pin BRAMWord[0][2]_i I0[15] -pin BRAMWord[0][2]_i__0 I0[15]
load net BRAMWord[1][6][8] -attr @rip BRAMWord[1][6][8] -pin BRAMWord[0][6]_i I1[8] -pin BRAMWord[0][6]_i__0 I1[8] -port BRAMWord[1][6][8]
load net TowardsConvUnit[1][6]_OBUF[16] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[1][6][17:0] Q[16]
load net TowardsConvUnit[2][1]_OBUF[7] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst I[7] -pin TowardsConvUnit_FF_reg[2][1][17:0] Q[7]
load net TowardsConvUnit[2][2]_OBUF[9] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[2][2][17:0] Q[9]
load net TowardsConvUnit[0][0]_OBUF[13] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[0][0][17:0] Q[13]
load net TowardsConvUnit[1][2]_OBUF[10] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[1][2][17:0] Q[10]
load net TowardsConvUnit[2][0][14] -attr @rip 14 -port TowardsConvUnit[2][0][14] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst O[14]
load net BRAMWord[0][4]0_out[16] -attr @rip O[16] -pin BRAMWord[0][4]_i O[16] -pin TowardsConvUnit_FF_reg[0][4][17:0] D[16] -pin TowardsConvUnit_FF_reg[2][4][17:0] D[16]
load net TowardsConvUnit[3][5][12] -attr @rip 12 -port TowardsConvUnit[3][5][12] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst O[12]
load net BRAMWord[0][2]0_out[12] -attr @rip O[12] -pin BRAMWord[0][2]_i O[12] -pin TowardsConvUnit_FF_reg[0][2][17:0] D[12] -pin TowardsConvUnit_FF_reg[2][2][17:0] D[12]
load net BRAMWord[0][6][3] -attr @rip BRAMWord[0][6][3] -port BRAMWord[0][6][3] -pin BRAMWord[0][6]_i I0[3] -pin BRAMWord[0][6]_i__0 I0[3]
load net TowardsConvUnit[1][4]_OBUF[13] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[1][4][17:0] Q[13]
load net TowardsConvUnit[2][7][3] -attr @rip 3 -port TowardsConvUnit[2][7][3] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst O[3]
load net TowardsConvUnit[2][0]_OBUF[13] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[2][0][17:0] Q[13]
load net TowardsConvUnit[2][5]_OBUF[10] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[2][5][17:0] Q[10]
load net TowardsConvUnit[2][5][4] -attr @rip 4 -port TowardsConvUnit[2][5][4] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst O[4]
load net BRAMWord[0][2]0_out[2] -attr @rip O[2] -pin BRAMWord[0][2]_i O[2] -pin TowardsConvUnit_FF_reg[0][2][17:0] D[2] -pin TowardsConvUnit_FF_reg[2][2][17:0] D[2]
load net TowardsConvUnit[1][7]_OBUF[15] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[1][7][17:0] Q[15]
load net TowardsConvUnit[1][7][17] -attr @rip 17 -port TowardsConvUnit[1][7][17] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst O[17]
load net TowardsConvUnit[3][7]_OBUF[1] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[3][7][17:0] Q[1]
load net TowardsConvUnit[0][4]_OBUF[12] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[0][4][17:0] Q[12]
load net TowardsConvUnit[1][2][13] -attr @rip 13 -port TowardsConvUnit[1][2][13] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst O[13]
load net TowardsConvUnit[1][5][5] -attr @rip 5 -port TowardsConvUnit[1][5][5] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst O[5]
load net TowardsConvUnit[2][4]_OBUF[10] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[2][4][17:0] Q[10]
load net TowardsConvUnit[1][1]_OBUF[17] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[1][1][17:0] Q[17]
load net TowardsConvUnit[2][1]_OBUF[15] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[2][1][17:0] Q[15]
load net TowardsConvUnit[2][4]_OBUF[0] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[2][4][17:0] Q[0]
load net TowardsConvUnit[2][6]_OBUF[10] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[2][6][17:0] Q[10]
load net TowardsConvUnit[3][3][17] -attr @rip 17 -port TowardsConvUnit[3][3][17] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst O[17]
load net TowardsConvUnit[3][6][12] -attr @rip 12 -port TowardsConvUnit[3][6][12] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst O[12]
load net TowardsConvUnit_FF[3][0] -pin TowardsConvUnit_FF[3][7:0]_i O[0] -pin TowardsConvUnit_FF_reg[3][0][17:0] RST
load net BRAMWord[0][2][16] -attr @rip BRAMWord[0][2][16] -port BRAMWord[0][2][16] -pin BRAMWord[0][2]_i I0[16] -pin BRAMWord[0][2]_i__0 I0[16]
load net TowardsConvUnit[1][4]_OBUF[10] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[1][4][17:0] Q[10]
load net TowardsConvUnit[1][6]_OBUF[17] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[1][6][17:0] Q[17]
load net TowardsConvUnit[2][1]_OBUF[8] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst I[8] -pin TowardsConvUnit_FF_reg[2][1][17:0] Q[8]
load net TowardsConvUnit[0][0]_OBUF[14] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[0][0][17:0] Q[14]
load net BRAMWord[0][4]0_out[15] -attr @rip O[15] -pin BRAMWord[0][4]_i O[15] -pin TowardsConvUnit_FF_reg[0][4][17:0] D[15] -pin TowardsConvUnit_FF_reg[2][4][17:0] D[15]
load net TowardsConvUnit[1][7]_OBUF[10] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[1][7][17:0] Q[10]
load net BRAMWord[0][7][17] -attr @rip BRAMWord[0][7][17] -port BRAMWord[0][7][17] -pin BRAMWord[0][7]_i I0[17] -pin BRAMWord[0][7]_i__0 I0[17]
load net BRAMWord[0][2]0_out[11] -attr @rip O[11] -pin BRAMWord[0][2]_i O[11] -pin TowardsConvUnit_FF_reg[0][2][17:0] D[11] -pin TowardsConvUnit_FF_reg[2][2][17:0] D[11]
load net TowardsConvUnit[1][2]_OBUF[11] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[1][2][17:0] Q[11]
load net TowardsConvUnit[2][0][15] -attr @rip 15 -port TowardsConvUnit[2][0][15] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst O[15]
load net TowardsConvUnit[2][7][2] -attr @rip 2 -port TowardsConvUnit[2][7][2] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst O[2]
load net TowardsConvUnit[3][2]_OBUF[10] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[3][2][17:0] Q[10]
load net TowardsConvUnit[3][5][13] -attr @rip 13 -port TowardsConvUnit[3][5][13] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst O[13]
load net TowardsConvUnit[3][6]_OBUF[4] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[3][6][17:0] Q[4]
load net TowardsConvUnit[1][3]_OBUF[16] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[1][3][17:0] Q[16]
load net TowardsConvUnit[1][7][14] -attr @rip 14 -port TowardsConvUnit[1][7][14] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst O[14]
load net BRAMWord[0][2]0_out[1] -attr @rip O[1] -pin BRAMWord[0][2]_i O[1] -pin TowardsConvUnit_FF_reg[0][2][17:0] D[1] -pin TowardsConvUnit_FF_reg[2][2][17:0] D[1]
load net TowardsConvUnit[2][0]_OBUF[14] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[2][0][17:0] Q[14]
load net TowardsConvUnit[3][7]_OBUF[0] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[3][7][17:0] Q[0]
load net BRAMWord[1][7][3] -attr @rip BRAMWord[1][7][3] -pin BRAMWord[0][7]_i I1[3] -pin BRAMWord[0][7]_i__0 I1[3] -port BRAMWord[1][7][3]
load net BRAMWord[0][3][10] -attr @rip BRAMWord[0][3][10] -port BRAMWord[0][3][10] -pin BRAMWord[0][3]_i I0[10] -pin BRAMWord[0][3]_i__0 I0[10]
load net TowardsConvUnit[0][6][5] -attr @rip 5 -port TowardsConvUnit[0][6][5] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst O[5]
load net TowardsConvUnit[1][1]_OBUF[16] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[1][1][17:0] Q[16]
load net TowardsConvUnit[2][1]_OBUF[14] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[2][1][17:0] Q[14]
load net TowardsConvUnit[2][2][12] -attr @rip 12 -port TowardsConvUnit[2][2][12] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst O[12]
load net TowardsConvUnit[2][4]_OBUF[1] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[2][4][17:0] Q[1]
load net TowardsConvUnit[0][1]_OBUF[1] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[0][1][17:0] Q[1]
load net TowardsConvUnit[1][2][16] -attr @rip 16 -port TowardsConvUnit[1][2][16] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst O[16]
load net TowardsConvUnit[3][3]_OBUF[1] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[3][3][17:0] Q[1]
load net TowardsConvUnit[2][0][12] -attr @rip 12 -port TowardsConvUnit[2][0][12] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst O[12]
load net BRAMWord[0][4]0_out[14] -attr @rip O[14] -pin BRAMWord[0][4]_i O[14] -pin TowardsConvUnit_FF_reg[0][4][17:0] D[14] -pin TowardsConvUnit_FF_reg[2][4][17:0] D[14]
load net BRAMWord[0][2][17] -attr @rip BRAMWord[0][2][17] -port BRAMWord[0][2][17] -pin BRAMWord[0][2]_i I0[17] -pin BRAMWord[0][2]_i__0 I0[17]
load net BRAMWord[0][2]0_out[10] -attr @rip O[10] -pin BRAMWord[0][2]_i O[10] -pin TowardsConvUnit_FF_reg[0][2][17:0] D[10] -pin TowardsConvUnit_FF_reg[2][2][17:0] D[10]
load net TowardsConvUnit[0][6]_OBUF[10] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[0][6][17:0] Q[10]
load net TowardsConvUnit[1][4]_OBUF[11] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[1][4][17:0] Q[11]
load net TowardsConvUnit[2][1]_OBUF[9] -pin TowardsConvUnit[2][1][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[2][1][17:0] Q[9]
load net TowardsConvUnit[3][1][11] -attr @rip 11 -port TowardsConvUnit[3][1][11] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst O[11]
load net TowardsConvUnit[3][6]_OBUF[3] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[3][6][17:0] Q[3]
load net TowardsConvUnit[1][2]_OBUF[12] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[1][2][17:0] Q[12]
load net TowardsConvUnit[1][3]_OBUF[15] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[1][3][17:0] Q[15]
load net TowardsConvUnit[3][2]_OBUF[11] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[3][2][17:0] Q[11]
load net BRAMWord[0][2]0_out[0] -attr @rip O[0] -pin BRAMWord[0][2]_i O[0] -pin TowardsConvUnit_FF_reg[0][2][17:0] D[0] -pin TowardsConvUnit_FF_reg[2][2][17:0] D[0]
load net TowardsConvUnit[3][0][17] -attr @rip 17 -port TowardsConvUnit[3][0][17] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst O[17]
load net TowardsConvUnit[3][5][14] -attr @rip 14 -port TowardsConvUnit[3][5][14] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst O[14]
load net TowardsConvUnit[1][7][15] -attr @rip 15 -port TowardsConvUnit[1][7][15] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst O[15]
load net TowardsConvUnit[2][7][5] -attr @rip 5 -port TowardsConvUnit[2][7][5] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst O[5]
load net BRAMWord[0][1][6] -attr @rip BRAMWord[0][1][6] -port BRAMWord[0][1][6] -pin BRAMWord[0][1]_i I0[6] -pin BRAMWord[0][1]_i__0 I0[6]
load net TowardsConvUnit[0][3][9] -attr @rip 9 -port TowardsConvUnit[0][3][9] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst O[9]
load net TowardsConvUnit[0][4]_OBUF[10] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[0][4][17:0] Q[10]
load net BRAMWord[1][7][4] -attr @rip BRAMWord[1][7][4] -pin BRAMWord[0][7]_i I1[4] -pin BRAMWord[0][7]_i__0 I1[4] -port BRAMWord[1][7][4]
load net BRAMWord[1][3][10] -attr @rip BRAMWord[1][3][10] -pin BRAMWord[0][3]_i I1[10] -pin BRAMWord[0][3]_i__0 I1[10] -port BRAMWord[1][3][10]
load net TowardsConvUnit[1][1]_OBUF[15] -pin TowardsConvUnit[1][1][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[1][1][17:0] Q[15]
load net TowardsConvUnit[0][6][6] -attr @rip 6 -port TowardsConvUnit[0][6][6] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst O[6]
load net TowardsConvUnit[1][2][15] -attr @rip 15 -port TowardsConvUnit[1][2][15] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst O[15]
load net TowardsConvUnit[3][3]_OBUF[0] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[3][3][17:0] Q[0]
load net TowardsConvUnit[2][2][13] -attr @rip 13 -port TowardsConvUnit[2][2][13] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst O[13]
load net TowardsConvUnit[0][1]_OBUF[2] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[0][1][17:0] Q[2]
load net BRAMWord[0][3]_i__0_n_10 -attr @rip O[7] -pin BRAMWord[0][3]_i__0 O[7] -pin TowardsConvUnit_FF_reg[1][3][17:0] D[7] -pin TowardsConvUnit_FF_reg[3][3][17:0] D[7]
load net BRAMWord[0][4]0_out[13] -attr @rip O[13] -pin BRAMWord[0][4]_i O[13] -pin TowardsConvUnit_FF_reg[0][4][17:0] D[13] -pin TowardsConvUnit_FF_reg[2][4][17:0] D[13]
load net BRAMWord[0][3]_i__0_n_11 -attr @rip O[6] -pin BRAMWord[0][3]_i__0 O[6] -pin TowardsConvUnit_FF_reg[1][3][17:0] D[6] -pin TowardsConvUnit_FF_reg[3][3][17:0] D[6]
load net TowardsConvUnit[0][1]_OBUF[15] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[0][1][17:0] Q[15]
load net BRAMWord[0][3]_i__0_n_12 -attr @rip O[5] -pin BRAMWord[0][3]_i__0 O[5] -pin TowardsConvUnit_FF_reg[1][3][17:0] D[5] -pin TowardsConvUnit_FF_reg[3][3][17:0] D[5]
load net TowardsConvUnit[2][0][13] -attr @rip 13 -port TowardsConvUnit[2][0][13] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst O[13]
load net BRAMWord[0][3]_i__0_n_0 -attr @rip O[17] -pin BRAMWord[0][3]_i__0 O[17] -pin TowardsConvUnit_FF_reg[1][3][17:0] D[17] -pin TowardsConvUnit_FF_reg[3][3][17:0] D[17]
load net BRAMWord[0][3]_i__0_n_13 -attr @rip O[4] -pin BRAMWord[0][3]_i__0 O[4] -pin TowardsConvUnit_FF_reg[1][3][17:0] D[4] -pin TowardsConvUnit_FF_reg[3][3][17:0] D[4]
load net TowardsConvUnit[3][1][10] -attr @rip 10 -port TowardsConvUnit[3][1][10] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst O[10]
load net TowardsConvUnit[3][4]_OBUF[9] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst I[9] -pin TowardsConvUnit_FF_reg[3][4][17:0] Q[9]
load net BRAMWord[0][3]_i__0_n_1 -attr @rip O[16] -pin BRAMWord[0][3]_i__0 O[16] -pin TowardsConvUnit_FF_reg[1][3][17:0] D[16] -pin TowardsConvUnit_FF_reg[3][3][17:0] D[16]
load net BRAMWord[0][3]_i__0_n_14 -attr @rip O[3] -pin BRAMWord[0][3]_i__0 O[3] -pin TowardsConvUnit_FF_reg[1][3][17:0] D[3] -pin TowardsConvUnit_FF_reg[3][3][17:0] D[3]
load net TowardsConvUnit[1][3]_OBUF[14] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[1][3][17:0] Q[14]
load net TowardsConvUnit[1][7][12] -attr @rip 12 -port TowardsConvUnit[1][7][12] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst O[12]
load net BRAMWord[1][0][17] -attr @rip BRAMWord[1][0][17] -pin BRAMWord[0][0]_i I1[17] -pin BRAMWord[0][0]_i__0 I1[17] -port BRAMWord[1][0][17]
load net BRAMWord[0][3]_i__0_n_2 -attr @rip O[15] -pin BRAMWord[0][3]_i__0 O[15] -pin TowardsConvUnit_FF_reg[1][3][17:0] D[15] -pin TowardsConvUnit_FF_reg[3][3][17:0] D[15]
load net BRAMWord[0][3]_i__0_n_15 -attr @rip O[2] -pin BRAMWord[0][3]_i__0 O[2] -pin TowardsConvUnit_FF_reg[1][3][17:0] D[2] -pin TowardsConvUnit_FF_reg[3][3][17:0] D[2]
load net TowardsConvUnit[0][4]_OBUF[2] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[0][4][17:0] Q[2]
load net TowardsConvUnit[1][7]_OBUF[12] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[1][7][17:0] Q[12]
load net BRAMWord[0][3]_i__0_n_3 -attr @rip O[14] -pin BRAMWord[0][3]_i__0 O[14] -pin TowardsConvUnit_FF_reg[1][3][17:0] D[14] -pin TowardsConvUnit_FF_reg[3][3][17:0] D[14]
load net BRAMWord[0][3]_i__0_n_16 -attr @rip O[1] -pin BRAMWord[0][3]_i__0 O[1] -pin TowardsConvUnit_FF_reg[1][3][17:0] D[1] -pin TowardsConvUnit_FF_reg[3][3][17:0] D[1]
load net BRAMWord[1][4][10] -attr @rip BRAMWord[1][4][10] -pin BRAMWord[0][4]_i I1[10] -pin BRAMWord[0][4]_i__0 I1[10] -port BRAMWord[1][4][10]
load net TowardsConvUnit[1][2]_OBUF[13] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[1][2][17:0] Q[13]
load net TowardsConvUnit[2][7][4] -attr @rip 4 -port TowardsConvUnit[2][7][4] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst O[4]
load net BRAMWord[0][3]_i__0_n_4 -attr @rip O[13] -pin BRAMWord[0][3]_i__0 O[13] -pin TowardsConvUnit_FF_reg[1][3][17:0] D[13] -pin TowardsConvUnit_FF_reg[3][3][17:0] D[13]
load net BRAMWord[0][3]_i__0_n_17 -attr @rip O[0] -pin BRAMWord[0][3]_i__0 O[0] -pin TowardsConvUnit_FF_reg[1][3][17:0] D[0] -pin TowardsConvUnit_FF_reg[3][3][17:0] D[0]
load net TowardsConvUnit[0][3][8] -attr @rip 8 -port TowardsConvUnit[0][3][8] -pin TowardsConvUnit[0][3][17:0]_OBUF_inst O[8]
load net TowardsConvUnit[3][5][15] -attr @rip 15 -port TowardsConvUnit[3][5][15] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst O[15]
load net TowardsConvUnit[3][6]_OBUF[6] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[3][6][17:0] Q[6]
load net BRAMWord[0][3]_i__0_n_5 -attr @rip O[12] -pin BRAMWord[0][3]_i__0 O[12] -pin TowardsConvUnit_FF_reg[1][3][17:0] D[12] -pin TowardsConvUnit_FF_reg[3][3][17:0] D[12]
load net BRAMWord[0][1][7] -attr @rip BRAMWord[0][1][7] -port BRAMWord[0][1][7] -pin BRAMWord[0][1]_i I0[7] -pin BRAMWord[0][1]_i__0 I0[7]
load net BRAMWord[0][3]_i__0_n_6 -attr @rip O[11] -pin BRAMWord[0][3]_i__0 O[11] -pin TowardsConvUnit_FF_reg[1][3][17:0] D[11] -pin TowardsConvUnit_FF_reg[3][3][17:0] D[11]
load net TowardsConvUnit[1][2][10] -attr @rip 10 -port TowardsConvUnit[1][2][10] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst O[10]
load net BRAMWord[0][3]_i__0_n_7 -attr @rip O[10] -pin BRAMWord[0][3]_i__0 O[10] -pin TowardsConvUnit_FF_reg[1][3][17:0] D[10] -pin TowardsConvUnit_FF_reg[3][3][17:0] D[10]
load net BRAMWord[1][7][5] -attr @rip BRAMWord[1][7][5] -pin BRAMWord[0][7]_i I1[5] -pin BRAMWord[0][7]_i__0 I1[5] -port BRAMWord[1][7][5]
load net BRAMWord[0][3]_i__0_n_8 -attr @rip O[9] -pin BRAMWord[0][3]_i__0 O[9] -pin TowardsConvUnit_FF_reg[1][3][17:0] D[9] -pin TowardsConvUnit_FF_reg[3][3][17:0] D[9]
load net BRAMWord[0][3][12] -attr @rip BRAMWord[0][3][12] -port BRAMWord[0][3][12] -pin BRAMWord[0][3]_i I0[12] -pin BRAMWord[0][3]_i__0 I0[12]
load net BRAMWord[1][3][11] -attr @rip BRAMWord[1][3][11] -pin BRAMWord[0][3]_i I1[11] -pin BRAMWord[0][3]_i__0 I1[11] -port BRAMWord[1][3][11]
load net BRAMWord[0][3]_i__0_n_9 -attr @rip O[8] -pin BRAMWord[0][3]_i__0 O[8] -pin TowardsConvUnit_FF_reg[1][3][17:0] D[8] -pin TowardsConvUnit_FF_reg[3][3][17:0] D[8]
load net TowardsConvUnit[0][6][7] -attr @rip 7 -port TowardsConvUnit[0][6][7] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst O[7]
load net TowardsConvUnit[2][7]_OBUF[1] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[2][7][17:0] Q[1]
load net TowardsConvUnit[2][0][10] -attr @rip 10 -port TowardsConvUnit[2][0][10] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst O[10]
load net TowardsConvUnit[2][2][14] -attr @rip 14 -port TowardsConvUnit[2][2][14] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst O[14]
load net TowardsConvUnit[0][1]_OBUF[14] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[0][1][17:0] Q[14]
load net BRAMWord[1][6][17] -attr @rip BRAMWord[1][6][17] -pin BRAMWord[0][6]_i I1[17] -pin BRAMWord[0][6]_i__0 I1[17] -port BRAMWord[1][6][17]
load net TowardsConvUnit[1][3]_OBUF[13] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[1][3][17:0] Q[13]
load net BRAMWord[1][0][16] -attr @rip BRAMWord[1][0][16] -pin BRAMWord[0][0]_i I1[16] -pin BRAMWord[0][0]_i__0 I1[16] -port BRAMWord[1][0][16]
load net BRAMWord[1][2][9] -attr @rip BRAMWord[1][2][9] -pin BRAMWord[0][2]_i I1[9] -pin BRAMWord[0][2]_i__0 I1[9] -port BRAMWord[1][2][9]
load net TowardsConvUnit[1][7]_OBUF[11] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[1][7][17:0] Q[11]
load net TowardsConvUnit[2][6][2] -attr @rip 2 -port TowardsConvUnit[2][6][2] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst O[2]
load net TowardsConvUnit[1][7][13] -attr @rip 13 -port TowardsConvUnit[1][7][13] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst O[13]
load net TowardsConvUnit[3][3]_OBUF[17] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[3][3][17:0] Q[17]
load net TowardsConvUnit[0][4]_OBUF[3] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[0][4][17:0] Q[3]
load net TowardsConvUnit[3][6]_OBUF[5] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[3][6][17:0] Q[5]
load net TowardsConvUnit[1][2]_OBUF[14] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[1][2][17:0] Q[14]
load net TowardsConvUnit[0][2]_OBUF[2] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[0][2][17:0] Q[2]
load net TowardsConvUnit[3][2][5] -attr @rip 5 -port TowardsConvUnit[3][2][5] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst O[5]
load net TowardsConvUnit[2][7][7] -attr @rip 7 -port TowardsConvUnit[2][7][7] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst O[7]
load net BRAMWord[0][1][8] -attr @rip BRAMWord[0][1][8] -port BRAMWord[0][1][8] -pin BRAMWord[0][1]_i I0[8] -pin BRAMWord[0][1]_i__0 I0[8]
load net TowardsConvUnit[1][7][0] -attr @rip 0 -port TowardsConvUnit[1][7][0] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst O[0]
load net BRAMWord[0][5]0_out[9] -attr @rip O[9] -pin BRAMWord[0][5]_i O[9] -pin TowardsConvUnit_FF_reg[0][5][17:0] D[9] -pin TowardsConvUnit_FF_reg[2][5][17:0] D[9]
load net BRAMWord[0][3][11] -attr @rip BRAMWord[0][3][11] -port BRAMWord[0][3][11] -pin BRAMWord[0][3]_i I0[11] -pin BRAMWord[0][3]_i__0 I0[11]
load net BRAMWord[1][7][6] -attr @rip BRAMWord[1][7][6] -pin BRAMWord[0][7]_i I1[6] -pin BRAMWord[0][7]_i__0 I1[6] -port BRAMWord[1][7][6]
load net TowardsConvUnit[0][1]_OBUF[0] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[0][1][17:0] Q[0]
load net TowardsConvUnit[0][6][8] -attr @rip 8 -port TowardsConvUnit[0][6][8] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst O[8]
load net TowardsConvUnit[2][7]_OBUF[2] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[2][7][17:0] Q[2]
load net TowardsConvUnit[0][1]_OBUF[13] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[0][1][17:0] Q[13]
load net TowardsConvUnit[1][5][9] -attr @rip 9 -port TowardsConvUnit[1][5][9] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst O[9]
load net TowardsConvUnit[2][0][11] -attr @rip 11 -port TowardsConvUnit[2][0][11] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst O[11]
load net TowardsConvUnit[2][2][15] -attr @rip 15 -port TowardsConvUnit[2][2][15] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst O[15]
load net TowardsConvUnit[3][6]_OBUF[0] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[3][6][17:0] Q[0]
load net BRAMWord[0][4][16] -attr @rip BRAMWord[0][4][16] -port BRAMWord[0][4][16] -pin BRAMWord[0][4]_i I0[16] -pin BRAMWord[0][4]_i__0 I0[16]
load net BRAMWord[1][0][15] -attr @rip BRAMWord[1][0][15] -pin BRAMWord[0][0]_i I1[15] -pin BRAMWord[0][0]_i__0 I1[15] -port BRAMWord[1][0][15]
load net BRAMWord[1][2][8] -attr @rip BRAMWord[1][2][8] -pin BRAMWord[0][2]_i I1[8] -pin BRAMWord[0][2]_i__0 I1[8] -port BRAMWord[1][2][8]
load net TowardsConvUnit[0][4]_OBUF[0] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[0][4][17:0] Q[0]
load net TowardsConvUnit[2][6][1] -attr @rip 1 -port TowardsConvUnit[2][6][1] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst O[1]
load net TowardsConvUnit[3][3]_OBUF[16] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[3][3][17:0] Q[16]
load net TowardsConvUnit[0][2][9] -attr @rip 9 -port TowardsConvUnit[0][2][9] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst O[9]
load net TowardsConvUnit[3][2][4] -attr @rip 4 -port TowardsConvUnit[3][2][4] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst O[4]
load net TowardsConvUnit[1][2]_OBUF[15] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[1][2][17:0] Q[15]
load net TowardsConvUnit[2][7][6] -attr @rip 6 -port TowardsConvUnit[2][7][6] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst O[6]
load net TowardsConvUnit[0][2]_OBUF[3] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[0][2][17:0] Q[3]
load net BRAMWord[0][5]0_out[8] -attr @rip O[8] -pin BRAMWord[0][5]_i O[8] -pin TowardsConvUnit_FF_reg[0][5][17:0] D[8] -pin TowardsConvUnit_FF_reg[2][5][17:0] D[8]
load net BRAMWord[1][7][11] -attr @rip BRAMWord[1][7][11] -pin BRAMWord[0][7]_i I1[11] -pin BRAMWord[0][7]_i__0 I1[11] -port BRAMWord[1][7][11]
load net BRAMWord[0][1][9] -attr @rip BRAMWord[0][1][9] -port BRAMWord[0][1][9] -pin BRAMWord[0][1]_i I0[9] -pin BRAMWord[0][1]_i__0 I0[9]
load net TowardsConvUnit[1][2][12] -attr @rip 12 -port TowardsConvUnit[1][2][12] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst O[12]
load net TowardsConvUnit[1][7][1] -attr @rip 1 -port TowardsConvUnit[1][7][1] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst O[1]
load net TowardsConvUnit[2][7]_OBUF[11] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[2][7][17:0] Q[11]
load net TowardsConvUnit[0][1]_OBUF[12] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[0][1][17:0] Q[12]
load net TowardsConvUnit[2][6][0] -attr @rip 0 -port TowardsConvUnit[2][6][0] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst O[0]
load net BRAMWord[0][4][17] -attr @rip BRAMWord[0][4][17] -port BRAMWord[0][4][17] -pin BRAMWord[0][4]_i I0[17] -pin BRAMWord[0][4]_i__0 I0[17]
load net TowardsConvUnit[0][1]_OBUF[5] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[0][1][17:0] Q[5]
load net TowardsConvUnit[1][5]_OBUF[1] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[1][5][17:0] Q[1]
load net TowardsConvUnit[3][3]_OBUF[15] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[3][3][17:0] Q[15]
load net TowardsConvUnit[0][4]_OBUF[1] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[0][4][17:0] Q[1]
load net BRAMWord[1][7][0] -attr @rip BRAMWord[1][7][0] -pin BRAMWord[0][7]_i I1[0] -pin BRAMWord[0][7]_i__0 I1[0] -port BRAMWord[1][7][0]
load net TowardsConvUnit[3][2][3] -attr @rip 3 -port TowardsConvUnit[3][2][3] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst O[3]
load net TowardsConvUnit[0][0][10] -attr @rip 10 -port TowardsConvUnit[0][0][10] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst O[10]
load net TowardsConvUnit[3][2][14] -attr @rip 14 -port TowardsConvUnit[3][2][14] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst O[14]
load net TowardsConvUnit[2][2]_OBUF[0] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[2][2][17:0] Q[0]
load net TowardsConvUnit[3][1][15] -attr @rip 15 -port TowardsConvUnit[3][1][15] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst O[15]
load net BRAMWord[0][5]0_out[7] -attr @rip O[7] -pin BRAMWord[0][5]_i O[7] -pin TowardsConvUnit_FF_reg[0][5][17:0] D[7] -pin TowardsConvUnit_FF_reg[2][5][17:0] D[7]
load net TowardsConvUnit[1][2]_OBUF[16] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[1][2][17:0] Q[16]
load net TowardsConvUnit[0][2]_OBUF[4] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[0][2][17:0] Q[4]
load net BRAMWord[1][7][10] -attr @rip BRAMWord[1][7][10] -pin BRAMWord[0][7]_i I1[10] -pin BRAMWord[0][7]_i__0 I1[10] -port BRAMWord[1][7][10]
load net TowardsConvUnit[1][2][11] -attr @rip 11 -port TowardsConvUnit[1][2][11] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst O[11]
load net BRAMWord[0][6][9] -attr @rip BRAMWord[0][6][9] -port BRAMWord[0][6][9] -pin BRAMWord[0][6]_i I0[9] -pin BRAMWord[0][6]_i__0 I0[9]
load net TowardsConvUnit[2][7][9] -attr @rip 9 -port TowardsConvUnit[2][7][9] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst O[9]
load net TowardsConvUnit[2][7]_OBUF[10] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[2][7][17:0] Q[10]
load net TowardsConvUnit[0][7][10] -attr @rip 10 -port TowardsConvUnit[0][7][10] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst O[10]
load net TowardsConvUnit[1][7][2] -attr @rip 2 -port TowardsConvUnit[1][7][2] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst O[2]
load net TowardsConvUnit[2][7]_OBUF[0] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[2][7][17:0] Q[0]
load net BRAMWord[0][5]_i__0_n_10 -attr @rip O[7] -pin BRAMWord[0][5]_i__0 O[7] -pin TowardsConvUnit_FF_reg[1][5][17:0] D[7] -pin TowardsConvUnit_FF_reg[3][5][17:0] D[7]
load net TowardsConvUnit[2][0][0] -attr @rip 0 -port TowardsConvUnit[2][0][0] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst O[0]
load net BRAMWord[0][5]_i__0_n_11 -attr @rip O[6] -pin BRAMWord[0][5]_i__0 O[6] -pin TowardsConvUnit_FF_reg[1][5][17:0] D[6] -pin TowardsConvUnit_FF_reg[3][5][17:0] D[6]
load net BRAMWord[0][5]_i__0_n_12 -attr @rip O[5] -pin BRAMWord[0][5]_i__0 O[5] -pin TowardsConvUnit_FF_reg[1][5][17:0] D[5] -pin TowardsConvUnit_FF_reg[3][5][17:0] D[5]
load net BRAMWord[0][5]_i__0_n_13 -attr @rip O[4] -pin BRAMWord[0][5]_i__0 O[4] -pin TowardsConvUnit_FF_reg[1][5][17:0] D[4] -pin TowardsConvUnit_FF_reg[3][5][17:0] D[4]
load net TowardsConvUnit[2][5][17] -attr @rip 17 -port TowardsConvUnit[2][5][17] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst O[17]
load net BRAMWord[0][5]_i__0_n_14 -attr @rip O[3] -pin BRAMWord[0][5]_i__0 O[3] -pin TowardsConvUnit_FF_reg[1][5][17:0] D[3] -pin TowardsConvUnit_FF_reg[3][5][17:0] D[3]
load net TowardsConvUnit[3][0][12] -attr @rip 12 -port TowardsConvUnit[3][0][12] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst O[12]
load net TowardsConvUnit[3][4][4] -attr @rip 4 -port TowardsConvUnit[3][4][4] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst O[4]
load net BRAMWord[0][5]_i__0_n_15 -attr @rip O[2] -pin BRAMWord[0][5]_i__0 O[2] -pin TowardsConvUnit_FF_reg[1][5][17:0] D[2] -pin TowardsConvUnit_FF_reg[3][5][17:0] D[2]
load net TowardsConvUnit[1][5]_OBUF[0] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[1][5][17:0] Q[0]
load net TowardsConvUnit[3][3]_OBUF[14] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[3][3][17:0] Q[14]
load net BRAMWord[0][5]_i__0_n_16 -attr @rip O[1] -pin BRAMWord[0][5]_i__0 O[1] -pin TowardsConvUnit_FF_reg[1][5][17:0] D[1] -pin TowardsConvUnit_FF_reg[3][5][17:0] D[1]
load net TowardsConvUnit[2][4][7] -attr @rip 7 -port TowardsConvUnit[2][4][7] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst O[7]
load net TowardsConvUnit[3][6]_OBUF[2] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[3][6][17:0] Q[2]
load net BRAMWord[0][5]_i__0_n_17 -attr @rip O[0] -pin BRAMWord[0][5]_i__0 O[0] -pin TowardsConvUnit_FF_reg[1][5][17:0] D[0] -pin TowardsConvUnit_FF_reg[3][5][17:0] D[0]
load net TowardsConvUnit[0][1]_OBUF[6] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[0][1][17:0] Q[6]
load net TowardsConvUnit[3][2][2] -attr @rip 2 -port TowardsConvUnit[3][2][2] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst O[2]
load net TowardsConvUnit[3][6][8] -attr @rip 8 -port TowardsConvUnit[3][6][8] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst O[8]
load net TowardsConvUnit[3][2][13] -attr @rip 13 -port TowardsConvUnit[3][2][13] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst O[13]
load net BRAMWord[1][7][1] -attr @rip BRAMWord[1][7][1] -pin BRAMWord[0][7]_i I1[1] -pin BRAMWord[0][7]_i__0 I1[1] -port BRAMWord[1][7][1]
load net TowardsConvUnit[3][1][14] -attr @rip 14 -port TowardsConvUnit[3][1][14] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst O[14]
load net BRAMWord[0][5]0_out[6] -attr @rip O[6] -pin BRAMWord[0][5]_i O[6] -pin TowardsConvUnit_FF_reg[0][5][17:0] D[6] -pin TowardsConvUnit_FF_reg[2][5][17:0] D[6]
load net TowardsConvUnit[0][0][11] -attr @rip 11 -port TowardsConvUnit[0][0][11] -pin TowardsConvUnit[0][0][17:0]_OBUF_inst O[11]
load net TowardsConvUnit[2][2]_OBUF[1] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[2][2][17:0] Q[1]
load net TowardsConvUnit[3][6]_OBUF[10] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[3][6][17:0] Q[10]
load net TowardsConvUnit[1][2]_OBUF[17] -pin TowardsConvUnit[1][2][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[1][2][17:0] Q[17]
load net TowardsConvUnit[1][4][8] -attr @rip 8 -port TowardsConvUnit[1][4][8] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst O[8]
load net TowardsConvUnit[2][7][8] -attr @rip 8 -port TowardsConvUnit[2][7][8] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst O[8]
load net TowardsConvUnit[0][2]_OBUF[5] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[0][2][17:0] Q[5]
load net TowardsConvUnit[2][2][10] -attr @rip 10 -port TowardsConvUnit[2][2][10] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst O[10]
load net TowardsConvUnit[0][7][11] -attr @rip 11 -port TowardsConvUnit[0][7][11] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst O[11]
load net BRAMWord[1][7][13] -attr @rip BRAMWord[1][7][13] -pin BRAMWord[0][7]_i I1[13] -pin BRAMWord[0][7]_i__0 I1[13] -port BRAMWord[1][7][13]
load net TowardsConvUnit[2][5][16] -attr @rip 16 -port TowardsConvUnit[2][5][16] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst O[16]
load net BRAMWord[1][2][5] -attr @rip BRAMWord[1][2][5] -pin BRAMWord[0][2]_i I1[5] -pin BRAMWord[0][2]_i__0 I1[5] -port BRAMWord[1][2][5]
load net TowardsConvUnit[3][0][11] -attr @rip 11 -port TowardsConvUnit[3][0][11] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst O[11]
load net TowardsConvUnit[0][1]_OBUF[3] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[0][1][17:0] Q[3]
load net BRAMWord[1][1][17] -attr @rip BRAMWord[1][1][17] -pin BRAMWord[0][1]_i I1[17] -pin BRAMWord[0][1]_i__0 I1[17] -port BRAMWord[1][1][17]
load net TowardsConvUnit[2][7]_OBUF[5] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[2][7][17:0] Q[5]
load net TowardsConvUnit[3][3]_OBUF[13] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[3][3][17:0] Q[13]
load net TowardsConvUnit[3][4][5] -attr @rip 5 -port TowardsConvUnit[3][4][5] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst O[5]
load net TowardsConvUnit[3][6]_OBUF[1] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[3][6][17:0] Q[1]
load net TowardsConvUnit[2][4][8] -attr @rip 8 -port TowardsConvUnit[2][4][8] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst O[8]
load net TowardsConvUnit[3][2][1] -attr @rip 1 -port TowardsConvUnit[3][2][1] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst O[1]
load net clk -pin TowardsConvUnit_FF_reg[0][0][17:0] C -pin TowardsConvUnit_FF_reg[0][1][17:0] C -pin TowardsConvUnit_FF_reg[0][2][17:0] C -pin TowardsConvUnit_FF_reg[0][3][17:0] C -pin TowardsConvUnit_FF_reg[0][4][17:0] C -pin TowardsConvUnit_FF_reg[0][5][17:0] C -pin TowardsConvUnit_FF_reg[0][6][17:0] C -pin TowardsConvUnit_FF_reg[0][7][17:0] C -pin TowardsConvUnit_FF_reg[1][0][17:0] C -pin TowardsConvUnit_FF_reg[1][1][17:0] C -pin TowardsConvUnit_FF_reg[1][2][17:0] C -pin TowardsConvUnit_FF_reg[1][3][17:0] C -pin TowardsConvUnit_FF_reg[1][4][17:0] C -pin TowardsConvUnit_FF_reg[1][5][17:0] C -pin TowardsConvUnit_FF_reg[1][6][17:0] C -pin TowardsConvUnit_FF_reg[1][7][17:0] C -pin TowardsConvUnit_FF_reg[2][0][17:0] C -pin TowardsConvUnit_FF_reg[2][1][17:0] C -pin TowardsConvUnit_FF_reg[2][2][17:0] C -pin TowardsConvUnit_FF_reg[2][3][17:0] C -pin TowardsConvUnit_FF_reg[2][4][17:0] C -pin TowardsConvUnit_FF_reg[2][5][17:0] C -pin TowardsConvUnit_FF_reg[2][6][17:0] C -pin TowardsConvUnit_FF_reg[2][7][17:0] C -pin TowardsConvUnit_FF_reg[3][0][17:0] C -pin TowardsConvUnit_FF_reg[3][1][17:0] C -pin TowardsConvUnit_FF_reg[3][2][17:0] C -pin TowardsConvUnit_FF_reg[3][3][17:0] C -pin TowardsConvUnit_FF_reg[3][4][17:0] C -pin TowardsConvUnit_FF_reg[3][5][17:0] C -pin TowardsConvUnit_FF_reg[3][6][17:0] C -pin TowardsConvUnit_FF_reg[3][7][17:0] C -port clk
netloc clk 1 0 2 NJ 2910 600
load net TowardsConvUnit[3][2][12] -attr @rip 12 -port TowardsConvUnit[3][2][12] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst O[12]
load net TowardsConvUnit[1][6][12] -attr @rip 12 -port TowardsConvUnit[1][6][12] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst O[12]
load net TowardsConvUnit[3][1][13] -attr @rip 13 -port TowardsConvUnit[3][1][13] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst O[13]
load net TowardsConvUnit[3][6][9] -attr @rip 9 -port TowardsConvUnit[3][6][9] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst O[9]
load net BRAMWord[0][5]0_out[5] -attr @rip O[5] -pin BRAMWord[0][5]_i O[5] -pin TowardsConvUnit_FF_reg[0][5][17:0] D[5] -pin TowardsConvUnit_FF_reg[2][5][17:0] D[5]
load net TowardsConvUnit[1][3]_OBUF[17] -pin TowardsConvUnit[1][3][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[1][3][17:0] Q[17]
load net TowardsConvUnit[3][5][1] -attr @rip 1 -port TowardsConvUnit[3][5][1] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst O[1]
load net LoadEnable[3] -attr @rip LoadEnable[3] -port LoadEnable[3] -pin TowardsConvUnit_FF_reg[3][0][17:0] CE -pin TowardsConvUnit_FF_reg[3][1][17:0] CE -pin TowardsConvUnit_FF_reg[3][2][17:0] CE -pin TowardsConvUnit_FF_reg[3][3][17:0] CE -pin TowardsConvUnit_FF_reg[3][4][17:0] CE -pin TowardsConvUnit_FF_reg[3][5][17:0] CE -pin TowardsConvUnit_FF_reg[3][6][17:0] CE -pin TowardsConvUnit_FF_reg[3][7][17:0] CE
load net TowardsConvUnit[0][4][9] -attr @rip 9 -port TowardsConvUnit[0][4][9] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst O[9]
load net BRAMWord[1][7][2] -attr @rip BRAMWord[1][7][2] -pin BRAMWord[0][7]_i I1[2] -pin BRAMWord[0][7]_i__0 I1[2] -port BRAMWord[1][7][2]
load net TowardsConvUnit[2][2]_OBUF[2] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst I[2] -pin TowardsConvUnit_FF_reg[2][2][17:0] Q[2]
load net TowardsConvUnit[3][6]_OBUF[11] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[3][6][17:0] Q[11]
load net TowardsConvUnit[1][4][9] -attr @rip 9 -port TowardsConvUnit[1][4][9] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst O[9]
load net BRAMWord[1][7][12] -attr @rip BRAMWord[1][7][12] -pin BRAMWord[0][7]_i I1[12] -pin BRAMWord[0][7]_i__0 I1[12] -port BRAMWord[1][7][12]
load net TowardsConvUnit[2][2][11] -attr @rip 11 -port TowardsConvUnit[2][2][11] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst O[11]
load net TowardsConvUnit[0][7][12] -attr @rip 12 -port TowardsConvUnit[0][7][12] -pin TowardsConvUnit[0][7][17:0]_OBUF_inst O[12]
load net BRAMWord[0][4][12] -attr @rip BRAMWord[0][4][12] -port BRAMWord[0][4][12] -pin BRAMWord[0][4]_i I0[12] -pin BRAMWord[0][4]_i__0 I0[12]
load net TowardsConvUnit[2][5][15] -attr @rip 15 -port TowardsConvUnit[2][5][15] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst O[15]
load net TowardsConvUnit[3][7][0] -attr @rip 0 -port TowardsConvUnit[3][7][0] -pin TowardsConvUnit[3][7][17:0]_OBUF_inst O[0]
load net BRAMWord[1][2][4] -attr @rip BRAMWord[1][2][4] -pin BRAMWord[0][2]_i I1[4] -pin BRAMWord[0][2]_i__0 I1[4] -port BRAMWord[1][2][4]
load net TowardsConvUnit[3][0][10] -attr @rip 10 -port TowardsConvUnit[3][0][10] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst O[10]
load net TowardsConvUnit[0][6][12] -attr @rip 12 -port TowardsConvUnit[0][6][12] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst O[12]
load net BRAMWord[1][1][16] -attr @rip BRAMWord[1][1][16] -pin BRAMWord[0][1]_i I1[16] -pin BRAMWord[0][1]_i__0 I1[16] -port BRAMWord[1][1][16]
load net TowardsConvUnit[3][3]_OBUF[12] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst I[12] -pin TowardsConvUnit_FF_reg[3][3][17:0] Q[12]
load net BRAMWord[0][7]0_out[4] -attr @rip O[4] -pin BRAMWord[0][7]_i O[4] -pin TowardsConvUnit_FF_reg[0][7][17:0] D[4] -pin TowardsConvUnit_FF_reg[2][7][17:0] D[4]
load net TowardsConvUnit[2][4][5] -attr @rip 5 -port TowardsConvUnit[2][4][5] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst O[5]
load net TowardsConvUnit[0][1]_OBUF[4] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[0][1][17:0] Q[4]
load net TowardsConvUnit[2][7]_OBUF[6] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[2][7][17:0] Q[6]
load net TowardsConvUnit[3][2][0] -attr @rip 0 -port TowardsConvUnit[3][2][0] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst O[0]
load net TowardsConvUnit[3][4][6] -attr @rip 6 -port TowardsConvUnit[3][4][6] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst O[6]
load net TowardsConvUnit[3][6][6] -attr @rip 6 -port TowardsConvUnit[3][6][6] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst O[6]
load net TowardsConvUnit[3][2][11] -attr @rip 11 -port TowardsConvUnit[3][2][11] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst O[11]
load net TowardsConvUnit[1][6][11] -attr @rip 11 -port TowardsConvUnit[1][6][11] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst O[11]
load net TowardsConvUnit[3][1][12] -attr @rip 12 -port TowardsConvUnit[3][1][12] -pin TowardsConvUnit[3][1][17:0]_OBUF_inst O[12]
load net BRAMWord[0][5]0_out[4] -attr @rip O[4] -pin BRAMWord[0][5]_i O[4] -pin TowardsConvUnit_FF_reg[0][5][17:0] D[4] -pin TowardsConvUnit_FF_reg[2][5][17:0] D[4]
load net LoadEnable[2] -attr @rip LoadEnable[2] -port LoadEnable[2] -pin TowardsConvUnit_FF_reg[2][0][17:0] CE -pin TowardsConvUnit_FF_reg[2][1][17:0] CE -pin TowardsConvUnit_FF_reg[2][2][17:0] CE -pin TowardsConvUnit_FF_reg[2][3][17:0] CE -pin TowardsConvUnit_FF_reg[2][4][17:0] CE -pin TowardsConvUnit_FF_reg[2][5][17:0] CE -pin TowardsConvUnit_FF_reg[2][6][17:0] CE -pin TowardsConvUnit_FF_reg[2][7][17:0] CE
load net TowardsConvUnit[1][4][6] -attr @rip 6 -port TowardsConvUnit[1][4][6] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst O[6]
load net TowardsConvUnit[3][5][2] -attr @rip 2 -port TowardsConvUnit[3][5][2] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst O[2]
load net TowardsConvUnit[0][5]_OBUF[17] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[0][5][17:0] Q[17]
load net TowardsConvUnit[2][2]_OBUF[3] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[2][2][17:0] Q[3]
load net BRAMWord[0][7][10] -attr @rip BRAMWord[0][7][10] -port BRAMWord[0][7][10] -pin BRAMWord[0][7]_i I0[10] -pin BRAMWord[0][7]_i__0 I0[10]
load net TowardsConvUnit[2][5][14] -attr @rip 14 -port TowardsConvUnit[2][5][14] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst O[14]
load net BRAMWord[1][1][15] -attr @rip BRAMWord[1][1][15] -pin BRAMWord[0][1]_i I1[15] -pin BRAMWord[0][1]_i__0 I1[15] -port BRAMWord[1][1][15]
load net BRAMWord[0][2]0_out[9] -attr @rip O[9] -pin BRAMWord[0][2]_i O[9] -pin TowardsConvUnit_FF_reg[0][2][17:0] D[9] -pin TowardsConvUnit_FF_reg[2][2][17:0] D[9]
load net BRAMWord[1][7][15] -attr @rip BRAMWord[1][7][15] -pin BRAMWord[0][7]_i I1[15] -pin BRAMWord[0][7]_i__0 I1[15] -port BRAMWord[1][7][15]
load net BRAMWord[0][4][13] -attr @rip BRAMWord[0][4][13] -port BRAMWord[0][4][13] -pin BRAMWord[0][4]_i I0[13] -pin BRAMWord[0][4]_i__0 I0[13]
load net TowardsConvUnit[0][4]_OBUF[17] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[0][4][17:0] Q[17]
load net TowardsConvUnit[2][7]_OBUF[3] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst I[3] -pin TowardsConvUnit_FF_reg[2][7][17:0] Q[3]
load net TowardsConvUnit[3][3]_OBUF[11] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst I[11] -pin TowardsConvUnit_FF_reg[3][3][17:0] Q[11]
load net BRAMWord[0][7]0_out[3] -attr @rip O[3] -pin BRAMWord[0][7]_i O[3] -pin TowardsConvUnit_FF_reg[0][7][17:0] D[3] -pin TowardsConvUnit_FF_reg[2][7][17:0] D[3]
load net BRAMWord[0][6]_i__0_n_0 -attr @rip O[17] -pin BRAMWord[0][6]_i__0 O[17] -pin TowardsConvUnit_FF_reg[1][6][17:0] D[17] -pin TowardsConvUnit_FF_reg[3][6][17:0] D[17]
load net TowardsConvUnit[2][7]_OBUF[15] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[2][7][17:0] Q[15]
load net TowardsConvUnit[0][6][13] -attr @rip 13 -port TowardsConvUnit[0][6][13] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst O[13]
load net BRAMWord[0][6]_i__0_n_1 -attr @rip O[16] -pin BRAMWord[0][6]_i__0 O[16] -pin TowardsConvUnit_FF_reg[1][6][17:0] D[16] -pin TowardsConvUnit_FF_reg[3][6][17:0] D[16]
load net BRAMWord[1][2][7] -attr @rip BRAMWord[1][2][7] -pin BRAMWord[0][2]_i I1[7] -pin BRAMWord[0][2]_i__0 I1[7] -port BRAMWord[1][2][7]
load net BRAMWord[0][6]_i__0_n_2 -attr @rip O[15] -pin BRAMWord[0][6]_i__0 O[15] -pin TowardsConvUnit_FF_reg[1][6][17:0] D[15] -pin TowardsConvUnit_FF_reg[3][6][17:0] D[15]
load net TowardsConvUnit[2][4][6] -attr @rip 6 -port TowardsConvUnit[2][4][6] -pin TowardsConvUnit[2][4][17:0]_OBUF_inst O[6]
load net TowardsConvUnit[0][1][17] -attr @rip 17 -port TowardsConvUnit[0][1][17] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst O[17]
load net BRAMWord[0][6]_i__0_n_3 -attr @rip O[14] -pin BRAMWord[0][6]_i__0 O[14] -pin TowardsConvUnit_FF_reg[1][6][17:0] D[14] -pin TowardsConvUnit_FF_reg[3][6][17:0] D[14]
load net TowardsConvUnit[3][2][10] -attr @rip 10 -port TowardsConvUnit[3][2][10] -pin TowardsConvUnit[3][2][17:0]_OBUF_inst O[10]
load net BRAMWord[0][6]_i__0_n_4 -attr @rip O[13] -pin BRAMWord[0][6]_i__0 O[13] -pin TowardsConvUnit_FF_reg[1][6][17:0] D[13] -pin TowardsConvUnit_FF_reg[3][6][17:0] D[13]
load net TowardsConvUnit[1][6][10] -attr @rip 10 -port TowardsConvUnit[1][6][10] -pin TowardsConvUnit[1][6][17:0]_OBUF_inst O[10]
load net TowardsConvUnit[3][4][7] -attr @rip 7 -port TowardsConvUnit[3][4][7] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst O[7]
load net TowardsConvUnit[3][6][7] -attr @rip 7 -port TowardsConvUnit[3][6][7] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst O[7]
load net BRAMWord[0][7]_i__0_n_10 -attr @rip O[7] -pin BRAMWord[0][7]_i__0 O[7] -pin TowardsConvUnit_FF_reg[1][7][17:0] D[7] -pin TowardsConvUnit_FF_reg[3][7][17:0] D[7]
load net BRAMWord[0][5]0_out[3] -attr @rip O[3] -pin BRAMWord[0][5]_i O[3] -pin TowardsConvUnit_FF_reg[0][5][17:0] D[3] -pin TowardsConvUnit_FF_reg[2][5][17:0] D[3]
load net BRAMWord[0][6]_i__0_n_5 -attr @rip O[12] -pin BRAMWord[0][6]_i__0 O[12] -pin TowardsConvUnit_FF_reg[1][6][17:0] D[12] -pin TowardsConvUnit_FF_reg[3][6][17:0] D[12]
load net BRAMWord[0][7]_i__0_n_11 -attr @rip O[6] -pin BRAMWord[0][7]_i__0 O[6] -pin TowardsConvUnit_FF_reg[1][7][17:0] D[6] -pin TowardsConvUnit_FF_reg[3][7][17:0] D[6]
load net TowardsConvUnit[0][2]_OBUF[0] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[0][2][17:0] Q[0]
load net TowardsConvUnit[0][4][7] -attr @rip 7 -port TowardsConvUnit[0][4][7] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst O[7]
load net BRAMWord[0][6]_i__0_n_6 -attr @rip O[11] -pin BRAMWord[0][6]_i__0 O[11] -pin TowardsConvUnit_FF_reg[1][6][17:0] D[11] -pin TowardsConvUnit_FF_reg[3][6][17:0] D[11]
load net BRAMWord[0][7]_i__0_n_12 -attr @rip O[5] -pin BRAMWord[0][7]_i__0 O[5] -pin TowardsConvUnit_FF_reg[1][7][17:0] D[5] -pin TowardsConvUnit_FF_reg[3][7][17:0] D[5]
load net BRAMWord[0][6]_i__0_n_7 -attr @rip O[10] -pin BRAMWord[0][6]_i__0 O[10] -pin TowardsConvUnit_FF_reg[1][6][17:0] D[10] -pin TowardsConvUnit_FF_reg[3][6][17:0] D[10]
load net BRAMWord[0][7]_i__0_n_13 -attr @rip O[4] -pin BRAMWord[0][7]_i__0 O[4] -pin TowardsConvUnit_FF_reg[1][7][17:0] D[4] -pin TowardsConvUnit_FF_reg[3][7][17:0] D[4]
load net TowardsConvUnit[0][5]_OBUF[16] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst I[16] -pin TowardsConvUnit_FF_reg[0][5][17:0] Q[16]
load net BRAMWord[0][6]_i__0_n_8 -attr @rip O[9] -pin BRAMWord[0][6]_i__0 O[9] -pin TowardsConvUnit_FF_reg[1][6][17:0] D[9] -pin TowardsConvUnit_FF_reg[3][6][17:0] D[9]
load net BRAMWord[0][7]_i__0_n_14 -attr @rip O[3] -pin BRAMWord[0][7]_i__0 O[3] -pin TowardsConvUnit_FF_reg[1][7][17:0] D[3] -pin TowardsConvUnit_FF_reg[3][7][17:0] D[3]
load net BRAMWord[0][6]_i__0_n_9 -attr @rip O[8] -pin BRAMWord[0][6]_i__0 O[8] -pin TowardsConvUnit_FF_reg[1][6][17:0] D[8] -pin TowardsConvUnit_FF_reg[3][6][17:0] D[8]
load net TowardsConvUnit[1][4][7] -attr @rip 7 -port TowardsConvUnit[1][4][7] -pin TowardsConvUnit[1][4][17:0]_OBUF_inst O[7]
load net TowardsConvUnit[2][3][0] -attr @rip 0 -port TowardsConvUnit[2][3][0] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst O[0]
load net BRAMWord[0][7]_i__0_n_15 -attr @rip O[2] -pin BRAMWord[0][7]_i__0 O[2] -pin TowardsConvUnit_FF_reg[1][7][17:0] D[2] -pin TowardsConvUnit_FF_reg[3][7][17:0] D[2]
load net TowardsConvUnit[0][5]_OBUF[5] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst I[5] -pin TowardsConvUnit_FF_reg[0][5][17:0] Q[5]
load net BRAMWord[0][7]_i__0_n_16 -attr @rip O[1] -pin BRAMWord[0][7]_i__0 O[1] -pin TowardsConvUnit_FF_reg[1][7][17:0] D[1] -pin TowardsConvUnit_FF_reg[3][7][17:0] D[1]
load net BRAMWord[0][7]_i__0_n_17 -attr @rip O[0] -pin BRAMWord[0][7]_i__0 O[0] -pin TowardsConvUnit_FF_reg[1][7][17:0] D[0] -pin TowardsConvUnit_FF_reg[3][7][17:0] D[0]
load net TowardsConvUnit[1][5][16] -attr @rip 16 -port TowardsConvUnit[1][5][16] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst O[16]
load net TowardsConvUnit[2][5][13] -attr @rip 13 -port TowardsConvUnit[2][5][13] -pin TowardsConvUnit[2][5][17:0]_OBUF_inst O[13]
load net BRAMWord[1][1][14] -attr @rip BRAMWord[1][1][14] -pin BRAMWord[0][1]_i I1[14] -pin BRAMWord[0][1]_i__0 I1[14] -port BRAMWord[1][1][14]
load net BRAMWord[0][7][11] -attr @rip BRAMWord[0][7][11] -port BRAMWord[0][7][11] -pin BRAMWord[0][7]_i I0[11] -pin BRAMWord[0][7]_i__0 I0[11]
load net TowardsConvUnit[0][6][10] -attr @rip 10 -port TowardsConvUnit[0][6][10] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst O[10]
load net BRAMWord[0][2]0_out[8] -attr @rip O[8] -pin BRAMWord[0][2]_i O[8] -pin TowardsConvUnit_FF_reg[0][2][17:0] D[8] -pin TowardsConvUnit_FF_reg[2][2][17:0] D[8]
load net BRAMWord[1][7][14] -attr @rip BRAMWord[1][7][14] -pin BRAMWord[0][7]_i I1[14] -pin BRAMWord[0][7]_i__0 I1[14] -port BRAMWord[1][7][14]
load net TowardsConvUnit[3][3]_OBUF[10] -pin TowardsConvUnit[3][3][17:0]_OBUF_inst I[10] -pin TowardsConvUnit_FF_reg[3][3][17:0] Q[10]
load net BRAMWord[0][7]0_out[2] -attr @rip O[2] -pin BRAMWord[0][7]_i O[2] -pin TowardsConvUnit_FF_reg[0][7][17:0] D[2] -pin TowardsConvUnit_FF_reg[2][7][17:0] D[2]
load net TowardsConvUnit[2][7]_OBUF[14] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[2][7][17:0] Q[14]
load net BRAMWord[0][4][14] -attr @rip BRAMWord[0][4][14] -port BRAMWord[0][4][14] -pin BRAMWord[0][4]_i I0[14] -pin BRAMWord[0][4]_i__0 I0[14]
load net TowardsConvUnit[2][7]_OBUF[4] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst I[4] -pin TowardsConvUnit_FF_reg[2][7][17:0] Q[4]
load net BRAMWord[1][2][6] -attr @rip BRAMWord[1][2][6] -pin BRAMWord[0][2]_i I1[6] -pin BRAMWord[0][2]_i__0 I1[6] -port BRAMWord[1][2][6]
load net BRAMWord[0][3]0_out[14] -attr @rip O[14] -pin BRAMWord[0][3]_i O[14] -pin TowardsConvUnit_FF_reg[0][3][17:0] D[14] -pin TowardsConvUnit_FF_reg[2][3][17:0] D[14]
load net BRAMWord[0][3][17] -attr @rip BRAMWord[0][3][17] -port BRAMWord[0][3][17] -pin BRAMWord[0][3]_i I0[17] -pin BRAMWord[0][3]_i__0 I0[17]
load net TowardsConvUnit[1][7]_OBUF[17] -pin TowardsConvUnit[1][7][17:0]_OBUF_inst I[17] -pin TowardsConvUnit_FF_reg[1][7][17:0] Q[17]
load net TowardsConvUnit[2][0][4] -attr @rip 4 -port TowardsConvUnit[2][0][4] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst O[4]
load net TowardsConvUnit[3][6][4] -attr @rip 4 -port TowardsConvUnit[3][6][4] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst O[4]
load net BRAMWord[0][5]0_out[2] -attr @rip O[2] -pin BRAMWord[0][5]_i O[2] -pin TowardsConvUnit_FF_reg[0][5][17:0] D[2] -pin TowardsConvUnit_FF_reg[2][5][17:0] D[2]
load net TowardsConvUnit[3][0][16] -attr @rip 16 -port TowardsConvUnit[3][0][16] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst O[16]
load net TowardsConvUnit[3][4][8] -attr @rip 8 -port TowardsConvUnit[3][4][8] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst O[8]
load net TowardsConvUnit[3][5][0] -attr @rip 0 -port TowardsConvUnit[3][5][0] -pin TowardsConvUnit[3][5][17:0]_OBUF_inst O[0]
load net TowardsConvUnit[0][5]_OBUF[15] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[0][5][17:0] Q[15]
load net BRAMWord[1][5][0] -attr @rip BRAMWord[1][5][0] -pin BRAMWord[0][5]_i I1[0] -pin BRAMWord[0][5]_i__0 I1[0] -port BRAMWord[1][5][0]
load net TowardsConvUnit[0][2]_OBUF[1] -pin TowardsConvUnit[0][2][17:0]_OBUF_inst I[1] -pin TowardsConvUnit_FF_reg[0][2][17:0] Q[1]
load net TowardsConvUnit[0][4][8] -attr @rip 8 -port TowardsConvUnit[0][4][8] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst O[8]
load net TowardsConvUnit[1][0][16] -attr @rip 16 -port TowardsConvUnit[1][0][16] -pin TowardsConvUnit[1][0][17:0]_OBUF_inst O[16]
load net BRAMWord[0][2]0_out[17] -attr @rip O[17] -pin BRAMWord[0][2]_i O[17] -pin TowardsConvUnit_FF_reg[0][2][17:0] D[17] -pin TowardsConvUnit_FF_reg[2][2][17:0] D[17]
load net BRAMWord[0][2][6] -attr @rip BRAMWord[0][2][6] -port BRAMWord[0][2][6] -pin BRAMWord[0][2]_i I0[6] -pin BRAMWord[0][2]_i__0 I0[6]
load net TowardsConvUnit[2][3][1] -attr @rip 1 -port TowardsConvUnit[2][3][1] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst O[1]
load net TowardsConvUnit[0][5]_OBUF[6] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst I[6] -pin TowardsConvUnit_FF_reg[0][5][17:0] Q[6]
load net TowardsConvUnit[2][2][7] -attr @rip 7 -port TowardsConvUnit[2][2][7] -pin TowardsConvUnit[2][2][17:0]_OBUF_inst O[7]
load net BRAMWord[0][2]0_out[7] -attr @rip O[7] -pin BRAMWord[0][2]_i O[7] -pin TowardsConvUnit_FF_reg[0][2][17:0] D[7] -pin TowardsConvUnit_FF_reg[2][2][17:0] D[7]
load net TowardsConvUnit[0][4]_OBUF[15] -pin TowardsConvUnit[0][4][17:0]_OBUF_inst I[15] -pin TowardsConvUnit_FF_reg[0][4][17:0] Q[15]
load net TowardsConvUnit[1][5][17] -attr @rip 17 -port TowardsConvUnit[1][5][17] -pin TowardsConvUnit[1][5][17:0]_OBUF_inst O[17]
load net TowardsConvUnit[3][6]_OBUF[14] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[3][6][17:0] Q[14]
load net BRAMWord[0][7]0_out[1] -attr @rip O[1] -pin BRAMWord[0][7]_i O[1] -pin TowardsConvUnit_FF_reg[0][7][17:0] D[1] -pin TowardsConvUnit_FF_reg[2][7][17:0] D[1]
load net BRAMWord[1][0][10] -attr @rip BRAMWord[1][0][10] -pin BRAMWord[0][0]_i I1[10] -pin BRAMWord[0][0]_i__0 I1[10] -port BRAMWord[1][0][10]
load net TowardsConvUnit[2][7]_OBUF[13] -pin TowardsConvUnit[2][7][17:0]_OBUF_inst I[13] -pin TowardsConvUnit_FF_reg[2][7][17:0] Q[13]
load net BRAMWord[0][7][12] -attr @rip BRAMWord[0][7][12] -port BRAMWord[0][7][12] -pin BRAMWord[0][7]_i I0[12] -pin BRAMWord[0][7]_i__0 I0[12]
load net TowardsConvUnit[0][6][11] -attr @rip 11 -port TowardsConvUnit[0][6][11] -pin TowardsConvUnit[0][6][17:0]_OBUF_inst O[11]
load net TowardsConvUnit[2][3]_OBUF[0] -pin TowardsConvUnit[2][3][17:0]_OBUF_inst I[0] -pin TowardsConvUnit_FF_reg[2][3][17:0] Q[0]
load net TowardsConvUnit[2][0][3] -attr @rip 3 -port TowardsConvUnit[2][0][3] -pin TowardsConvUnit[2][0][17:0]_OBUF_inst O[3]
load net TowardsConvUnit[0][1][15] -attr @rip 15 -port TowardsConvUnit[0][1][15] -pin TowardsConvUnit[0][1][17:0]_OBUF_inst O[15]
load net BRAMWord[0][4][15] -attr @rip BRAMWord[0][4][15] -port BRAMWord[0][4][15] -pin BRAMWord[0][4]_i I0[15] -pin BRAMWord[0][4]_i__0 I0[15]
load net TowardsConvUnit[2][6][13] -attr @rip 13 -port TowardsConvUnit[2][6][13] -pin TowardsConvUnit[2][6][17:0]_OBUF_inst O[13]
load net BRAMWord[0][3]0_out[15] -attr @rip O[15] -pin BRAMWord[0][3]_i O[15] -pin TowardsConvUnit_FF_reg[0][3][17:0] D[15] -pin TowardsConvUnit_FF_reg[2][3][17:0] D[15]
load net TowardsConvUnit[3][6][5] -attr @rip 5 -port TowardsConvUnit[3][6][5] -pin TowardsConvUnit[3][6][17:0]_OBUF_inst O[5]
load net BRAMWord[0][5]0_out[1] -attr @rip O[1] -pin BRAMWord[0][5]_i O[1] -pin TowardsConvUnit_FF_reg[0][5][17:0] D[1] -pin TowardsConvUnit_FF_reg[2][5][17:0] D[1]
load net TowardsConvUnit[3][0][15] -attr @rip 15 -port TowardsConvUnit[3][0][15] -pin TowardsConvUnit[3][0][17:0]_OBUF_inst O[15]
load net TowardsConvUnit[0][5]_OBUF[14] -pin TowardsConvUnit[0][5][17:0]_OBUF_inst I[14] -pin TowardsConvUnit_FF_reg[0][5][17:0] Q[14]
load net TowardsConvUnit[3][4][9] -attr @rip 9 -port TowardsConvUnit[3][4][9] -pin TowardsConvUnit[3][4][17:0]_OBUF_inst O[9]
load netBundle @TowardsConvUnit_35 18 TowardsConvUnit[1][5][17] TowardsConvUnit[1][5][16] TowardsConvUnit[1][5][15] TowardsConvUnit[1][5][14] TowardsConvUnit[1][5][13] TowardsConvUnit[1][5][12] TowardsConvUnit[1][5][11] TowardsConvUnit[1][5][10] TowardsConvUnit[1][5][9] TowardsConvUnit[1][5][8] TowardsConvUnit[1][5][7] TowardsConvUnit[1][5][6] TowardsConvUnit[1][5][5] TowardsConvUnit[1][5][4] TowardsConvUnit[1][5][3] TowardsConvUnit[1][5][2] TowardsConvUnit[1][5][1] TowardsConvUnit[1][5][0] -autobundled
netbloc @TowardsConvUnit_35 1 3 1 NJ
load netBundle @TowardsConvUnit_36 18 TowardsConvUnit[0][0]_OBUF[17] TowardsConvUnit[0][0]_OBUF[16] TowardsConvUnit[0][0]_OBUF[15] TowardsConvUnit[0][0]_OBUF[14] TowardsConvUnit[0][0]_OBUF[13] TowardsConvUnit[0][0]_OBUF[12] TowardsConvUnit[0][0]_OBUF[11] TowardsConvUnit[0][0]_OBUF[10] TowardsConvUnit[0][0]_OBUF[9] TowardsConvUnit[0][0]_OBUF[8] TowardsConvUnit[0][0]_OBUF[7] TowardsConvUnit[0][0]_OBUF[6] TowardsConvUnit[0][0]_OBUF[5] TowardsConvUnit[0][0]_OBUF[4] TowardsConvUnit[0][0]_OBUF[3] TowardsConvUnit[0][0]_OBUF[2] TowardsConvUnit[0][0]_OBUF[1] TowardsConvUnit[0][0]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_36 1 2 1 N
load netBundle @BRAMWord_46 18 BRAMWord[0][7][17] BRAMWord[0][7][16] BRAMWord[0][7][15] BRAMWord[0][7][14] BRAMWord[0][7][13] BRAMWord[0][7][12] BRAMWord[0][7][11] BRAMWord[0][7][10] BRAMWord[0][7][9] BRAMWord[0][7][8] BRAMWord[0][7][7] BRAMWord[0][7][6] BRAMWord[0][7][5] BRAMWord[0][7][4] BRAMWord[0][7][3] BRAMWord[0][7][2] BRAMWord[0][7][1] BRAMWord[0][7][0] -autobundled
netbloc @BRAMWord_46 1 0 1 120
load netBundle @BRAMWord_29 18 BRAMWord[0][5]_i__0_n_0 BRAMWord[0][5]_i__0_n_1 BRAMWord[0][5]_i__0_n_2 BRAMWord[0][5]_i__0_n_3 BRAMWord[0][5]_i__0_n_4 BRAMWord[0][5]_i__0_n_5 BRAMWord[0][5]_i__0_n_6 BRAMWord[0][5]_i__0_n_7 BRAMWord[0][5]_i__0_n_8 BRAMWord[0][5]_i__0_n_9 BRAMWord[0][5]_i__0_n_10 BRAMWord[0][5]_i__0_n_11 BRAMWord[0][5]_i__0_n_12 BRAMWord[0][5]_i__0_n_13 BRAMWord[0][5]_i__0_n_14 BRAMWord[0][5]_i__0_n_15 BRAMWord[0][5]_i__0_n_16 BRAMWord[0][5]_i__0_n_17 -autobundled
netbloc @BRAMWord_29 1 1 1 460
load netBundle @TowardsConvUnit_37 18 TowardsConvUnit[0][1][17] TowardsConvUnit[0][1][16] TowardsConvUnit[0][1][15] TowardsConvUnit[0][1][14] TowardsConvUnit[0][1][13] TowardsConvUnit[0][1][12] TowardsConvUnit[0][1][11] TowardsConvUnit[0][1][10] TowardsConvUnit[0][1][9] TowardsConvUnit[0][1][8] TowardsConvUnit[0][1][7] TowardsConvUnit[0][1][6] TowardsConvUnit[0][1][5] TowardsConvUnit[0][1][4] TowardsConvUnit[0][1][3] TowardsConvUnit[0][1][2] TowardsConvUnit[0][1][1] TowardsConvUnit[0][1][0] -autobundled
netbloc @TowardsConvUnit_37 1 3 1 NJ
load netBundle @BRAMWord_1 18 BRAMWord[0][3]0_out[17] BRAMWord[0][3]0_out[16] BRAMWord[0][3]0_out[15] BRAMWord[0][3]0_out[14] BRAMWord[0][3]0_out[13] BRAMWord[0][3]0_out[12] BRAMWord[0][3]0_out[11] BRAMWord[0][3]0_out[10] BRAMWord[0][3]0_out[9] BRAMWord[0][3]0_out[8] BRAMWord[0][3]0_out[7] BRAMWord[0][3]0_out[6] BRAMWord[0][3]0_out[5] BRAMWord[0][3]0_out[4] BRAMWord[0][3]0_out[3] BRAMWord[0][3]0_out[2] BRAMWord[0][3]0_out[1] BRAMWord[0][3]0_out[0] -autobundled
netbloc @BRAMWord_1 1 1 1 460
load netBundle @TowardsConvUnit_38 18 TowardsConvUnit[2][6]_OBUF[17] TowardsConvUnit[2][6]_OBUF[16] TowardsConvUnit[2][6]_OBUF[15] TowardsConvUnit[2][6]_OBUF[14] TowardsConvUnit[2][6]_OBUF[13] TowardsConvUnit[2][6]_OBUF[12] TowardsConvUnit[2][6]_OBUF[11] TowardsConvUnit[2][6]_OBUF[10] TowardsConvUnit[2][6]_OBUF[9] TowardsConvUnit[2][6]_OBUF[8] TowardsConvUnit[2][6]_OBUF[7] TowardsConvUnit[2][6]_OBUF[6] TowardsConvUnit[2][6]_OBUF[5] TowardsConvUnit[2][6]_OBUF[4] TowardsConvUnit[2][6]_OBUF[3] TowardsConvUnit[2][6]_OBUF[2] TowardsConvUnit[2][6]_OBUF[1] TowardsConvUnit[2][6]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_38 1 2 1 N
load netBundle @TowardsConvUnit_60 18 TowardsConvUnit[2][5]_OBUF[17] TowardsConvUnit[2][5]_OBUF[16] TowardsConvUnit[2][5]_OBUF[15] TowardsConvUnit[2][5]_OBUF[14] TowardsConvUnit[2][5]_OBUF[13] TowardsConvUnit[2][5]_OBUF[12] TowardsConvUnit[2][5]_OBUF[11] TowardsConvUnit[2][5]_OBUF[10] TowardsConvUnit[2][5]_OBUF[9] TowardsConvUnit[2][5]_OBUF[8] TowardsConvUnit[2][5]_OBUF[7] TowardsConvUnit[2][5]_OBUF[6] TowardsConvUnit[2][5]_OBUF[5] TowardsConvUnit[2][5]_OBUF[4] TowardsConvUnit[2][5]_OBUF[3] TowardsConvUnit[2][5]_OBUF[2] TowardsConvUnit[2][5]_OBUF[1] TowardsConvUnit[2][5]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_60 1 2 1 N
load netBundle @TowardsConvUnit_80 18 TowardsConvUnit[0][2]_OBUF[17] TowardsConvUnit[0][2]_OBUF[16] TowardsConvUnit[0][2]_OBUF[15] TowardsConvUnit[0][2]_OBUF[14] TowardsConvUnit[0][2]_OBUF[13] TowardsConvUnit[0][2]_OBUF[12] TowardsConvUnit[0][2]_OBUF[11] TowardsConvUnit[0][2]_OBUF[10] TowardsConvUnit[0][2]_OBUF[9] TowardsConvUnit[0][2]_OBUF[8] TowardsConvUnit[0][2]_OBUF[7] TowardsConvUnit[0][2]_OBUF[6] TowardsConvUnit[0][2]_OBUF[5] TowardsConvUnit[0][2]_OBUF[4] TowardsConvUnit[0][2]_OBUF[3] TowardsConvUnit[0][2]_OBUF[2] TowardsConvUnit[0][2]_OBUF[1] TowardsConvUnit[0][2]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_80 1 2 1 N
load netBundle @BRAMWord_98 18 BRAMWord[1][2][17] BRAMWord[1][2][16] BRAMWord[1][2][15] BRAMWord[1][2][14] BRAMWord[1][2][13] BRAMWord[1][2][12] BRAMWord[1][2][11] BRAMWord[1][2][10] BRAMWord[1][2][9] BRAMWord[1][2][8] BRAMWord[1][2][7] BRAMWord[1][2][6] BRAMWord[1][2][5] BRAMWord[1][2][4] BRAMWord[1][2][3] BRAMWord[1][2][2] BRAMWord[1][2][1] BRAMWord[1][2][0] -autobundled
netbloc @BRAMWord_98 1 0 1 140
load netBundle @TowardsConvUnit_11 18 TowardsConvUnit[0][3]_OBUF[17] TowardsConvUnit[0][3]_OBUF[16] TowardsConvUnit[0][3]_OBUF[15] TowardsConvUnit[0][3]_OBUF[14] TowardsConvUnit[0][3]_OBUF[13] TowardsConvUnit[0][3]_OBUF[12] TowardsConvUnit[0][3]_OBUF[11] TowardsConvUnit[0][3]_OBUF[10] TowardsConvUnit[0][3]_OBUF[9] TowardsConvUnit[0][3]_OBUF[8] TowardsConvUnit[0][3]_OBUF[7] TowardsConvUnit[0][3]_OBUF[6] TowardsConvUnit[0][3]_OBUF[5] TowardsConvUnit[0][3]_OBUF[4] TowardsConvUnit[0][3]_OBUF[3] TowardsConvUnit[0][3]_OBUF[2] TowardsConvUnit[0][3]_OBUF[1] TowardsConvUnit[0][3]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_11 1 2 1 N
load netBundle @TowardsConvUnit_39 18 TowardsConvUnit[0][2][17] TowardsConvUnit[0][2][16] TowardsConvUnit[0][2][15] TowardsConvUnit[0][2][14] TowardsConvUnit[0][2][13] TowardsConvUnit[0][2][12] TowardsConvUnit[0][2][11] TowardsConvUnit[0][2][10] TowardsConvUnit[0][2][9] TowardsConvUnit[0][2][8] TowardsConvUnit[0][2][7] TowardsConvUnit[0][2][6] TowardsConvUnit[0][2][5] TowardsConvUnit[0][2][4] TowardsConvUnit[0][2][3] TowardsConvUnit[0][2][2] TowardsConvUnit[0][2][1] TowardsConvUnit[0][2][0] -autobundled
netbloc @TowardsConvUnit_39 1 3 1 NJ
load netBundle @TowardsConvUnit_61 18 TowardsConvUnit[2][1][17] TowardsConvUnit[2][1][16] TowardsConvUnit[2][1][15] TowardsConvUnit[2][1][14] TowardsConvUnit[2][1][13] TowardsConvUnit[2][1][12] TowardsConvUnit[2][1][11] TowardsConvUnit[2][1][10] TowardsConvUnit[2][1][9] TowardsConvUnit[2][1][8] TowardsConvUnit[2][1][7] TowardsConvUnit[2][1][6] TowardsConvUnit[2][1][5] TowardsConvUnit[2][1][4] TowardsConvUnit[2][1][3] TowardsConvUnit[2][1][2] TowardsConvUnit[2][1][1] TowardsConvUnit[2][1][0] -autobundled
netbloc @TowardsConvUnit_61 1 3 1 NJ
load netBundle @BRAMWord_3 18 BRAMWord[0][2]0_out[17] BRAMWord[0][2]0_out[16] BRAMWord[0][2]0_out[15] BRAMWord[0][2]0_out[14] BRAMWord[0][2]0_out[13] BRAMWord[0][2]0_out[12] BRAMWord[0][2]0_out[11] BRAMWord[0][2]0_out[10] BRAMWord[0][2]0_out[9] BRAMWord[0][2]0_out[8] BRAMWord[0][2]0_out[7] BRAMWord[0][2]0_out[6] BRAMWord[0][2]0_out[5] BRAMWord[0][2]0_out[4] BRAMWord[0][2]0_out[3] BRAMWord[0][2]0_out[2] BRAMWord[0][2]0_out[1] BRAMWord[0][2]0_out[0] -autobundled
netbloc @BRAMWord_3 1 1 1 580
load netBundle @TowardsConvUnit_12 18 TowardsConvUnit[2][1]_OBUF[17] TowardsConvUnit[2][1]_OBUF[16] TowardsConvUnit[2][1]_OBUF[15] TowardsConvUnit[2][1]_OBUF[14] TowardsConvUnit[2][1]_OBUF[13] TowardsConvUnit[2][1]_OBUF[12] TowardsConvUnit[2][1]_OBUF[11] TowardsConvUnit[2][1]_OBUF[10] TowardsConvUnit[2][1]_OBUF[9] TowardsConvUnit[2][1]_OBUF[8] TowardsConvUnit[2][1]_OBUF[7] TowardsConvUnit[2][1]_OBUF[6] TowardsConvUnit[2][1]_OBUF[5] TowardsConvUnit[2][1]_OBUF[4] TowardsConvUnit[2][1]_OBUF[3] TowardsConvUnit[2][1]_OBUF[2] TowardsConvUnit[2][1]_OBUF[1] TowardsConvUnit[2][1]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_12 1 2 1 N
load netBundle @TowardsConvUnit_62 18 TowardsConvUnit[1][7]_OBUF[17] TowardsConvUnit[1][7]_OBUF[16] TowardsConvUnit[1][7]_OBUF[15] TowardsConvUnit[1][7]_OBUF[14] TowardsConvUnit[1][7]_OBUF[13] TowardsConvUnit[1][7]_OBUF[12] TowardsConvUnit[1][7]_OBUF[11] TowardsConvUnit[1][7]_OBUF[10] TowardsConvUnit[1][7]_OBUF[9] TowardsConvUnit[1][7]_OBUF[8] TowardsConvUnit[1][7]_OBUF[7] TowardsConvUnit[1][7]_OBUF[6] TowardsConvUnit[1][7]_OBUF[5] TowardsConvUnit[1][7]_OBUF[4] TowardsConvUnit[1][7]_OBUF[3] TowardsConvUnit[1][7]_OBUF[2] TowardsConvUnit[1][7]_OBUF[1] TowardsConvUnit[1][7]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_62 1 2 1 N
load netBundle @BRAMWord_70 18 BRAMWord[0][2][17] BRAMWord[0][2][16] BRAMWord[0][2][15] BRAMWord[0][2][14] BRAMWord[0][2][13] BRAMWord[0][2][12] BRAMWord[0][2][11] BRAMWord[0][2][10] BRAMWord[0][2][9] BRAMWord[0][2][8] BRAMWord[0][2][7] BRAMWord[0][2][6] BRAMWord[0][2][5] BRAMWord[0][2][4] BRAMWord[0][2][3] BRAMWord[0][2][2] BRAMWord[0][2][1] BRAMWord[0][2][0] -autobundled
netbloc @BRAMWord_70 1 0 1 80
load netBundle @TowardsConvUnit_81 18 TowardsConvUnit[2][5][17] TowardsConvUnit[2][5][16] TowardsConvUnit[2][5][15] TowardsConvUnit[2][5][14] TowardsConvUnit[2][5][13] TowardsConvUnit[2][5][12] TowardsConvUnit[2][5][11] TowardsConvUnit[2][5][10] TowardsConvUnit[2][5][9] TowardsConvUnit[2][5][8] TowardsConvUnit[2][5][7] TowardsConvUnit[2][5][6] TowardsConvUnit[2][5][5] TowardsConvUnit[2][5][4] TowardsConvUnit[2][5][3] TowardsConvUnit[2][5][2] TowardsConvUnit[2][5][1] TowardsConvUnit[2][5][0] -autobundled
netbloc @TowardsConvUnit_81 1 3 1 NJ
load netBundle @TowardsConvUnit_82 18 TowardsConvUnit[1][0]_OBUF[17] TowardsConvUnit[1][0]_OBUF[16] TowardsConvUnit[1][0]_OBUF[15] TowardsConvUnit[1][0]_OBUF[14] TowardsConvUnit[1][0]_OBUF[13] TowardsConvUnit[1][0]_OBUF[12] TowardsConvUnit[1][0]_OBUF[11] TowardsConvUnit[1][0]_OBUF[10] TowardsConvUnit[1][0]_OBUF[9] TowardsConvUnit[1][0]_OBUF[8] TowardsConvUnit[1][0]_OBUF[7] TowardsConvUnit[1][0]_OBUF[6] TowardsConvUnit[1][0]_OBUF[5] TowardsConvUnit[1][0]_OBUF[4] TowardsConvUnit[1][0]_OBUF[3] TowardsConvUnit[1][0]_OBUF[2] TowardsConvUnit[1][0]_OBUF[1] TowardsConvUnit[1][0]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_82 1 2 1 N
load netBundle @TowardsConvUnit_13 18 TowardsConvUnit[2][3][17] TowardsConvUnit[2][3][16] TowardsConvUnit[2][3][15] TowardsConvUnit[2][3][14] TowardsConvUnit[2][3][13] TowardsConvUnit[2][3][12] TowardsConvUnit[2][3][11] TowardsConvUnit[2][3][10] TowardsConvUnit[2][3][9] TowardsConvUnit[2][3][8] TowardsConvUnit[2][3][7] TowardsConvUnit[2][3][6] TowardsConvUnit[2][3][5] TowardsConvUnit[2][3][4] TowardsConvUnit[2][3][3] TowardsConvUnit[2][3][2] TowardsConvUnit[2][3][1] TowardsConvUnit[2][3][0] -autobundled
netbloc @TowardsConvUnit_13 1 3 1 NJ
load netBundle @TowardsConvUnit_63 18 TowardsConvUnit[0][7][17] TowardsConvUnit[0][7][16] TowardsConvUnit[0][7][15] TowardsConvUnit[0][7][14] TowardsConvUnit[0][7][13] TowardsConvUnit[0][7][12] TowardsConvUnit[0][7][11] TowardsConvUnit[0][7][10] TowardsConvUnit[0][7][9] TowardsConvUnit[0][7][8] TowardsConvUnit[0][7][7] TowardsConvUnit[0][7][6] TowardsConvUnit[0][7][5] TowardsConvUnit[0][7][4] TowardsConvUnit[0][7][3] TowardsConvUnit[0][7][2] TowardsConvUnit[0][7][1] TowardsConvUnit[0][7][0] -autobundled
netbloc @TowardsConvUnit_63 1 3 1 NJ
load netBundle @TowardsConvUnit_FF 8 TowardsConvUnit_FF[2][7] TowardsConvUnit_FF[2][6] TowardsConvUnit_FF[2][5] TowardsConvUnit_FF[2][4] TowardsConvUnit_FF[2][3] TowardsConvUnit_FF[2][2] TowardsConvUnit_FF[2][1] TowardsConvUnit_FF[2][0] -autobundled
netbloc @TowardsConvUnit_FF 1 1 1 660
load netBundle @TowardsConvUnit_64 18 TowardsConvUnit[3][0]_OBUF[17] TowardsConvUnit[3][0]_OBUF[16] TowardsConvUnit[3][0]_OBUF[15] TowardsConvUnit[3][0]_OBUF[14] TowardsConvUnit[3][0]_OBUF[13] TowardsConvUnit[3][0]_OBUF[12] TowardsConvUnit[3][0]_OBUF[11] TowardsConvUnit[3][0]_OBUF[10] TowardsConvUnit[3][0]_OBUF[9] TowardsConvUnit[3][0]_OBUF[8] TowardsConvUnit[3][0]_OBUF[7] TowardsConvUnit[3][0]_OBUF[6] TowardsConvUnit[3][0]_OBUF[5] TowardsConvUnit[3][0]_OBUF[4] TowardsConvUnit[3][0]_OBUF[3] TowardsConvUnit[3][0]_OBUF[2] TowardsConvUnit[3][0]_OBUF[1] TowardsConvUnit[3][0]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_64 1 2 1 N
load netBundle @BRAMWord_72 18 BRAMWord[0][1][17] BRAMWord[0][1][16] BRAMWord[0][1][15] BRAMWord[0][1][14] BRAMWord[0][1][13] BRAMWord[0][1][12] BRAMWord[0][1][11] BRAMWord[0][1][10] BRAMWord[0][1][9] BRAMWord[0][1][8] BRAMWord[0][1][7] BRAMWord[0][1][6] BRAMWord[0][1][5] BRAMWord[0][1][4] BRAMWord[0][1][3] BRAMWord[0][1][2] BRAMWord[0][1][1] BRAMWord[0][1][0] -autobundled
netbloc @BRAMWord_72 1 0 1 20
load netBundle @BRAMWord_5 18 BRAMWord[0][6][17] BRAMWord[0][6][16] BRAMWord[0][6][15] BRAMWord[0][6][14] BRAMWord[0][6][13] BRAMWord[0][6][12] BRAMWord[0][6][11] BRAMWord[0][6][10] BRAMWord[0][6][9] BRAMWord[0][6][8] BRAMWord[0][6][7] BRAMWord[0][6][6] BRAMWord[0][6][5] BRAMWord[0][6][4] BRAMWord[0][6][3] BRAMWord[0][6][2] BRAMWord[0][6][1] BRAMWord[0][6][0] -autobundled
netbloc @BRAMWord_5 1 0 1 140
load netBundle @TowardsConvUnit_FF_23 8 TowardsConvUnit_FF[0][7] TowardsConvUnit_FF[0][6] TowardsConvUnit_FF[0][5] TowardsConvUnit_FF[0][4] TowardsConvUnit_FF[0][3] TowardsConvUnit_FF[0][2] TowardsConvUnit_FF[0][1] TowardsConvUnit_FF[0][0] -autobundled
netbloc @TowardsConvUnit_FF_23 1 1 1 540
load netBundle @BRAMWord_6 18 BRAMWord[0][6]0_out[17] BRAMWord[0][6]0_out[16] BRAMWord[0][6]0_out[15] BRAMWord[0][6]0_out[14] BRAMWord[0][6]0_out[13] BRAMWord[0][6]0_out[12] BRAMWord[0][6]0_out[11] BRAMWord[0][6]0_out[10] BRAMWord[0][6]0_out[9] BRAMWord[0][6]0_out[8] BRAMWord[0][6]0_out[7] BRAMWord[0][6]0_out[6] BRAMWord[0][6]0_out[5] BRAMWord[0][6]0_out[4] BRAMWord[0][6]0_out[3] BRAMWord[0][6]0_out[2] BRAMWord[0][6]0_out[1] BRAMWord[0][6]0_out[0] -autobundled
netbloc @BRAMWord_6 1 1 1 560
load netBundle @BRAMWord_10 18 BRAMWord[0][1]0_out[17] BRAMWord[0][1]0_out[16] BRAMWord[0][1]0_out[15] BRAMWord[0][1]0_out[14] BRAMWord[0][1]0_out[13] BRAMWord[0][1]0_out[12] BRAMWord[0][1]0_out[11] BRAMWord[0][1]0_out[10] BRAMWord[0][1]0_out[9] BRAMWord[0][1]0_out[8] BRAMWord[0][1]0_out[7] BRAMWord[0][1]0_out[6] BRAMWord[0][1]0_out[5] BRAMWord[0][1]0_out[4] BRAMWord[0][1]0_out[3] BRAMWord[0][1]0_out[2] BRAMWord[0][1]0_out[1] BRAMWord[0][1]0_out[0] -autobundled
netbloc @BRAMWord_10 1 1 1 560
load netBundle @TowardsConvUnit_84 18 TowardsConvUnit[1][3]_OBUF[17] TowardsConvUnit[1][3]_OBUF[16] TowardsConvUnit[1][3]_OBUF[15] TowardsConvUnit[1][3]_OBUF[14] TowardsConvUnit[1][3]_OBUF[13] TowardsConvUnit[1][3]_OBUF[12] TowardsConvUnit[1][3]_OBUF[11] TowardsConvUnit[1][3]_OBUF[10] TowardsConvUnit[1][3]_OBUF[9] TowardsConvUnit[1][3]_OBUF[8] TowardsConvUnit[1][3]_OBUF[7] TowardsConvUnit[1][3]_OBUF[6] TowardsConvUnit[1][3]_OBUF[5] TowardsConvUnit[1][3]_OBUF[4] TowardsConvUnit[1][3]_OBUF[3] TowardsConvUnit[1][3]_OBUF[2] TowardsConvUnit[1][3]_OBUF[1] TowardsConvUnit[1][3]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_84 1 2 1 N
load netBundle @TowardsConvUnit_65 18 TowardsConvUnit[2][0][17] TowardsConvUnit[2][0][16] TowardsConvUnit[2][0][15] TowardsConvUnit[2][0][14] TowardsConvUnit[2][0][13] TowardsConvUnit[2][0][12] TowardsConvUnit[2][0][11] TowardsConvUnit[2][0][10] TowardsConvUnit[2][0][9] TowardsConvUnit[2][0][8] TowardsConvUnit[2][0][7] TowardsConvUnit[2][0][6] TowardsConvUnit[2][0][5] TowardsConvUnit[2][0][4] TowardsConvUnit[2][0][3] TowardsConvUnit[2][0][2] TowardsConvUnit[2][0][1] TowardsConvUnit[2][0][0] -autobundled
netbloc @TowardsConvUnit_65 1 3 1 NJ
load netBundle @TowardsConvUnit_66 18 TowardsConvUnit[0][1]_OBUF[17] TowardsConvUnit[0][1]_OBUF[16] TowardsConvUnit[0][1]_OBUF[15] TowardsConvUnit[0][1]_OBUF[14] TowardsConvUnit[0][1]_OBUF[13] TowardsConvUnit[0][1]_OBUF[12] TowardsConvUnit[0][1]_OBUF[11] TowardsConvUnit[0][1]_OBUF[10] TowardsConvUnit[0][1]_OBUF[9] TowardsConvUnit[0][1]_OBUF[8] TowardsConvUnit[0][1]_OBUF[7] TowardsConvUnit[0][1]_OBUF[6] TowardsConvUnit[0][1]_OBUF[5] TowardsConvUnit[0][1]_OBUF[4] TowardsConvUnit[0][1]_OBUF[3] TowardsConvUnit[0][1]_OBUF[2] TowardsConvUnit[0][1]_OBUF[1] TowardsConvUnit[0][1]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_66 1 2 1 N
load netBundle @BRAMWord_74 18 BRAMWord[0][1]_i__0_n_0 BRAMWord[0][1]_i__0_n_1 BRAMWord[0][1]_i__0_n_2 BRAMWord[0][1]_i__0_n_3 BRAMWord[0][1]_i__0_n_4 BRAMWord[0][1]_i__0_n_5 BRAMWord[0][1]_i__0_n_6 BRAMWord[0][1]_i__0_n_7 BRAMWord[0][1]_i__0_n_8 BRAMWord[0][1]_i__0_n_9 BRAMWord[0][1]_i__0_n_10 BRAMWord[0][1]_i__0_n_11 BRAMWord[0][1]_i__0_n_12 BRAMWord[0][1]_i__0_n_13 BRAMWord[0][1]_i__0_n_14 BRAMWord[0][1]_i__0_n_15 BRAMWord[0][1]_i__0_n_16 BRAMWord[0][1]_i__0_n_17 -autobundled
netbloc @BRAMWord_74 1 1 1 500
load netBundle @BRAMWord_7 18 BRAMWord[1][1][17] BRAMWord[1][1][16] BRAMWord[1][1][15] BRAMWord[1][1][14] BRAMWord[1][1][13] BRAMWord[1][1][12] BRAMWord[1][1][11] BRAMWord[1][1][10] BRAMWord[1][1][9] BRAMWord[1][1][8] BRAMWord[1][1][7] BRAMWord[1][1][6] BRAMWord[1][1][5] BRAMWord[1][1][4] BRAMWord[1][1][3] BRAMWord[1][1][2] BRAMWord[1][1][1] BRAMWord[1][1][0] -autobundled
netbloc @BRAMWord_7 1 0 1 40
load netBundle @TowardsConvUnit_85 18 TowardsConvUnit[0][6][17] TowardsConvUnit[0][6][16] TowardsConvUnit[0][6][15] TowardsConvUnit[0][6][14] TowardsConvUnit[0][6][13] TowardsConvUnit[0][6][12] TowardsConvUnit[0][6][11] TowardsConvUnit[0][6][10] TowardsConvUnit[0][6][9] TowardsConvUnit[0][6][8] TowardsConvUnit[0][6][7] TowardsConvUnit[0][6][6] TowardsConvUnit[0][6][5] TowardsConvUnit[0][6][4] TowardsConvUnit[0][6][3] TowardsConvUnit[0][6][2] TowardsConvUnit[0][6][1] TowardsConvUnit[0][6][0] -autobundled
netbloc @TowardsConvUnit_85 1 3 1 NJ
load netBundle @BRAMWord_8 18 BRAMWord[0][2]_i__0_n_0 BRAMWord[0][2]_i__0_n_1 BRAMWord[0][2]_i__0_n_2 BRAMWord[0][2]_i__0_n_3 BRAMWord[0][2]_i__0_n_4 BRAMWord[0][2]_i__0_n_5 BRAMWord[0][2]_i__0_n_6 BRAMWord[0][2]_i__0_n_7 BRAMWord[0][2]_i__0_n_8 BRAMWord[0][2]_i__0_n_9 BRAMWord[0][2]_i__0_n_10 BRAMWord[0][2]_i__0_n_11 BRAMWord[0][2]_i__0_n_12 BRAMWord[0][2]_i__0_n_13 BRAMWord[0][2]_i__0_n_14 BRAMWord[0][2]_i__0_n_15 BRAMWord[0][2]_i__0_n_16 BRAMWord[0][2]_i__0_n_17 -autobundled
netbloc @BRAMWord_8 1 1 1 480
load netBundle @BRAMWord_100 18 BRAMWord[0][3][17] BRAMWord[0][3][16] BRAMWord[0][3][15] BRAMWord[0][3][14] BRAMWord[0][3][13] BRAMWord[0][3][12] BRAMWord[0][3][11] BRAMWord[0][3][10] BRAMWord[0][3][9] BRAMWord[0][3][8] BRAMWord[0][3][7] BRAMWord[0][3][6] BRAMWord[0][3][5] BRAMWord[0][3][4] BRAMWord[0][3][3] BRAMWord[0][3][2] BRAMWord[0][3][1] BRAMWord[0][3][0] -autobundled
netbloc @BRAMWord_100 1 0 1 140
load netBundle @TowardsConvUnit_67 18 TowardsConvUnit[3][0][17] TowardsConvUnit[3][0][16] TowardsConvUnit[3][0][15] TowardsConvUnit[3][0][14] TowardsConvUnit[3][0][13] TowardsConvUnit[3][0][12] TowardsConvUnit[3][0][11] TowardsConvUnit[3][0][10] TowardsConvUnit[3][0][9] TowardsConvUnit[3][0][8] TowardsConvUnit[3][0][7] TowardsConvUnit[3][0][6] TowardsConvUnit[3][0][5] TowardsConvUnit[3][0][4] TowardsConvUnit[3][0][3] TowardsConvUnit[3][0][2] TowardsConvUnit[3][0][1] TowardsConvUnit[3][0][0] -autobundled
netbloc @TowardsConvUnit_67 1 3 1 NJ
load netBundle @TowardsConvUnit_18 18 TowardsConvUnit[0][6]_OBUF[17] TowardsConvUnit[0][6]_OBUF[16] TowardsConvUnit[0][6]_OBUF[15] TowardsConvUnit[0][6]_OBUF[14] TowardsConvUnit[0][6]_OBUF[13] TowardsConvUnit[0][6]_OBUF[12] TowardsConvUnit[0][6]_OBUF[11] TowardsConvUnit[0][6]_OBUF[10] TowardsConvUnit[0][6]_OBUF[9] TowardsConvUnit[0][6]_OBUF[8] TowardsConvUnit[0][6]_OBUF[7] TowardsConvUnit[0][6]_OBUF[6] TowardsConvUnit[0][6]_OBUF[5] TowardsConvUnit[0][6]_OBUF[4] TowardsConvUnit[0][6]_OBUF[3] TowardsConvUnit[0][6]_OBUF[2] TowardsConvUnit[0][6]_OBUF[1] TowardsConvUnit[0][6]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_18 1 2 1 N
load netBundle @TowardsConvUnit_68 18 TowardsConvUnit[1][4]_OBUF[17] TowardsConvUnit[1][4]_OBUF[16] TowardsConvUnit[1][4]_OBUF[15] TowardsConvUnit[1][4]_OBUF[14] TowardsConvUnit[1][4]_OBUF[13] TowardsConvUnit[1][4]_OBUF[12] TowardsConvUnit[1][4]_OBUF[11] TowardsConvUnit[1][4]_OBUF[10] TowardsConvUnit[1][4]_OBUF[9] TowardsConvUnit[1][4]_OBUF[8] TowardsConvUnit[1][4]_OBUF[7] TowardsConvUnit[1][4]_OBUF[6] TowardsConvUnit[1][4]_OBUF[5] TowardsConvUnit[1][4]_OBUF[4] TowardsConvUnit[1][4]_OBUF[3] TowardsConvUnit[1][4]_OBUF[2] TowardsConvUnit[1][4]_OBUF[1] TowardsConvUnit[1][4]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_68 1 2 1 N
load netBundle @BRAMWord_76 18 BRAMWord[0][4]0_out[17] BRAMWord[0][4]0_out[16] BRAMWord[0][4]0_out[15] BRAMWord[0][4]0_out[14] BRAMWord[0][4]0_out[13] BRAMWord[0][4]0_out[12] BRAMWord[0][4]0_out[11] BRAMWord[0][4]0_out[10] BRAMWord[0][4]0_out[9] BRAMWord[0][4]0_out[8] BRAMWord[0][4]0_out[7] BRAMWord[0][4]0_out[6] BRAMWord[0][4]0_out[5] BRAMWord[0][4]0_out[4] BRAMWord[0][4]0_out[3] BRAMWord[0][4]0_out[2] BRAMWord[0][4]0_out[1] BRAMWord[0][4]0_out[0] -autobundled
netbloc @BRAMWord_76 1 1 1 580
load netBundle @BRAMWord_9 18 BRAMWord[0][0][17] BRAMWord[0][0][16] BRAMWord[0][0][15] BRAMWord[0][0][14] BRAMWord[0][0][13] BRAMWord[0][0][12] BRAMWord[0][0][11] BRAMWord[0][0][10] BRAMWord[0][0][9] BRAMWord[0][0][8] BRAMWord[0][0][7] BRAMWord[0][0][6] BRAMWord[0][0][5] BRAMWord[0][0][4] BRAMWord[0][0][3] BRAMWord[0][0][2] BRAMWord[0][0][1] BRAMWord[0][0][0] -autobundled
netbloc @BRAMWord_9 1 0 1 20
load netBundle @TowardsConvUnit_87 18 TowardsConvUnit[3][1][17] TowardsConvUnit[3][1][16] TowardsConvUnit[3][1][15] TowardsConvUnit[3][1][14] TowardsConvUnit[3][1][13] TowardsConvUnit[3][1][12] TowardsConvUnit[3][1][11] TowardsConvUnit[3][1][10] TowardsConvUnit[3][1][9] TowardsConvUnit[3][1][8] TowardsConvUnit[3][1][7] TowardsConvUnit[3][1][6] TowardsConvUnit[3][1][5] TowardsConvUnit[3][1][4] TowardsConvUnit[3][1][3] TowardsConvUnit[3][1][2] TowardsConvUnit[3][1][1] TowardsConvUnit[3][1][0] -autobundled
netbloc @TowardsConvUnit_87 1 3 1 NJ
load netBundle @TowardsConvUnit_91 18 TowardsConvUnit[3][5]_OBUF[17] TowardsConvUnit[3][5]_OBUF[16] TowardsConvUnit[3][5]_OBUF[15] TowardsConvUnit[3][5]_OBUF[14] TowardsConvUnit[3][5]_OBUF[13] TowardsConvUnit[3][5]_OBUF[12] TowardsConvUnit[3][5]_OBUF[11] TowardsConvUnit[3][5]_OBUF[10] TowardsConvUnit[3][5]_OBUF[9] TowardsConvUnit[3][5]_OBUF[8] TowardsConvUnit[3][5]_OBUF[7] TowardsConvUnit[3][5]_OBUF[6] TowardsConvUnit[3][5]_OBUF[5] TowardsConvUnit[3][5]_OBUF[4] TowardsConvUnit[3][5]_OBUF[3] TowardsConvUnit[3][5]_OBUF[2] TowardsConvUnit[3][5]_OBUF[1] TowardsConvUnit[3][5]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_91 1 2 1 N
load netBundle @BRAMWord_14 18 BRAMWord[0][6]_i__0_n_0 BRAMWord[0][6]_i__0_n_1 BRAMWord[0][6]_i__0_n_2 BRAMWord[0][6]_i__0_n_3 BRAMWord[0][6]_i__0_n_4 BRAMWord[0][6]_i__0_n_5 BRAMWord[0][6]_i__0_n_6 BRAMWord[0][6]_i__0_n_7 BRAMWord[0][6]_i__0_n_8 BRAMWord[0][6]_i__0_n_9 BRAMWord[0][6]_i__0_n_10 BRAMWord[0][6]_i__0_n_11 BRAMWord[0][6]_i__0_n_12 BRAMWord[0][6]_i__0_n_13 BRAMWord[0][6]_i__0_n_14 BRAMWord[0][6]_i__0_n_15 BRAMWord[0][6]_i__0_n_16 BRAMWord[0][6]_i__0_n_17 -autobundled
netbloc @BRAMWord_14 1 1 1 440
load netBundle @TowardsConvUnit_40 18 TowardsConvUnit[2][3]_OBUF[17] TowardsConvUnit[2][3]_OBUF[16] TowardsConvUnit[2][3]_OBUF[15] TowardsConvUnit[2][3]_OBUF[14] TowardsConvUnit[2][3]_OBUF[13] TowardsConvUnit[2][3]_OBUF[12] TowardsConvUnit[2][3]_OBUF[11] TowardsConvUnit[2][3]_OBUF[10] TowardsConvUnit[2][3]_OBUF[9] TowardsConvUnit[2][3]_OBUF[8] TowardsConvUnit[2][3]_OBUF[7] TowardsConvUnit[2][3]_OBUF[6] TowardsConvUnit[2][3]_OBUF[5] TowardsConvUnit[2][3]_OBUF[4] TowardsConvUnit[2][3]_OBUF[3] TowardsConvUnit[2][3]_OBUF[2] TowardsConvUnit[2][3]_OBUF[1] TowardsConvUnit[2][3]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_40 1 2 1 N
load netBundle @TowardsConvUnit_88 18 TowardsConvUnit[0][4]_OBUF[17] TowardsConvUnit[0][4]_OBUF[16] TowardsConvUnit[0][4]_OBUF[15] TowardsConvUnit[0][4]_OBUF[14] TowardsConvUnit[0][4]_OBUF[13] TowardsConvUnit[0][4]_OBUF[12] TowardsConvUnit[0][4]_OBUF[11] TowardsConvUnit[0][4]_OBUF[10] TowardsConvUnit[0][4]_OBUF[9] TowardsConvUnit[0][4]_OBUF[8] TowardsConvUnit[0][4]_OBUF[7] TowardsConvUnit[0][4]_OBUF[6] TowardsConvUnit[0][4]_OBUF[5] TowardsConvUnit[0][4]_OBUF[4] TowardsConvUnit[0][4]_OBUF[3] TowardsConvUnit[0][4]_OBUF[2] TowardsConvUnit[0][4]_OBUF[1] TowardsConvUnit[0][4]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_88 1 2 1 N
load netBundle @TowardsConvUnit_69 18 TowardsConvUnit[3][7][17] TowardsConvUnit[3][7][16] TowardsConvUnit[3][7][15] TowardsConvUnit[3][7][14] TowardsConvUnit[3][7][13] TowardsConvUnit[3][7][12] TowardsConvUnit[3][7][11] TowardsConvUnit[3][7][10] TowardsConvUnit[3][7][9] TowardsConvUnit[3][7][8] TowardsConvUnit[3][7][7] TowardsConvUnit[3][7][6] TowardsConvUnit[3][7][5] TowardsConvUnit[3][7][4] TowardsConvUnit[3][7][3] TowardsConvUnit[3][7][2] TowardsConvUnit[3][7][1] TowardsConvUnit[3][7][0] -autobundled
netbloc @TowardsConvUnit_69 1 3 1 NJ
load netBundle @BRAMWord_78 18 BRAMWord[1][5][17] BRAMWord[1][5][16] BRAMWord[1][5][15] BRAMWord[1][5][14] BRAMWord[1][5][13] BRAMWord[1][5][12] BRAMWord[1][5][11] BRAMWord[1][5][10] BRAMWord[1][5][9] BRAMWord[1][5][8] BRAMWord[1][5][7] BRAMWord[1][5][6] BRAMWord[1][5][5] BRAMWord[1][5][4] BRAMWord[1][5][3] BRAMWord[1][5][2] BRAMWord[1][5][1] BRAMWord[1][5][0] -autobundled
netbloc @BRAMWord_78 1 0 1 140
load netBundle @BRAMWord_15 18 BRAMWord[0][7]0_out[17] BRAMWord[0][7]0_out[16] BRAMWord[0][7]0_out[15] BRAMWord[0][7]0_out[14] BRAMWord[0][7]0_out[13] BRAMWord[0][7]0_out[12] BRAMWord[0][7]0_out[11] BRAMWord[0][7]0_out[10] BRAMWord[0][7]0_out[9] BRAMWord[0][7]0_out[8] BRAMWord[0][7]0_out[7] BRAMWord[0][7]0_out[6] BRAMWord[0][7]0_out[5] BRAMWord[0][7]0_out[4] BRAMWord[0][7]0_out[3] BRAMWord[0][7]0_out[2] BRAMWord[0][7]0_out[1] BRAMWord[0][7]0_out[0] -autobundled
netbloc @BRAMWord_15 1 1 1 560
load netBundle @TowardsConvUnit_41 18 TowardsConvUnit[1][2][17] TowardsConvUnit[1][2][16] TowardsConvUnit[1][2][15] TowardsConvUnit[1][2][14] TowardsConvUnit[1][2][13] TowardsConvUnit[1][2][12] TowardsConvUnit[1][2][11] TowardsConvUnit[1][2][10] TowardsConvUnit[1][2][9] TowardsConvUnit[1][2][8] TowardsConvUnit[1][2][7] TowardsConvUnit[1][2][6] TowardsConvUnit[1][2][5] TowardsConvUnit[1][2][4] TowardsConvUnit[1][2][3] TowardsConvUnit[1][2][2] TowardsConvUnit[1][2][1] TowardsConvUnit[1][2][0] -autobundled
netbloc @TowardsConvUnit_41 1 3 1 NJ
load netBundle @TowardsConvUnit_89 18 TowardsConvUnit[3][6]_OBUF[17] TowardsConvUnit[3][6]_OBUF[16] TowardsConvUnit[3][6]_OBUF[15] TowardsConvUnit[3][6]_OBUF[14] TowardsConvUnit[3][6]_OBUF[13] TowardsConvUnit[3][6]_OBUF[12] TowardsConvUnit[3][6]_OBUF[11] TowardsConvUnit[3][6]_OBUF[10] TowardsConvUnit[3][6]_OBUF[9] TowardsConvUnit[3][6]_OBUF[8] TowardsConvUnit[3][6]_OBUF[7] TowardsConvUnit[3][6]_OBUF[6] TowardsConvUnit[3][6]_OBUF[5] TowardsConvUnit[3][6]_OBUF[4] TowardsConvUnit[3][6]_OBUF[3] TowardsConvUnit[3][6]_OBUF[2] TowardsConvUnit[3][6]_OBUF[1] TowardsConvUnit[3][6]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_89 1 2 1 N
load netBundle @BRAMWord_16 18 BRAMWord[0][0]_i__0_n_0 BRAMWord[0][0]_i__0_n_1 BRAMWord[0][0]_i__0_n_2 BRAMWord[0][0]_i__0_n_3 BRAMWord[0][0]_i__0_n_4 BRAMWord[0][0]_i__0_n_5 BRAMWord[0][0]_i__0_n_6 BRAMWord[0][0]_i__0_n_7 BRAMWord[0][0]_i__0_n_8 BRAMWord[0][0]_i__0_n_9 BRAMWord[0][0]_i__0_n_10 BRAMWord[0][0]_i__0_n_11 BRAMWord[0][0]_i__0_n_12 BRAMWord[0][0]_i__0_n_13 BRAMWord[0][0]_i__0_n_14 BRAMWord[0][0]_i__0_n_15 BRAMWord[0][0]_i__0_n_16 BRAMWord[0][0]_i__0_n_17 -autobundled
netbloc @BRAMWord_16 1 1 1 520
load netBundle @TowardsConvUnit_94 18 TowardsConvUnit[2][2]_OBUF[17] TowardsConvUnit[2][2]_OBUF[16] TowardsConvUnit[2][2]_OBUF[15] TowardsConvUnit[2][2]_OBUF[14] TowardsConvUnit[2][2]_OBUF[13] TowardsConvUnit[2][2]_OBUF[12] TowardsConvUnit[2][2]_OBUF[11] TowardsConvUnit[2][2]_OBUF[10] TowardsConvUnit[2][2]_OBUF[9] TowardsConvUnit[2][2]_OBUF[8] TowardsConvUnit[2][2]_OBUF[7] TowardsConvUnit[2][2]_OBUF[6] TowardsConvUnit[2][2]_OBUF[5] TowardsConvUnit[2][2]_OBUF[4] TowardsConvUnit[2][2]_OBUF[3] TowardsConvUnit[2][2]_OBUF[2] TowardsConvUnit[2][2]_OBUF[1] TowardsConvUnit[2][2]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_94 1 2 1 N
load netBundle @BRAMWord_52 18 BRAMWord[1][6][17] BRAMWord[1][6][16] BRAMWord[1][6][15] BRAMWord[1][6][14] BRAMWord[1][6][13] BRAMWord[1][6][12] BRAMWord[1][6][11] BRAMWord[1][6][10] BRAMWord[1][6][9] BRAMWord[1][6][8] BRAMWord[1][6][7] BRAMWord[1][6][6] BRAMWord[1][6][5] BRAMWord[1][6][4] BRAMWord[1][6][3] BRAMWord[1][6][2] BRAMWord[1][6][1] BRAMWord[1][6][0] -autobundled
netbloc @BRAMWord_52 1 0 1 20
load netBundle @TowardsConvUnit_43 18 TowardsConvUnit[3][2][17] TowardsConvUnit[3][2][16] TowardsConvUnit[3][2][15] TowardsConvUnit[3][2][14] TowardsConvUnit[3][2][13] TowardsConvUnit[3][2][12] TowardsConvUnit[3][2][11] TowardsConvUnit[3][2][10] TowardsConvUnit[3][2][9] TowardsConvUnit[3][2][8] TowardsConvUnit[3][2][7] TowardsConvUnit[3][2][6] TowardsConvUnit[3][2][5] TowardsConvUnit[3][2][4] TowardsConvUnit[3][2][3] TowardsConvUnit[3][2][2] TowardsConvUnit[3][2][1] TowardsConvUnit[3][2][0] -autobundled
netbloc @TowardsConvUnit_43 1 3 1 NJ
load netBundle @BRAMWord 18 BRAMWord[0][5]0_out[17] BRAMWord[0][5]0_out[16] BRAMWord[0][5]0_out[15] BRAMWord[0][5]0_out[14] BRAMWord[0][5]0_out[13] BRAMWord[0][5]0_out[12] BRAMWord[0][5]0_out[11] BRAMWord[0][5]0_out[10] BRAMWord[0][5]0_out[9] BRAMWord[0][5]0_out[8] BRAMWord[0][5]0_out[7] BRAMWord[0][5]0_out[6] BRAMWord[0][5]0_out[5] BRAMWord[0][5]0_out[4] BRAMWord[0][5]0_out[3] BRAMWord[0][5]0_out[2] BRAMWord[0][5]0_out[1] BRAMWord[0][5]0_out[0] -autobundled
netbloc @BRAMWord 1 1 1 680
load netBundle @TowardsConvUnit_44 18 TowardsConvUnit[2][4][17] TowardsConvUnit[2][4][16] TowardsConvUnit[2][4][15] TowardsConvUnit[2][4][14] TowardsConvUnit[2][4][13] TowardsConvUnit[2][4][12] TowardsConvUnit[2][4][11] TowardsConvUnit[2][4][10] TowardsConvUnit[2][4][9] TowardsConvUnit[2][4][8] TowardsConvUnit[2][4][7] TowardsConvUnit[2][4][6] TowardsConvUnit[2][4][5] TowardsConvUnit[2][4][4] TowardsConvUnit[2][4][3] TowardsConvUnit[2][4][2] TowardsConvUnit[2][4][1] TowardsConvUnit[2][4][0] -autobundled
netbloc @TowardsConvUnit_44 1 3 1 NJ
load netBundle @LoadEnable 4 LoadEnable[0] LoadEnable[1] LoadEnable[2] LoadEnable[3] -autobundled
netbloc @LoadEnable 1 0 2 NJ 2930 620
load netBundle @TowardsConvUnit_96 18 TowardsConvUnit[3][3]_OBUF[17] TowardsConvUnit[3][3]_OBUF[16] TowardsConvUnit[3][3]_OBUF[15] TowardsConvUnit[3][3]_OBUF[14] TowardsConvUnit[3][3]_OBUF[13] TowardsConvUnit[3][3]_OBUF[12] TowardsConvUnit[3][3]_OBUF[11] TowardsConvUnit[3][3]_OBUF[10] TowardsConvUnit[3][3]_OBUF[9] TowardsConvUnit[3][3]_OBUF[8] TowardsConvUnit[3][3]_OBUF[7] TowardsConvUnit[3][3]_OBUF[6] TowardsConvUnit[3][3]_OBUF[5] TowardsConvUnit[3][3]_OBUF[4] TowardsConvUnit[3][3]_OBUF[3] TowardsConvUnit[3][3]_OBUF[2] TowardsConvUnit[3][3]_OBUF[1] TowardsConvUnit[3][3]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_96 1 2 1 N
load netBundle @BRAMWord_19 18 BRAMWord[0][0]0_out[17] BRAMWord[0][0]0_out[16] BRAMWord[0][0]0_out[15] BRAMWord[0][0]0_out[14] BRAMWord[0][0]0_out[13] BRAMWord[0][0]0_out[12] BRAMWord[0][0]0_out[11] BRAMWord[0][0]0_out[10] BRAMWord[0][0]0_out[9] BRAMWord[0][0]0_out[8] BRAMWord[0][0]0_out[7] BRAMWord[0][0]0_out[6] BRAMWord[0][0]0_out[5] BRAMWord[0][0]0_out[4] BRAMWord[0][0]0_out[3] BRAMWord[0][0]0_out[2] BRAMWord[0][0]0_out[1] BRAMWord[0][0]0_out[0] -autobundled
netbloc @BRAMWord_19 1 1 1 520
load netBundle @TowardsConvUnit_45 18 TowardsConvUnit[3][7]_OBUF[17] TowardsConvUnit[3][7]_OBUF[16] TowardsConvUnit[3][7]_OBUF[15] TowardsConvUnit[3][7]_OBUF[14] TowardsConvUnit[3][7]_OBUF[13] TowardsConvUnit[3][7]_OBUF[12] TowardsConvUnit[3][7]_OBUF[11] TowardsConvUnit[3][7]_OBUF[10] TowardsConvUnit[3][7]_OBUF[9] TowardsConvUnit[3][7]_OBUF[8] TowardsConvUnit[3][7]_OBUF[7] TowardsConvUnit[3][7]_OBUF[6] TowardsConvUnit[3][7]_OBUF[5] TowardsConvUnit[3][7]_OBUF[4] TowardsConvUnit[3][7]_OBUF[3] TowardsConvUnit[3][7]_OBUF[2] TowardsConvUnit[3][7]_OBUF[1] TowardsConvUnit[3][7]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_45 1 2 1 N
load netBundle @TowardsConvUnit_1 18 TowardsConvUnit[3][4]_OBUF[17] TowardsConvUnit[3][4]_OBUF[16] TowardsConvUnit[3][4]_OBUF[15] TowardsConvUnit[3][4]_OBUF[14] TowardsConvUnit[3][4]_OBUF[13] TowardsConvUnit[3][4]_OBUF[12] TowardsConvUnit[3][4]_OBUF[11] TowardsConvUnit[3][4]_OBUF[10] TowardsConvUnit[3][4]_OBUF[9] TowardsConvUnit[3][4]_OBUF[8] TowardsConvUnit[3][4]_OBUF[7] TowardsConvUnit[3][4]_OBUF[6] TowardsConvUnit[3][4]_OBUF[5] TowardsConvUnit[3][4]_OBUF[4] TowardsConvUnit[3][4]_OBUF[3] TowardsConvUnit[3][4]_OBUF[2] TowardsConvUnit[3][4]_OBUF[1] TowardsConvUnit[3][4]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_1 1 2 1 N
load netBundle @TowardsConvUnit_47 18 TowardsConvUnit[3][3][17] TowardsConvUnit[3][3][16] TowardsConvUnit[3][3][15] TowardsConvUnit[3][3][14] TowardsConvUnit[3][3][13] TowardsConvUnit[3][3][12] TowardsConvUnit[3][3][11] TowardsConvUnit[3][3][10] TowardsConvUnit[3][3][9] TowardsConvUnit[3][3][8] TowardsConvUnit[3][3][7] TowardsConvUnit[3][3][6] TowardsConvUnit[3][3][5] TowardsConvUnit[3][3][4] TowardsConvUnit[3][3][3] TowardsConvUnit[3][3][2] TowardsConvUnit[3][3][1] TowardsConvUnit[3][3][0] -autobundled
netbloc @TowardsConvUnit_47 1 3 1 NJ
load netBundle @TowardsConvUnit_20 18 TowardsConvUnit[3][1]_OBUF[17] TowardsConvUnit[3][1]_OBUF[16] TowardsConvUnit[3][1]_OBUF[15] TowardsConvUnit[3][1]_OBUF[14] TowardsConvUnit[3][1]_OBUF[13] TowardsConvUnit[3][1]_OBUF[12] TowardsConvUnit[3][1]_OBUF[11] TowardsConvUnit[3][1]_OBUF[10] TowardsConvUnit[3][1]_OBUF[9] TowardsConvUnit[3][1]_OBUF[8] TowardsConvUnit[3][1]_OBUF[7] TowardsConvUnit[3][1]_OBUF[6] TowardsConvUnit[3][1]_OBUF[5] TowardsConvUnit[3][1]_OBUF[4] TowardsConvUnit[3][1]_OBUF[3] TowardsConvUnit[3][1]_OBUF[2] TowardsConvUnit[3][1]_OBUF[1] TowardsConvUnit[3][1]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_20 1 2 1 N
load netBundle @TowardsConvUnit_48 18 TowardsConvUnit[1][4][17] TowardsConvUnit[1][4][16] TowardsConvUnit[1][4][15] TowardsConvUnit[1][4][14] TowardsConvUnit[1][4][13] TowardsConvUnit[1][4][12] TowardsConvUnit[1][4][11] TowardsConvUnit[1][4][10] TowardsConvUnit[1][4][9] TowardsConvUnit[1][4][8] TowardsConvUnit[1][4][7] TowardsConvUnit[1][4][6] TowardsConvUnit[1][4][5] TowardsConvUnit[1][4][4] TowardsConvUnit[1][4][3] TowardsConvUnit[1][4][2] TowardsConvUnit[1][4][1] TowardsConvUnit[1][4][0] -autobundled
netbloc @TowardsConvUnit_48 1 3 1 NJ
load netBundle @TowardsConvUnit_2 18 TowardsConvUnit[0][7]_OBUF[17] TowardsConvUnit[0][7]_OBUF[16] TowardsConvUnit[0][7]_OBUF[15] TowardsConvUnit[0][7]_OBUF[14] TowardsConvUnit[0][7]_OBUF[13] TowardsConvUnit[0][7]_OBUF[12] TowardsConvUnit[0][7]_OBUF[11] TowardsConvUnit[0][7]_OBUF[10] TowardsConvUnit[0][7]_OBUF[9] TowardsConvUnit[0][7]_OBUF[8] TowardsConvUnit[0][7]_OBUF[7] TowardsConvUnit[0][7]_OBUF[6] TowardsConvUnit[0][7]_OBUF[5] TowardsConvUnit[0][7]_OBUF[4] TowardsConvUnit[0][7]_OBUF[3] TowardsConvUnit[0][7]_OBUF[2] TowardsConvUnit[0][7]_OBUF[1] TowardsConvUnit[0][7]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_2 1 2 1 N
load netBundle @TowardsConvUnit_71 18 TowardsConvUnit[1][3][17] TowardsConvUnit[1][3][16] TowardsConvUnit[1][3][15] TowardsConvUnit[1][3][14] TowardsConvUnit[1][3][13] TowardsConvUnit[1][3][12] TowardsConvUnit[1][3][11] TowardsConvUnit[1][3][10] TowardsConvUnit[1][3][9] TowardsConvUnit[1][3][8] TowardsConvUnit[1][3][7] TowardsConvUnit[1][3][6] TowardsConvUnit[1][3][5] TowardsConvUnit[1][3][4] TowardsConvUnit[1][3][3] TowardsConvUnit[1][3][2] TowardsConvUnit[1][3][1] TowardsConvUnit[1][3][0] -autobundled
netbloc @TowardsConvUnit_71 1 3 1 NJ
load netBundle @BRAMWord_58 18 BRAMWord[0][4][17] BRAMWord[0][4][16] BRAMWord[0][4][15] BRAMWord[0][4][14] BRAMWord[0][4][13] BRAMWord[0][4][12] BRAMWord[0][4][11] BRAMWord[0][4][10] BRAMWord[0][4][9] BRAMWord[0][4][8] BRAMWord[0][4][7] BRAMWord[0][4][6] BRAMWord[0][4][5] BRAMWord[0][4][4] BRAMWord[0][4][3] BRAMWord[0][4][2] BRAMWord[0][4][1] BRAMWord[0][4][0] -autobundled
netbloc @BRAMWord_58 1 0 1 140
load netBundle @TowardsConvUnit_21 18 TowardsConvUnit[3][5][17] TowardsConvUnit[3][5][16] TowardsConvUnit[3][5][15] TowardsConvUnit[3][5][14] TowardsConvUnit[3][5][13] TowardsConvUnit[3][5][12] TowardsConvUnit[3][5][11] TowardsConvUnit[3][5][10] TowardsConvUnit[3][5][9] TowardsConvUnit[3][5][8] TowardsConvUnit[3][5][7] TowardsConvUnit[3][5][6] TowardsConvUnit[3][5][5] TowardsConvUnit[3][5][4] TowardsConvUnit[3][5][3] TowardsConvUnit[3][5][2] TowardsConvUnit[3][5][1] TowardsConvUnit[3][5][0] -autobundled
netbloc @TowardsConvUnit_21 1 3 1 NJ
load netBundle @TowardsConvUnit_49 18 TowardsConvUnit[0][3][17] TowardsConvUnit[0][3][16] TowardsConvUnit[0][3][15] TowardsConvUnit[0][3][14] TowardsConvUnit[0][3][13] TowardsConvUnit[0][3][12] TowardsConvUnit[0][3][11] TowardsConvUnit[0][3][10] TowardsConvUnit[0][3][9] TowardsConvUnit[0][3][8] TowardsConvUnit[0][3][7] TowardsConvUnit[0][3][6] TowardsConvUnit[0][3][5] TowardsConvUnit[0][3][4] TowardsConvUnit[0][3][3] TowardsConvUnit[0][3][2] TowardsConvUnit[0][3][1] TowardsConvUnit[0][3][0] -autobundled
netbloc @TowardsConvUnit_49 1 3 1 NJ
load netBundle @BRAMWord_30 18 BRAMWord[0][3]_i__0_n_0 BRAMWord[0][3]_i__0_n_1 BRAMWord[0][3]_i__0_n_2 BRAMWord[0][3]_i__0_n_3 BRAMWord[0][3]_i__0_n_4 BRAMWord[0][3]_i__0_n_5 BRAMWord[0][3]_i__0_n_6 BRAMWord[0][3]_i__0_n_7 BRAMWord[0][3]_i__0_n_8 BRAMWord[0][3]_i__0_n_9 BRAMWord[0][3]_i__0_n_10 BRAMWord[0][3]_i__0_n_11 BRAMWord[0][3]_i__0_n_12 BRAMWord[0][3]_i__0_n_13 BRAMWord[0][3]_i__0_n_14 BRAMWord[0][3]_i__0_n_15 BRAMWord[0][3]_i__0_n_16 BRAMWord[0][3]_i__0_n_17 -autobundled
netbloc @BRAMWord_30 1 1 1 640
load netBundle @TowardsConvUnit_73 18 TowardsConvUnit[0][0][17] TowardsConvUnit[0][0][16] TowardsConvUnit[0][0][15] TowardsConvUnit[0][0][14] TowardsConvUnit[0][0][13] TowardsConvUnit[0][0][12] TowardsConvUnit[0][0][11] TowardsConvUnit[0][0][10] TowardsConvUnit[0][0][9] TowardsConvUnit[0][0][8] TowardsConvUnit[0][0][7] TowardsConvUnit[0][0][6] TowardsConvUnit[0][0][5] TowardsConvUnit[0][0][4] TowardsConvUnit[0][0][3] TowardsConvUnit[0][0][2] TowardsConvUnit[0][0][1] TowardsConvUnit[0][0][0] -autobundled
netbloc @TowardsConvUnit_73 1 3 1 NJ
load netBundle @TowardsConvUnit_24 18 TowardsConvUnit[2][4]_OBUF[17] TowardsConvUnit[2][4]_OBUF[16] TowardsConvUnit[2][4]_OBUF[15] TowardsConvUnit[2][4]_OBUF[14] TowardsConvUnit[2][4]_OBUF[13] TowardsConvUnit[2][4]_OBUF[12] TowardsConvUnit[2][4]_OBUF[11] TowardsConvUnit[2][4]_OBUF[10] TowardsConvUnit[2][4]_OBUF[9] TowardsConvUnit[2][4]_OBUF[8] TowardsConvUnit[2][4]_OBUF[7] TowardsConvUnit[2][4]_OBUF[6] TowardsConvUnit[2][4]_OBUF[5] TowardsConvUnit[2][4]_OBUF[4] TowardsConvUnit[2][4]_OBUF[3] TowardsConvUnit[2][4]_OBUF[2] TowardsConvUnit[2][4]_OBUF[1] TowardsConvUnit[2][4]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_24 1 2 1 N
load netBundle @TowardsConvUnit_75 18 TowardsConvUnit[3][4][17] TowardsConvUnit[3][4][16] TowardsConvUnit[3][4][15] TowardsConvUnit[3][4][14] TowardsConvUnit[3][4][13] TowardsConvUnit[3][4][12] TowardsConvUnit[3][4][11] TowardsConvUnit[3][4][10] TowardsConvUnit[3][4][9] TowardsConvUnit[3][4][8] TowardsConvUnit[3][4][7] TowardsConvUnit[3][4][6] TowardsConvUnit[3][4][5] TowardsConvUnit[3][4][4] TowardsConvUnit[3][4][3] TowardsConvUnit[3][4][2] TowardsConvUnit[3][4][1] TowardsConvUnit[3][4][0] -autobundled
netbloc @TowardsConvUnit_75 1 3 1 NJ
load netBundle @TowardsConvUnit_25 18 TowardsConvUnit[1][5]_OBUF[17] TowardsConvUnit[1][5]_OBUF[16] TowardsConvUnit[1][5]_OBUF[15] TowardsConvUnit[1][5]_OBUF[14] TowardsConvUnit[1][5]_OBUF[13] TowardsConvUnit[1][5]_OBUF[12] TowardsConvUnit[1][5]_OBUF[11] TowardsConvUnit[1][5]_OBUF[10] TowardsConvUnit[1][5]_OBUF[9] TowardsConvUnit[1][5]_OBUF[8] TowardsConvUnit[1][5]_OBUF[7] TowardsConvUnit[1][5]_OBUF[6] TowardsConvUnit[1][5]_OBUF[5] TowardsConvUnit[1][5]_OBUF[4] TowardsConvUnit[1][5]_OBUF[3] TowardsConvUnit[1][5]_OBUF[2] TowardsConvUnit[1][5]_OBUF[1] TowardsConvUnit[1][5]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_25 1 2 1 N
load netBundle @BRAMWord_83 18 BRAMWord[0][4]_i__0_n_0 BRAMWord[0][4]_i__0_n_1 BRAMWord[0][4]_i__0_n_2 BRAMWord[0][4]_i__0_n_3 BRAMWord[0][4]_i__0_n_4 BRAMWord[0][4]_i__0_n_5 BRAMWord[0][4]_i__0_n_6 BRAMWord[0][4]_i__0_n_7 BRAMWord[0][4]_i__0_n_8 BRAMWord[0][4]_i__0_n_9 BRAMWord[0][4]_i__0_n_10 BRAMWord[0][4]_i__0_n_11 BRAMWord[0][4]_i__0_n_12 BRAMWord[0][4]_i__0_n_13 BRAMWord[0][4]_i__0_n_14 BRAMWord[0][4]_i__0_n_15 BRAMWord[0][4]_i__0_n_16 BRAMWord[0][4]_i__0_n_17 -autobundled
netbloc @BRAMWord_83 1 1 1 580
load netBundle @TowardsConvUnit_26 18 TowardsConvUnit[1][2]_OBUF[17] TowardsConvUnit[1][2]_OBUF[16] TowardsConvUnit[1][2]_OBUF[15] TowardsConvUnit[1][2]_OBUF[14] TowardsConvUnit[1][2]_OBUF[13] TowardsConvUnit[1][2]_OBUF[12] TowardsConvUnit[1][2]_OBUF[11] TowardsConvUnit[1][2]_OBUF[10] TowardsConvUnit[1][2]_OBUF[9] TowardsConvUnit[1][2]_OBUF[8] TowardsConvUnit[1][2]_OBUF[7] TowardsConvUnit[1][2]_OBUF[6] TowardsConvUnit[1][2]_OBUF[5] TowardsConvUnit[1][2]_OBUF[4] TowardsConvUnit[1][2]_OBUF[3] TowardsConvUnit[1][2]_OBUF[2] TowardsConvUnit[1][2]_OBUF[1] TowardsConvUnit[1][2]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_26 1 2 1 N
load netBundle @BRAMWord_34 18 BRAMWord[1][7][17] BRAMWord[1][7][16] BRAMWord[1][7][15] BRAMWord[1][7][14] BRAMWord[1][7][13] BRAMWord[1][7][12] BRAMWord[1][7][11] BRAMWord[1][7][10] BRAMWord[1][7][9] BRAMWord[1][7][8] BRAMWord[1][7][7] BRAMWord[1][7][6] BRAMWord[1][7][5] BRAMWord[1][7][4] BRAMWord[1][7][3] BRAMWord[1][7][2] BRAMWord[1][7][1] BRAMWord[1][7][0] -autobundled
netbloc @BRAMWord_34 1 0 1 140
load netBundle @TowardsConvUnit_FF_17 8 TowardsConvUnit_FF[3][7] TowardsConvUnit_FF[3][6] TowardsConvUnit_FF[3][5] TowardsConvUnit_FF[3][4] TowardsConvUnit_FF[3][3] TowardsConvUnit_FF[3][2] TowardsConvUnit_FF[3][1] TowardsConvUnit_FF[3][0] -autobundled
netbloc @TowardsConvUnit_FF_17 1 1 1 420
load netBundle @TowardsConvUnit_77 18 TowardsConvUnit[1][0][17] TowardsConvUnit[1][0][16] TowardsConvUnit[1][0][15] TowardsConvUnit[1][0][14] TowardsConvUnit[1][0][13] TowardsConvUnit[1][0][12] TowardsConvUnit[1][0][11] TowardsConvUnit[1][0][10] TowardsConvUnit[1][0][9] TowardsConvUnit[1][0][8] TowardsConvUnit[1][0][7] TowardsConvUnit[1][0][6] TowardsConvUnit[1][0][5] TowardsConvUnit[1][0][4] TowardsConvUnit[1][0][3] TowardsConvUnit[1][0][2] TowardsConvUnit[1][0][1] TowardsConvUnit[1][0][0] -autobundled
netbloc @TowardsConvUnit_77 1 3 1 NJ
load netBundle @TowardsConvUnit_27 18 TowardsConvUnit[0][4][17] TowardsConvUnit[0][4][16] TowardsConvUnit[0][4][15] TowardsConvUnit[0][4][14] TowardsConvUnit[0][4][13] TowardsConvUnit[0][4][12] TowardsConvUnit[0][4][11] TowardsConvUnit[0][4][10] TowardsConvUnit[0][4][9] TowardsConvUnit[0][4][8] TowardsConvUnit[0][4][7] TowardsConvUnit[0][4][6] TowardsConvUnit[0][4][5] TowardsConvUnit[0][4][4] TowardsConvUnit[0][4][3] TowardsConvUnit[0][4][2] TowardsConvUnit[0][4][1] TowardsConvUnit[0][4][0] -autobundled
netbloc @TowardsConvUnit_27 1 3 1 NJ
load netBundle @TowardsConvUnit_28 18 TowardsConvUnit[2][0]_OBUF[17] TowardsConvUnit[2][0]_OBUF[16] TowardsConvUnit[2][0]_OBUF[15] TowardsConvUnit[2][0]_OBUF[14] TowardsConvUnit[2][0]_OBUF[13] TowardsConvUnit[2][0]_OBUF[12] TowardsConvUnit[2][0]_OBUF[11] TowardsConvUnit[2][0]_OBUF[10] TowardsConvUnit[2][0]_OBUF[9] TowardsConvUnit[2][0]_OBUF[8] TowardsConvUnit[2][0]_OBUF[7] TowardsConvUnit[2][0]_OBUF[6] TowardsConvUnit[2][0]_OBUF[5] TowardsConvUnit[2][0]_OBUF[4] TowardsConvUnit[2][0]_OBUF[3] TowardsConvUnit[2][0]_OBUF[2] TowardsConvUnit[2][0]_OBUF[1] TowardsConvUnit[2][0]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_28 1 2 1 N
load netBundle @BRAMWord_86 18 BRAMWord[1][4][17] BRAMWord[1][4][16] BRAMWord[1][4][15] BRAMWord[1][4][14] BRAMWord[1][4][13] BRAMWord[1][4][12] BRAMWord[1][4][11] BRAMWord[1][4][10] BRAMWord[1][4][9] BRAMWord[1][4][8] BRAMWord[1][4][7] BRAMWord[1][4][6] BRAMWord[1][4][5] BRAMWord[1][4][4] BRAMWord[1][4][3] BRAMWord[1][4][2] BRAMWord[1][4][1] BRAMWord[1][4][0] -autobundled
netbloc @BRAMWord_86 1 0 1 120
load netBundle @TowardsConvUnit_79 18 TowardsConvUnit[1][7][17] TowardsConvUnit[1][7][16] TowardsConvUnit[1][7][15] TowardsConvUnit[1][7][14] TowardsConvUnit[1][7][13] TowardsConvUnit[1][7][12] TowardsConvUnit[1][7][11] TowardsConvUnit[1][7][10] TowardsConvUnit[1][7][9] TowardsConvUnit[1][7][8] TowardsConvUnit[1][7][7] TowardsConvUnit[1][7][6] TowardsConvUnit[1][7][5] TowardsConvUnit[1][7][4] TowardsConvUnit[1][7][3] TowardsConvUnit[1][7][2] TowardsConvUnit[1][7][1] TowardsConvUnit[1][7][0] -autobundled
netbloc @TowardsConvUnit_79 1 3 1 NJ
load netBundle @TowardsConvUnit_50 18 TowardsConvUnit[0][5][17] TowardsConvUnit[0][5][16] TowardsConvUnit[0][5][15] TowardsConvUnit[0][5][14] TowardsConvUnit[0][5][13] TowardsConvUnit[0][5][12] TowardsConvUnit[0][5][11] TowardsConvUnit[0][5][10] TowardsConvUnit[0][5][9] TowardsConvUnit[0][5][8] TowardsConvUnit[0][5][7] TowardsConvUnit[0][5][6] TowardsConvUnit[0][5][5] TowardsConvUnit[0][5][4] TowardsConvUnit[0][5][3] TowardsConvUnit[0][5][2] TowardsConvUnit[0][5][1] TowardsConvUnit[0][5][0] -autobundled
netbloc @TowardsConvUnit_50 1 3 1 NJ
load netBundle @TowardsConvUnit_51 18 TowardsConvUnit[2][7][17] TowardsConvUnit[2][7][16] TowardsConvUnit[2][7][15] TowardsConvUnit[2][7][14] TowardsConvUnit[2][7][13] TowardsConvUnit[2][7][12] TowardsConvUnit[2][7][11] TowardsConvUnit[2][7][10] TowardsConvUnit[2][7][9] TowardsConvUnit[2][7][8] TowardsConvUnit[2][7][7] TowardsConvUnit[2][7][6] TowardsConvUnit[2][7][5] TowardsConvUnit[2][7][4] TowardsConvUnit[2][7][3] TowardsConvUnit[2][7][2] TowardsConvUnit[2][7][1] TowardsConvUnit[2][7][0] -autobundled
netbloc @TowardsConvUnit_51 1 3 1 NJ
load netBundle @TowardsConvUnit_53 18 TowardsConvUnit[2][6][17] TowardsConvUnit[2][6][16] TowardsConvUnit[2][6][15] TowardsConvUnit[2][6][14] TowardsConvUnit[2][6][13] TowardsConvUnit[2][6][12] TowardsConvUnit[2][6][11] TowardsConvUnit[2][6][10] TowardsConvUnit[2][6][9] TowardsConvUnit[2][6][8] TowardsConvUnit[2][6][7] TowardsConvUnit[2][6][6] TowardsConvUnit[2][6][5] TowardsConvUnit[2][6][4] TowardsConvUnit[2][6][3] TowardsConvUnit[2][6][2] TowardsConvUnit[2][6][1] TowardsConvUnit[2][6][0] -autobundled
netbloc @TowardsConvUnit_53 1 3 1 NJ
load netBundle @TowardsConvUnit_54 18 TowardsConvUnit[0][5]_OBUF[17] TowardsConvUnit[0][5]_OBUF[16] TowardsConvUnit[0][5]_OBUF[15] TowardsConvUnit[0][5]_OBUF[14] TowardsConvUnit[0][5]_OBUF[13] TowardsConvUnit[0][5]_OBUF[12] TowardsConvUnit[0][5]_OBUF[11] TowardsConvUnit[0][5]_OBUF[10] TowardsConvUnit[0][5]_OBUF[9] TowardsConvUnit[0][5]_OBUF[8] TowardsConvUnit[0][5]_OBUF[7] TowardsConvUnit[0][5]_OBUF[6] TowardsConvUnit[0][5]_OBUF[5] TowardsConvUnit[0][5]_OBUF[4] TowardsConvUnit[0][5]_OBUF[3] TowardsConvUnit[0][5]_OBUF[2] TowardsConvUnit[0][5]_OBUF[1] TowardsConvUnit[0][5]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_54 1 2 1 N
load netBundle @TowardsConvUnit_FF_1 8 TowardsConvUnit_FF[1][7] TowardsConvUnit_FF[1][6] TowardsConvUnit_FF[1][5] TowardsConvUnit_FF[1][4] TowardsConvUnit_FF[1][3] TowardsConvUnit_FF[1][2] TowardsConvUnit_FF[1][1] TowardsConvUnit_FF[1][0] -autobundled
netbloc @TowardsConvUnit_FF_1 1 1 1 680
load netBundle @TowardsConvUnit_55 18 TowardsConvUnit[3][6][17] TowardsConvUnit[3][6][16] TowardsConvUnit[3][6][15] TowardsConvUnit[3][6][14] TowardsConvUnit[3][6][13] TowardsConvUnit[3][6][12] TowardsConvUnit[3][6][11] TowardsConvUnit[3][6][10] TowardsConvUnit[3][6][9] TowardsConvUnit[3][6][8] TowardsConvUnit[3][6][7] TowardsConvUnit[3][6][6] TowardsConvUnit[3][6][5] TowardsConvUnit[3][6][4] TowardsConvUnit[3][6][3] TowardsConvUnit[3][6][2] TowardsConvUnit[3][6][1] TowardsConvUnit[3][6][0] -autobundled
netbloc @TowardsConvUnit_55 1 3 1 NJ
load netBundle @TowardsConvUnit_56 18 TowardsConvUnit[1][1]_OBUF[17] TowardsConvUnit[1][1]_OBUF[16] TowardsConvUnit[1][1]_OBUF[15] TowardsConvUnit[1][1]_OBUF[14] TowardsConvUnit[1][1]_OBUF[13] TowardsConvUnit[1][1]_OBUF[12] TowardsConvUnit[1][1]_OBUF[11] TowardsConvUnit[1][1]_OBUF[10] TowardsConvUnit[1][1]_OBUF[9] TowardsConvUnit[1][1]_OBUF[8] TowardsConvUnit[1][1]_OBUF[7] TowardsConvUnit[1][1]_OBUF[6] TowardsConvUnit[1][1]_OBUF[5] TowardsConvUnit[1][1]_OBUF[4] TowardsConvUnit[1][1]_OBUF[3] TowardsConvUnit[1][1]_OBUF[2] TowardsConvUnit[1][1]_OBUF[1] TowardsConvUnit[1][1]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_56 1 2 1 N
load netBundle @TowardsConvUnit_57 18 TowardsConvUnit[2][2][17] TowardsConvUnit[2][2][16] TowardsConvUnit[2][2][15] TowardsConvUnit[2][2][14] TowardsConvUnit[2][2][13] TowardsConvUnit[2][2][12] TowardsConvUnit[2][2][11] TowardsConvUnit[2][2][10] TowardsConvUnit[2][2][9] TowardsConvUnit[2][2][8] TowardsConvUnit[2][2][7] TowardsConvUnit[2][2][6] TowardsConvUnit[2][2][5] TowardsConvUnit[2][2][4] TowardsConvUnit[2][2][3] TowardsConvUnit[2][2][2] TowardsConvUnit[2][2][1] TowardsConvUnit[2][2][0] -autobundled
netbloc @TowardsConvUnit_57 1 3 1 NJ
load netBundle @BRAMWord_22 18 BRAMWord[0][7]_i__0_n_0 BRAMWord[0][7]_i__0_n_1 BRAMWord[0][7]_i__0_n_2 BRAMWord[0][7]_i__0_n_3 BRAMWord[0][7]_i__0_n_4 BRAMWord[0][7]_i__0_n_5 BRAMWord[0][7]_i__0_n_6 BRAMWord[0][7]_i__0_n_7 BRAMWord[0][7]_i__0_n_8 BRAMWord[0][7]_i__0_n_9 BRAMWord[0][7]_i__0_n_10 BRAMWord[0][7]_i__0_n_11 BRAMWord[0][7]_i__0_n_12 BRAMWord[0][7]_i__0_n_13 BRAMWord[0][7]_i__0_n_14 BRAMWord[0][7]_i__0_n_15 BRAMWord[0][7]_i__0_n_16 BRAMWord[0][7]_i__0_n_17 -autobundled
netbloc @BRAMWord_22 1 1 1 400
load netBundle @TowardsConvUnit_59 18 TowardsConvUnit[1][6][17] TowardsConvUnit[1][6][16] TowardsConvUnit[1][6][15] TowardsConvUnit[1][6][14] TowardsConvUnit[1][6][13] TowardsConvUnit[1][6][12] TowardsConvUnit[1][6][11] TowardsConvUnit[1][6][10] TowardsConvUnit[1][6][9] TowardsConvUnit[1][6][8] TowardsConvUnit[1][6][7] TowardsConvUnit[1][6][6] TowardsConvUnit[1][6][5] TowardsConvUnit[1][6][4] TowardsConvUnit[1][6][3] TowardsConvUnit[1][6][2] TowardsConvUnit[1][6][1] TowardsConvUnit[1][6][0] -autobundled
netbloc @TowardsConvUnit_59 1 3 1 NJ
load netBundle @BRAMWord_90 18 BRAMWord[1][3][17] BRAMWord[1][3][16] BRAMWord[1][3][15] BRAMWord[1][3][14] BRAMWord[1][3][13] BRAMWord[1][3][12] BRAMWord[1][3][11] BRAMWord[1][3][10] BRAMWord[1][3][9] BRAMWord[1][3][8] BRAMWord[1][3][7] BRAMWord[1][3][6] BRAMWord[1][3][5] BRAMWord[1][3][4] BRAMWord[1][3][3] BRAMWord[1][3][2] BRAMWord[1][3][1] BRAMWord[1][3][0] -autobundled
netbloc @BRAMWord_90 1 0 1 120
load netBundle @TowardsConvUnit_31 18 TowardsConvUnit[2][7]_OBUF[17] TowardsConvUnit[2][7]_OBUF[16] TowardsConvUnit[2][7]_OBUF[15] TowardsConvUnit[2][7]_OBUF[14] TowardsConvUnit[2][7]_OBUF[13] TowardsConvUnit[2][7]_OBUF[12] TowardsConvUnit[2][7]_OBUF[11] TowardsConvUnit[2][7]_OBUF[10] TowardsConvUnit[2][7]_OBUF[9] TowardsConvUnit[2][7]_OBUF[8] TowardsConvUnit[2][7]_OBUF[7] TowardsConvUnit[2][7]_OBUF[6] TowardsConvUnit[2][7]_OBUF[5] TowardsConvUnit[2][7]_OBUF[4] TowardsConvUnit[2][7]_OBUF[3] TowardsConvUnit[2][7]_OBUF[2] TowardsConvUnit[2][7]_OBUF[1] TowardsConvUnit[2][7]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_31 1 2 1 N
load netBundle @TowardsConvUnit 18 TowardsConvUnit[3][2]_OBUF[17] TowardsConvUnit[3][2]_OBUF[16] TowardsConvUnit[3][2]_OBUF[15] TowardsConvUnit[3][2]_OBUF[14] TowardsConvUnit[3][2]_OBUF[13] TowardsConvUnit[3][2]_OBUF[12] TowardsConvUnit[3][2]_OBUF[11] TowardsConvUnit[3][2]_OBUF[10] TowardsConvUnit[3][2]_OBUF[9] TowardsConvUnit[3][2]_OBUF[8] TowardsConvUnit[3][2]_OBUF[7] TowardsConvUnit[3][2]_OBUF[6] TowardsConvUnit[3][2]_OBUF[5] TowardsConvUnit[3][2]_OBUF[4] TowardsConvUnit[3][2]_OBUF[3] TowardsConvUnit[3][2]_OBUF[2] TowardsConvUnit[3][2]_OBUF[1] TowardsConvUnit[3][2]_OBUF[0] -autobundled
netbloc @TowardsConvUnit 1 2 1 N
load netBundle @TowardsConvUnit_32 18 TowardsConvUnit[1][6]_OBUF[17] TowardsConvUnit[1][6]_OBUF[16] TowardsConvUnit[1][6]_OBUF[15] TowardsConvUnit[1][6]_OBUF[14] TowardsConvUnit[1][6]_OBUF[13] TowardsConvUnit[1][6]_OBUF[12] TowardsConvUnit[1][6]_OBUF[11] TowardsConvUnit[1][6]_OBUF[10] TowardsConvUnit[1][6]_OBUF[9] TowardsConvUnit[1][6]_OBUF[8] TowardsConvUnit[1][6]_OBUF[7] TowardsConvUnit[1][6]_OBUF[6] TowardsConvUnit[1][6]_OBUF[5] TowardsConvUnit[1][6]_OBUF[4] TowardsConvUnit[1][6]_OBUF[3] TowardsConvUnit[1][6]_OBUF[2] TowardsConvUnit[1][6]_OBUF[1] TowardsConvUnit[1][6]_OBUF[0] -autobundled
netbloc @TowardsConvUnit_32 1 2 1 N
load netBundle @BRAMWord_42 18 BRAMWord[1][0][17] BRAMWord[1][0][16] BRAMWord[1][0][15] BRAMWord[1][0][14] BRAMWord[1][0][13] BRAMWord[1][0][12] BRAMWord[1][0][11] BRAMWord[1][0][10] BRAMWord[1][0][9] BRAMWord[1][0][8] BRAMWord[1][0][7] BRAMWord[1][0][6] BRAMWord[1][0][5] BRAMWord[1][0][4] BRAMWord[1][0][3] BRAMWord[1][0][2] BRAMWord[1][0][1] BRAMWord[1][0][0] -autobundled
netbloc @BRAMWord_42 1 0 1 40
load netBundle @BRAMWord_92 18 BRAMWord[0][5][17] BRAMWord[0][5][16] BRAMWord[0][5][15] BRAMWord[0][5][14] BRAMWord[0][5][13] BRAMWord[0][5][12] BRAMWord[0][5][11] BRAMWord[0][5][10] BRAMWord[0][5][9] BRAMWord[0][5][8] BRAMWord[0][5][7] BRAMWord[0][5][6] BRAMWord[0][5][5] BRAMWord[0][5][4] BRAMWord[0][5][3] BRAMWord[0][5][2] BRAMWord[0][5][1] BRAMWord[0][5][0] -autobundled
netbloc @BRAMWord_92 1 0 1 40
load netBundle @TowardsConvUnit_33 18 TowardsConvUnit[1][1][17] TowardsConvUnit[1][1][16] TowardsConvUnit[1][1][15] TowardsConvUnit[1][1][14] TowardsConvUnit[1][1][13] TowardsConvUnit[1][1][12] TowardsConvUnit[1][1][11] TowardsConvUnit[1][1][10] TowardsConvUnit[1][1][9] TowardsConvUnit[1][1][8] TowardsConvUnit[1][1][7] TowardsConvUnit[1][1][6] TowardsConvUnit[1][1][5] TowardsConvUnit[1][1][4] TowardsConvUnit[1][1][3] TowardsConvUnit[1][1][2] TowardsConvUnit[1][1][1] TowardsConvUnit[1][1][0] -autobundled
netbloc @TowardsConvUnit_33 1 3 1 NJ
levelinfo -pg 1 0 250 730 1060 1380 -top 0 -bot 4810
show
zoom 0.75714
scrollpos -555 694
#
# initialize ictrl to current module DataBRAM_ConvUnitInterface work:DataBRAM_ConvUnitInterface:NOFILE
ictrl init topinfo |
ictrl layer glayer install
ictrl layer glayer config ibundle 1
ictrl layer glayer config nbundle 0
ictrl layer glayer config pbundle 0
ictrl layer glayer config cache 1
