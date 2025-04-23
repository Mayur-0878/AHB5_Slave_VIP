path = ../top/AHB5_Slave_package.sv
#path1 = ../sv/Transaction.sv
#path += ../sve/interface.sv
#path += ../sve/Environment.sv
#path += ../top/test.sv
#path += ../sv/Monitor.sv
#path += ../sv/Scoreboard.sv
#path += ../sv/generator.sv
#path += ../sv/Driver.sv
log +=*vcd
log +=transcript
#log +=*vstf
log +=*wlf
wave=0

all:compile sim wlf 


compile:
	@echo "compiling...."
	@vlog $(path)
	
sim:
	@echo "simulation start"
	@vopt work.AHB5_Slave_Top -o tb_opt +acc=arn
	@vsim  -assertdebug work.tb_opt 
	#@mv $(log) ../sim/
	
wlf:
	@vsim vsim.wlf -do "add wave -r/ *" 

waves:
	ifeq (wave==1)
	  @vopt work.testbench -o tb_opt +acc=arn
	  @vsim  -assertdebug work.tb_opt -do "add wave -position insertpoint sim:/testbench/Slave_intf/*"
	  @mv $(log) ../sim/
	  @rm -rf *vcd
	else
	  @vsim  -assertdebug work.tb_opt -do "add wave -position insertpoint sim:/testbench/Slave_intf/*; run -all "
	  @mv $(log) ../sim/
	endif  



clean:
	@rm -rf work
	#@rm -rf  ../sim/$(log)

