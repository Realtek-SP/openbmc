SUMMARY = "Linux kernel"
PROVIDES += "linux"

LINUX_VERSION = "6.6.87"
KCONFIG_MODE = "--alldefconfig"

LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

FILESEXTRAPATHS:prepend:evb-rts4930a := "${THISDIR}/files/evb-rts4930a:"

SRC_URI = "git://github.com/realtek-sp/linux.git;protocol=https;branch=${KBRANCH} \
           file://defconfig \
           "

SRC_URI:append:evb-rts4930a = " file://enable_lm75.cfg \
                              file://enable_at24.cfg \
                              "
#not for AUTOREV
#LINUX_VERSION_EXTENSION ?= "-${SRCREV}"

PV = "${LINUX_VERSION}+git${SRCPV}"

inherit kernel
require recipes-kernel/linux/linux-yocto.inc

python() {
  # OpenBMC loads in kernel features via other mechanisms so this check in the kernel-yocto.bbclass is not required
  d.setVar("KERNEL_DANGLING_FEATURES_WARN_ONLY","1")
}

DEPENDS += "rsync-native "
KERNEL_EXTRA_ARGS += "KCFLAGS='-Wno-int-conversion'"
