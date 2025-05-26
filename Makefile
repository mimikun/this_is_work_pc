PROJECT_ROOT := .
TARGET_DIR := $(PROJECT_ROOT)/target
BIN_RELEASE := $(TARGET_DIR)/release/this_is_work_pc

.PHONY: all
all: build

.PHONY: build
build:
	cargo build --release

INSTALL_DIR := /usr/local/bin

.PHONY: install
install: build
	mkdir -p $(INSTALL_DIR)
	sudo cp $(BIN_RELEASE) $(INSTALL_DIR)

.PHONY: clean
clean:
	cargo clean
