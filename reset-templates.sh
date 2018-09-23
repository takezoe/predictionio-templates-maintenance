#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)
source $SCRIPT_DIR/env.sh

for PIO_TEMPLATE in $PIO_TEMPLATES; do
  echo "[INFO] Reset $PIO_TEMPLATE"
  cd $SCRIPT_DIR/$PIO_TEMPLATE
  git reset --hard
done
