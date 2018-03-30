BUILD := ./build
TARGET := $(BUILD)/simple-switch.hex

DEVICE := pic10f200

all: $(TARGET)

$(TARGET): $(BUILD)/simple-switch.o
	gplink -m -O 2 -o $@ $^

$(BUILD)/%.o: %.asm
	mkdir -p $(BUILD)
	gpasm -c -o $@ $<

clean:
	$(RM) -r $(BUILD)

flash: $(TARGET)
	pk2cmd -p $(DEVICE) -f $< -m -t

on:
	pk2cmd -p $(DEVICE) -t

off:
	pk2cmd -p $(DEVICE)

.PHONY: all clean flash on off
