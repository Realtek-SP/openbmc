FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:firmware-stream-update = " \
    file://0001-feat-support-pre-extracted-directory-path.patch \
"