#!/bin/bash

if [[ ${build_platform} != ${target_platform} ]]; then
    sed -i 's/R_HOME/BUILD_PREFIX/' configure
fi

export DISABLE_AUTOBREW=1
${R} CMD INSTALL --build . ${R_ARGS}
