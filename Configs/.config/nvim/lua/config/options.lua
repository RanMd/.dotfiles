-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim.g.trouble_lualine = false

-- Disable animations
vim.g.snacks_animate = false

_G.oil_config = {
  use_default_keymaps = true,
  default_file_explorer = true,
  skip_confirm_for_simple_edits = true,
  view_options = {
    show_hidden = true,
    is_always_hidden = function(name, _)
      return name == ".." or name == ".git"
    end,
  },
  lsp_file_methods = {
    enabled = true,
    timeout_ms = 1000,
    -- Set to true to autosave buffers that are updated with LSP willRenameFiles
    -- Set to "unmodified" to only save unmodified buffers
    autosave_changes = false,
  },
  keymaps = {
    ["<A-enter>"] = { "actions.select", opts = { vertical = true } },
    ["q"] = { "actions.close", mode = "n" },
  },
}

local opt = vim.opt

opt.mouse = "" -- allow the mouse to be used in neovim
opt.number = false -- set numbered lines
opt.relativenumber = false -- set relative numbered lines
opt.numberwidth = 1 -- set number column width to 2 {default 4}
opt.hidden = true -- hide the status line
opt.cursorlineopt = "number" -- show the line numbers highlighted
