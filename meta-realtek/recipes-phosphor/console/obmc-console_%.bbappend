FILESEXTRAPATHS:prepend:rts4931a-escm := "${THISDIR}/${PN}/escm:"
FILESEXTRAPATHS:prepend:rts4932a-escm := "${THISDIR}/${PN}/escm:"
FILESEXTRAPATHS:prepend:rts4931a-evb := "${THISDIR}/${PN}/evb:"
FILESEXTRAPATHS:prepend:rts4932a-evb := "${THISDIR}/${PN}/evb:"
SRC_URI:append = "\
        file://./ \
    "
do_install:append() {
    install -m 0755 -d ${D}${sysconfdir}/${BPN}
    rm -f ${D}${sysconfdir}/${BPN}/server.ttyVUART0.conf
    rm -f ${D}${sysconfdir}/${BPN}.conf
    install -m 0644 ${UNPACKDIR}/*.conf ${D}${sysconfdir}/${BPN}

    install -d ${D}/${nonarch_base_libdir}/udev/rules.d
    rm -f ${D}/${nonarch_base_libdir}/udev/rules.d/80-obmc-console-uart.rules
    install -m 0644 ${UNPACKDIR}/80-realtek-console-uart.rules ${D}/${nonarch_base_libdir}/udev/rules.d


    install -d ${D}${systemd_system_unitdir}
    install -m 0755 ${UNPACKDIR}/use-socket.conf.in -D ${D}${systemd_system_unitdir}/obmc-console-ssh@.service.d/use-socket.conf
}