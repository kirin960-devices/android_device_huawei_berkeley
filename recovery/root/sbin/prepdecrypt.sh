#!/sbin/sh

relink()
{
	fname=$(basename "$1")
	target="/sbin/$fname"
	sed 's|/system/bin/linker64|///////sbin/linker64|' "$1" > "$target"
	chmod 755 $target
}

finish()
{
	umount /s
	umount /v
	setprop crypto.ready 1
	exit 0
}

syspath="/dev/block/bootdevice/by-name/system"
mount -t ext4 -o ro /system_root
syspath="/dev/block/bootdevice/by-name/vendor"
mount -t ext4 -o ro /vendor

is_fastboot_twrp=$(getprop ro.boot.fastboot)
if [ ! -z "$is_fastboot_twrp" ]; then
	osver=$(getprop ro.build.version.release_orig)
	patchlevel=$(getprop ro.build.version.security_patch_orig)
	setprop ro.build.version.release "$osver"
	setprop ro.build.version.security_patch "$patchlevel"
	finish
fi

build_prop_path="/s/build.prop"
if [ -f /system_root/system/build.prop ]; then
	build_prop_path="/s/system/build.prop"
fi
if [ -f "$build_prop_path" ]; then
	# TODO: It may be better to try to read these from the boot image than from /system
	osver=$(grep -i 'ro.build.version.release' "$build_prop_path"  | cut -f2 -d'=')
	patchlevel=$(grep -i 'ro.build.version.security_patch' "$build_prop_path"  | cut -f2 -d'=')
	setprop ro.build.version.release "$osver"
	setprop ro.build.version.security_patch "$patchlevel"
	finish
else
	# Be sure to increase the PLATFORM_VERSION in build/core/version_defaults.mk to override Google's anti-rollback features to something rather insane
	osver=$(getprop ro.build.version.release_orig)
	patchlevel=$(getprop ro.build.version.security_patch_orig)
	setprop ro.build.version.release "$osver"
	setprop ro.build.version.security_patch "$patchlevel"
	finish
fi

finish
exit 0
