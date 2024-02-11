echo "Mounting pseudo-filesystems..."
mountpoint -q /proc || mount -t proc     -o rw,relatime                     proc /proc
mountpoint -q /sys  || mount -t sysfs    -o rw,nosuid,nodev,noexec,relatime sys  /sys
mountpoint -q /run  || mount -t tmpfs    -o mode=0755,rw,nosuid,nodev       run  /run
mountpoint -q /tmp  || mount -t tmpfs    -o rw,nosuid,nodev                 tmp  /tmp
mountpoint -q /dev  || mount -t devtmpfs -o mode=0755,rw,relatime           dev  /dev
mkdir -p -m0755 /run/user /run/lock /run/log /dev/pts /dev/shm
mountpoint -q /dev/pts || mount -t devpts -o mode=0620,gid=5,nosuid,noexec,relatime -n devpts /dev/pts
mountpoint -q /dev/shm || mount -t tmpfs  -o rw,nosuid,nodev                        -n shm    /dev/shm

if [ -d /sys/firmware/efi/efivars ]; then
    mountpoint -q /sys/firmware/efi/efivars || mount -t efivarfs -o nosuid,noexec,nodev efivarfs /sys/firmware/efi/efivars
fi
echo "Done."
