#!/bin/sh

set -eu

if ! command -v poetry >/dev/null
then
  echo "Installing Poetry"
  curl -sSL https://install.python-poetry.org | python3 -
fi

poetry install --no-root

poetry run ansible-playbook -i inventory.yaml playbook.yaml "$@"
