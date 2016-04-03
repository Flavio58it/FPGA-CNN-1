onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib blk_mem_gen_1_TDP_Ar18w72_Br72w72_opt

do {wave.do}

view wave
view structure
view signals

do {blk_mem_gen_1_TDP_Ar18w72_Br72w72.udo}

run -all

quit -force
