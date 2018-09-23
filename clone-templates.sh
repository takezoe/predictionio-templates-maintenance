#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)
$SCRIPT_DIR/env.sh

cd $SCRIPT_DIR

for PIO_TEMPLATE in $PIO_TEMPLATES; do
  echo "[INFO] Clone $PIO_TEMPLATE"
  rm -rf $PIO_TEMPLATE
  git clone https://git-wip-us.apache.org/repos/asf/$PIO_TEMPLATE.git
done
