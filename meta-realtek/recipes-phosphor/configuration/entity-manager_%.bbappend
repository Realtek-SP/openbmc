FILESEXTRAPATHS:prepend:rts4931a-evb := "${THISDIR}/${PN}/evb:"
FILESEXTRAPATHS:prepend:rts4932a-evb := "${THISDIR}/${PN}/evb:"
FILESEXTRAPATHS:prepend:rts4931a-escm := "${THISDIR}/${PN}/escm:"
FILESEXTRAPATHS:prepend:rts4932a-escm := "${THISDIR}/${PN}/escm:"
SRC_URI += " \
    file://realtek-rts493xa.json \
    file://blacklist.json \
    file://fru.bin \
"

do_install:append() {
     rm -f ${D}${datadir}/entity-manager/configurations/*.json
     install -d ${D}${datadir}/entity-manager/configurations
     install -m 0444 ${UNPACKDIR}/realtek-rts493xa.json ${D}/usr/share/entity-manager/configurations
     install -D ${UNPACKDIR}/blacklist.json ${D}${datadir}/${BPN}/blacklist.json
     install -m 0444 ${UNPACKDIR}/fru.bin ${D}${datadir}/entity-manager/configurations
}
