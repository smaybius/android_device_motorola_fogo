#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

BOARD_VENDOR := motorola

DEVICE_PATH := device/motorola/fogo
BUILD_BROKEN_DUP_RULES := true

# Inherit from motorola sm7325-common
include device/motorola/sm7325-common/BoardConfigCommon.mk

# Architecture
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_VARIANT_RUNTIME := kryo300

TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a75

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := holi

# Display
TARGET_SCREEN_DENSITY := 280

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/device_framework_matrix.xml hardware/qcom-caf/common/vendor_framework_compatibility_matrix.xml vendor/lineage/config/device_framework_matrix.xml
# via product/etc/vintf in the dump
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/device_vendor_matrix.xml hardware/qcom-caf/common/compatibility_matrix.xml
    
# via vendor/etc/vintf in the dump
ODM_MANIFEST_FILES := $(DEVICE_PATH)/manifest_dn.xml $(DEVICE_PATH)/manifest_n.xml
# via odm/etc/vintf in the dump

# Kernel
BOARD_KERNEL_CMDLINE += androidboot.hab.product=fogo
TARGET_KERNEL_CONFIG := fogo_defconfig
TARGET_KERNEL_SOURCE := kernel/motorola/sm4375

# Kernel Modules
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load))
BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE := $(DEVICE_PATH)/modules.blocklist
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load.recovery))
BOOT_KERNEL_MODULES := $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD)

# Partitions
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

# Platform
TARGET_BOARD_PLATFORM := holi

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/system_ext.prop
TARGET_SYSTEM_DLKM_PROP += $(DEVICE_PATH)/system_dlkm.prop
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# Security patch level
VENDOR_SECURITY_PATCH := 2024-12-01

# Verified Boot
BOARD_AVB_VENDOR_BOOT_ROLLBACK_INDEX := 1
BOARD_AVB_VENDOR_BOOT_ROLLBACK_INDEX_LOCATION := 1

# Inherit the proprietary files
include vendor/motorola/fogo/BoardConfigVendor.mk
