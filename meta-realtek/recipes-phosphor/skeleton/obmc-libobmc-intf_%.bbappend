FILESEXTRAPATHS:prepend:rts4931a-escm := "${THISDIR}/${PN}/rts493xa-escm:"
FILESEXTRAPATHS:prepend:rts4932a-escm := "${THISDIR}/${PN}/rts493xa-escm:"
FILES_ESCM = " \
        file://0001-change-change-gpiochip-number.patch;patchdir=.. \
        "
SRC_URI:append = "${@bb.utils.contains_any('MACHINE', \
                                'rts4931a-escm rts4932a-escm', \
                                '${FILES_ESCM}','', \
                                d)}"

# ERROR_QA:remove = "license-checksum"

