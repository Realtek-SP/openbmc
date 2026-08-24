USERADD_PACKAGES:remove = "udev"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " \
    file://99-journald.conf \
"

do_install:append() {
    install -m 644 -D \
        ${UNPACKDIR}/99-journald.conf \
        ${D}${systemd_unitdir}/journald.conf.d/99-journald.conf
}
