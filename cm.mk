# Prepare for new BootAnimation
TARGET_BOOTANIMATION_NAME := vertical-240x320

# Inherit device configuration
$(call inherit-product, device/lge/p350/p350.mk)

# Include GSM stuff
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)

#include qcom opensource features
$(call inherit-product, vendor/qcom/opensource/omx/mm-core/Android.mk)
$(call inherit-product, vendor/qcom/opensource/omx/mm-video/Android.mk)

## Device identifier. This must come after all inclusions
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_DISPLAY_ID=IMM76L \
    BUILD_FINGERPRINT="lge/pecan/pecan:4.0.4/IMM76D/299849:user/release-keys" \
    PRIVATE_BUILD_DESC="pecan-user 4.0.4 IMM76D 299849 release-keys"

TARGET_NO_LIVEWALLPAPERS := true

PRODUCT_DEVICE := p350
PRODUCT_NAME := cm_p350
PRODUCT_BRAND := lge
PRODUCT_MODEL := LG-P350
PRODUCT_MANUFACTURER := lge
PRODUCT_CHARACTERISTICS := phone

# Release name and versioning
PRODUCT_RELEASE_NAME := OptimusMe
PRODUCT_VERSION_DEVICE_SPECIFIC :=

# For userdebug builds
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1
