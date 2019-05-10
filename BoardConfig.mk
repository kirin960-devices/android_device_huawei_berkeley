# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := KIRIN
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := generic
TARGET_BOARD_PLATFORM_GPU := kirin

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI_LIST_64_BIT := arm64-v8a
TARGET_CPU_VARIANT := cortex-a73

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

BOARD_KERNEL_CMDLINE := 

BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x8000 --ramdisk_offset 0x01000000 --tags_offset 0x0100

# phony empty kernel to satisfy build system, but this device does not
# include a kernel in the recovery image -- flash to recovery_ramdisk
TARGET_PREBUILT_KERNEL := device/huawei/berkeley/dummykernel
# else uncomment below to build from sauce
# TARGET_KERNEL_SOURCE := kernel/huawei/berkeley
# TARGET_KERNEL_CONFIG := berkeley_defconfig

# NOTE I only bother properly setting recovery image size
BOARD_BOOTIMAGE_PARTITION_SIZE := 41943040
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_HAS_NO_SELECT_BUTTON := true

BOARD_ROOT_EXTRA_FOLDERS := \
    cust \
    hw_odm \
    modem_log \
    preload \
    sec_storage \
    splash2 \
    version

TW_THEME := portrait_hdpi
BOARD_SUPPRESS_SECURE_ERASE := true
RECOVERY_SDCARD_ON_DATA := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_TWRPAPP := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd_backlight0/brightness
TW_NO_HAPTICS := true
TW_NO_SCREEN_BLANK := true
TW_USE_TOOLBOX := true
TW_USE_NEW_MINADBD := true
TW_DEFAULT_BRIGHTNESS := "2048"
TW_CUSTOM_BATTERY_PATH := /sys/class/power_supply/Battery
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/config/usb_gadget/g1/functions/mass_storage.gs6/lun.%d/file"
# Device crashes if /sbin/modprobe is present so this is needed:
BOARD_CUSTOM_BOOTIMG_MK := device/huawei/berkeley/custombootimg.mk

# Crypto
PLATFORM_SECURITY_PATCH := 2025-12-31
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true

# Debug flags
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

# seliux
SELINUX_IGNORE_NEVERALLOWS := true
BOARD_SEPOLICY_DIRS += device/huawei/berkeley/sepolicy/twrp