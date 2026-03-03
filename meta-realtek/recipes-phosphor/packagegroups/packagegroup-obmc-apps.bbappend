PACKAGES += "\
        ${PN}-system "

PROVIDES += " \
        virtual/obmc-system-mgmt \
        "

RPROVIDES:${PN}-system += "virtual-obmc-system-mgmt"

SUMMARY:${PN}-system = "Realtek System"
RDEPENDS:${PN}-system = " \
        srvcfg-manager \
        "
RDEPENDS:${PN}-chassis-state-mgmt:append = "${@bb.utils.contains_any('MACHINE', \
                                'rts4931a-escm rts4932a-escm','phosphor-state-manager-rts493xa-escm','',d)}"