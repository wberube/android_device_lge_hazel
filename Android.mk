LOCAL_PATH := $(my-dir)

ifeq ($(TARGET_DEVICE),p350)
    subdir_makefiles := \
         $(LOCAL_PATH)/apversion/android.mk \
         $(LOCAL_PATH)/hwaddrs/android.mk \
	 $(LOCAL_PATH)/libaudio/Android.mk \
         $(LOCAL_PATH)/libcamera/Android.mk \
         $(LOCAL_PATH)/libcopybit/android.mk \
         $(LOCAL_PATH)/liblights/android.mk \
	 $(LOCAL_PATH)/source/libomxcore/Android.mk \
         $(LOCAL_PATH)/source/librpc/Android.mk \
	 $(LOCAL_PATH)/source/libstagefrighthw/Android.mk \
     include $(subdir_makefiles)
endif
