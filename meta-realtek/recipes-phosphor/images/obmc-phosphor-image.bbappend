DEPENDS += "virtual/bootloader"
OBMC_IMAGE_EXTRA_INSTALL:append = " \
    kernel-modules \
    update-network \
    nfs-utils \
    phosphor-skeleton-control-power \
    phosphor-state-manager \
    phosphor-sel-logger \
    phosphor-post-code-manager \
    phosphor-host-postd \
    phosphor-hostlogger \
    virtual-obmc-host-ipmi-hw \
    net-tools \
    strace \
"
#autologin for debug
IMAGE_FEATURES += "empty-root-password serial-autologin-root allow-root-login allow-empty-password"
IMAGE_FEATURES:remove = "\
    obmc-ikvm \
    obmc-leds \
"
ROOTFS_POSTPROCESS_COMMAND += "reconfig_getty_service"

reconfig_getty_service () {

    if [ -e ${IMAGE_ROOTFS}${systemd_system_unitdir}/serial-getty@.service ]; then
        sed -i "/^\s*ExecStart\b/ s/ -o '-- \\\\\\\\u'//" \
            "${IMAGE_ROOTFS}${systemd_system_unitdir}/serial-getty@.service"
    fi
}
