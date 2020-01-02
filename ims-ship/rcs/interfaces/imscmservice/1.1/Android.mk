# This file is autogenerated by hidl-gen. Do not edit manually.

LOCAL_PATH := $(call my-dir)

################################################################################

include $(CLEAR_VARS)
LOCAL_MODULE := com.qualcomm.qti.imscmservice@1.1-java
LOCAL_MODULE_CLASS := JAVA_LIBRARIES

intermediates := $(call local-generated-sources-dir, COMMON)

HIDL := $(HOST_OUT_EXECUTABLES)/hidl-gen$(HOST_EXECUTABLE_SUFFIX)

LOCAL_JAVA_LIBRARIES := \
    android.hidl.base-V1.0-java \
    com.qualcomm.qti.imscmservice@1.0-java \


#
# Build types.hal (IMSCM_AUTOCONFIG_REQUEST_STATUS)
#
GEN := $(intermediates)/com/qualcomm/qti/imscmservice/V1_1/IMSCM_AUTOCONFIG_REQUEST_STATUS.java
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/types.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
        $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
        -Ljava \
        -randroid.hidl:system/libhidl/transport \
        -rcom.qualcomm.qti:vendor/qcom/proprietary/ims-ship/rcs/interfaces/ \
        com.qualcomm.qti.imscmservice@1.1::types.IMSCM_AUTOCONFIG_REQUEST_STATUS

$(GEN): $(LOCAL_PATH)/types.hal
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)

#
# Build types.hal (IMSCM_AUTOCONFIG_TRIGGER_REASON)
#
GEN := $(intermediates)/com/qualcomm/qti/imscmservice/V1_1/IMSCM_AUTOCONFIG_TRIGGER_REASON.java
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/types.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
        $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
        -Ljava \
        -randroid.hidl:system/libhidl/transport \
        -rcom.qualcomm.qti:vendor/qcom/proprietary/ims-ship/rcs/interfaces/ \
        com.qualcomm.qti.imscmservice@1.1::types.IMSCM_AUTOCONFIG_TRIGGER_REASON

$(GEN): $(LOCAL_PATH)/types.hal
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)

#
# Build types.hal (IMSCM_CONFIG_DATA)
#
GEN := $(intermediates)/com/qualcomm/qti/imscmservice/V1_1/IMSCM_CONFIG_DATA.java
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/types.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
        $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
        -Ljava \
        -randroid.hidl:system/libhidl/transport \
        -rcom.qualcomm.qti:vendor/qcom/proprietary/ims-ship/rcs/interfaces/ \
        com.qualcomm.qti.imscmservice@1.1::types.IMSCM_CONFIG_DATA

$(GEN): $(LOCAL_PATH)/types.hal
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)

#
# Build types.hal (QIMS_CM_DEVICE_CONFIG)
#
GEN := $(intermediates)/com/qualcomm/qti/imscmservice/V1_1/QIMS_CM_DEVICE_CONFIG.java
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/types.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
        $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
        -Ljava \
        -randroid.hidl:system/libhidl/transport \
        -rcom.qualcomm.qti:vendor/qcom/proprietary/ims-ship/rcs/interfaces/ \
        com.qualcomm.qti.imscmservice@1.1::types.QIMS_CM_DEVICE_CONFIG

$(GEN): $(LOCAL_PATH)/types.hal
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)

#
# Build IImsCMConnection.hal
#
GEN := $(intermediates)/com/qualcomm/qti/imscmservice/V1_1/IImsCMConnection.java
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/IImsCMConnection.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
        $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
        -Ljava \
        -randroid.hidl:system/libhidl/transport \
        -rcom.qualcomm.qti:vendor/qcom/proprietary/ims-ship/rcs/interfaces/ \
        com.qualcomm.qti.imscmservice@1.1::IImsCMConnection

$(GEN): $(LOCAL_PATH)/IImsCMConnection.hal
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)

#
# Build IImsCMConnectionListener.hal
#
GEN := $(intermediates)/com/qualcomm/qti/imscmservice/V1_1/IImsCMConnectionListener.java
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/IImsCMConnectionListener.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
        $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
        -Ljava \
        -randroid.hidl:system/libhidl/transport \
        -rcom.qualcomm.qti:vendor/qcom/proprietary/ims-ship/rcs/interfaces/ \
        com.qualcomm.qti.imscmservice@1.1::IImsCMConnectionListener

