ifneq ($(KERNELRELEASE),)

# kbuild part of makefile
obj-m += lirc_bbb.o

else

# normal makefile
KDIR ?= /lib/modules/`uname -r`/build

build:
	$(MAKE) -C $(KDIR) M=$$PWD

install:
	$(MAKE) -C $(KDIR) M=$$PWD INSTALL_MOD_DIR=kernel/drivers/staging/media/lirc modules_install
	depmod -A

clean:
	$(MAKE) -C $(KDIR) M=$$PWD clean

# Module specific targets
unload:
	modprobe -r lirc-bbb

load:
	modprobe lirc-bbb gpio_in_pin=66

reload: build install unload load
	@echo Reloaded.
	@dmesg | tail -10

prepare: scripts

scripts:
	$(MAKE) -C $(KDIR) scripts

endif
