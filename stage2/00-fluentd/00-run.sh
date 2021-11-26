
install -m 644 files/fluentd-sources.list "${ROOTFS_DIR}/etc/apt/sources.list.d/"
install -m 644 files/fluentbit@.service "${ROOTFS_DIR}/etc/systemd/system"

mkdir -p "${ROOTFS_DIR}/opt/growbe/fluent/"

on_chroot << EOF
apt-get install curl
curl https://packages.fluentbit.io/fluentbit.key | apt-key add -
apt-get update
apt-get install td-agent-bit
EOF
