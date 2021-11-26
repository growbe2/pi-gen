
mkdir -p "${ROOTFS_DIR}/opt/growbe/"

install -m 644 files/growbe-mainboard@.service "${ROOTFS_DIR}/etc/systemd/system"
install -m 644 files/init-config.service "${ROOTFS_DIR}/etc/systemd/system"
install -m 644 files/init.sh "${ROOTFS_DIR}/opt/growbe/init.sh"
chmod +x "${ROOTFS_DIR}/opt/growbe/init.sh"

on_chroot << EOF
systemctl enable init-config.service
echo "i2c-dev" >> /etc/modules
sed -i '1s/^/dtparam=i2c_arm=on\n/' /boot/config.txt
EOF
