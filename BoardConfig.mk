#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/lge/mh2lm

# inherit from common tree
-include device/lge/sm8150-common/BoardConfigCommon.mk

# Platform
SOONG_CONFIG_NAMESPACES += LGE_LIGHTS_HAL
SOONG_CONFIG_LGE_LIGHTS_HAL := INCLUDE_DIR
SOONG_CONFIG_LGE_LIGHTS_HAL_INCLUDE_DIR := $(DEVICE_PATH)/include

# Display
TARGET_SCREEN_DENSITY := 401

# HIDL
ODM_MANIFEST_FILES += $(DEVICE_PATH)/manifest_odm.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/framework_compatibility_matrix.xml

# Kernel
TARGET_KERNEL_CONFIG := vendor/lineageos_mh2_defconfig

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 90

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# inherit from the proprietary version
-include vendor/lge/mh2lm/BoardConfigVendor.mk
