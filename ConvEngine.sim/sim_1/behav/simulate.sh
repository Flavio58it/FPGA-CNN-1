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
ExecStep $xv_path/bin/xsim ConvEngineOutput_Top_tb_behav -key {Behavioral:sim_1:Functional:ConvEngineOutput_Top_tb} -tclbatch ConvEngineOutput_Top_tb.tcl -log simulate.log
