#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)
source $SCRIPT_DIR/env.sh

cd $SCRIPT_DIR

./clone-templates.sh
./update-versions.sh

git clone -b develop https://git-wip-us.apache.org/repos/asf/predictionio.git
cd predictionio
sbt publishLocal

cd $SCRIPT_DIR

./clone-templates.sh
./update-versions.sh
./test-templates.sh

