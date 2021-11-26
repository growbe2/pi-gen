
mkdir -p "${ROOTFS_DIR}/opt/growbe/"

install -m 644 files/growbe-mainboard@.service "${ROOTFS_DIR}/etc/systemd/system"
install -m 644 files/init-config.service "${ROOTFS_DIR}/etc/systemd/system"
install -m 644 files/init.sh "${ROOTFS_DIR}/opt/growbe/init.sh"

on_chroot << EOF
chmod +x /opt/growbe/init.sh
systemctl enabled init-config.service
EOF
