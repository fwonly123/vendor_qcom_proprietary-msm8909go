LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(call all-subdir-java-files)
LOCAL_SDK_VERSION := current
LOCAL_PACKAGE_NAME := CtTeleServiceRes
LOCAL_MODULE_PATH := $(GENERATED_PACKAGE_PATH)/ChinaTelecom/system/vendor/overlay
LOCAL_CERTIFICATE := platform

include $(BUILD_PACKAGE)