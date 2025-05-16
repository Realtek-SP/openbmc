SUMMARY = "Update Mac/IP Address"
PR = "r1"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"

DEPENDS += "systemd"
RDEPENDS:${PN} += "bash"

inherit systemd

SRC_URI = " file://update_network.service \
            file://update_network.sh \
          "

S = "${WORKDIR}/sources"
UNPACKDIR = "${S}"

do_install() {
    install -d ${D}${systemd_system_unitdir}/
    install -m 0644 ${UNPACKDIR}/update_network.service ${D}${systemd_system_unitdir}/

    install -d ${D}/${sbindir}
    install -m 755 ${UNPACKDIR}/update_network.sh ${D}/${sbindir}
}

SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE:${PN} = "update_network.service"
