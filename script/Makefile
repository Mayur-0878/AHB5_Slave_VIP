path = ../top/AHB5_Slave_top.sv
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
override wave=0

all:compile sim  


compile:
	@echo "compiling...."
	@echo $(wave)
	@vlog $(path)
	
sim:
	@echo "simulation start"
	@vopt work.AHB5_Slave_Top -o tb_opt +acc=arn 
	@vsim -c -assertdebug -msgmode both work.tb_opt 
	
wlf:
	@vsim vsim.wlf -do "add wave -r/ *" 




clean:
	@rm -rf work
	#@rm -rf  ../sim/$(log)

