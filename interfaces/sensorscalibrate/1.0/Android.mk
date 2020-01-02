# This file is autogenerated by hidl-gen. Do not edit manually.

LOCAL_PATH := $(call my-dir)

################################################################################

include $(CLEAR_VARS)
LOCAL_MODULE := vendor.qti.hardware.sensorscalibrate-V1.0-java
LOCAL_MODULE_CLASS := JAVA_LIBRARIES

LOCAL_MODULE_OWNER := qti
LOCAL_PROPRIETARY_MODULE := true

intermediates := $(call local-generated-sources-dir, COMMON)

HIDL := $(HOST_OUT_EXECUTABLES)/hidl-gen$(HOST_EXECUTABLE_SUFFIX)

LOCAL_JAVA_LIBRARIES := \
    android.hidl.base-V1.0-java \


#
# Build ISensorsCalibrate.hal
#
GEN := $(intermediates)/vendor/qti/hardware/sensorscalibrate/V1_0/ISensorsCalibrate.java
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/ISensorsCalibrate.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
        $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
        -Ljava \
        -randroid.hidl:system/libhidl/transport \
        -rvendor.qti.hardware:vendor/qcom/proprietary/interfaces/ \
        vendor.qti.hardware.sensorscalibrate@1.0::ISensorsCalibrate

$(GEN): $(LOCAL_PATH)/ISensorsCalibrate.hal
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)
include $(BUILD_JAVA_LIBRARY)

include $(call all-makefiles-under,$(LOCAL_PATH))
