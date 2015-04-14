#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

readonly NAME=angband
readonly VERSION=3.5.1

pushd source

./configure --disable-x11 && make && make install

popd
