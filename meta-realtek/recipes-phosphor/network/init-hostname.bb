SUMMARY = "Init BMC HostName"
PR = "r1"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"

DEPENDS += "systemd"
RDEPENDS:${PN} += "bash"

inherit systemd

SRC_URI = " file://init-hostname.service \
            file://init-hostname.sh \
          "

do_install() {
    install -d ${D}${systemd_system_unitdir}/
    install -m 0644 ${UNPACKDIR}/init-hostname.service ${D}${systemd_system_unitdir}/

    install -d ${D}/${bindir}
    install -m 755 ${UNPACKDIR}/init-hostname.sh ${D}/${bindir}
}

SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE:${PN} = "init-hostname.service"
