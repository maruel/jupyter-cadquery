#!/bin/bash
# Copyright 2024 Marc-Antoine Ruel. All rights reserved.
# Use of this source code is governed under the Apache License, Version 2.0
# that can be found in the LICENSE file.

set -eu
cd "$(dirname $0)"
if [ ! -f venv/bin/activate ]; then
  echo "Run ./setup.sh first"
  exit 1
fi
source venv/bin/activate

# https://github.com/CadQuery/cadquery?tab=readme-ov-file#cadquery-installation-via-pip
# https://cadquery.readthedocs.io/en/latest/installation.html#jupyter
pip3 install --upgrade \
  PyQt5 \
  jupyterlab \
  logbook \
  pyqtgraph \
  spyder \

pip3 install --upgrade \
  cadquery

# https://github.com/CadQuery/cadquery?tab=readme-ov-file#cq-editor-gui
# There's nearly no commits. Let's ignore this for now.
#pip3 install --upgrade \
#  git+https://github.com/CadQuery/CQ-editor.git

UNAME=$(uname)

pip3 freeze > "requirements-$(uname).txt"
