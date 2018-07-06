#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 17629184 b86a5a41832346b78f8f005ee8fa8620a44d203e 11606016 aafd9d8c4c996ca6a1d0c930d326a1cd908b28d8
fi
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:17629184:b86a5a41832346b78f8f005ee8fa8620a44d203e; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:11606016:aafd9d8c4c996ca6a1d0c930d326a1cd908b28d8 EMMC:/dev/block/bootdevice/by-name/recovery b86a5a41832346b78f8f005ee8fa8620a44d203e 17629184 aafd9d8c4c996ca6a1d0c930d326a1cd908b28d8:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
