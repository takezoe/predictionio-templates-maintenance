#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR

rm -rf predictionio
git clone -b develop https://git-wip-us.apache.org/repos/asf/predictionio.git
cd predictionio
sbt publishLocal

cd $SCRIPT_DIR
./clone-templates.sh
./update-version.sh
./test-templates.sh

