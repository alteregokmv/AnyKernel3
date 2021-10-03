#!/system/bin/sh

# Wait to set proper init values

sleep 10

# Freq
# Silver    300000 403200 499200 576000 672000 768000 844800 940800 1036800 1113600 1209600 1305600 1382400 1478400 1555200 1632000 1708800 1785600 
# Gold     710400 825600 940800 1056000 1171200 1286400 1401600 1497600 1612800 1708800 1804800 1920000 2016000 2131200 2227200 2323200 2419200 
# Gold+   825600 940800 1056000 1171200 1286400 1401600 1497600 1612800 1708800 1804800 1920000 2016000 2131200 2227200 2323200 2419200 2534400 2649600 2745600 2841600 2956800 

# CPU silver
echo 1555200 > /sys/devices/system/cpu/cpufreq/policy0/scaling_min_freq
#echo 1785600 > /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
# CPU gold
echo 710400 > /sys/devices/system/cpu/cpufreq/policy4/scaling_min_freq
#echo 1401600 > /sys/devices/system/cpu/cpufreq/policy4/scaling_max_freq
# CPU gold+
echo 825600 > /sys/devices/system/cpu/cpufreq/policy7/scaling_min_freq
#echo 1804800 > /sys/devices/system/cpu/cpufreq/policy7/scaling_max_freq

# Cpu silver
echo 1 > /sys/devices/system/cpu/cpu0/core_ctl/min_cpus
echo 95 95 95 95 > /sys/devices/system/cpu/cpu0/core_ctl/busy_up_thres
echo 90 90 90 90 > /sys/devices/system/cpu/cpu0/core_ctl/busy_down_thres
#echo 0 > /sys/devices/system/cpu/cpu0/core_ctl/offline_delay_ms
echo 0 > /sys/devices/system/cpu/cpu0/core_ctl/enable
#
# Cpu gold
echo 0 > /sys/devices/system/cpu/cpu4/core_ctl/min_cpus
echo 97 97 97 > /sys/devices/system/cpu/cpu4/core_ctl/busy_up_thres
echo 92 92 92 > /sys/devices/system/cpu/cpu4/core_ctl/busy_down_thres
#echo 0 > /sys/devices/system/cpu/cpu4/core_ctl/offline_delay_ms
echo 1 > /sys/devices/system/cpu/cpu4/core_ctl/enable
echo 3 > /sys/devices/system/cpu/cpu4/core_ctl/task_thres
#
# Cpu gold+
echo 0 > /sys/devices/system/cpu/cpu7/core_ctl/min_cpus
echo 98 > /sys/devices/system/cpu/cpu7/core_ctl/busy_up_thres
echo 93 > /sys/devices/system/cpu/cpu7/core_ctl/busy_down_thres
#echo 0 > /sys/devices/system/cpu/cpu7/core_ctl/offline_delay_ms
echo 1 > /sys/devices/system/cpu/cpu7/core_ctl/enable
echo 1 > /sys/devices/system/cpu/cpu7/core_ctl/task_thres

# CPU silver
echo "schedutil" > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
echo 1 > /sys/devices/system/cpu/cpufreq/policy0/schedutil/pl
echo 90 > /sys/devices/system/cpu/cpufreq/policy0/schedutil/hispeed_load
echo 1785600 > /sys/devices/system/cpu/cpufreq/policy0/schedutil/hispeed_freq
echo 50 > /sys/devices/system/cpu/cpufreq/policy0/schedutil/up_rate_limit_us
echo 750 > /sys/devices/system/cpu/cpufreq/policy0/schedutil/down_rate_limit_us
#
# CPU gold
echo "schedutil" > /sys/devices/system/cpu/cpufreq/policy4/scaling_governor
echo 1 > /sys/devices/system/cpu/cpufreq/policy4/schedutil/pl
echo 92 > /sys/devices/system/cpu/cpufreq/policy4/schedutil/hispeed_load
echo 1401600 > /sys/devices/system/cpu/cpufreq/policy4/schedutil/hispeed_freq
echo 1500 > /sys/devices/system/cpu/cpufreq/policy4/schedutil/up_rate_limit_us
echo 200 > /sys/devices/system/cpu/cpufreq/policy4/schedutil/down_rate_limit_us
#
# CPU gold+
echo "schedutil" > /sys/devices/system/cpu/cpufreq/policy7/scaling_governor
echo 1 > /sys/devices/system/cpu/cpufreq/policy7/schedutil/pl
echo 93 > /sys/devices/system/cpu/cpufreq/policy7/schedutil/hispeed_load
echo 1804800 > /sys/devices/system/cpu/cpufreq/policy7/schedutil/hispeed_freq
echo 2000 > /sys/devices/system/cpu/cpufreq/policy7/schedutil/up_rate_limit_us
echo 200 > /sys/devices/system/cpu/cpufreq/policy7/schedutil/down_rate_limit_us

# Setting scheduler parameters
echo 2 > /proc/sys/kernel/sched_tunable_scaling
#echo 0 > /proc/sys/kernel/sched_conservative_pl
#echo 1 > /proc/sys/kernel/sched_walt_rotate_big_tasks
echo 99 > /proc/sys/kernel/sched_group_upmigrate
echo 85 > /proc/sys/kernel/sched_group_downmigrate
echo 96 96 > /proc/sys/kernel/sched_upmigrate
echo 90 90 > /proc/sys/kernel/sched_downmigrate

# GPU
# Freq 257000000 345000000 427000000 499200000 585000000 675000000
#echo 345000000 > /sys/class/kgsl/kgsl-3d0/devfreq/max_freq
#echo 345000000 > /sys/class/kgsl/kgsl-3d0/max_gpuclk
#echo 345 > /sys/class/kgsl/kgsl-3d0/max_clock_mhz
#echo 345 > /sys/class/kgsl/kgsl-3d0/min_clock_mhz

# More
echo "Poco-X3-Pro" > /proc/sys/kernel/hostname
setprop net.hostname Poco-X3-Pro
#sysctl -w net.ipv4.tcp_congestion_control=bbr
#settings put system user_refresh_rate 90
