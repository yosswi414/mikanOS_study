BASE = ~/mikanOS
LOADER = $(BASE)/edk2/Build/MikanLoaderX64/DEBUG_CLANG38/X64/Loader.efi
KERNEL = $(BASE)/workspace/mikanos/kernel/kernel.elf
QEMU = $(BASE)/osbook/devenv/run_qemu.sh

SHELL := /bin/bash

.PHONY: run

.DEFAULT_GOAL := run

run: $(LOADER) $(KERNEL) Makefile
	$(QEMU) $(LOADER) $(KERNEL)

$(LOADER): Makefile
	cd $(BASE)/edk2; . ./edksetup.sh; build

BASEDIR="$(BASE)/osbook/devenv/x86_64-elf"
EDK2DIR="$(BASE)/edk2"
CPPFLAGS="\
    -I$(BASEDIR)/include/c++/v1 -I$(BASEDIR)/include -I$(BASEDIR)/include/freetype2 \
    -I$(EDK2DIR)/MdePkg/Include -I$(EDK2DIR)/MdePkg/Include/X64 \
    -nostdlibinc -D__ELF__ -D_LDBL_EQ_DBL -D_GNU_SOURCE -D_POSIX_TIMERS \
    -DEFIAPI='__attribute__((ms_abi))'"
LDFLAGS="-L$(BASEDIR)/lib"

export CPPFLAGS
export LDFLAGS
$(KERNEL): Makefile
	. $(BASE)/osbook/devenv/buildenv.sh; make -C $(dir $@)

