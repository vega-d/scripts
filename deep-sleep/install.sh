#!/usr/bin/env bash
# this script is a part of Vega's install automation project, do not use by itself.

# from rpm-ostree documentation:
#       kargs
#           Without options, display current default kernel arguments. Modify arguments using the following
#           parameters which will create a new deployment with the modified kernel arguments. Previous deployments
#           are never changed.
#
#            --editor to use an editor to modify the kernel arguments.
#
#            --append to append a kernel argument. For example, --append=panic=1.
#
#            --append-if-missing to append a kernel argument if it is not present.

# this fix is for intel 11th gen tiger lake laptop platform, found here:
# https://community.frame.work/t/ubuntu-21-04-on-the-framework-laptop/2722/8

rpm-ostree kargs --append=mem_sleep_default=deep