ifneq ($(TARGET_HAS_LOW_RAM),true)

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := debug

LOCAL_SRC_FILES := $(call all-java-files-under, src)

LOCAL_JAVA_LIBRARIES := android.test.runner
LOCAL_JAVA_LIBRARIES += qti-vzw-ims-internal legacy-test
LOCAL_STATIC_JAVA_LIBRARIES := legacy-android-test

LOCAL_PACKAGE_NAME :=  com.qti.vzw.ims.internal.tests

LOCAL_PROGUARD_ENABLED := disabled

LOCAL_CERTIFICATE := platform

include $(BUILD_PACKAGE)

endif
