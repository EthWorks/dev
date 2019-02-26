#!/bin/bash
# Copyright 2017-2019 @polkadot/dev authors & contributors
# This software may be modified and distributed under the terms
# of the Apache-2.0 license. See the LICENSE file for details.

set -e

function build_docs () {
  ROOT=$1

  DOCROOT=${ROOT/packages/.}
  typedoc --theme markdown --out ./docs/$DOCROOT $ROOT/src
}

if [ -f "typedoc.js" ]; then
  PACKAGES=( $(ls -1d packages/*) )

  for PACKAGE in "${PACKAGES[@]}"; do
    if [ ! -f "$PACKAGE/.nodoc" ]; then
      echo ""
      echo "*** Executing in $PACKAGE"

      build_docs "$PACKAGE"
    fi
  done

  if [ -d "docs/.vuepress" ]; then
    echo ""
    echo "*** Building via vuepress"

    yarn vuepress build docs

    echo ""
    echo "*** Copying vuepress HTML"
    cp -rf ./docs/.vuepress/dist/* ./docs
  fi

  echo ""
  echo "*** Docs completed"
fi

exit 0
