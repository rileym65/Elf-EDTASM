PROJECT = edtasm

$(PROJECT).prg: $(PROJECT).asm bios.inc
	rcasm -l -v -x -d1802 $(PROJECT) 2>&1 | tee edtasm.lst

elfos: $(PROJECT).asm bios.inc kernel.inc
	rcasm -l -v -x -d1802 -DELFOS $(PROJECT) 2>&1 | tee edtasm.lst

picoelf: $(PROJECT).asm bios.inc
	rcasm -l -v -x -d1802 -DPICOROM $(PROJECT) 2>&1 | tee edtasm.lst

stg: $(PROJECT).asm bios.inc config.inc
	rcasm -l -v -x -d1802 -DSTGROM $(PROJECT) 2>&1 | tee edtasm.lst

mchip: $(PROJECT).asm bios.inc config.inc
	rcasm -l -v -x -d1802 -DMCHIP $(PROJECT) 2>&1 | tee edtasm.lst

clean:
	-rm $(PROJECT).prg


