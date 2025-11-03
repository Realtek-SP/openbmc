SUMMARY = "YAML configuration for realtek rts493xa"
PR = "r1"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"

inherit allarch

SRC_URI = " \
    file://ipmi-sensors.yaml \
    file://ipmi-fru.yaml \
    "

S = "${WORKDIR}/sources"
UNPACKDIR = "${S}"

do_install() {
    # cat romulus-ipmi-fru.yaml romulus-ipmi-fru-bmc.yaml > fru-read.yaml

    # install -m 0644 -D romulus-ipmi-inventory-sensors.yaml \
    #     ${D}${datadir}/${BPN}/ipmi-inventory-sensors.yaml
    install -m 0644 -D ipmi-sensors.yaml \
        ${D}${datadir}/${BPN}/ipmi-sensors.yaml
    install -m 0644 -D ipmi-fru.yaml \
        ${D}${datadir}/${BPN}/ipmi-fru.yaml
}

FILES:${PN}-dev = " \
    ${datadir}/${BPN}/ipmi-sensors.yaml \
    ${datadir}/${BPN}/ipmi-fru.yaml \
    "

ALLOW_EMPTY:${PN} = "1"
