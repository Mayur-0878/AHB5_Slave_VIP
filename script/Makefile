path += ../top/top.sv
#path += ../sv/Transaction.sv
#path += ../sve/interface.sv
#path += ../sve/Environment.sv
#path += ../top/test.sv
#path += ../sv/Monitor.sv
#path += ../sv/Scoreboard.sv
#path += ../sv/generator.sv
#path += ../sv/Driver.sv

all:

compile:clean
	@echo "compiling...."
	@vlog $(path)
compile_with_sim:clean
	@vlog $(path)
	@vopt work.testbench -o tb_opt +acc=arn
	@vsim -assertdebug work.tb_opt
clean:
	@rm -rf work

