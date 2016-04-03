onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib fifo_generator_Width16_Depth16_DistRAM_opt

do {wave.do}

view wave
view structure
view signals

do {fifo_generator_Width16_Depth16_DistRAM.udo}

run -all

quit -force
