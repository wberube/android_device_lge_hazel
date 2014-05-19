ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),hazel)
include $(call first-makefiles-under,$(call my-dir))
endif
