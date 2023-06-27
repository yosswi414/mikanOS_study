BASE = /home/yosswi414/mikanOS
LOADER = $(BASE)/edk2/Build/MikanLoaderX64/DEBUG_CLANG38/X64/Loader.efi
LOADER_SRC = $(BASE)/workspace/mikanos/MikanLoaderPkg/Main.c
KERNEL_DIR = $(BASE)/workspace/mikanos/kernel
KERNEL_SRC = $(wildcard $(KERNEL_DIR)/*.cpp $(KERNEL_DIR)/*.hpp)
KERNEL = $(KERNEL_DIR)/kernel.elf
KERNEL_MKF = $(KERNEL_DIR)/Makefile
# KERNEL_OBJS = main.o graphics.o font.o newlib_support.o console.o pci.o asmfunc.o logger.o usb/xhci/xhci.hpp
# KERNEL_DEPENDS = $(addprefix $(dir $(KERNEL)),$(notdir $(KERNEL_OBJS)))
KERNEL_DEPENDS = $(subst .cpp,.o,$(wildcard $(KERNEL_DIR)/*.cpp))

QEMU = $(BASE)/osbook/devenv/run_qemu.sh
MAKEFS = Makefile $(KERNEL_MKF)

SHELL := /bin/bash

# OLD_SHELL := $(SHELL)
# SHELL = $(warning [Making: $@]   [Dependencies: $^]   [Changed: $?])$(OLD_SHELL)

.PHONY: run test clean

.DEFAULT_GOAL := run

test:
	@echo KERNEL_DEPENDS: $(KERNEL_DEPENDS)

run: $(LOADER) $(KERNEL) $(KERNEL_DEPENDS) $(KERNEL_SRC)
	$(QEMU) $(LOADER) $(KERNEL)

clean:
	rm -f $(KERNEL_DEPENDS) $(KERNEL)

$(LOADER): $(LOADER_SRC) $(MAKEFS)
	cd $(BASE)/edk2; . ./edksetup.sh; build
	touch $@

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
$(KERNEL): $(KERNEL_DEPENDS) $(MAKEFS) $(KERNEL_SRC)

$(KERNEL_DEPENDS): $(MAKEFS) $(KERNEL_SRC)
	make -C $(dir $@)
