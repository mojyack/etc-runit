udevd="/lib/systemd/systemd-udevd"

echo "Starting udev and waiting for devices to settle..."
$udevd --daemon
udevadm trigger --action=add --type=subsystems
udevadm trigger --action=add --type=devices
udevadm settle
echo "Done"
