#!/bin/bash
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

kernelmodules=("tuxedo_keyboard" "clevo_wmi" "clevo_acpi")

for i in "${kernelmodules[@]}"; do
    echo "creating a policy for" $i
    ausearch -c 'insmod' -f "/var/home/vega/software/tuxedo-keyboard/src/$i.ko" --raw | audit2allow -M $i
    echo "enabling said policy right now"
    semodule -i $i.pp
    echo "policy" $i "enabled (hopefully)"
done
