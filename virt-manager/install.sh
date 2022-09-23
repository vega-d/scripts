#!/usr/bin/env bash
# this script is a part of Vega's install automation project, do not use by itself.

# this is a workaround sourced here:
# https://docs.fedoraproject.org/en-US/fedora-silverblue/troubleshooting/#_unable_to_add_user_to_group

mkdir -p ~/VMs

sudo -- -sh -c <<EOF
grep -E '^libvirt:' /usr/lib/group >> /etc/group
usermod -aG libvirt vega
EOF

sudo cp ./misc/vfio /etc/modules-load.d/vfio
sudo cp ./misc/vfio /etc/modprobe.d/vfio.conf

sudo rpm-ostree kargs \
--append-if-missing=intel_iommu=on \
pcie_acs_override=downstream,multifunction \
video=efifb:off \
video=vesa:off \
vfio-pci.ids=1002:67df,1002:aaf0 \
vfio_iommu_type1.allow_unsafe_interrupts=1 \
kvm.ignore_msrs=1

