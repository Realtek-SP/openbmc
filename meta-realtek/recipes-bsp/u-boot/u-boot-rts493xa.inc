PROVIDES = "virtual/bootloader"
PROVIDES += "u-boot"

PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit uboot-config uboot-extlinux-config uboot-sign deploy python3native kernel-arch cml1

DEPENDS += "swig-native kern-tools-native rsync-native"

EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=1'
EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
EXTRA_OEMAKE += 'STAGING_INCDIR=${STAGING_INCDIR_NATIVE} STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE}'
EXTRA_OEMAKE += "KCFLAGS='-Wno-int-conversion -Wno-implicit-function-declaration'"

PACKAGECONFIG ??= "openssl"
# u-boot will compile its own tools during the build, with specific
# configurations (aka when CONFIG_FIT_SIGNATURE is enabled) openssl is needed as
# a host build dependency.
PACKAGECONFIG[openssl] = ",,openssl-native"

# Allow setting an additional version string that will be picked up by the
# u-boot build system and appended to the u-boot version.  If the .scmversion
# file already exists it will not be overwritten.
UBOOT_LOCALVERSION ?= ""

do_configure () {
    cp ${UNPACKDIR}/${UBOOT_MACHINE} ${S}/configs
    rsync -au --chmod=u=rwX,go=rX  --exclude .svn --exclude .git --exclude .hg --exclude .bzr --exclude CVS ${S}/ ${B}

    if [ -z "${UBOOT_CONFIG}" ]; then
        if [ -n "${UBOOT_MACHINE}" ]; then
            oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE}
        else
            oe_runmake -C ${S} O=${B} oldconfig
        fi
        merge_config.sh -m .config ${@" ".join(find_cfgs(d))}
        cml1_do_configure
    fi
}

do_savedefconfig() {
	bbplain "Saving defconfig to:\n${B}/defconfig"
	oe_runmake -C ${B} savedefconfig
}
do_savedefconfig[nostamp] = "1"
addtask savedefconfig after do_configure

UBOOT_ARCH_DIR = "${@'arm' if d.getVar('UBOOT_ARCH').startswith('arm') else d.getVar('UBOOT_ARCH')}"

do_compile:prepend() {
    unset SOURCE_DATE_EPOCH
}

do_compile() {
    rsync -au --chmod=u=rwX,go=rX  --exclude .svn --exclude .git --exclude .hg --exclude .bzr --exclude CVS ${S}/ ${B}
    oe_runmake -C ${B}
}

do_install() {
    install -D -m 644 ${B}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
    ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
}

SYSROOT_DIRS += "/boot"
FILES:${PN} = "/boot ${datadir}"

PACKAGE_BEFORE_PN += "${PN}-env"

RPROVIDES:${PN}-env += "u-boot-default-env"
ALLOW_EMPTY:${PN}-env = "1"
FILES:${PN}-env = "${sysconfdir}/fw_env.config"

do_deploy(){
    install -D -m 644 ${B}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
    cd ${DEPLOYDIR}
    rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
    ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
    ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
}

addtask deploy before do_build after do_compile
