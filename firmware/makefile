.PHONY: all clean program on off

DEVICE := pic10f200
# DEVICE := pic10lf322

all: simple-switch.hex

simple-switch.hex : simple-switch.o
	gplink -m -O 2 -o $@ $^

%.o : %.asm
	gpasm -c -o $@ $<

clean :
	$(RM) *.hex
	$(RM) *.lst
	$(RM) *.map
	$(RM) *.cod
	$(RM) *.o

program : simple-switch.hex
	pk2cmd -p $(DEVICE) -f simple-switch.hex -m -t

on :
	pk2cmd -p $(DEVICE) -t

off :
	pk2cmd -p $(DEVICE)