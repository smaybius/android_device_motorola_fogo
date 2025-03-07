#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# A/B
TARGET_IS_VAB := true

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Inherit from motorola sm7325-common
$(call inherit-product, device/motorola/sm7325-common/common.mk)

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    FILESYSTEM_TYPE_system=erofs \

AB_OTA_POSTINSTALL_CONFIG += \
    FILESYSTEM_TYPE_vendor=erofs \

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# API levels
PRODUCT_SHIPPING_API_LEVEL := 34

# ANT
PRODUCT_PACKAGES += \
    com.dsi.ant@1.0

# Audio
PRODUCT_PACKAGES += \
    libqcompostprocbundle \
    libvolumelistener

AUDIO_HAL_DIR := hardware/qcom-caf/sm8350/audio

# Battery

# Bluetooth
PRODUCT_PACKAGES += \
    libqti_vndfwk_detect \
    vendor.qti.hardware.bluetooth_audio@2.0 \
    vendor.qti.hardware.bluetooth_audio@2.1 \
    vendor.qti.hardware.btconfigstore@1.0 \
    vendor.qti.hardware.btconfigstore@2.0

# Camera
PRODUCT_PACKAGES += \
    vendor.qti.hardware.camera.postproc@1.0

# Configstore
PRODUCT_PACKAGES += \
    vendor.qti.hardware.capabilityconfigstore@1.0

# Display
PRODUCT_PACKAGES += \
    vendor.display.config@1.0 \
    vendor.display.config@1.1 \
    vendor.display.config@1.10 \
    vendor.display.config@1.11 \
    vendor.display.config@1.12 \
    vendor.display.config@1.13 \
    vendor.display.config@1.14 \
    vendor.display.config@1.15 \
    vendor.display.config@1.2 \
    vendor.display.config@1.3 \
    vendor.display.config@1.4 \
    vendor.display.config@1.5 \
    vendor.display.config@1.6 \
    vendor.display.config@1.7 \
    vendor.display.config@1.8 \
    vendor.display.config@1.9 \
    vendor.display.config@2.0 \
    vendor.qti.hardware.display.allocator-service \
    vendor.qti.hardware.display.allocator@1.0 \
    vendor.qti.hardware.display.allocator@3.0 \
    vendor.qti.hardware.display.allocator@4.0 \
    vendor.qti.hardware.display.composer@1.0 \
    vendor.qti.hardware.display.composer@2.0 \
    vendor.qti.hardware.display.composer@3.0 \
    vendor.qti.hardware.display.mapper@1.0 \
    vendor.qti.hardware.display.mapper@1.1 \
    vendor.qti.hardware.display.mapper@2.0 \
    vendor.qti.hardware.display.mapper@3.0 \
    vendor.qti.hardware.display.mapper@4.0 \
    vendor.qti.hardware.display.mapperextensions@1.0 \
    vendor.qti.hardware.display.mapperextensions@1.1 \
    vendor.qti.hardware.display.mapperextensions@1.2 \
    vendor.qti.hardware.display.mapperextensions@1.3

# Face
PRODUCT_PACKAGES += \
    libcamera2ndk_vendor

# Perf
PRODUCT_PACKAGES += \
    libqti-perfd-client \
    vendor.qti.hardware.perf@2.0 \
    vendor.qti.hardware.perf@2.1 \
    vendor.qti.hardware.perf@2.2

# Product characteristics
PRODUCT_CHARACTERISTICS := default

# Rootdir
PRODUCT_PACKAGES += \
    apanic_annotate.sh \
    apanic_copy.sh \
    apanic_save.sh \
    hardware_revisions.sh \
    init.class_main.sh \
    init.crda.sh \
    init.gbmods.sh \
    init.kernel.post_boot-blair.sh \
    init.kernel.post_boot-holi.sh \
    init.kernel.post_boot.sh \
    init.mdm.sh \
    init.mmi.block_perm.sh \
    init.mmi.boot.sh \
    init.mmi.mdlog-getlogs.sh \
    init.mmi.modules.sh \
    init.mmi.shutdown.sh \
    init.mmi.touch.sh \
    init.mmi.usb.sh \
    init.mmi.wlan-getlogs.sh \
    init.oem.fingerprint2.sh \
    init.oem.hw.sh \
    init.qcom.class_core.sh \
    init.qcom.coex.sh \
    init.qcom.early_boot.sh \
    init.qcom.efs.sync.sh \
    init.qcom.post_boot.sh \
    init.qcom.sdio.sh \
    init.qcom.sensors.sh \
    init.qcom.sh \
    init.qti.chg_policy.sh \
    init.qti.display_boot.sh \
    init.qti.early_init.sh \
    init.qti.kernel.debug-blair.sh \
    init.qti.kernel.debug-holi.sh \
    init.qti.kernel.debug.sh \
    init.qti.kernel.sh \
    init.qti.media.sh \
    init.qti.qcv.sh \
    pstore_annotate.sh \
    qca6234-service.sh \
    vendor_modprobe.sh \

PRODUCT_PACKAGES += \
    init.mmi.charge_only.rc \
    init.mmi.chipset.rc \
    init.mmi.debug.rc \
    init.mmi.diag.rc \
    init.mmi.diag_mdlog.rc \
    init.mmi.overlay.rc \
    init.mmi.rc \
    init.mmi.tcmd.rc \
    init.mmi.usb.rc \
    init.mmi.wlan.rc \
    init.qcom.factory.rc \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.qti.kernel.rc \
    init.target.rc \
    init.recovery.qcom.rc \

# Sensors
PRODUCT_PACKAGES += \
    sensors.fogo

# Service tracker
PRODUCT_PACKAGES += \
    vendor.qti.hardware.servicetracker@1.0 \
    vendor.qti.hardware.servicetracker@1.1 \
    vendor.qti.hardware.servicetracker@1.2

# Touch
PRODUCT_PACKAGES += \
    com.motorola.hardware.biometric.fingerprint@1.0 \
    vendor.lineage.touch@1.0-service.fogo

# Wifi
PRODUCT_PACKAGES += \
    hostapd \
    vendor.qti.hardware.wifi.supplicant@1.0 \
    vendor.qti.hardware.wifi.supplicant@2.0 \
    vendor.qti.hardware.wifi.supplicant@2.1 \
    vendor.qti.hardware.wifi.supplicant@2.2

# Unorganized
PRODUCT_PACKAGES += \
    libgpu_tonemapper \
    libgralloccore \
    libgrallocutils \
    libqdutils \
    libqservice \
    libsdmcore \
    libtinyxml \
    libvulkan

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    hardware/motorola \
    hardware/lineage/interfaces/power-libperfmgr \

# Inherit the proprietary files
$(call inherit-product, vendor/motorola/fogo/fogo-vendor.mk)
