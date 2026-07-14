# AGENTS.md

## Architecture
- **LazyVim**-based Neovim config. All LazyVim conventions apply.
- Entrypoint: `init.lua` → bootstraps `lazy.nvim` → loads `lua/config/lazy.lua` → imports `LazyVim/LazyVim` + `lua/plugins/`.
- Custom config lives in `lua/config/` (autocmds, keymaps, options). These files extend LazyVim defaults, not replace them.
- Custom plugins live in `lua/plugins/`. Every `.lua` file there is auto-loaded by lazy.nvim.
- `lua/plugins/example.lua` is **disabled** (`if true then return {} end`) — it's a reference template, do not edit or use it.

## Commands
- **Format Lua**: `stylua .` (config in `stylua.toml`: 2 spaces, 120 cols)
- **Check for plugin updates**: run `:Lazy check` inside Neovim
- **Sync plugins**: run `:Lazy sync` inside Neovim

## Conventions
- Plugin specs use the LazyVim override pattern: return a table with the plugin name as key, optional `opts`/`dependencies` to merge with upstream defaults.
- Use `opts = function(_, opts)` to extend lists (e.g. `ensure_installed`) rather than overwriting them — `vim.tbl_deep_extend` doesn't merge lists.
- LazyVim extras are declared in `lazyvim.json`; additional extras can be imported in plugin specs via `{ import = "lazyvim.plugins.extras.…" }`.
- Treesitter parsers: `bash`, `lua`, `markdown`, `markdown_inline`, `python`, `yaml` are explicitly installed (in `core.lua`).
- Colorscheme: `tokyonight` (with `habamax` fallback). Set transparent background via `init.lua` hl override.
