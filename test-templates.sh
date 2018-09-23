#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)
$SCRIPT_DIR/env.sh

for PIO_TEMPLATE in $PIO_TEMPLATES; do
  echo "[INFO] Test $PIO_TEMPLATE..."
  cd $SCRIPT_DIR/$PIO_TEMPLATE
  sbt clean test
done
