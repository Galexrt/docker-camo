#!/bin/bash

export PATH="node-v4.1.2-linux-x64/bin:$PATH"

if [ ! -d /home/camo/camo/.git ]; then
    mkdir -p /home/camo/camo
    rm -rf /home/camo/camo
    git clone --recursive https://github.com/atmos/camo /home/camo/camo
fi
chown -R camo:camo /home/camo
if [ -z "$CAMO_KEY" ]; then
  echo "No Camo Key given."
fi

echo "NodeJs version"
node -v
echo "==="
su camo -c "node /home/camo/camo/server.js"
