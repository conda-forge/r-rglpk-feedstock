#!/bin/bash

set -o xtrace -o nounset -o pipefail -o errexit

if [[ ${build_platform} != ${target_platform} ]]; then
    # configure script fails but we can just substitute in correct values manually
    rm configure
    sed -e "s|@GLPK_INCLUDE_PATH@||" \
    -e "s|@GLPK_LIB_PATH@||" \
    -e "s|@GLPK_LIBS@|-lglpk|" \
    -e "s|@GLPK_TS@||" \
    src/Makevars.in > src/Makevars
fi

export DISABLE_AUTOBREW=1
${R} CMD INSTALL --build . ${R_ARGS:-}
