
install -m 644 files/growbe-mainboard@.service "${ROOTFS_DIR}/usr/lib/systemd/system"

mkdir -p "${ROOTFS_DIR}/opt/growbe/"

on_chroot << EOF
EOF
