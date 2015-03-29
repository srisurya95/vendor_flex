# Enhanced NFC
$(call inherit-product, vendor/flex/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/flex/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/sony/nicki/nicki.mk)

TARGET_SCREEN_HEIGHT := 854
TARGET_SCREEN_WIDTH := 480

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := nicki
PRODUCT_NAME := flex_nicki
PRODUCT_BRAND := Sony
PRODUCT_MODEL := nicki
PRODUCT_MANUFACTURER := Sony
PRODUCT_CHARACTERISTICS := phone

# Release name
PRODUCT_RELEASE_NAME := Xperia M
