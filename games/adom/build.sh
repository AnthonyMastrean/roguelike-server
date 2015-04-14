#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

readonly NAME=adom
readonly VERSION=1.2.0-pre.23

fpm \
  -t deb \
  -s dir \
  --name $NAME \
  --version $VERSION \
  -C bin \
  --deb-group games \
  adom=/usr/games/adom \
  licenses=/usr/share/doc/adom/ \
  docs/adomfaq.txt=/usr/share/doc/adom/ \
  docs/credits.txt=/usr/share/doc/adom/ \
  docs/manual.txt=/usr/share/doc/adom/ \
  docs/readme1st.txt=/usr/share/doc/adom/
