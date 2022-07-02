#!/usr/bin/env import

## demo name = > unzip-from-source

# docs link = > https://servingtokens.com/docs/functions/auth/authenticating-users/example-api/username-with-env-variables-example.sh
# live example = > https://bash-api-endpoint-examples.vercel.app/api/unzip-from-source
# github repo => https://github.com/servingtokens-com/public-tests/edit/main/unzip-from-source.sh

#!/bin/bash
set -euo pipefail

# `import` debug logs are always enabled during build
export IMPORT_DEBUG=1
export IMPORT_CURL_OPTS="-s -H"
export IMPORT_RELOAD=0

IMPORT_LIB="$IMPORT_CACHE/bin/lib"
lastcmd="| last cmd = $? |" 

handler() {
    echo "Installing static \`package\` binary to \"$IMPORT_LIB\"" \
    eval "$(curl -sfLS \"https://github.com/jwerre/node-canvas-lambda/blob/master/node12_canvas_lib64_layer.zip?raw=true\" > $IMPORT_LIB && unzip -o $IMPORT_LIB $IMPORT_LIB/lib &&  rm -rf $IMPORT_LIB/lib.zip:)" \
    echo "$lastcmd" \
    echo "sourcing lib \`package\` and removed the zip file" \
    eval "$(. "$IMPORT_LIB/lib")" \
    echo "$lastcmd" \
    echo "listing the contents of the IMPORT_LIB dir" \
    echo "$(ls -laiR $IMPORT_CACHE/bin)" \
    echo "$lastcmd" \
    echo "listing the contents of the IMPORT_LIB dir"
}
