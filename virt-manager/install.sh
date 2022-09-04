#!/usr/bin/env bash
# this script is a part of Vega's install automation project, do not use by itself.

# this is a workaround sourced here:
# https://docs.fedoraproject.org/en-US/fedora-silverblue/troubleshooting/#_unable_to_add_user_to_group

mkdir -p ~/VMs

sudo -- -sh -c <<EOF
grep -E '^libvirt:' /usr/lib/group >> /etc/group
usermod -aG libvirt vega
EOF

