path = ../top/AHB5_Slave_top.sv
current_Directory = ../sim/
log +=vsim.wlf
override seed?=100
override waves?=0
override argument ?=Second

all:compile sim logs 


compile:
	@echo "compiling...."
	@echo $(seed)
	@vlog $(path)
	
sim:
	@echo "simulation start"
	@vopt work.AHB5_Slave_Top -o tb_opt +acc=arn 
ifeq ($(waves),1)
	mkdir  -p $(current_Directory)log/$(argument)_$(seed)
	vsim  -assertdebug work.tb_opt +$(argument) -sv_seed $(seed) -l $(current_Directory)log/$(argument)_$(seed)/$(argument)_$(seed).log  -do "add wave -r /*;run -all"
else
	mkdir  -p $(current_Directory)log/$(argument)_$(seed)
	vsim  -assertdebug  work.tb_opt +$(argument) -sv_seed $(seed) -l $(current_Directory)log/$(argument)_$(seed)/$(argument)_$(seed).log -do "run -all"
endif

logs:
	@mv $(log)  $(current_Directory)log/$(argument)_$(seed)/$(argument)_$(seed).wlf



clean:
	@rm -rf work
clean_all:
	@rm -rf work
	@rm -rf $(current_Directory)log/*

