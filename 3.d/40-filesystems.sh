echo "Unmounting filesystems, disabling swap..."
swapoff -a
umount -r -a -t nosysfs,noproc,nodevtmpfs,notmpfs
echo "Remounting rootfs read-only..."
mount -o remount,ro /
sync
