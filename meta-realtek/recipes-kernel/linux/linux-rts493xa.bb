SRCREV = "${AUTOREV}"

KBRANCH = "develop/realtek-v6.6"

require linux-rts493xa.inc

do_install:append() {
	oe_runmake headers_install INSTALL_HDR_PATH=${TMPDIR}/ ARCH=$ARCH
}
