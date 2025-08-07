require("config.lazy")

if vim.g.vscode then
  require("vscode-config.config")
  return
end

local hl = vim.api.nvim_set_hl
-- Fix the black square lualine
hl(0, "StatusLine", { link = "lualine_c_normal" })

-- local colors = require("kanagawa.colors").setup()
-- local theme_colors = colors.theme
--
-- vim.print(vim.inspect(theme_colors))
