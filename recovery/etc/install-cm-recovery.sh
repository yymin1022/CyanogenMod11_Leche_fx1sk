#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 10862592 a096c97210dd8f93f01b8e99574ba4a760f50882 7856128 5442fc56a10da4edbd727721f1b5aefa9a7a7219
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:10862592:a096c97210dd8f93f01b8e99574ba4a760f50882; then
  log -t recovery "Installing new recovery image"
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:7856128:5442fc56a10da4edbd727721f1b5aefa9a7a7219 EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery a096c97210dd8f93f01b8e99574ba4a760f50882 10862592 5442fc56a10da4edbd727721f1b5aefa9a7a7219:/system/recovery-from-boot.p
else
  log -t recovery "Recovery image already installed"
fi
