PV = "6.6.87"
require recipes-kernel/linux-libc-headers/linux-libc-headers.inc

KBRANCH = "realtek-v6.6"

SRCREV = "be15be9c4d93bbf33ac92ccb2e8b44fda4238daa"
SRC_URI = "git://github.com/realtek-sp/linux.git;protocol=https;branch=${KBRANCH}"

LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

S = "${WORKDIR}/git"
