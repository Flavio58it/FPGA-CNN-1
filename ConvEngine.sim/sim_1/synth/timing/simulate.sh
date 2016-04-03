#!/bin/bash -f
xv_path="/opt/Xilinx/Vivado/2015.3"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xsim LocalMemControl_tb_time_synth -key {Post-Synthesis:sim_1:Timing:LocalMemControl_tb} -tclbatch LocalMemControl_tb.tcl -log simulate.log
