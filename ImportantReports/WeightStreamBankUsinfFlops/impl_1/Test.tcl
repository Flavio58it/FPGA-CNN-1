proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {Common 17-41} -limit 10000000
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  create_project -in_memory -part xc7vx485tffg1761-2
  set_property board_part xilinx.com:vc707:part0:1.2 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir /home/edcn103/Dropbox/M.tech/Project/Hardware_Implementation/ConvEngine/ConvEngine.cache/wt [current_project]
  set_property parent.project_path /home/edcn103/Dropbox/M.tech/Project/Hardware_Implementation/ConvEngine/ConvEngine.xpr [current_project]
  set_property ip_repo_paths /home/edcn103/Dropbox/M.tech/Project/Hardware_Implementation/ConvEngine/ConvEngine.cache/ip [current_project]
  set_property ip_output_repo /home/edcn103/Dropbox/M.tech/Project/Hardware_Implementation/ConvEngine/ConvEngine.cache/ip [current_project]
  add_files -quiet /home/edcn103/Dropbox/M.tech/Project/Hardware_Implementation/ConvEngine/ConvEngine.runs/synth_1/Test.dcp
  add_files -quiet /home/edcn103/Dropbox/M.tech/Project/Hardware_Implementation/ConvEngine/ConvEngine.runs/xbip_dsp48_macro_A18_B18_P48_NoRounding_synth_1/xbip_dsp48_macro_A18_B18_P48_NoRounding.dcp
  set_property netlist_only true [get_files /home/edcn103/Dropbox/M.tech/Project/Hardware_Implementation/ConvEngine/ConvEngine.runs/xbip_dsp48_macro_A18_B18_P48_NoRounding_synth_1/xbip_dsp48_macro_A18_B18_P48_NoRounding.dcp]
  add_files -quiet /home/edcn103/Dropbox/M.tech/Project/Hardware_Implementation/ConvEngine/ConvEngine.runs/blk_mem_gen_TDP_Awrite288read288depth16384_BsimilarToA_128BRAM_synth_1/blk_mem_gen_TDP_Awrite288read288depth16384_BsimilarToA_128BRAM.dcp
  set_property netlist_only true [get_files /home/edcn103/Dropbox/M.tech/Project/Hardware_Implementation/ConvEngine/ConvEngine.runs/blk_mem_gen_TDP_Awrite288read288depth16384_BsimilarToA_128BRAM_synth_1/blk_mem_gen_TDP_Awrite288read288depth16384_BsimilarToA_128BRAM.dcp]
  read_xdc -mode out_of_context -ref xbip_dsp48_macro_A18_B18_P48_NoRounding -cells U0 /home/edcn103/Dropbox/M.tech/Project/Hardware_Implementation/ConvEngine/ConvEngine.srcs/sources_1/ip/xbip_dsp48_macro_A18_B18_P48_NoRounding/xbip_dsp48_macro_A18_B18_P48_NoRounding_ooc.xdc
  set_property processing_order EARLY [get_files /home/edcn103/Dropbox/M.tech/Project/Hardware_Implementation/ConvEngine/ConvEngine.srcs/sources_1/ip/xbip_dsp48_macro_A18_B18_P48_NoRounding/xbip_dsp48_macro_A18_B18_P48_NoRounding_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_gen_TDP_Awrite288read288depth16384_BsimilarToA_128BRAM -cells U0 /home/edcn103/Dropbox/M.tech/Project/Hardware_Implementation/ConvEngine/ConvEngine.srcs/sources_1/ip/blk_mem_gen_TDP_Awrite288read288depth16384_BsimilarToA_128BRAM/blk_mem_gen_TDP_Awrite288read288depth16384_BsimilarToA_128BRAM_ooc.xdc
  set_property processing_order EARLY [get_files /home/edcn103/Dropbox/M.tech/Project/Hardware_Implementation/ConvEngine/ConvEngine.srcs/sources_1/ip/blk_mem_gen_TDP_Awrite288read288depth16384_BsimilarToA_128BRAM/blk_mem_gen_TDP_Awrite288read288depth16384_BsimilarToA_128BRAM_ooc.xdc]
  read_xdc /home/edcn103/Dropbox/M.tech/Project/Hardware_Implementation/ConvEngine/ConvEngine.srcs/constrs_1/new/StreamWriteControl.xdc
  link_design -top Test -part xc7vx485tffg1761-2
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force Test_opt.dcp
  report_drc -file Test_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  catch {write_hwdef -file Test.hwdef}
  place_design 
  write_checkpoint -force Test_placed.dcp
  report_io -file Test_io_placed.rpt
  report_utilization -file Test_utilization_placed.rpt -pb Test_utilization_placed.pb
  report_control_sets -verbose -file Test_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force Test_routed.dcp
  report_drc -file Test_drc_routed.rpt -pb Test_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file Test_timing_summary_routed.rpt -rpx Test_timing_summary_routed.rpx
  report_power -file Test_power_routed.rpt -pb Test_power_summary_routed.pb
  report_route_status -file Test_route_status.rpt -pb Test_route_status.pb
  report_clock_utilization -file Test_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

