#!/bin/bash

VERSION=node_"$0"
DISTRO="$(lsb_release -s -c)"

export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

bash $NVM_DIR/nvm.sh install node
bash $NVM_DIR/nvm.sh install-latest-npm