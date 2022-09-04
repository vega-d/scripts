#!/usr/bin/env bash
# this script is a part of Vega's install automation project, do not use by itself.

PACKAGE_LIST_FOLDERS=$(ls -d ./*/)
START_DIR=$(pwd)
PACKAGE_LIST=()

for i in $PACKAGE_LIST_FOLDERS; do
  cd "$i" || exit
  PACKAGE=$(cat packages.list 2>/dev/null)


  if [ -z "$PACKAGE" ]; then
    echo ""
  else
    PACKAGE=$(eval "echo $PACKAGE")
    PACKAGE+=" "
    PACKAGE_LIST+=("$PACKAGE")
  fi



  cd "$START_DIR" || exit
done

# shellcheck disable=SC2068
echo "will install:" ${PACKAGE_LIST[@]}
# shellcheck disable=SC2068
rpm-ostree install ${PACKAGE_LIST[@]}