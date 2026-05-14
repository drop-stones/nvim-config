# nvim-config

LazyVim-based Neovim configuration.

<!--
README maintenance rule:
  This README lists plugins on top of LazyVim defaults — that is, plugins
  added directly by this config OR pulled in via LazyVim extras (e.g. the
  language/dap/test extras). LazyVim core defaults (gitsigns, neo-tree,
  trouble, todo-comments, mini.ai, conform, nvim-lint, etc.) are intentionally
  omitted; see https://www.lazyvim.org/configuration/plugins for that baseline.

  Sections mirror the lua/plugins/ directory structure. Descriptions are
  copied verbatim from each plugin's GitHub repository.
-->

## Coding

| Plugin | Description |
|--------|-------------|
| [better-escape.nvim](https://github.com/max397574/better-escape.nvim) | Map keys without delay when typing |
| [im-switch.nvim](https://github.com/drop-stones/im-switch.nvim) | ⌨ Neovim plugin for automatic IM switching |
| [mini.surround](https://github.com/nvim-mini/mini.surround) | Neovim Lua plugin with fast and feature-rich surround actions. Part of 'mini.nvim' library. |
| [yanky.nvim](https://github.com/gbprod/yanky.nvim) | Improved Yank and Put functionalities for Neovim |

## Core

| Plugin | Description |
|--------|-------------|
| [blink.cmp](https://github.com/saghen/blink.cmp) | Performant, batteries-included completion plugin for Neovim |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Set of preconfigured snippets for different languages |
| [neoconf.nvim](https://github.com/folke/neoconf.nvim) | 💼 Neovim plugin to manage global and project-local settings |
| [neotest](https://github.com/nvim-neotest/neotest) | An extensible framework for interacting with tests within NeoVim |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debug Adapter Protocol client implementation for Neovim |
| [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | A UI for nvim-dap |
| [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text) | Virtual text support for nvim-dap |
| [mason-nvim-dap.nvim](https://github.com/jay-babu/mason-nvim-dap.nvim) | Bridge between mason.nvim and nvim-dap |
| [nvim-nio](https://github.com/nvim-neotest/nvim-nio) | A library for asynchronous IO in Neovim |

## Language

Configured languages: Assembly, Bash/Zsh, C/C++, .NET, Graphviz (dot), Git, JSON, Just, KDL, Markdown, Nix, PowerShell, Python, Rust, TOML, TypeScript, VHS, YAML, Yuck.

Per-language LazyVim extras pull in additional plugins:

| Language | Plugin | Description |
|----------|--------|-------------|
| C/C++ | [clangd_extensions.nvim](https://github.com/p00f/clangd_extensions.nvim) | Clangd's off-spec features for neovim's LSP client |
| JSON/YAML | [SchemaStore.nvim](https://github.com/b0o/SchemaStore.nvim) | 🛍 JSON schemas for Neovim |
| Markdown | [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) | markdown preview plugin for (neo)vim |
| Markdown | [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Improve viewing Markdown in Neovim |
| Python | [neotest-python](https://github.com/nvim-neotest/neotest-python) | neotest adapter for Python |
| Python | [nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python) | nvim-dap extension for Python debugging |
| Python | [venv-selector.nvim](https://github.com/linux-cultist/venv-selector.nvim) | Allows selection of python virtual environment from within neovim |
| Rust | [crates.nvim](https://github.com/Saecki/crates.nvim) | A neovim plugin that helps managing crates.io dependencies |
| Rust | [rustaceanvim](https://github.com/mrcjkb/rustaceanvim) | 🦀 Supercharge your Rust experience in Neovim! A heavily modified fork of rust-tools.nvim |

## Navigation

| Plugin | Description |
|--------|-------------|
| [smart-splits.nvim](https://github.com/mrjones2014/smart-splits.nvim) | 🧠 Smart, seamless, directional navigation and resizing of Neovim + terminal multiplexer splits |
| [smart-splits-wsl.nvim](https://github.com/drop-stones/smart-splits-wsl.nvim) | 🌉 Bridge smart-splits.nvim across the WSL2 boundary |

## Picker

| Plugin | Description |
|--------|-------------|
| [grepscope.nvim](https://github.com/drop-stones/grepscope.nvim) | 🎯 Project-scoped, persistent glob filters for snacks.nvim grep picker |

## UI

| Plugin | Description |
|--------|-------------|
| [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) | Show code context |

## Util

| Plugin | Description |
|--------|-------------|
| [obsidian.nvim](https://github.com/obsidian-nvim/obsidian.nvim) | Obsidian 🤝 Neovim (actively maintained version) |
