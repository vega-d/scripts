#!/usr/bin/env bash
# this script is a part of Vega's install automation project, do not use by itself.

PACKAGE_LIST_FOLDERS=$(ls -d ./*/)
START_DIR=$(pwd)

for i in $PACKAGE_LIST_FOLDERS; do
  cd "$i" || exit

  COPR_LINK=$(cat copr 2>/dev/null)
  if [ -z "$COPR_LINK" ]; then
    echo ""
  else
    echo "installing copr for $i"
    WGET_COMMAND="sudo wget $COPR_LINK -P /etc/yum.repos.d/"
    eval $WGET_COMMAND
  fi
  cd "$START_DIR" || exit
done
