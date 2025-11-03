SOC_FAMILY = "realtek-rts493xa"
include conf/machine/include/soc-family.inc

require conf/machine/include/arm/armv7a/tune-cortexa7.inc

PREFERRED_PROVIDER_virtual/kernel ?= "linux-rts493xa"
PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-rts493xa"
PREFERRED_PROVIDER_linux ?= "linux-rts493xa"
PREFERRED_PROVIDER_u-boot ?= "u-boot-rts493xa"
PREFERRED_PROVIDER_u-boot-fw-utils ?= "u-boot-fw-rts493xa"
PREFERRED_PROVIDER_virtual/obmc-host-ipmi-hw = "phosphor-ipmi-ssif"

KERNEL_IMAGETYPES += " fitImage "
KERNEL_CLASSES = " kernel-fitimage"
UBOOT_LOADADDRESS := "0x81000000"
UBOOT_ENTRYPOINT := "0x81000000"
UBOOT_DTB_LOADADDRESS := "0x82400000"

MACHINE_FEATURES += "hw-rng"
MACHINEOVERRIDES =. "realtek:"
SERIAL_CONSOLES ?= "57600;ttyS1"

IMAGE_FSTYPES = "mtd-static mtd-static-tar mtd-static-alltar"
INITRAMFS_IMAGE = "obmc-phosphor-initramfs"
INITRAMFS_CTYPE ?= "gz"
INITRAMFS_FSTYPES = "cpio.${INITRAMFS_CTYPE}"

PHOSPHOR_MRW_LICENSE = "Apache-2.0"
PHOSPHOR_MRW_LIC_FILES_CHKSUM = "file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
PHOSPHOR_MRW_URI = "git://github.com/open-power/romulus-xml;branch=master;protocol=https"
PHOSPHOR_MRW_REV = "14b471fbf37f5fb60261de001df83caf5f96d81f"

VIRTUAL-RUNTIME_obmc-inventory-manager = "entity-manager"
VIRTUAL-RUNTIME_obmc-sensors-hwmon = "dbus-sensors"

OBMC_COMPATIBLE_NAMES = "com.realtek.Hardware.BMC.Model.rts493xa"

# Fixed partition offsets
FLASH_UBOOT_OFFSET ?= "0"

# 128MB Flash partition offsets
FLASH_MANIFEST_OFFSET:flash-131072 = "888"
FLASH_UBOOT_ENV_OFFSET:flash-131072 = "768"
FLASH_KERNEL_OFFSET:flash-131072 = "1024"
FLASH_ROFS_OFFSET:flash-131072 = "5376"
FLASH_RWFS_OFFSET:flash-131072 = "98560"

# 256MB Flash partition offsets
FLASH_MANIFEST_OFFSET:flash-262144 = "1776"
FLASH_UBOOT_ENV_OFFSET:flash-262144 = "1536"
FLASH_KERNEL_OFFSET:flash-262144 = "2048"
FLASH_ROFS_OFFSET:flash-262144 = "10752"
FLASH_RWFS_OFFSET:flash-262144 = "197120"
