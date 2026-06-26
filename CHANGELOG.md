# Changelog

## 2026-05-09 - Zsh Startup and Completion Cleanup

### Changed
- Centralized interactive shell orchestration in `zshrc`, keeping `shell/env.sh` focused on environment variables, PATH setup, and runtime configuration.
- Moved Zinit bootstrap out of `shell/env.sh` and into `zshrc`, so plugin loading now lives with the rest of the interactive shell setup.
- Reworked completion initialization so Homebrew zsh completions are added once and `compinit` runs from a single location.
- Loaded Powerlevel10k early via zinit with only `depth=1`, matching Powerlevel10k's supported zinit pattern and avoiding delayed theme initialization.
- Changed the `reload` command to restart zsh with `exec zsh` instead of sourcing `.zshrc`, which is not compatible with Powerlevel10k instant prompt after a prompt has already rendered.
- Replaced eager NVM startup loading with lazy loading for `nvm`, `node`, `npm`, and `npx`, reducing shell startup work.
- Switched Homebrew initialization from per-shell `brew shellenv` execution to static prefix setup for faster startup.
- Replaced the `cd` alias with zoxide's official zsh initialization using `--cmd cd`.

### Fixed
- Removed the incomplete trailing `autoload -U compinit` from `zshrc`.
- Disabled `zsh-autocomplete` to avoid overlap with Warp, Powerlevel10k, fzf, and autosuggestions.
- Prevented stale `zsh-autocomplete` completion paths from remaining in `fpath`.
- Stopped `colorscript` from running during shell startup, avoiding output that can interfere with Powerlevel10k instant prompt and Warp shell integration.
- Fixed the Powerlevel10k instant prompt warning caused by loading the theme too late in the startup sequence.
- Fixed first-prompt fallback behavior by loading Powerlevel10k for interactive shells rather than tying theme setup to stdout TTY detection.
- Made `LANG` and `LC_ALL` consistently use `en_US.UTF-8`.
- Changed pipeline shortcuts `H`, `T`, `G`, and `L` into global aliases so they work after commands.
- Guarded `pbcopy` and `pbpaste` so Linux uses `xclip` only when available and macOS keeps native commands.
- Replaced the plain `claude` alias with a guard function that exits non-zero and directs usage to `claude-dg` or `claude-verisk`.

### Improved
- Added a PATH helper to prevent duplicate PATH entries when shell files are re-sourced.
- Set both `EDITOR` and `VISUAL` to `nvim`.
- Reduced history size to a more practical `100000` entries and removed `HIST_BEEP`.
- Added practical interactive shell options for directory navigation, completion behavior, case-insensitive globbing, and interactive comments.
- Added TTY guards around Powerlevel10k loading so scripted interactive shell checks stay quiet while normal terminal startup keeps the prompt.

### Verified
- `zsh -n` passes for `zshrc`, `shell/env.sh`, and `shell/alias.sh`.
- Clean interactive startup succeeds.
- Homebrew's zsh completion directory appears once in `fpath`.
- Completions resolve for Brew, GitHub CLI, AWS CLI, uv, zoxide, and git.
- Lazy NVM loading works for `nvm`, `node`, and `npm`.
- Zoxide-backed `cd` works for normal directory changes.
- The guarded `claude` command exits with status `1`.
