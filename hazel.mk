# Inherit from those products. Most specific first
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, device/common/gps/gps_us_supl.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony.mk)

$(call inherit-product-if-exists, vendor/lge/hazel/hazel-vendor.mk)
$(call inherit-product-if-exists, vendor/lge/msm7x27-common/msm7x27-common-vendor-blobs.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/hazel/overlay
DEVICE_PACKAGE_OVERLAYS += device/lge/hazel/blank-overlay


PRODUCT_AAPT_CONFIG := normal mdpi ldpi
PRODUCT_AAPT_PREF_CONFIG := ldpi

PRODUCT_LOCALES := \
	en_US \

# Permission files
PRODUCT_COPY_FILES += \
 frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

# Configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    $(LOCAL_PATH)/configs/touch_mcs6000.idc:system/usr/idc/touch_mcs6000.idc \
    $(LOCAL_PATH)/configs/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    $(LOCAL_PATH)/configs/Generic.kl:system/usr/keylayout/Generic.kl \
    $(LOCAL_PATH)/configs/touch_mcs6000.kl:system/usr/keylayout/touch_mcs6000.kl \
    $(LOCAL_PATH)/configs/sysctl.conf:system/etc/sysctl.conf
    
# fstab    
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.hazel:root/fstab.hazel 

# Bluedroid: rc
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/bluetooth/init.qcom.bluedroid.rc:root/init.qcom.bluetooth.rc

# USBMS for recovery
PRODUCT_COPY_FILES += \
    device/lge/hazel/recovery/init.recovery.msm7x27.rc:root/init.recovery.$(CM_BUILD).rc

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

# SD Card
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/vold.fstab:system/etc/vold.fstab

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/AudioFilter.csv:system/etc/AudioFilter.csv \
    $(LOCAL_PATH)/configs/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml

# Misc 
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh

# Display 
PRODUCT_PACKAGES += \
   hwcomposer.msm7x27 \
   libmemalloc \
   gralloc.msm7x27 \
   libgenlock \
   copybit.msm7x27 \
   libopencorehw \
   libqdutils \
   liboverlay 

## Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    libaudioutils \
    audio_policy.conf \
    audio_policy.hazel \
    audio.primary.hazel

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs 

# video decoding
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libmm-omxcore \
    libOmxCore \
    libdivxdrmdecrypt

# Apps
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    Gallery \
    Stk \
    HwaSettings

# Camera
PRODUCT_PACKAGES += \
     camera.hazel

# Other
PRODUCT_PACKAGES += \
    librs_jni \
    lights.hazel \
    gps.hazel \
    gps.msm7x27 \
    power.hazel \
    lgapversion \

# Misc
PRODUCT_PACKAGES += \
    libnetcmdiface \
    bdAddrLoader \
    hwaddrs

PRODUCT_PACKAGES += \
    init.hazel.rc \
    init.hazel.usb.rc \
    init.qcom.rc \
    init.qcom.usb.rc \
    ueventd.qcom.rc \
    ueventd.hazel.rc


PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.camera=hazel \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r6 \
    ro.setupwizard.enable_bypass=1 \
    ro.telephony.call_ring.multiple=false \
    ro.vold.umsdirtyratio=20
    persist.service.adb.enable=1

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.ap.interface=wl0.1


# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heaptargetutilization=0.25 \
    dalvik.vm.execution-mode=int:fast

    
# SELinux - we're not ready for enforcing mode yet
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.selinux=permissive

BOARD_SEPOLICY_DIRS += device/lge/hazel/sepolicy
BOARD_SEPOLICY_UNION += \
    file_contexts \
    genfs_contexts

# Battery life hacks
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.disable.power.collapse=1 \
    pm.sleep_mode=1 \
    wifi.supplicant_scan_interval=150

PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.surface.rgb565=true \
    com.qc.hardware=true \
    com.qc.hdmi_out=false \
    debug.sf.hw=0 \
    debug.enabletr=false \
    debug.hwui.render_dirty_regions=false \
    debug.composition.type=mdp \
    debug.gr.numframebuffers=3 \
    debug.qctwa.statusbar=1 \
    debug.qctwa.preservebuf=1 \
    hwui.render_dirty_regions=false \
    hwui.print_config=choice \
    persist.sys.strictmode.visual=0 \
    persist.sys.strictmode.disable=1  \
    sys.mem.max_hidden_apps=10

PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.enable-player=true \
    media.stagefright.enable-meta=false \
    media.stagefright.enable-scan=false \
    media.stagefright.enable-http=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-qcp=true

# Development settings
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.debuggable=1 \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.allow.mock.location=0
    
# Install/Uninstall google apps
$(call inherit-product, vendor/google/gapps_armv6_tiny.mk)

#Bluetooth configuration files
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf

    
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_NAME := cm_hazel
PRODUCT_DEVICE := cm_hazel
PRODUCT_MODEL := LG-C550
