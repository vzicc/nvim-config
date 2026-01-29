# Neovim config — reorganized layout

This repository contains a reorganized Neovim configuration. Changes were made to separate core editor settings from plugin management and plugin-specific configs.

Layout
- `init.lua` — entrypoint (minimal). Keeps bootstrapping and high-level requires.
- `lua/core/` — core editor settings:
  - `options.lua`, `keymaps.lua`, `diagnostics.lua`
- `lua/plugins/` — plugin manager + plugin configs:
  - `init.lua` — plugin list and lazy setup
  - `configs/` — per-plugin configuration files (e.g. `gruvbox.lua`, `telescope.lua`)
- `lua/lazy/` — kept existing `lazy` helper

Why
- Keeps `core` focused on editor behavior and `plugins` dedicated to plugin registration and configuration.
- Easier to find and manage plugin-specific code under `lua/plugins/configs`.

Revert
If you need to revert to the previous layout, a backup was saved when the reorganization was applied. To restore it, run:

```bash
tar -xzf /Users/vincent/nvim_config_backup_20260128_220557.tar.gz -C /Users/vincent
```

Quick checks
- Run Neovim healthcheck (headless):
```bash
nvim --headless -c 'checkhealth' -c 'qa!'
```
- Quick load test:
```bash
nvim --headless -c 'luafile ~/.config/nvim/init.lua' -c 'qa!'
```

Commit
If everything looks good you can commit the changes:
```bash
cd ~/.config/nvim
git add -A
git commit -m "Reorganize config: plugins -> lua/plugins + configs"
```

Contact
If you want further refinements (move `core` into a single `core/init.lua`, change naming, or split `configs` by category), tell me which direction and I can apply it.