$(GEN): $(LOCAL_PATH)/IImsCMConnectionListener.hal
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)

#
# Build IImsCmService.hal
#
GEN := $(intermediates)/com/qualcomm/qti/imscmservice/V1_1/IImsCmService.java
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/IImsCmService.hal
$(GEN): PRIVATE_DEPS += $(LOCAL_PATH)/IImsCmServiceListener.hal
$(GEN): $(LOCAL_PATH)/IImsCmServiceListener.hal
$(GEN): PRIVATE_DEPS += $(LOCAL_PATH)/types.hal
$(GEN): $(LOCAL_PATH)/types.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
        $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
        -Ljava \
        -randroid.hidl:system/libhidl/transport \
        -rcom.qualcomm.qti:vendor/qcom/proprietary/ims-ship/rcs/interfaces/ \
        com.qualcomm.qti.imscmservice@1.1::IImsCmService

$(GEN): $(LOCAL_PATH)/IImsCmService.hal
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)

#
# Build IImsCmServiceListener.hal
#
GEN := $(intermediates)/com/qualcomm/qti/imscmservice/V1_1/IImsCmServiceListener.java
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/IImsCmServiceListener.hal
$(GEN): PRIVATE_DEPS += $(LOCAL_PATH)/types.hal
$(GEN): $(LOCAL_PATH)/types.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
        $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
        -Ljava \
        -randroid.hidl:system/libhidl/transport \
        -rcom.qualcomm.qti:vendor/qcom/proprietary/ims-ship/rcs/interfaces/ \
        com.qualcomm.qti.imscmservice@1.1::IImsCmServiceListener

$(GEN): $(LOCAL_PATH)/IImsCmServiceListener.hal
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)
include $(BUILD_JAVA_LIBRARY)


################################################################################

include $(CLEAR_VARS)
LOCAL_MODULE := com.qualcomm.qti.imscmservice@1.1-java-static
LOCAL_MODULE_CLASS := JAVA_LIBRARIES

intermediates := $(call local-generated-sources-dir, COMMON)

HIDL := $(HOST_OUT_EXECUTABLES)/hidl-gen$(HOST_EXECUTABLE_SUFFIX)

LOCAL_JAVA_LIBRARIES := \
    android.hidl.base-V1.0-java \

LOCAL_STATIC_JAVA_LIBRARIES := \
    com.qualcomm.qti.imscmservice@1.0-java-static \


#
# Build types.hal (IMSCM_AUTOCONFIG_REQUEST_STATUS)
#
GEN := $(intermediates)/com/qualcomm/qti/imscmservice/V1_1/IMSCM_AUTOCONFIG_REQUEST_STATUS.java
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/types.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
        $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
        -Ljava \
        -randroid.hidl:system/libhidl/transport \
        -rcom.qualcomm.qti:vendor/qcom/proprietary/ims-ship/rcs/interfaces/ \
        com.qualcomm.qti.imscmservice@1.1::types.IMSCM_AUTOCONFIG_REQUEST_STATUS

$(GEN): $(LOCAL_PATH)/types.hal
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)

#
# Build types.hal (IMSCM_AUTOCONFIG_TRIGGER_REASON)
#
GEN := $(intermediates)/com/qualcomm/qti/imscmservice/V1_1/IMSCM_AUTOCONFIG_TRIGGER_REASON.java
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/types.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
        $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
        -Ljava \
        -randroid.hidl:system/libhidl/transport \
        -rcom.qualcomm.qti:vendor/qcom/proprietary/ims-ship/rcs/interfaces/ \
        com.qualcomm.qti.imscmservice@1.1::types.IMSCM_AUTOCONFIG_TRIGGER_REASON

$(GEN): $(LOCAL_PATH)/types.hal
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)

#
# Build types.hal (IMSCM_CONFIG_DATA)
#
GEN := $(intermediates)/com/qualcomm/qti/imscmservice/V1_1/IMSCM_CONFIG_DATA.java
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/types.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
        $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
        -Ljava \
        -randroid.hidl:system/libhidl/transport \
        -rcom.qualcomm.qti:vendor/qcom/proprietary/ims-ship/rcs/interfaces/ \
        com.qualcomm.qti.imscmservice@1.1::types.IMSCM_CONFIG_DATA

