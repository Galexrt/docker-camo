#!/bin/bash

if [ ! -d /home/camo/camo/.git ]; then
    mkdir -p /home/camo/camo
    rm -rf /home/camo/camo
    git clone --recursive https://github.com/atmos/camo /home/camo/camo
fi

chown -R camo:camo /home/camo
if [ -f "/home/camo/env" ]; then
    source /home/camo/env
fi

echo "=> Node version: $(node -v)"
echo "=> Starting camo as camo user"
exec su camo -c "node /home/camo/camo/server.js"
