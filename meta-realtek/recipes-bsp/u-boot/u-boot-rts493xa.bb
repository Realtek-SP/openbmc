require u-boot-common-rts493xa.inc
require u-boot-rts493xa.inc

SRC_URI:append:rts4931a-escm = " file://modify_escm_env_offset.cfg"
SRC_URI:append:rts4932a-evb = " file://enable_2Gbit_support.cfg"
SRC_URI:append:rts4932a-escm = " file://modify_escm_env_offset.cfg \
                                 file://enable_2Gbit_support.cfg \
                               "
