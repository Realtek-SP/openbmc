SUMMARY = "YAML configuration for realtek rts493xa"
PR = "r1"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"

inherit allarch

FILESEXTRAPATHS:prepend:rts4931a-evb := "${THISDIR}/${PN}/evb:"
FILESEXTRAPATHS:prepend:rts4932a-evb := "${THISDIR}/${PN}/evb:"
FILESEXTRAPATHS:prepend:rts4931a-escm := "${THISDIR}/${PN}/escm:"
FILESEXTRAPATHS:prepend:rts4932a-escm := "${THISDIR}/${PN}/escm:"


SRC_URI:append = " \
            file://ipmi-sensors.yaml \
            file://ipmi-fru.yaml \
    "

S = "${WORKDIR}/sources"
UNPACKDIR = "${S}"

do_install() {

    install -m 0644 -D ${UNPACKDIR}/ipmi-sensors.yaml \
            ${D}${datadir}/${BPN}/ipmi-sensors.yaml

    install -m 0644 -D ${UNPACKDIR}/ipmi-fru.yaml \
        ${D}${datadir}/${BPN}/ipmi-fru.yaml
}

FILES:${PN}-dev = " \
    ${datadir}/${BPN}/ipmi-fru.yaml \
    ${datadir}/${BPN}/ipmi-sensors.yaml \
    "

ALLOW_EMPTY:${PN} = "1"
