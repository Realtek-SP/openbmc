FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
SRC_URI:append:evb-rts4930a = " \
                   file://evb-rts4930a.json \
                   file://blacklist.json \
                   file://fru.bin \
                 "

do_install:append:evb-rts4930a() {
     rm -f ${D}${datadir}/entity-manager/configurations/*.json
     install -d ${D}${datadir}/entity-manager/configurations
     install -m 0444 ${UNPACKDIR}/evb-rts4930a.json ${D}/usr/share/entity-manager/configurations
     install -D ${UNPACKDIR}/blacklist.json ${D}${datadir}/${BPN}/blacklist.json
     install -m 0444 ${UNPACKDIR}/fru.bin ${D}${datadir}/entity-manager/configurations
}
