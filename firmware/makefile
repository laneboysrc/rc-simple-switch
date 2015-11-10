.PHONY: all
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
