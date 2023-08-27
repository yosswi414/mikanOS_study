BASE = .
LOADER = $(BASE)/edk2/Build/MikanLoaderX64/DEBUG_CLANG38/X64/Loader.efi
LOADER_SRC = $(BASE)/workspace/mikanos/MikanLoaderPkg/Main.c
KERNEL_DIR = $(BASE)/workspace/mikanos/kernel
KERNEL_SRC = $(shell find $(KERNEL_DIR) -name "*.cpp" -o -name "*.hpp" -o -name "*.c" -o -name "*.h" -o -name "*.asm")
KERNEL = $(KERNEL_DIR)/kernel.elf
KERNEL_MKF = $(KERNEL_DIR)/Makefile

QEMU = $(BASE)/osbook/devenv/run_qemu.sh
MAKEFS = Makefile $(KERNEL_MKF)

SHELL := /bin/bash

# OLD_SHELL := $(SHELL)
# SHELL = $(warning [Making: $@]   [Dependencies: $^]   [Changed: $?])$(OLD_SHELL)

.PHONY: run
run: $(LOADER) $(KERNEL) Makefile
	$(QEMU) $(LOADER) $(KERNEL)

.DEFAULT_GOAL := run

.PHONY: test
test:
	# @echo KERNEL_DEPENDS: $(KERNEL_DEPENDS)
	# @echo KERNEL_SRC: $(KERNEL_SRC)
	@echo wildcard: $(shell find $(KERNEL_DIR) -name "*.cpp" -o -name "*.hpp" -o -name "*.c" -o -name "*.h" -o -name "*.asm")

.PHONY: loader
loader: $(LOADER)

.PHONY: clean
clean:
	rm $(LOADER)
	rm -rf $(dir $(LOADER))MikanLoaderPkg

$(LOADER): $(LOADER_SRC) Makefile
	cd $(BASE)/edk2; . ./edksetup.sh; build; cd $(BASE)

# BASEDIR="$(BASE)/osbook/devenv/x86_64-elf"
# EDK2DIR="$(BASE)/edk2"
# CPPFLAGS=\
#     -I$(BASEDIR)/include/c++/v1 -I$(BASEDIR)/include -I$(BASEDIR)/include/freetype2 \
#     -I$(EDK2DIR)/MdePkg/Include -I$(EDK2DIR)/MdePkg/Include/X64 \
#     -nostdlibinc -D__ELF__ -D_LDBL_EQ_DBL -D_GNU_SOURCE -D_POSIX_TIMERS \
#     -DEFIAPI='__attribute__((ms_abi))'
# LDFLAGS="-L$(BASEDIR)/lib"

# export CPPFLAGS
# export LDFLAGS

$(KERNEL): $(KERNEL_SRC) $(KERNEL_MKF)
	make -C $(KERNEL_DIR)

# $(KERNEL_DEPENDS): $(KERNEL_MKF) $(KERNEL_SRC)
	
