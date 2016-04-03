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
ExecStep $xv_path/bin/xelab -wto 550eb3c5a432405b9324e15c5ef7c990 -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L secureip --snapshot ConvEngineWeightBankTop_tb_func_impl xil_defaultlib.ConvEngineWeightBankTop_tb xil_defaultlib.glbl -log elaborate.log
