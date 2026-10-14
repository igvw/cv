#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"

if [[ ! -x venv/bin/python ]]; then
    "${CV_PYTHON:-python3}" -m venv venv
fi

venv/bin/python -c 'import sys; assert sys.version_info >= (3, 12), "RenderCV 2.8 requires Python 3.12 or newer"'
venv/bin/python -m pip install --disable-pip-version-check -r requirements.txt
