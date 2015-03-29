# Inherit some common flex stuff
$(call inherit-product, vendor/flex/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/xiaomi/armani/full_armani.mk)

PRODUCT_NAME := flex_armani

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
