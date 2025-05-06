-- Define the path to the lazy.nvim plugin
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if the lazy.nvim plugin is not already installed
if not vim.uv.fs_stat(lazypath) then
  -- Bootstrap lazy.nvim by cloning the repository
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end

-- Prepend the lazy.nvim path to the runtime path
vim.opt.rtp:prepend(lazypath)

local spec_local = {}

if vim.g.vscode then
  spec_local = {
    { import = "plugins.vscode" }, -- Vscode plugins
  }
else
  spec_local = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- AI
    -- { import = "lazyvim.plugins.extras.ai.copilot" },
    -- { import = "lazyvim.plugins.extras.ai.copilot-chat" },

    -- import any extras modules here
    { import = "lazyvim.plugins.extras.editor.harpoon2" },
    { import = "lazyvim.plugins.extras.coding.mini-surround" },
    { import = "lazyvim.plugins.extras.editor.snacks_picker" },

    -- Formatting plugins
    { import = "lazyvim.plugins.extras.formatting.biome" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },

    -- Language support plugins
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json" },

    -- import/override with your plugins
    { import = "plugins" },
    { import = "plugins.editor" }, -- Plugins for the editor
    { import = "plugins.ui" }, -- Plugins for ui
    { import = "plugins.overrides" }, -- Overrides of some plugins
    { import = "plugins.lsp" }, -- LSP configs
    { import = "plugins.lang" }, -- Languages
    { import = "plugins.formatting" }, -- Formaters
    { import = "plugins.coding" }, -- Coding plugins
    { import = "plugins.ai" }, -- Coding plugins
  }
end

require("lazy").setup({
  spec = spec_local,
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  local_spec = true,
  checker = {
    enabled = true,
    notify = false,
  }, -- automatically check for plugin updates
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
