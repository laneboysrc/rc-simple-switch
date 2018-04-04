BUILD := ./build
TARGET := $(BUILD)/simple-switch.ihx

CPU_FREQUENCY_KHZ := 6000

CFLAGS = -mmcs51
CFLAGS += --std-c99
CFLAGS += --iram-size 128
CFLAGS += --code-size 0x1000
CFLAGS += --out-fmt-ihx


STC_OPTIONS := --option low_voltage_reset=true
STC_OPTIONS += --option low_voltage_threshold=5
STC_OPTIONS += --option rstout_por_state=low


all: $(TARGET)

$(TARGET): simple-switch.c
	mkdir -p $(BUILD)
	sdcc $(CFLAGS) -o $(BUILD)/ $^

clean:
	$(RM) -r $(BUILD)

flash: $(TARGET)
	stcgal -t $(CPU_FREQUENCY_KHZ) $(STC_OPTIONS) -b 1200 $<

.PHONY: all clean flash