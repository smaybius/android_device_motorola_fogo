#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
TARGET_SUPPORTS_OMX_SERVICE := false
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from fogo device
$(call inherit-product, device/motorola/fogo/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_DEVICE := fogo
PRODUCT_NAME := lineage_fogo
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g 5G - 2024
PRODUCT_MANUFACTURER := motorola

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
	BuildDesc="fogo_g-user 14 U1UFNS34.41-98-3-11 17710-d1a62 release-keys MUR1-0.252" \
	BuildFingerprint=motorola/fogo_g/fogo:14/U1UFNS34M.41-98-3-11/d1a62:user/release-keys \
	DeviceProduct=fogo_g
