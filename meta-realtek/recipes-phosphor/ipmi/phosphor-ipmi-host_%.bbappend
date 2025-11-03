DEPENDS += "realtek-rts493xa-yaml-config"

EXTRA_OEMESON += " \
    -Dsensor-yaml-gen=${STAGING_DIR_HOST}${datadir}/realtek-rts493xa-yaml-config/ipmi-sensors.yaml \
    -Dfru-yaml-gen=${STAGING_DIR_HOST}${datadir}/realtek-rts493xa-yaml-config/ipmi-fru.yaml \
    -Dget-dbus-active-software=disabled \
    "
