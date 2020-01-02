PRODUCT_COPY_FILES += \
					  $(foreach file,$(wildcard vendor/qcom/proprietary/android-perf/configs/$(TARGET_BOARD_PLATFORM)/*.conf),$(file):$(TARGET_COPY_OUT_VENDOR)/etc/perf/$(notdir $(file)))

PRODUCT_COPY_FILES += \
					  $(foreach file,$(wildcard vendor/qcom/proprietary/android-perf/configs/$(TARGET_BOARD_PLATFORM)/whitelist*.xml),$(file):/system/etc/perf/$(notdir $(file)))

PRODUCT_COPY_FILES += \
					  $(foreach file,$(wildcard vendor/qcom/proprietary/android-perf/configs/$(TARGET_BOARD_PLATFORM)/gamed*.xml),$(file):$(TARGET_COPY_OUT_VENDOR)/etc/perf/$(notdir $(file)))

PRODUCT_COPY_FILES += \
					  $(foreach file,$(wildcard vendor/qcom/proprietary/android-perf/configs/$(TARGET_BOARD_PLATFORM)/app*.xml),$(file):$(TARGET_COPY_OUT_VENDOR)/etc/perf/$(notdir $(file)))

PRODUCT_COPY_FILES += \
					  $(foreach file,$(wildcard vendor/qcom/proprietary/android-perf/configs/$(TARGET_BOARD_PLATFORM)/perfboosts*.xml),$(file):$(TARGET_COPY_OUT_VENDOR)/etc/perf/$(notdir $(file)))

PRODUCT_COPY_FILES += \
					  $(foreach file,$(wildcard vendor/qcom/proprietary/android-perf/configs/$(TARGET_BOARD_PLATFORM)/power*.xml),$(file):$(TARGET_COPY_OUT_VENDOR)/etc/perf/$(notdir $(file)))

PRODUCT_COPY_FILES += \
					  $(foreach file,$(wildcard vendor/qcom/proprietary/android-perf/configs/$(TARGET_BOARD_PLATFORM)/perfmap*.xml),$(file):$(TARGET_COPY_OUT_VENDOR)/etc/perf/$(notdir $(file)))
