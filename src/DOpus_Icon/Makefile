# ---- Project ----
TARGET      := DOpus_Icon

include ../common.mk

.PHONY: all clean

all: $(BUILD_DIR)/$(TARGET)

# Link
$(BUILD_DIR)/$(TARGET): $(OBJS)
	@echo '------  LINK  ------'
	$(CC) $(CFLAGS) $(OBJS) $(LIBS) -o $@

clean:
	$(RM) $(BUILD_DIR)
