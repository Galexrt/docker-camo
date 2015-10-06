#!/bin/bash

export PATH="node-v4.1.2-linux-x64/bin:$PATH"

if [ ! -d /home/camo/.git ]; then
    cd /home/camo
    git clone --recursive https://github.com/atmos/camo /home/camo
fi

chown -R camo:camo /home/camo

if [ -z "$CAMO_KEY" ]; then
  echo "No Camo Key given."
  exit 1
fi

echo "NodeJs version"
node -v
echo "==="
su camo -c "node /home/camo/server.js"
