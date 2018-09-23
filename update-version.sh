#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)
source $SCRIPT_DIR/env.sh

echo "==================================================="
echo "PIO_VERSION $PIO_VERSION"
echo "SPARK_VERSION $SPARK_VERSION"
echo "==================================================="

for PIO_TEMPLATE in $PIO_TEMPLATES; do
  echo "[INFO] Update $PIO_TEMPLATE"
  cd $SCRIPT_DIR/$PIO_TEMPLATE
  sed -e 's/"apache-predictionio-core"[ \t]*%[ \t]*"[0-9\.]*"/"apache-predictionio-core" % "'$PIO_VERSION'"/' build.sbt | sed -e 's/"spark-mllib"[ \t]*%[ \t]*"[0-9\.]*"/"spark-mllib" % "'$SPARK_VERSION'"/' | sed -e 's/"spark-core"[ \t]*%[ \t]*"[0-9\.]*"/"spark-core" % "'$SPARK_VERSION'"/'> new-build.sbt
  mv new-build.sbt build.sbt
  git diff
done

