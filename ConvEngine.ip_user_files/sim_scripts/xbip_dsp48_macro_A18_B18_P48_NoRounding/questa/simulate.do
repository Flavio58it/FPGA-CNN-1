onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib xbip_dsp48_macro_A18_B18_P48_NoRounding_opt

do {wave.do}

view wave
view structure
view signals

do {xbip_dsp48_macro_A18_B18_P48_NoRounding.udo}

run -all

quit -force
