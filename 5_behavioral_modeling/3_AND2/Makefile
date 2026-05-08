CLEAN_FILES = cds.lib hdl.var *.lib waves.shm *.log *.key

clean:
	@rm -rf $(CLEAN_FILES)
	@echo "Removed:" $(wildcard $(CLEAN_FILES))
set: 
	touch cds.lib hdl.var
	mkdir work.lib
	echo "define work_lib ./work.lib" >> ./cds.lib
	echo "define WORK work_lib" >> ./hdl.var
compile:
	xmvlog -MESS -linedebug ./*v
elab:
	xmelab -MESS -access rwc tb_ander_ff

sim:
	xmsim -MESS tb_ander_ff -gui 


all: clean set compile elab sim
