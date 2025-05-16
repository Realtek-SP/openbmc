PV = "6.6.87"
require recipes-kernel/linux-libc-headers/linux-libc-headers.inc

KBRANCH = "realtek-v6.6"

SRCREV = "3fdc613ac2694d3450aee93a94ecae699b0173ee"
SRC_URI = "git://github.com/realtek-sp/linux.git;protocol=https;branch=${KBRANCH}"

LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

S = "${WORKDIR}/git"
