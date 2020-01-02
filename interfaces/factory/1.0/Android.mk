# This file is autogenerated by hidl-gen. Do not edit manually.

LOCAL_PATH := $(call my-dir)

################################################################################

include $(CLEAR_VARS)
LOCAL_MODULE := vendor.qti.hardware.factory-V1.0-java
LOCAL_MODULE_CLASS := JAVA_LIBRARIES

OCAL_MODULE_OWNER := qti
LOCAL_PROPRIETARY_MODULE := true

intermediates := $(call local-generated-sources-dir, COMMON)

HIDL := $(HOST_OUT_EXECUTABLES)/hidl-gen$(HOST_EXECUTABLE_SUFFIX)

LOCAL_JAVA_LIBRARIES := \
    android.hidl.base-V1.0-java \


#
# Build types.hal (FactoryResult)
#
GEN := $(intermediates)/vendor/qti/hardware/factory/V1_0/FactoryResult.java
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/types.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
        $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
        -Ljava \
        -randroid.hidl:system/libhidl/transport \
        -rvendor.qti.hardware:vendor/qcom/proprietary/interfaces \
        vendor.qti.hardware.factory@1.0::types.FactoryResult

$(GEN): $(LOCAL_PATH)/types.hal
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)

#
# Build types.hal (IResultType)
#
GEN := $(intermediates)/vendor/qti/hardware/factory/V1_0/IResultType.java
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/types.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
        $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
        -Ljava \
        -randroid.hidl:system/libhidl/transport \
        -rvendor.qti.hardware:vendor/qcom/proprietary/interfaces \
        vendor.qti.hardware.factory@1.0::types.IResultType

$(GEN): $(LOCAL_PATH)/types.hal
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)

#
# Build IFactory.hal
#
GEN := $(intermediates)/vendor/qti/hardware/factory/V1_0/IFactory.java
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/IFactory.hal
$(GEN): PRIVATE_DEPS += $(LOCAL_PATH)/types.hal
$(GEN): $(LOCAL_PATH)/types.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
        $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
        -Ljava \
        -randroid.hidl:system/libhidl/transport \
        -rvendor.qti.hardware:vendor/qcom/proprietary/interfaces \
        vendor.qti.hardware.factory@1.0::IFactory

$(GEN): $(LOCAL_PATH)/IFactory.hal
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)
include $(BUILD_JAVA_LIBRARY)


################################################################################

include $(CLEAR_VARS)
LOCAL_MODULE := vendor.qti.hardware.factory-V1.0-java-static
LOCAL_MODULE_CLASS := JAVA_LIBRARIES

intermediates := $(call local-generated-sources-dir, COMMON)

HIDL := $(HOST_OUT_EXECUTABLES)/hidl-gen$(HOST_EXECUTABLE_SUFFIX)

LOCAL_JAVA_LIBRARIES := \
    android.hidl.base-V1.0-java \


#
# Build types.hal (FactoryResult)
#
GEN := $(intermediates)/vendor/qti/hardware/factory/V1_0/FactoryResult.java
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/types.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
        $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
        -Ljava \
        -randroid.hidl:system/libhidl/transport \
        -rvendor.qti.hardware:vendor/qcom/proprietary/interfaces \
        vendor.qti.hardware.factory@1.0::types.FactoryResult

$(GEN): $(LOCAL_PATH)/types.hal
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)

#
# Build types.hal (IResultType)
#
GEN := $(intermediates)/vendor/qti/hardware/factory/V1_0/IResultType.java
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/types.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
        $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
        -Ljava \
        -randroid.hidl:system/libhidl/transport \
        -rvendor.qti.hardware:vendor/qcom/proprietary/interfaces \
        vendor.qti.hardware.factory@1.0::types.IResultType

$(GEN): $(LOCAL_PATH)/types.hal
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)

#
# Build IFactory.hal
#
GEN := $(intermediates)/vendor/qti/hardware/factory/V1_0/IFactory.java
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/IFactory.hal
$(GEN): PRIVATE_DEPS += $(LOCAL_PATH)/types.hal
$(GEN): $(LOCAL_PATH)/types.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
        $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
        -Ljava \
        -randroid.hidl:system/libhidl/transport \
        -rvendor.qti.hardware:vendor/qcom/proprietary/interfaces \
        vendor.qti.hardware.factory@1.0::IFactory

$(GEN): $(LOCAL_PATH)/IFactory.hal
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)
include $(BUILD_STATIC_JAVA_LIBRARY)



include $(call all-makefiles-under,$(LOCAL_PATH))
