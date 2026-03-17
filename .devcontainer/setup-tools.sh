#!/usr/bin/env bash
set -euo pipefail

sed -i '/oss-cad-suite\/bin/d' /home/vscode/.bashrc || true

if ! grep -q 'opt/teros-python/bin:/usr/bin' /home/vscode/.bashrc; then
    echo 'export PATH=/opt/teros-python/bin:/usr/bin:$PATH' >> /home/vscode/.bashrc
fi

export PATH=/opt/teros-python/bin:/usr/bin:$PATH

mkdir -p /home/vscode/.teroshdl/build
ln -sfn /home/vscode/.teroshdl/build "$PWD/build"

if [ -f "$PWD/.devcontainer/teros-settings.json" ]; then
    cp "$PWD/.devcontainer/teros-settings.json" /home/vscode/.teroshdl2_config.json
fi

which ghdl
ghdl --version
yosys -V