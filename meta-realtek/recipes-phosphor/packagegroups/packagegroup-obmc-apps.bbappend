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
