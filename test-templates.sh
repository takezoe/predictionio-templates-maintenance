#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)
source $SCRIPT_DIR/env.sh

cd $SCRIPT_DIR
git clone -b develop https://git-wip-us.apache.org/repos/asf/predictionio.git
cd predictionio
sbt publishLocal

for PIO_TEMPLATE in $PIO_TEMPLATES; do
  echo "[INFO] Test $PIO_TEMPLATE..."
  cd $SCRIPT_DIR/$PIO_TEMPLATE
  sbt clean test
done
