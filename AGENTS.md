# AGENTS.md

## Repo type

Personal dotfiles. Files are meant to be symlinked into `~/` or `~/.config/`. Do not suggest adding build, test, or CI tooling.

## Files

| File | Target |
|------|--------|
| `zshrc` | `~/.zshrc` |
| `nvim/` | `~/.config/nvim` (symlink) |
| `starship.toml` | `~/.config/starship.toml` |
| `config.ghostty` | `~/.config/ghostty/config` |

## Conventions

- Neovim: 2-space indent, spaces, relativenumber, `<space>` leader (`init.lua`)
- Shell aliases: `ls`/`l` → `eza`, `g` → `git`, `v` → activate `.venv`
- `sg [p|w]` function switches git credentials between personal and work profiles
- macOS Homebrew path: `/opt/homebrew/bin/brew`
