# Inherit common CM stuff
$(call inherit-product, vendor/flex/config/common.mk)

# Include CM audio files
include vendor/flex/config/cm_audio.mk

# Include CM LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/flex/overlay/dictionaries

# Optional CM packages
PRODUCT_PACKAGES += \
    Galaxy4 \
    HoloSpiralWallpaper \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    NoiseField \
    PhaseBeam \
    PhotoTable \
    SoundRecorder \
    PhotoPhase

# Extra tools in CM
PRODUCT_PACKAGES += \
    7z \
    bash \
    bzip2 \
    curl \
    powertop \
    unrar \
    unzip \
    vim \
    wget \
    zip
