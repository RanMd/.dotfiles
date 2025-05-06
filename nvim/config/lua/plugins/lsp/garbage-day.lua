return {
  -- Plugin: garbage-day.nvim
  -- URL: https://github.com/Zeioth/garbage-day.nvim
  -- Description: Garbage collector that stops inactive LSP clients to free RAM
  "zeioth/garbage-day.nvim",
  dependencies = "neovim/nvim-lspconfig",
  event = "LspAttach",
  opts = {
    notifications = true,
  },
}
