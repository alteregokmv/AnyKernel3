# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=lybkernel vayu (MiCode base)
do.devicecheck=0
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=vayu
device.name2=bhima
device.name3=
device.name4=
device.name5=
supported.versions=
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=auto;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 750 750 $ramdisk/*;


## AnyKernel install
dump_boot;

# Begin Ramdisk Changes

# migrate from /overlay to /overlay.d to enable SAR Magisk
if [ -d $ramdisk/overlay ]; then
  rm -rf $ramdisk/overlay;
fi;

remove_old_cmdline () {
patch_cmdline "lyb_boost_def=1" " "
patch_cmdline "lyb_eff_def=1" " "
patch_cmdline "lyb_tsmod=1" " "
patch_cmdline "lyb_tsmod=2" " "
patch_cmdline "dfps.min_fps=30" " "
patch_cmdline "dfps.min_fps=48" " "
patch_cmdline "dfps.min_fps=50" " "
patch_cmdline "dfps.min_fps=60" " "
patch_cmdline "dfps.min_fps=90" " "
patch_cmdline "dfps.min_fps=120" " "
patch_cmdline "dfps.max_fps=30" " "
patch_cmdline "dfps.max_fps=48" " "
patch_cmdline "dfps.max_fps=50" " "
patch_cmdline "dfps.max_fps=60" " "
patch_cmdline "dfps.max_fps=90" " "
patch_cmdline "dfps.max_fps=120" " "
}

# remove old cmd line many times just to make sure it is all cleaned up
remove_old_cmdline
remove_old_cmdline
remove_old_cmdline
remove_old_cmdline
remove_old_cmdline
remove_old_cmdline
remove_old_cmdline
remove_old_cmdline
remove_old_cmdline
remove_old_cmdline

patch_cmdline "kpti=off" "kpti=off lyb_tsmod=2"

write_boot;
## end install

