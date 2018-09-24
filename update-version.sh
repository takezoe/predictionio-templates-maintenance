#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
source $SCRIPT_DIR/env.sh

echo "==================================================="
echo "PIO_VERSION $PIO_VERSION"
echo "SPARK_VERSION $SPARK_VERSION"
echo "==================================================="

for PIO_TEMPLATE in $PIO_TEMPLATES; do
  echo "[INFO] Update $PIO_TEMPLATE"
  cd $SCRIPT_DIR/$PIO_TEMPLATE
  sed -e 's/"apache-predictionio-core"[ \t]*%[ \t]*".*"/"apache-predictionio-core" % "'$PIO_VERSION'" % "provided"/' build.sbt | sed -e 's/"spark-mllib"[ \t]*%[ \t]*".*"/"spark-mllib"              % "'$SPARK_VERSION'" % "provided"/' | sed -e 's/"spark-core"[ \t]*%[ \t]*".*"/"spark-core"               % "'$SPARK_VERSION'" % "provided"/'> new-build.sbt
  mv new-build.sbt build.sbt
  git diff
done

