# Set FLEX_BUILDTYPE from the env RELEASE_TYPE, for jenkins compat

ifndef FLEX_BUILDTYPE
    ifdef RELEASE_TYPE
        # Starting with "FLEX_" is optional
        RELEASE_TYPE := $(shell echo $(RELEASE_TYPE) | sed -e 's|^FLEX_||g')
        FLEX_BUILDTYPE := $(RELEASE_TYPE)
    endif
endif

# Filter out random types, so it'll reset to unofficial
ifeq ($(filter weekly nightly release experimental,$(FLEX_BUILDTYPE)),)
    FLEX_BUILDTYPE :=
endif

ifdef FLEX_BUILDTYPE
    ifneq ($(FLEX_BUILDTYPE), release)
        ifdef FLEX_EXTRAVERSION
            # Force build type to experimental
            FLEX_BUILDTYPE := experimental
            # Remove leading dash from FLEX_EXTRAVERSION
            FLEX_EXTRAVERSION := $(shell echo $(FLEX_EXTRAVERSION) | sed 's/-//')
            # Add leading dash to FLEX_EXTRAVERSION
            FLEX_EXTRAVERSION := -$(FLEX_EXTRAVERSION)
        endif
    else
        ifndef FLEX_EXTRAVERSION
            # Force build type to experimental, release mandates a tag
            FLEX_BUILDTYPE := experimental
        else
            # Remove leading dash from FLEX_EXTRAVERSION
            FLEX_EXTRAVERSION := $(shell echo $(FLEX_EXTRAVERSION) | sed 's/-//')
            # Add leading dash to FLEX_EXTRAVERSION
            FLEX_EXTRAVERSION := -$(FLEX_EXTRAVERSION)
        endif
    endif
else
    # If FLEX_BUILDTYPE is not defined, set to unofficial
    FLEX_BUILDTYPE := unofficial
    FLEX_EXTRAVERSION :=
endif

ifeq ($(FLEX_BUILDTYPE), unofficial)
    ifneq ($(TARGET_unofficial_BUILD_ID),)
        FLEX_EXTRAVERSION := -$(TARGET_unofficial_BUILD_ID)
    endif
endif

ifeq ($(FLEX_BUILDTYPE), RELEASE)
    ifndef TARGET_VENDOR_RELEASE_BUILD_ID
        FLEX_VERSION := flexos_$(PLATFORM_VERSION)_$(PRODUCT_VERSION_MAINTENANCE)$(PRODUCT_VERSION_DEVICE_SPECIFIC)_$(shell date -u +%Y%m%d)-$(FLEX_BUILD)
    else
        ifeq ($(TARGET_BUILD_VARIANT),user)
            FLEX_VERSION := flexos_$(PLATFORM_VERSION)_$(TARGET_VENDOR_RELEASE_BUILD_ID)_$(shell date -u +%Y%m%d)-$(FLEX_BUILD)
        else
            FLEX_VERSION := flexos_$(PLATFORM_VERSION)_$(PRODUCT_VERSION_MAINTENANCE)$(PRODUCT_VERSION_DEVICE_SPECIFIC)_$(shell date -u +%Y%m%d)-$(FLEX_BUILD)
        endif
    endif
else
    ifeq ($(PRODUCT_VERSION_MINOR),0)
        FLEX_VERSION := flexos_$(PLATFORM_VERSION)_$(shell date -u +%Y%m%d)_$(FLEX_BUILDTYPE)$(FLEX_EXTRAVERSION)_$(FLEX_BUILD)
    else
        FLEX_VERSION := flexos_$(PLATFORM_VERSION)_$(shell date -u +%Y%m%d)_$(FLEX_BUILDTYPE)$(FLEX_EXTRAVERSION)_$(FLEX_BUILD)
    endif
endif

PRODUCT_PROPERTY_OVERRIDES += \
  ro.flex.version=$(FLEX_VERSION) \
  ro.flex.releasetype=$(FLEX_BUILDTYPE) \
  ro.modversion=$(FLEX_VERSION)

-include vendor/flex-priv/keys/keys.mk

FLEX_DISPLAY_VERSION := $(FLEX_VERSION)

# CM Version
-include vendor/flex/config/cm_version.mk
