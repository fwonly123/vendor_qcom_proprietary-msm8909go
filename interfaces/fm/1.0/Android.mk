
# This file is autogenerated by hidl-gen. Do not edit manually.

LOCAL_PATH := $(call my-dir)

################################################################################

include $(CLEAR_VARS)
LOCAL_MODULE := vendor.qti.hardware.fm-V1.0-java
LOCAL_MODULE_CLASS := JAVA_LIBRARIES

intermediates := $(call local-generated-sources-dir, COMMON)

HIDL := $(HOST_OUT_EXECUTABLES)/hidl-gen$(HOST_EXECUTABLE_SUFFIX)

LOCAL_JAVA_LIBRARIES := \
    android.hidl.base-V1.0-java \


#
# Build types.hal (Status)
#
GEN := $(intermediates)/vendor/qti/hardware/fm/V1_0/Status.java
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/types.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
        $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
        -Ljava \
        -randroid.hidl:system/libhidl/transport \
        -rvendor.qti.hardware:vendor/qcom/proprietary/interfaces \
        vendor.qti.hardware.fm@1.0::types.Status

$(GEN): $(LOCAL_PATH)/types.hal
        $(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)

#
# Build IFmHci.hal
#
GEN := $(intermediates)/vendor/qti/hardware/fm/V1_0/IFmHci.java
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/IFmHci.hal
$(GEN): PRIVATE_DEPS += $(LOCAL_PATH)/IFmHciCallbacks.hal
$(GEN): $(LOCAL_PATH)/IFmHciCallbacks.hal
$(GEN): PRIVATE_DEPS += $(LOCAL_PATH)/types.hal
$(GEN): $(LOCAL_PATH)/types.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
        $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
        -Ljava \
        -randroid.hidl:system/libhidl/transport \
        -rvendor.qti.hardware:vendor/qcom/proprietary/interfaces \
        vendor.qti.hardware.fm@1.0::IFmHci

$(GEN): $(LOCAL_PATH)/IFmHci.hal
        $(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)

#
# Build IFmHciCallbacks.hal
#
GEN := $(intermediates)/vendor/qti/hardware/fm/V1_0/IFmHciCallbacks.java
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/IFmHciCallbacks.hal
$(GEN): PRIVATE_DEPS += $(LOCAL_PATH)/types.hal
$(GEN): $(LOCAL_PATH)/types.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
        $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
        -Ljava \
        -randroid.hidl:system/libhidl/transport \
        -rvendor.qti.hardware:vendor/qcom/proprietary/interfaces \
        vendor.qti.hardware.fm@1.0::IFmHciCallbacks

$(GEN): $(LOCAL_PATH)/IFmHciCallbacks.hal
        $(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)
include $(BUILD_JAVA_LIBRARY)


################################################################################

include $(CLEAR_VARS)
LOCAL_MODULE := vendor.qti.hardware.fm-V1.0-java-static
LOCAL_MODULE_CLASS := JAVA_LIBRARIES

intermediates := $(call local-generated-sources-dir, COMMON)

HIDL := $(HOST_OUT_EXECUTABLES)/hidl-gen$(HOST_EXECUTABLE_SUFFIX)

LOCAL_JAVA_LIBRARIES := \
    android.hidl.base-V1.0-java \


#
# Build types.hal (Status)
#
GEN := $(intermediates)/vendor/qti/hardware/fm/V1_0/Status.java
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/types.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
        $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
        -Ljava \
        -randroid.hidl:system/libhidl/transport \
        -rvendor.qti.hardware:vendor/qcom/proprietary/interfaces \
        vendor.qti.hardware.fm@1.0::types.Status

$(GEN): $(LOCAL_PATH)/types.hal
        $(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)

#
# Build IFmHci.hal
#
GEN := $(intermediates)/vendor/qti/hardware/fm/V1_0/IFmHci.java
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/IFmHci.hal
$(GEN): PRIVATE_DEPS += $(LOCAL_PATH)/IFmHciCallbacks.hal
$(GEN): $(LOCAL_PATH)/IFmHciCallbacks.hal
$(GEN): PRIVATE_DEPS += $(LOCAL_PATH)/types.hal
$(GEN): $(LOCAL_PATH)/types.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
        $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
        -Ljava \
        -randroid.hidl:system/libhidl/transport \
        -rvendor.qti.hardware:vendor/qcom/proprietary/interfaces \
        vendor.qti.hardware.fm@1.0::IFmHci

$(GEN): $(LOCAL_PATH)/IFmHci.hal
        $(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)

#
# Build IFmHciCallbacks.hal
#
GEN := $(intermediates)/vendor/qti/hardware/fm/V1_0/IFmHciCallbacks.java
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/IFmHciCallbacks.hal
$(GEN): PRIVATE_DEPS += $(LOCAL_PATH)/types.hal
$(GEN): $(LOCAL_PATH)/types.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
        $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
        -Ljava \
        -randroid.hidl:system/libhidl/transport \
        -rvendor.qti.hardware:vendor/qcom/proprietary/interfaces \
        vendor.qti.hardware.fm@1.0::IFmHciCallbacks

$(GEN): $(LOCAL_PATH)/IFmHciCallbacks.hal
        $(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)
include $(BUILD_STATIC_JAVA_LIBRARY)



include $(call all-makefiles-under,$(LOCAL_PATH))