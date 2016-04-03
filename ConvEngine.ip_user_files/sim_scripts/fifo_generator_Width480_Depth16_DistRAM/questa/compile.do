vlib work
vlib msim

vlib msim/fifo_generator_v13_0_0
vlib msim/xil_defaultlib

vmap fifo_generator_v13_0_0 msim/fifo_generator_v13_0_0
vmap xil_defaultlib msim/xil_defaultlib

vcom -work fifo_generator_v13_0_0 -64 \
"./../../../ipstatic/fifo_generator_v13_0_0/simulation/fifo_generator_vhdl_beh.vhd" \
"./../../../ipstatic/fifo_generator_v13_0_0/hdl/fifo_generator_v13_0_rfs.vhd" \

vcom -work xil_defaultlib -64 \
"./../../../../ConvEngine.srcs/sources_1/ip/fifo_generator_Width480_Depth16_DistRAM/sim/fifo_generator_Width480_Depth16_DistRAM.vhd" \

