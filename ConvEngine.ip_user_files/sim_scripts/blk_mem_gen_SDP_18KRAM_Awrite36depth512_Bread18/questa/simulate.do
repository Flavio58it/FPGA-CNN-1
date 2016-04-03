onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib blk_mem_gen_SDP_18KRAM_Awrite36depth512_Bread18_opt

do {wave.do}

view wave
view structure
view signals

do {blk_mem_gen_SDP_18KRAM_Awrite36depth512_Bread18.udo}

run -all

quit -force
