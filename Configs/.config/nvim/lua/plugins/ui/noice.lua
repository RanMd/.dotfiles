return {
  -- Plugin: noice.nvim
  -- URL: https://github.com/folke/noice.nvim
  -- Description: A Neovim plugin for enhancing the command-line UI.
  "folke/noice.nvim",
  opts = {
    presets = {
      lsp_doc_border = true,
    },
    lsp = {
      signature = {
        enabled = false,
        auto_open = {
          enabled = false,
          trigger = true,
          throttle = 50,
        },
      },
    },
  },
}
