LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_CFLAGS += -Wno-unused-parameter -Wno-int-to-pointer-cast
LOCAL_CFLAGS += -Wno-non-virtual-dtor
LOCAL_CFLAGS += -Wno-maybe-uninitialized -Wno-parentheses
LOCAL_CPPFLAGS += -Wno-conversion-null

ifeq ($(TARGET_ARCH), arm)
	LOCAL_CFLAGS += -DPACKED="__attribute__ ((packed))"
else
	LOCAL_CFLAGS += -DPACKED=""
endif

LOCAL_SRC_FILES:= \
	com_qualcomm_qti_Performance.cpp

LOCAL_SHARED_LIBRARIES := \
    libnativehelper \
    liblog \
    libcutils \
    liblog \
    libutils \
    libbase \
    vendor.qti.hardware.iop@1.0 \
    libhidlbase \
    libhidltransport \
    libqti-perfd-client_system

LOCAL_C_INCLUDES := vendor/qcom/proprietary/android-perf/mp-ctl
ifeq ($(USE_OPENGL_RENDERER),true)
	LOCAL_SHARED_LIBRARIES += libhwui
endif

LOCAL_SHARED_LIBRARIES += \
	libdl

ifeq ($(WITH_MALLOC_LEAK_CHECK),true)
	LOCAL_CFLAGS += -DMALLOC_LEAK_CHECK
endif

# fake link to generate libqc-skia.a under
# $OUT. No code from libqc-skia.a will be
# injected into libqti_performance.so
ifeq ($(BOARD_USES_QTI_HARDWARE),true)
        LOCAL_STATIC_LIBRARIES := libqc-skia
endif

LOCAL_MODULE_OWNER := qti
LOCAL_MODULE:= libqti_performance

include $(BUILD_SHARED_LIBRARY)
