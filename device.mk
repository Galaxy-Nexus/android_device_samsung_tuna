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

# This file includes all definitions that apply to ALL tuna devices, and
# are also specific to tuna devices
#
# Everything in this directory will become public

DEVICE_FOLDER := device/samsung/tuna

# Processor
TARGET_BOARD_OMAP_CPU := 4460

$(call inherit-product-if-exists, hardware/ti/omap4/omap4.mk)

DEVICE_PACKAGE_OVERLAYS += $(DEVICE_FOLDER)/overlay

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# HALs
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.primary.tuna \
	audio.r_submix.default \
	audio.usb.default \
	camera.tuna \
	lights.tuna \
	nfc.tuna \
	libpn544_fw \
	power.tuna \
	sensors.tuna

# RIL
PRODUCT_PACKAGES += \
	libsecril-client \
	libsecril-compat \
	libsecril-shim

# Charging mode
PRODUCT_PACKAGES += \
	charger_res_images

PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/audio/audio_policy.conf:system/etc/audio_policy.conf \
	$(DEVICE_FOLDER)/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf

PRODUCT_PACKAGES += \
	tuna_hdcp_keys

# Enable AAC 5.1 output
PRODUCT_PROPERTY_OVERRIDES += \
	media.aac_51_output_enabled=true

# SMC
PRODUCT_PACKAGES += \
	keystore.tuna

 PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/tee-fs-setup.sh:system/vendor/bin/tee-fs-setup.sh

# Init files
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/rootdir/init.tuna.rc:root/init.tuna.rc \
	$(DEVICE_FOLDER)/rootdir/init.tuna.usb.rc:root/init.tuna.usb.rc \
	$(DEVICE_FOLDER)/rootdir/ueventd.tuna.rc:root/ueventd.tuna.rc

# Fstab
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/rootdir/fstab.tuna:root/fstab.tuna

# GPS
$(call inherit-product, device/common/gps/gps_us_supl.mk)
# Legacy GPS
PRODUCT_PACKAGES += \
    gps.tuna

# Media profiles
PRODUCT_COPY_FILES += \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
	$(DEVICE_FOLDER)/media_profiles.xml:system/etc/media_profiles.xml \
	$(DEVICE_FOLDER)/media_codecs.xml:system/etc/media_codecs.xml

# Wifi
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/bcmdhd.cal:system/etc/wifi/bcmdhd.cal

PRODUCT_PACKAGES += \
	libwpa_client \
	hostapd \
	wpa_supplicant \
	wpa_supplicant.conf

PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0

# NFC
PRODUCT_PACKAGES += \
	Nfc \
	Tag

# Key maps
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/keymap/tuna-gpio-keypad.kl:system/usr/keylayout/tuna-gpio-keypad.kl \
	$(DEVICE_FOLDER)/keymap/tuna-gpio-keypad.kcm:system/usr/keychars/tuna-gpio-keypad.kcm \
	$(DEVICE_FOLDER)/keymap/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
	$(DEVICE_FOLDER)/keymap/sec_jack.kcm:system/usr/keychars/sec_jack.kcm \
	$(DEVICE_FOLDER)/keymap/sii9234_rcp.kl:system/usr/keylayout/sii9234_rcp.kl \
	$(DEVICE_FOLDER)/keymap/sii9234_rcp.kcm:system/usr/keychars/sii9234_rcp.kcm

# Input device calibration files
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/touchscreen/Melfas_MMSxxx_Touchscreen.idc:system/usr/idc/Melfas_MMSxxx_Touchscreen.idc

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml

# file that declares the MIFARE NFC constant
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml

# NFC EXTRAS add-on API
PRODUCT_PACKAGES += \
	com.android.nfc_extras
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
	NFCEE_ACCESS_PATH := $(DEVICE_FOLDER)/nfc/nfcee_access.xml
else
	NFCEE_ACCESS_PATH := $(DEVICE_FOLDER)/nfc/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
	$(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

# Low-RAM optimizations
ADDITIONAL_BUILD_PROPERTIES += \
	config.disable_atlas=true \
	dalvik.vm.dex2oat-flags=--no-watch-dog

# I/O Scheduler
PRODUCT_PROPERTY_OVERRIDES += \
	sys.io.scheduler=bfq

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072 \
	ro.sf.lcd_density=320 \
	ro.hwui.disable_scissor_opt=true \
	debug.hwui.render_dirty_regions=false

# GPU producer to CPU consumer not supported
PRODUCT_PROPERTY_OVERRIDES += \
	ro.bq.gpu_to_cpu_unsupported=1

# Newer camera API isn't supported.
PRODUCT_PROPERTY_OVERRIDES += \
	camera2.portability.force_api=1

# Disable VFR support for encoders
PRODUCT_PROPERTY_OVERRIDES += \
	debug.vfr.enable=0

PRODUCT_CHARACTERISTICS := nosdcard

# Filesystem management tools
PRODUCT_PACKAGES += \
	e2fsck \
	setup_fs

# F2FS filesystem
PRODUCT_PACKAGES += \
	mkfs.f2fs \
	fsck.f2fs \
	fibmap.f2fs \
	f2fstat

# DCC
PRODUCT_PACKAGES += \
	dumpdcc

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

$(call inherit-product-if-exists, vendor/samsung/tuna/device-vendor.mk)
