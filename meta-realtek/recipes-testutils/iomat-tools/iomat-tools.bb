SUMMARY = "Set of tools for iomatrix"
DESCRIPTION = "IOMatrix tools"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

inherit meson

SRC_URI = "git://github.com/realtek-sp/iomat-tools.git;protocol=https;branch=${BRANCH}"

BRANCH = "master"
SRCREV = "${AUTOREV}"

S = "${WORKDIR}/git"

FILES_${PN} = "${bindir}/"
