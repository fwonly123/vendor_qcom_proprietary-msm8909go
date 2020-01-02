GC0339_SENSOR_LIBS_PATH := $(call my-dir)

# ---------------------------------------------------------------------------
#                      Make the shared library (libchromatix_ov9724_preview)
# ---------------------------------------------------------------------------

include $(CLEAR_VARS)
LOCAL_PATH := $(GC0339_SENSOR_LIBS_PATH)
LOCAL_MODULE_TAGS := optional

LOCAL_CFLAGS:= \
        -DAMSS_VERSION=$(AMSS_VERSION) \
        $(mmcamera_debug_defines) \
        $(mmcamera_debug_cflags)

ifeq ($(VFE_VERS),vfe40)
  LOCAL_CFLAGS += -DVFE_40
else ifeq ($(VFE_VERS),vfe32)
  LOCAL_CFLAGS += -DVFE_32
  ifeq ($(FEATURE_GYRO), true)
    LOCAL_CFLAGS += -DFEATURE_GYRO
  endif
else ifeq ($(VFE_VERS),vfe31)
  LOCAL_CFLAGS += -DVFE_31
  ifeq ($(MSM_VERSION), 7x30)
    LOCAL_CFLAGS += -DVFE_31_7x30
  else
    LOCAL_CFLAGS += -DVFE_31_8x60
  endif
else ifeq ($(VFE_VERS),vfe2x)
  LOCAL_CFLAGS += -DVFE_2X
endif

LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../includes
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../../../../includes
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

LOCAL_SRC_FILES:= gc0339_lib.c
LOCAL_MODULE           := libmmcamera_skuab_shinetech_gc0339
LOCAL_SHARED_LIBRARIES := libcutils liblog
#include $(LOCAL_PATH)/../../../../local_additional_dependency.mk

ifeq ($(MM_DEBUG),true)
LOCAL_SHARED_LIBRARIES += liblog
endif
LOCAL_MODULE_OWNER := qcom 
LOCAL_32_BIT_ONLY := true
LOCAL_PROPRIETARY_MODULE := true

include $(BUILD_SHARED_LIBRARY)
