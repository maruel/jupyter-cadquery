#!/bin/bash
# Copyright 2024 Marc-Antoine Ruel. All rights reserved.
# Use of this source code is governed under the Apache License, Version 2.0
# that can be found in the LICENSE file.

set -eu
cd "$(dirname $0)"

if [ ! -f venv/bin/activate ]; then
  echo "Setting up virtualenv"
  # Do not use "virtualenv" since it won't use the right python3 version.
  python3 -m venv venv
fi

# Ubuntu users may have to:
#   sudo apt install build-essential libssl-dev python3-dev

UNAME=$(uname)

# requirements.txt doesn't work at all cross platforms.
# pip3 install -q -r "requirements-$(uname).txt"

./upgrade.sh
