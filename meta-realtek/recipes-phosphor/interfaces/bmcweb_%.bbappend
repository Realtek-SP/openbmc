FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

EXTRA_OEMESON:append:firmware-stream-update = " \
    -Dfirmware-stream-update=enabled \
"

SRC_URI:append:firmware-stream-update = " \
    file://0001-feat-Add-zero-copy-streaming-extraction-for-firmware.patch \
"