require u-boot-common-rts493xa.inc

SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
DEPENDS += "mtd-utils"

PROVIDES += "u-boot-fw-utils"
RPROVIDES:${PN} += "u-boot-fw-utils"
SRC_URI += " file://fw_env_rts493xa.config"

ENV_CONFIG_FILE = "fw_env_rts493xa.config"

INSANE_SKIP:${PN} = "already-stripped"
EXTRA_OEMAKE:class-target = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" V=1'
EXTRA_OEMAKE:class-cross = 'HOSTCC="${CC} ${CFLAGS} ${LDFLAGS}" V=1'

inherit uboot-config

do_compile() {
    cp ${UNPACKDIR}/${UBOOT_MACHINE} ${S}/configs
    cp -r ${S}/* ${B}/
    oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE}
    oe_runmake envtools
}

do_install() {
    install -d ${D}${base_sbindir}
    install -m 755 ${B}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
    ln -sf fw_printenv ${D}${base_sbindir}/fw_setenv

    install -d ${D}${sysconfdir}
    install -m 644 ${UNPACKDIR}/${ENV_CONFIG_FILE} ${D}${sysconfdir}/fw_env.config
}

do_install:class-cross() {
    install -d ${D}${bindir_cross}
    install -m 755 ${B}/tools/env/fw_printenv ${D}${bindir_cross}/fw_printenv
    ln -sf fw_printenv ${D}${bindir_cross}/fw_setenv
}

SYSROOT_DIRS:append:class-cross = " ${bindir_cross}"

PACKAGE_ARCH = "${MACHINE_ARCH}"
BBCLASSEXTEND = "cross"
