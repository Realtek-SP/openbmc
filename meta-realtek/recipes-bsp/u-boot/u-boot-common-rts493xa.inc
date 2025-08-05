SUMMARY = "Universal Boot Loader for embedded devices"
SECTION = "bootloaders"
DEPENDS += "flex-native bison-native python3-setuptools-native"

LICENSE = "GPL-2.0-or-later"

LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"

SRCREV = "${AUTOREV}"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI = "git://rssi-git.rtkbf.com:29418/bmc/sdk/u-boot;protocol=ssh;branch=develop/realtek-v2023.01 \
           file://${UBOOT_MACHINE}"

S = "${WORKDIR}/git"
B = "${WORKDIR}/build"

inherit pkgconfig

do_configure[cleandirs] = "${B}"

UBOOT_INITIAL_ENV = ""
