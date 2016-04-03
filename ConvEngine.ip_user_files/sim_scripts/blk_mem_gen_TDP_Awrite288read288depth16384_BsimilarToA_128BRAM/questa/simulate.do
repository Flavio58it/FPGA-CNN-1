onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib blk_mem_gen_TDP_Awrite288read288depth16384_BsimilarToA_128BRAM_opt

do {wave.do}

view wave
view structure
view signals

do {blk_mem_gen_TDP_Awrite288read288depth16384_BsimilarToA_128BRAM.udo}

run -all

quit -force
