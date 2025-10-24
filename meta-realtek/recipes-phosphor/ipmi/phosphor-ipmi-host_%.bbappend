DEPENDS:append:evb-rts4930a = " evb-rts4930a-yaml-config"

EXTRA_OEMESON:evb-rts4930a = " \
    -Dsensor-yaml-gen=${STAGING_DIR_HOST}${datadir}/evb-rts4930a-yaml-config/ipmi-sensors.yaml \
    -Dfru-yaml-gen=${STAGING_DIR_HOST}${datadir}/evb-rts4930a-yaml-config/ipmi-fru.yaml \
    -Dget-dbus-active-software=disabled \
    "