$(call inherit-product, device/motorola/ghost/full_ghost.mk)

# Inherit some common Flex stuff.
$(call inherit-product, vendor/flex/config/common_full_phone.mk)

# Enhanced NFC
$(call inherit-product, vendor/flex/config/nfc_enhanced.mk)

PRODUCT_RELEASE_NAME := MOTO X
PRODUCT_NAME := flex_ghost

