-- Plugin: mini.nvim
-- URL: https://github.com/echasnovski/mini.nvim
-- Description: A collection of minimal, fast, and modular Lua plugins for Neovim.
return {
  "echasnovski/mini.nvim",
  version = false, -- Use the latest version
  config = function()
    require("mini.animate").setup({
      cursor = {
        enable = false, --Disable cursos animations
      },
      resize = {
        enable = false, -- Disable resize animations
      },
      open = {
        enable = false, -- Disable open animations
      },
      close = {
        enable = false, -- Disable close animations
      },
      scroll = {
        enable = true, -- Disable scroll animations
      },
    })
  end,
}
