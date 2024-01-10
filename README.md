# dotfiles

Dotfiles and related things, managed by Ansible.

## Install

Install [Just](https://just.systems/man/en/chapter_5.html#pre-built-binaries) first.

Note `Just` will be installed by Homebrew after the first `just run`

```bash
# NOTE: Install dependencies
just install

# NOTE: Optionally update dependencies
just update
```

## Run

```bash
# NOTE: Run everything
❯ just run

# NOTE: Only run homebrew-related tasks. See `just --list` for more.
❯ just brew
```
