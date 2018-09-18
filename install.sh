#!/bin/sh
# usage: ./install.sh --node-json nodes/node.json

set -e

bin/setup_mitamae

case "$(uname)" in
  "Darwin") ./bin/mitamae local $@ ./bootstrap.rb ;;
  *)  echo 'unsupported environment' ;;
esac
