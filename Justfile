set positional-arguments

alias brew := homebrew

# List available tasks
help:
  @just --list

# Install dependencies
install:
  curl -sSL https://install.python-poetry.org | python3 -
  poetry install --no-root

# Update Poetry and dependencies
update:
  poetry self update
  poetry update

# Run Ansible Playbook
run *args:
  poetry run ansible-playbook -i inventory.yaml playbook.yaml "$@"

# Run Ansible in check mode
check *args:
  @just run --check "$@"

# Update and install brew packages
homebrew:
  @just run -t homebrew

# Configure dotfiles and zinit
dotfiles:
  @just run -t dotfiles

# Install Krew and plugins
krew:
  @just run -t krew
