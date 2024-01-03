#
# Copyright (C) 2021 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/infinix/note10pro
HOT10S_PREBUILT := device/infinix/note10pro-prebuilt

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    vendor

# Audio
USE_CUSTOM_AUDIO_POLICY := 1

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := note10pro
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# DPI
TARGET_SCREEN_DENSITY := 480

# Platform
TARGET_BOARD_PLATFORM := mt6785

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# Mediatek IMS
TARGET_PROVIDES_MEDIATEK_IMS_STACK := true

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_note10pro
TARGET_RECOVERY_DEVICE_MODULES := libinit_note10pro

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=recovery

BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_OFFSET := 0x0bc08000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x0bc08000
BOARD_RAMDISK_OFFSET := 0x07c08000
BOARD_KERNEL_SECOND_OFFSET := 0xbff88000
BOARD_DTB_OFFSET := 0x0bc08000

BOARD_KERNEL_SEPARATED_DTBO := false
BOARD_BOOT_HEADER_VERSION := 2

BOARD_KERNEL_IMAGE_NAME := Image.gz
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img

BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_USERDATAIMAGE_PARTITION_SIZE := 117856763904
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4

# HWUI
HWUI_COMPILE_FOR_PERF := true

# Dynamic Partition
BOARD_SUPER_PARTITION_SIZE := 6012043264
BOARD_SUPER_PARTITION_GROUPS := main
BOARD_MAIN_SIZE := 6012043264
BOARD_MAIN_PARTITION_LIST := \
    product \
    system \
    system_ext 

BOARD_PARTITION_LIST := $(call to-upper, $(BOARD_MAIN_PARTITION_LIST))
$(foreach p, $(BOARD_PARTITION_LIST), $(eval BOARD_$(p)IMAGE_FILE_SYSTEM_TYPE := ext4))
$(foreach p, $(BOARD_PARTITION_LIST), $(eval TARGET_COPY_OUT_$(p) := $(call to-lower, $(p))))

BOARD_SUPER_PARTITION_ERROR_LIMIT := 6012043264

# Assert
TARGET_OTA_ASSERT_DEVICE := X695C,X695D,FULL-64

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Partition options
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
BOARD_ROOT_EXTRA_FOLDERS += metadata
ifeq ($(IS_NOTE10PRO),true)
BOARD_PREBUILT_VENDORIMAGE := $(NOTE10PRO_PREBUILT)/vendor/note10pro/vendor.img
endif
BOARD_USES_METADATA_PARTITION := true

# File systems
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Sepolicy
SELINUX_IGNORE_NEVERALLOWS := true
TARGET_USES_PREBUILT_VENDOR_SEPOLICY := true
TARGET_HAS_FUSEBLK_SEPOLICY_ON_VENDOR := true
BOARD_PLAT_PRIVATE_SEPOLICY_DIR := $(DEVICE_PATH)/sepolicy/private

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.mt6785
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_HAS_LARGE_FILESYSTEM := true

# Build Broken
BUILD_BROKEN_DUP_RULES := true

# Treble VNDK
BOARD_VNDK_VERSION := current

# VINTF
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/config/vintf/manifest.xml
PRODUCT_COMPATIBILITY_MATRIX_FILE := $(DEVICE_PATH)/configs/vintf/compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_DEVICE_FILE := $(DEVICE_PATH)/config/vintf/compatibility_matrix.device.xml
DEVICE_MANIFEST_SKUS += note10pro
DEVICE_MANIFEST_NOTE10PRO_FILES := $(DEVICE_PATH)/configs/vintf/manifest_note10pro.xml
