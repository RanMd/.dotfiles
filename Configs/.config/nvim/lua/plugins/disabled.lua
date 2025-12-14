-- This file contains the configuration for disabling specific Neovim plugins.

return {
  { "akinsho/bufferline.nvim", enabled = false },
  { "ibhagwan/fzf-lua", enabled = false },
  { "catppuccin/nvim", enabled = false },
  -- { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  { "dinhhuy258/git.nvim", enabled = false },
  { "nvim-mini/mini.pick", enabled = false },
  {
    "folke/snacks.nvim",
    opts = { indent = { enabled = false } },
  },
}
