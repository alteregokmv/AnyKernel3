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
patch_cmdline "lyb_boost_def" " "
patch_cmdline "lyb_eff_def" " "
patch_cmdline "lyb_tsmod" " "
patch_cmdline "dfps.min_fps" " "
patch_cmdline "dfps.max_fps" " "
patch_cmdline "thermal.disable_dcvs" " "
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

LYB_TSMOD=0
LYB_BOOST_DEF=0
LYB_EFF_DEF=0
LYB_OOS=0

if [ -f /tmp/lyb_tsmod ]; then
  LYB_TSMOD="$(cat /tmp/lyb_tsmod)"
fi;

if [ -f /tmp/lyb_oos ]; then
  LYB_OOS="$(cat /tmp/lyb_oos)"
fi;

if [ -f /tmp/lyb_eff_def ]; then
  LYB_EFF_DEF="$(cat /tmp/lyb_eff_def)"
fi;

if [ -f /tmp/lyb_boost_def ]; then
  LYB_BOOST_DEF="$(cat /tmp/lyb_boost_def)"
fi;

if [ -f /tmp/personal] ]; then
  LYB_PERSONAL="$(cat /tmp/lyb_personal)"
fi;

if [ "$LYB_OOS" ==  1  ];then
ui_print "cmdline = lyb_tsmod=$LYB_TSMOD lyb_eff_def=$LYB_EFF_DEF lyb_boost_def=$LYB_BOOST_DEF dfps.min_fps=60 dfps.max_fps=120"
# patch_cmdline "kpti=off" "kpti=off lyb_tsmod=$LYB_TSMOD lyb_eff_def=$LYB_EFF_DEF lyb_boost_def=$LYB_BOOST_DEF dfps.min_fps=60 dfps.max_fps=120"
patch_cmdline "lyb_boost_def" "lyb_boost_def=$LYB_BOOST_DEF"
patch_cmdline "lyb_eff_def" "lyb_eff_def=$LYB_EFF_DEF"
patch_cmdline "lyb_tsmod" "lyb_tsmod=$LYB_TSMOD"
patch_cmdline "dfps.min_fps" "dfps.min_fps=60"
patch_cmdline "dfps.max_fps" "dfps.max_fps=120"
else
ui_print "cmdline = lyb_tsmod=$LYB_TSMOD lyb_eff_def=$LYB_EFF_DEF lyb_boost_def=$LYB_BOOST_DEF"
# patch_cmdline "kpti=off" "kpti=off lyb_tsmod=$LYB_TSMOD lyb_eff_def=$LYB_EFF_DEF lyb_boost_def=$LYB_BOOST_DEF dfps.min_fps=60 dfps.max_fps=120"
patch_cmdline "lyb_boost_def" "lyb_boost_def=$LYB_BOOST_DEF"
patch_cmdline "lyb_eff_def" "lyb_eff_def=$LYB_EFF_DEF"
patch_cmdline "lyb_tsmod" "lyb_tsmod=$LYB_TSMOD"
fi

if  [ "$LYB_PERSONAL" == 1 ];then
ui_print "WARNING WARNING WARNING"
ui_print "personal detected - adding more dangerous tweaks haha"
patch_cmdline "thermal.disable_dcvs" "thermal.disable_dcvs=1"
fi

write_boot;
## end install

