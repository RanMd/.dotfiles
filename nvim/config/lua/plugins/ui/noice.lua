return {
  -- Plugin: noice.nvim
  -- URL: https://github.com/folke/noice.nvim
  -- Description: A Neovim plugin for enhancing the command-line UI.
  "folke/noice.nvim",
  opts = {
    -- cmdline = {
    --   view = "cmdline", -- Use the cmdline view for the command-line
    -- },
    presets = {
      lsp_doc_border = true, -- Enable LSP documentation border
    },
    lsp = {
      signature = {
        enabled = false,
        -- auto_open = {
        --   enabled = true,
        --   trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
        --   throttle = 50, -- Debounce lsp signature help request by 50ms
        -- },
        -- view = nil, -- when nil, use defaults from documentation
        -- opts = {}, -- merged with defaults from documentation
      },
    },
  },
}
