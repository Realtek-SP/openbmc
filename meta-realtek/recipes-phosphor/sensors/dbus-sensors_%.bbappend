PACKAGECONFIG = " \
    hwmontempsensor \
    "
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-change-dbus-sensor-disable-io_uring-for-dbus-sensors.patch"
