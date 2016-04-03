onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib xbip_dsp48_macro_A18_B18_Output36_SimpleRoundingOf12Bits_opt

do {wave.do}

view wave
view structure
view signals

do {xbip_dsp48_macro_A18_B18_Output36_SimpleRoundingOf12Bits.udo}

run -all

quit -force
