FILESEXTRAPATHS:prepend:rts4931a-escm:= "${THISDIR}/files/rts493xa-escm:"
FILESEXTRAPATHS:prepend:rts4932a-escm:= "${THISDIR}/files/rts493xa-escm:"

FILES_ESCM = " \
        file://host-control \
        file://rts493xa-escm-init-state.service \
    "
SRC_URI:append:rts4931a-escm = "${FILES_ESCM}"
SRC_URI:append:rts4932a-escm = "${FILES_ESCM}"

RDEPENDS:${PN}-rts493xa-escm:append = " bash"

DBUS_PACKAGES:append = "${@bb.utils.contains_any('MACHINE', \
                                'rts4931a-escm rts4932a-escm','${PN}-rts493xa-escm','',d)}"
PACKAGE_BEFORE_PN:append = "${@bb.utils.contains_any('MACHINE', \
                                'rts4931a-escm rts4932a-escm','${PN}-rts493xa-escm','',d)}"
SYSTEMD_PACKAGES:append = "${@bb.utils.contains_any('MACHINE', \
                                'rts4931a-escm rts4932a-escm','${PN}-rts493xa-escm','',d)}"

SYSTEMD_SERVICE:${PN}-rts493xa-escm += "rts493xa-escm-init-state.service"

#diable host watchdog, not support it for now
HOST_ERROR_TARGETS = ""
#disable depends for fan control
FAN_LINK_FMT = ""
SYSTEMD_SERVICE:${PN}-obmc-targets:remove = " \
        obmc-fans-ready.target \
        obmc-fan-control.target \
        obmc-fan-control-ready@.target \
        obmc-fan-watchdog-takeover.target \
        "

do_install:append() {
    rm -f ${D}${systemd_system_unitdir}/obmc-fan*.target

    if [ "${MACHINE}" = "rts4931a-escm" ] || [ "${MACHINE}" = "rts4932a-escm" ];then
        install -d ${D}${systemd_system_unitdir}
        install -m 0644 ${UNPACKDIR}/rts493xa-escm-init-state.service ${D}${systemd_system_unitdir}/

        install -d ${D}${sbindir}
        install -m 0744 ${UNPACKDIR}/host-control ${D}${sbindir}/
    fi
}

FILES:${PN}-rts493xa-escm += "${systemd_system_unitdir}/rts493xa-escm-init-state.service ${sbindir}/host-control"
