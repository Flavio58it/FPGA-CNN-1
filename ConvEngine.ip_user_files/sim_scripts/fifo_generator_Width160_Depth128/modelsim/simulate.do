onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L secureip -L fifo_generator_v13_0_0 -L xil_defaultlib -lib xil_defaultlib xil_defaultlib.fifo_generator_Width160_Depth128

do {wave.do}

view wave
view structure
view signals

do {fifo_generator_Width160_Depth128.udo}

run -all

quit -force
