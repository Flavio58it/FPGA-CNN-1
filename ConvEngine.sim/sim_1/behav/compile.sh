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
echo "xvhdl -m64 --relax -prj ConvEngineOutput_Top_tb_vhdl.prj"
ExecStep $xv_path/bin/xvhdl -m64 --relax -prj ConvEngineOutput_Top_tb_vhdl.prj 2>&1 | tee -a compile.log
