
install -m 644 files/autossh@.service "${ROOTFS_DIR}/usr/lib/systemd/system"

mkdir -p "${ROOTFS_DIR}/opt/growbe/autossh/"

on_chroot << EOF
apt-get install autossh
EOF
