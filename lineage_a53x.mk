#
# Copyright (C) 2020-2024 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

## Inherit from generic products, most specific first
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)

## Inherit from gta4xls device
$(call inherit-product, device/samsung/a53x/device.mk)

## Boot Animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080
TARGET_BOOT_ANIMATION_RES := 1080

## Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

## Device identifier, this must come after all inclusions
PRODUCT_DEVICE := a53x
PRODUCT_NAME := lineage_a53x
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A536B
PRODUCT_MANUFACTURER := samsung
PRODUCT_SHIPPING_API_LEVEL := 34

# Sign
-include vendor/lineage-priv/keys/keys.mk

# Some flags
# RisingOS (6.x)
PRODUCT_BUILD_PROP_OVERRIDES += \
    RisingChipset="Exynos 1280" \
    RisingMaintainer="Ksawlii <3"

# Global
TARGET_ENABLE_BLUR := true
PRODUCT_NO_CAMERA := false
TARGET_INCLUDE_PIXEL_CHARGER := true
EXTRA_UDFPS_ANIMATIONS := true
TARGET_HAS_FOD := true
TARGET_HAS_UDFPS := true
DERP_VERSION_APPEND_TIME_OF_DAY := true
TARGET_SUPPORTS_QUICK_TAP := true


# Gapps
# WITH_GMS := true
# TARGET_CORE_GMS := true

# PRODUCT_PACKAGES += \
#    Photos \
#    MarkupGoogle \
#    LatinIMEGooglePrebuilt \
#    AiWallpapers \
#    WallpaperEmojiPrebuilt \
#    PrebuiltDeskClockGoogle \
#    CalculatorGooglePrebuilt \
#    CalendarGooglePrebuilt \
#    Velvet
# TARGET_CORE_GMS_EXTRAS := true/false
# TARGET_DEFAULT_PIXEL_LAUNCHER := true

PRODUCT_GMS_CLIENTID_BASE := android-samsung
