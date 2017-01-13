#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_FOLDER := device/samsung/tuna

# inherit from omap4
-include hardware/ti/omap4/BoardConfigCommon.mk

# Build SGX KM
-include hardware/ti/omap4/pvr-km.mk

PRODUCT_VENDOR_KERNEL_HEADERS += $(DEVICE_FOLDER)/kernel-headers

# Use the non-open-source parts, if they're present
-include vendor/samsung/tuna/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_BOARD_INFO_FILE := $(DEVICE_FOLDER)/board-info.txt
TARGET_BOOTLOADER_BOARD_NAME := tuna

# Processor
TARGET_BOARD_OMAP_CPU := 4460

# Kernel
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := androidboot.hardware=$(TARGET_BOOTLOADER_BOARD_NAME)
TARGET_KERNEL_CONFIG := tuna_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/tuna
KERNEL_TOOLCHAIN := "$(ANDROID_BUILD_TOP)/prebuilts/gcc/$(strip $(HOST_OS))-x86/arm/arm-eabi-4.7/bin/"

TI_CAMERAHAL_USES_LEGACY_DOMX_DCC := true
TI_CAMERAHAL_INTERFACE := OMX
DOMX_TUNA := true
COMMON_GLOBAL_CFLAGS += -DDOMX_TUNA
TI_CAMERAHAL_MAX_CAMERAS_SUPPORTED := 2

# Include HDCP keys
BOARD_CREATE_TUNA_HDCP_KEYS_SYMLINK := true

# set if the target supports FBIO_WAITFORVSYNC
TARGET_HAS_WAITFORVSYNC := true

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 12517376
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 685768704
BOARD_CACHEIMAGE_PARTITION_SIZE := 452984832
BOARD_USERDATAIMAGE_PARTITION_SIZE := 14539537408
BOARD_FLASH_BLOCK_SIZE := 4096

# Disable journaling on system.img to save space.
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0

# Pre-optimize the boot image
WITH_DEXPREOPT := true
WITH_DEXPREOPT_BOOT_IMG_ONLY := true

# Wifi
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WLAN_DEVICE_REV            := bcm4330_b2
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
#WIFI_DRIVER_MODULE_PATH         := "/system/lib/modules/bcmdhd.ko"
WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_BAND                        := 802_11_ABG

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_FOLDER)/bluetooth

BOARD_HAL_STATIC_LIBRARIES := libdumpstate.tuna

# SELinux
BOARD_SEPOLICY_DIRS += \
	$(DEVICE_FOLDER)/sepolicy

# Recovery
TARGET_RECOVERY_FSTAB = $(DEVICE_FOLDER)/rootdir/fstab.tuna
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"

# TWRP
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_INCLUDE_CRYPTO := true
TW_FLASH_FROM_STORAGE := true
TW_NO_USB_STORAGE := true
TW_NO_SCREEN_BLANK := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/usb-otg"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "usb-otg"
TW_MAX_BRIGHTNESS := 255
TW_BRIGHTNESS_PATH := /sys/class/backlight/s6e8aa0/brightness
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/platform/omap/omap_temp_sensor.0/temperature
