onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L secureip -L blk_mem_gen_v8_3_0 -L xil_defaultlib -lib xil_defaultlib xil_defaultlib.blk_mem_gen_SDP_18KRAM_Awrite36depth512_Bread18

do {wave.do}

view wave
view structure
view signals

do {blk_mem_gen_SDP_18KRAM_Awrite36depth512_Bread18.udo}

run -all

quit -force