$(GEN): $(LOCAL_PATH)/types.hal
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)

#
# Build types.hal (QIMS_CM_DEVICE_CONFIG)
#
GEN := $(intermediates)/com/qualcomm/qti/imscmservice/V1_1/QIMS_CM_DEVICE_CONFIG.java
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/types.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
        $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
        -Ljava \
        -randroid.hidl:system/libhidl/transport \
        -rcom.qualcomm.qti:vendor/qcom/proprietary/ims-ship/rcs/interfaces/ \
        com.qualcomm.qti.imscmservice@1.1::types.QIMS_CM_DEVICE_CONFIG

$(GEN): $(LOCAL_PATH)/types.hal
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)

#
# Build IImsCMConnection.hal
#
GEN := $(intermediates)/com/qualcomm/qti/imscmservice/V1_1/IImsCMConnection.java
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/IImsCMConnection.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
        $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
        -Ljava \
        -randroid.hidl:system/libhidl/transport \
        -rcom.qualcomm.qti:vendor/qcom/proprietary/ims-ship/rcs/interfaces/ \
        com.qualcomm.qti.imscmservice@1.1::IImsCMConnection

$(GEN): $(LOCAL_PATH)/IImsCMConnection.hal
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)

#
# Build IImsCMConnectionListener.hal
#
GEN := $(intermediates)/com/qualcomm/qti/imscmservice/V1_1/IImsCMConnectionListener.java
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/IImsCMConnectionListener.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
        $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
        -Ljava \
        -randroid.hidl:system/libhidl/transport \
        -rcom.qualcomm.qti:vendor/qcom/proprietary/ims-ship/rcs/interfaces/ \
        com.qualcomm.qti.imscmservice@1.1::IImsCMConnectionListener

$(GEN): $(LOCAL_PATH)/IImsCMConnectionListener.hal
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)

#
# Build IImsCmService.hal
#
GEN := $(intermediates)/com/qualcomm/qti/imscmservice/V1_1/IImsCmService.java
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/IImsCmService.hal
$(GEN): PRIVATE_DEPS += $(LOCAL_PATH)/IImsCmServiceListener.hal
$(GEN): $(LOCAL_PATH)/IImsCmServiceListener.hal
$(GEN): PRIVATE_DEPS += $(LOCAL_PATH)/types.hal
$(GEN): $(LOCAL_PATH)/types.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
        $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
        -Ljava \
        -randroid.hidl:system/libhidl/transport \
        -rcom.qualcomm.qti:vendor/qcom/proprietary/ims-ship/rcs/interfaces/ \
        com.qualcomm.qti.imscmservice@1.1::IImsCmService

$(GEN): $(LOCAL_PATH)/IImsCmService.hal
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)

#
# Build IImsCmServiceListener.hal
#
GEN := $(intermediates)/com/qualcomm/qti/imscmservice/V1_1/IImsCmServiceListener.java
$(GEN): $(HIDL)
$(GEN): PRIVATE_HIDL := $(HIDL)
$(GEN): PRIVATE_DEPS := $(LOCAL_PATH)/IImsCmServiceListener.hal
$(GEN): PRIVATE_DEPS += $(LOCAL_PATH)/types.hal
$(GEN): $(LOCAL_PATH)/types.hal
$(GEN): PRIVATE_OUTPUT_DIR := $(intermediates)
$(GEN): PRIVATE_CUSTOM_TOOL = \
        $(PRIVATE_HIDL) -o $(PRIVATE_OUTPUT_DIR) \
        -Ljava \
        -randroid.hidl:system/libhidl/transport \
        -rcom.qualcomm.qti:vendor/qcom/proprietary/ims-ship/rcs/interfaces/ \
        com.qualcomm.qti.imscmservice@1.1::IImsCmServiceListener

$(GEN): $(LOCAL_PATH)/IImsCmServiceListener.hal
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)
include $(BUILD_STATIC_JAVA_LIBRARY)
################################################################################
include $(CLEAR_VARS)
LOCAL_MODULE := com.qualcomm.qti.imscmservice_1_1.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/permissions
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)
#############################################################################



include $(call all-makefiles-under,$(LOCAL_PATH))