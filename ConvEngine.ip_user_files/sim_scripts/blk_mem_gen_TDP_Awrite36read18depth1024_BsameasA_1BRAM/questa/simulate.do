onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib blk_mem_gen_TDP_Awrite36read18depth1024_BsameasA_1BRAM_opt

do {wave.do}

view wave
view structure
view signals

do {blk_mem_gen_TDP_Awrite36read18depth1024_BsameasA_1BRAM.udo}

run -all

quit -force
