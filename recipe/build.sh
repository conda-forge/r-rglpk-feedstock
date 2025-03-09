#!/bin/bash

if [[ ${build_platform} != ${target_platform} ]]; then
    sed -i "s?R=\"\${R_HOME}/bin/R\"?R=\"${BUILD_PREFIX}/bin/R\"?" configure
    cat configure
fi

export DISABLE_AUTOBREW=1
${R} CMD INSTALL --build . ${R_ARGS}
