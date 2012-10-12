#
# Copyright (C) 2011 The CyanogenMod Project
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

## The gps config appropriate for this device
PRODUCT_COPY_FILES += device/common/gps/gps.conf_US_SUPL:system/etc/gps.conf

## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/pantech/ef34k/ef34k-vendor.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS += device/pantech/ef34k/overlay

PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/pantech/ef34k/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/pantech/ef34k/modules/evbug.ko:system/lib/modules/evbug.ko \
    device/pantech/ef34k/modules/gspca_main.ko:system/lib/modules/gspca_main.ko \
    device/pantech/ef34k/modules/lcd.ko:system/lib/modules/lcd.ko \
    device/pantech/ef34k/modules/librasdioif.ko:system/lib/modules/librasdioif.ko \
    device/pantech/ef34k/modules/qcedev.ko:system/lib/modules/qcedev.ko \
    device/pantech/ef34k/modules/qce.ko:system/lib/modules/qce.ko \
    device/pantech/ef34k/modules/qcrypto.ko:system/lib/modules/qcrypto.ko \
    device/pantech/ef34k/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    device/pantech/ef34k/modules/spidev.ko:system/lib/modules/spidev.ko \
    device/pantech/ef34k/modules/wlan.ko:system/lib/modules/wlan.ko

# Ramdisk
PRODUCT_COPY_FILES += \
    device/pantech/ef34k/ramdisk/init.rc:root/init.rc \
    device/pantech/ef34k/ramdisk/init:root/init \
    device/pantech/ef34k/ramdisk/init.qcom.rc:root/init.qcom.rc \
    device/pantech/ef34k/ramdisk/init.qcom.sh:root/init.qcom.sh \
    device/pantech/ef34k/ramdisk/init.target.rc:root/init.target.rc \
    device/pantech/ef34k/ramdisk/init.qcom.usb.rc:root/init.qcom.usb.rc \
    device/pantech/ef34k/ramdisk/ueventd.rc:root/ueventd.rc \
    device/pantech/ef34k/ramdisk/logo2.rle:root/logo2.rle \
    device/pantech/ef34k/ramdisk/initlogo.rle:root/initlogo.rle 

# WIFI
PRODUCT_COPY_FILES += \
	device/pantech/ef34k/wifi/bcm43291.bin:system/etc/wl/bcm43291.bin \
	device/pantech/ef34k/wifi/bcm43291_apsta.bin:system/etc/wl/bcm43291_apsta.bin \
	device/pantech/ef34k/wifi/bcm43291_p2p.bin:system/etc/wl/bcm43291_p2p.bin \
	device/pantech/ef34k/wifi/nvram.txt:system/etc/wl/nvram.txt \
	device/pantech/ef34k/wifi/wlan.ko:system/lib/modules/wlan.ko

# BT firmware
PRODUCT_COPY_FILES += \
    device/pantech/ef34k/prebuilt/BCM43291A0_003.001.013.0141.0000_Pantech_EF33S_EF34K_extLNA_TestOnly.hcd:system/bin/BCM43291A0_003.001.013.0141.0000_Pantech_EF33S_EF34K_extLNA_TestOnly.hcd

# Vold configuration
PRODUCT_COPY_FILES += \
    device/pantech/ef34k/prebuilt/vold.fstab:system/etc/vold.fstab
# IDC
PRODUCT_COPY_FILES += \
    device/pantech/ef34k/idc/cyttsp-i2c.idc:system/usr/idc/cyttsp-i2c.idc 

# Set default USB interface
#PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
#    persist.sys.usb.config=mass_storage

# common msm8660
$(call inherit-product, device/pantech/msm8660-common/msm8660.mk)

$(call inherit-product, frameworks/base/build/phone-xhdpi-1024-dalvik-heap.mk)
