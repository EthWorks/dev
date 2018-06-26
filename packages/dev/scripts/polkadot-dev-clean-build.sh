#!/bin/bash
# Copyright 2017-2018 @polkadot/dev authors & contributors
# This software may be modified and distributed under the terms
# of the ISC license. See the LICENSE file for details.

set -e

function clean_build () {
  ROOT=$1

  echo ""
  echo "*** Cleaning build directory $ROOT/build"

  rimraf $ROOT/build
}

clean_build "."

if [ -d "packages" ]; then
  PACKAGES=( $(ls -1d packages/*) )

  for PACKAGE in "${PACKAGES[@]}"; do
    clean_build "$PACKAGE"
  done
fi

exit 0