#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# A/B
TARGET_IS_VAB := true

# Boot animation
TARGET_SCREEN_HEIGHT := 1612
TARGET_SCREEN_WIDTH := 720

# Screen
TARGET_SCREEN_DENSITY := 280

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 280dpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# API levels
PRODUCT_SHIPPING_API_LEVEL := 34

# Inherit from motorola sm7325-common
$(call inherit-product, device/motorola/sm7325-common/common.mk)

# Overlays
PRODUCT_PACKAGES += \
    FrameworksResFogo \
    LineagePlatformFogo \
    LineageSystemUIFogo \
    SettingsResFogo \
    SystemUIResFogo \
    WifiResFogo

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

# ANT
PRODUCT_PACKAGES += \
    com.dsi.ant@1.0

# Audio
PRODUCT_PACKAGES += \
    libqcompostprocbundle \
    libvolumelistener

# Face
PRODUCT_PACKAGES += \
    libcamera2ndk_vendor

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.fogo

# Lights
PRODUCT_PACKAGES += \
    android.hardware.lights-service.fogo

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service.st \
    com.android.nfc_extras \
    Tag

# Rootdir
PRODUCT_PACKAGES += \
    init.qti.display_boot.sh \

PRODUCT_PACKAGES += \
    init.qcom.usb.rc \
    init.recovery.qcom.rc \

# Sensors
PRODUCT_PACKAGES += \
    sensors.fogo

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Touch
PRODUCT_PACKAGES += \
    com.motorola.hardware.biometric.fingerprint@1.0 \
    vendor.lineage.touch@1.0-service.fogo

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/motorola/fogo/fogo-vendor.mk)
