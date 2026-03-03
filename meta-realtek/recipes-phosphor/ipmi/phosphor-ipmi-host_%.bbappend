DEPENDS += "realtek-rts493xa-yaml-config"

EXTRA_OEMESON += " \
    -Dsensor-yaml-gen=${STAGING_DIR_HOST}${datadir}/realtek-rts493xa-yaml-config/ipmi-sensors.yaml \
    -Dfru-yaml-gen=${STAGING_DIR_HOST}${datadir}/realtek-rts493xa-yaml-config/ipmi-fru.yaml \
    -Dget-dbus-active-software=disabled \
    "
RDEPENDS:${PN}:remove = "phosphor-watchdog"
#remove xyz.openbmc_project.Ipmi.Internal.SoftPowerOff.service
SOFT_SVC = ""
SOFT_TGTFMT = ""
SOFT_FMT =""