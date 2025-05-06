return {
  {
    "folke/snacks.nvim",
    opts = {
      indent = {
        enabled = false,
      },
    },
  },
  {
    -- Plugin: mini.indentscope
    -- URL: https://github.com/echasnovski/mini.indentscope
    -- Description: Neovim Lua plugin to visualize and operate on indent scope. Part of 'mini.nvim' library.
    "echasnovski/mini.indentscope",
    version = "*",
    config = function()
      require("mini.indentscope").setup({
        draw = {
          animation = require("mini.indentscope").gen_animation.none(),
        },
        symbol = "│",
      })
    end,
  },
}
