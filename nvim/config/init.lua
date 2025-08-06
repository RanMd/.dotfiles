require("config.lazy")

if vim.g.vscode then
  require("vscode-config.config")
  return
end

-- Fix the black square lualine
vim.api.nvim_set_hl(0, "StatusLine", { link = "lualine_c_normal" })
