vlib work
vlib msim

vlib msim/blk_mem_gen_v8_3_0
vlib msim/xil_defaultlib

vmap blk_mem_gen_v8_3_0 msim/blk_mem_gen_v8_3_0
vmap xil_defaultlib msim/xil_defaultlib

vcom -work blk_mem_gen_v8_3_0 -64 \
"./../../../ipstatic/blk_mem_gen_v8_3_0/simulation/blk_mem_gen_v8_3.vhd" \

vcom -work xil_defaultlib -64 \
"./../../../../ConvEngine.srcs/sources_1/ip/blk_mem_gen_1_TDP_Ar18w72_Br72w72/sim/blk_mem_gen_1_TDP_Ar18w72_Br72w72.vhd" \


