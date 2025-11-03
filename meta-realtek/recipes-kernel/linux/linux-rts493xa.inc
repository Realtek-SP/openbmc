SUMMARY = "Linux kernel"
PROVIDES += "linux"

LINUX_VERSION = "6.6.87"
KCONFIG_MODE = "--alldefconfig"

LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

FILESPATH:prepend := "${THISDIR}/files/common:"
FILESEXTRAPATHS:prepend:rts4931a-escm := "${THISDIR}/files/escm:"
FILESEXTRAPATHS:prepend:rts4932a-escm := "${THISDIR}/files/escm:"

EVB_COMMON_CFGS = " file://enable_lm75.cfg \
                    file://enable_at24.cfg \
                    file://enable_bmc_ssif.cfg \
                  "

ESCM_EXTRA_CFGS = " file://disable_sd_usbdev.cfg \
                    file://enable_ftdi_sio.cfg \
                  "

SRC_URI = "git://github.com/realtek-sp/linux.git;protocol=https;branch=${KBRANCH} \
           file://defconfig \
           "

SRC_URI:append:rts4931a-evb = "${EVB_COMMON_CFGS}"
SRC_URI:append:rts4932a-evb = "${EVB_COMMON_CFGS}"
SRC_URI:append:rts4931a-escm = "${EVB_COMMON_CFGS}"
SRC_URI:append:rts4932a-escm = "${EVB_COMMON_CFGS}"

SRC_URI:append:rts4931a-escm = "${ESCM_EXTRA_CFGS}"
SRC_URI:append:rts4932a-escm = "${ESCM_EXTRA_CFGS}"

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
