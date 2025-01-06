#!/usr/bin/env bash

set -eux

mkdir -p /home/vscode/.local/bin
echo "mono /usr/local/bin/ovm.exe \"\$@\"" > /home/vscode/.local/bin/ovm
chmod +x /home/vscode/.local/bin/ovm

ovm use --install dev

source /home/vscode/.profile

opm install opm
opm install oscript-config
opm install -l
