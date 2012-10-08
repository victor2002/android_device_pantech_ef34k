# Copyright (C) 2009 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true
# inherit from common msm8660
-include device/pantech/msm8660-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/pantech/ef34k/BoardConfigVendor.mk

TARGET_BOOTLOADER_BOARD_NAME := MSM8660_SURF

# assert
TARGET_OTA_ASSERT_DEVICE := a770k,ef34k,IM-A770K

# kernel
BOARD_KERNEL_CMDLINE        := console=ttyHSL0,115200,n8 androidboot.hardware=qcom loglevel=0
BOARD_KERNEL_BASE           := 0x40200000
BOARD_FORCE_RAMDISK_ADDRESS := 0x41500000
BOARD_KERNEL_PAGESIZE       := 2048
# Define Prebuilt kernel locations
TARGET_PREBUILT_KERNEL      := device/pantech/ef34k/prebuilt/kernel
#TARGT_PREBUILT_RECOVERY_KERNEL := device/pantech/ef34k/prebuilt/kernel
# fs
TARGET_USERIMAGES_USE_EXT4         := true
BOARD_BOOTIMAGE_PARTITION_SIZE     := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 629145600
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824
BOARD_FLASH_BLOCK_SIZE             := 131072

BOARD_USES_GENLOCK           := true
#BOARD_USE_LEGACY_TOUCHSCREEN := true
#BOARD_USE_LEGACY_TRACKPAD := true

BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_LIBS := true
BOARD_USE_SKIA_LCDTEXT := true
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
# Workaround for glitches while cropping bypass layers
#TARGET_NO_BYPASS_CROPPING := true

# Audio
TARGET_USES_QCOM_LPA := true
COMMON_GLOBAL_CFLAGS += -DWITH_QCOM_LPA

# RIL
BOARD_PROVIDES_LIBRIL := true

# WIFI
BOARD_WPA_SUPPLICANT_DRIVER      := WEXT
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
BOARD_WLAN_DEVICE                := bcm4329
#BOARD_HOSTAPD_DRIVER 		 := WEXT
#BOARD_HOSTAPD_PRIVATE_LIB 	 := lib_driver_cmd_wext
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/wlan/parameters/firmware_path"
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/wl/bcm43291.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/wl/bcm43291_apsta.bin"
WIFI_DRIVER_MODULE_NAME          := "bcm4329"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/system/etc/wl/bcm43291.bin nvram_path=/system/etc/wl/nvram.txt"
BOARD_WLAN_DEVICE_REV            := bcm4329
WIFI_BAND                        := 802_11_ABG
TARGET_CUSTOM_WIFI := ../../device/pantech/ef34k/wifi/wifi.c

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 19
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
TARGET_USE_CUSTOM_SECOND_LUN_NUM := 1

# recovery
#BOARD_TOUCH_RECOVERY	:= true
BOARD_HAS_NO_SELECT_BUTTON     := true
#BOARD_HAS_NO_MISC_PARTITION    := true
BOARD_USES_MMCUTILS            := true
BOARD_HAS_LARGE_FILESYSTEM     := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
