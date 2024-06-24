#!/usr/bin/env bash
set -ex
# pass uv version as first argument!

# remove virtualenv from prev attempt
rm -rf venv

# create fresh virtual env
python3.8 -m venv venv
# list all "binaries" in fresh env
ls -altr venv/bin
# activate env
. venv/bin/activate
python --version
# install uv with the version passed
pip install -U uv
# check version is used
which uv;
uv --version

# do step that behaves different for different versions
uv --verbose pip install -e '.[test]'

# list all "binaries" after install
ls -altr venv/bin

# exit venv in shell
deactivate
