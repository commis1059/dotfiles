#!/bin/sh
# usage: ./init.sh --node-json nodes/node.json

set -e

if ! [ -d /Applications/Xcode.app/Contents/Developer ]; then
  xcode-select --install
fi

if ! [ which brew ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
fi

~/dotfiles/install.sh
