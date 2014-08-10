# Boot Animation
TARGET_SCREEN_HEIGHT := 320
TARGET_SCREEN_WIDTH := 240

# Inherit device configuration
$(call inherit-product, device/lge/hazel/hazel.mk)

# Include GSM stuff
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common cm stuff.
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)
$(call inherit-product, vendor/cm/config/mini.mk)

## Device identifier. This must come after all inclusions
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_DISPLAY_ID=JDQ39E \
    BUILD_FINGERPRINT="lge/hazel/hazel:4.2.2/JDQ39E/20111018:user/release-keys" \
    PRIVATE_BUILD_DESC="hazel-user 4.2.2 JDQ39E 20111018 release-keys"

PRODUCT_DEVICE := hazel
PRODUCT_NAME := cm_hazel
PRODUCT_BRAND := lge
PRODUCT_MODEL := LG-C550
PRODUCT_MANUFACTURER := LGE
PRODUCT_CHARACTERISTICS := phone

# Release name and versioning
PRODUCT_RELEASE_NAME := OptimusChat
PRODUCT_VERSION_DEVICE_SPECIFIC :=

# Development settings
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.debuggable=1 \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.allow.mock.location=0

