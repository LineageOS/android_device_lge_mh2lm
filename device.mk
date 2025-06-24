#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from common tree
$(call inherit-product, device/lge/sm8150-common/sm8150.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 560dpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# Bootanimation
TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_HEIGHT := 2248

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects_tune.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects_tune.xml \
    $(LOCAL_PATH)/audio/audio_io_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_io_policy.conf \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(LOCAL_PATH)/audio/mixer_paths_tavil.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tavil.xml

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.lge

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/Vendor_1004_Product_637a.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Vendor_1004_Product_637a.kl

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_profiles_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml

# NFC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/nfc/libnfc-nxp-KR.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp-KR.conf \
    $(LOCAL_PATH)/nfc/libnfc-nxp-lg.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp-lg.conf \
    $(LOCAL_PATH)/nfc/libnfc-nxp-US.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp-US.conf

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/lge/mh2lm/mh2lm-vendor.mk)
