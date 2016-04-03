onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib blk_mem_gen_SDP_Awrite72depth65536_Bread72_128BRAM_opt

do {wave.do}

view wave
view structure
view signals

do {blk_mem_gen_SDP_Awrite72depth65536_Bread72_128BRAM.udo}

run -all

quit -force
