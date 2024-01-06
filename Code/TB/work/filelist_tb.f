+notimingchecks
-sv
-timescale "1us/1us"
-incr
-hazards

//  Include Path
+incdir+../inc
+incdir+../libs/uvm-1.1d/src
+incdir+../src

-y  ../inc
-y  ../libs/uvm-1.1d/src
-y  ../src

///////////////////////////////////////////////////////////////////////////////
//  Top Testbench Level Module
///////////////////////////////////////////////////////////////////////////////


../src/aes_tb_top/aes_tb_top.sv
