return {
  -- Plugin: FTerm.nvim
  -- URL: https://github.com/numToStr/FTerm.nvim
  -- Description: 🔥 No-nonsense floating terminal plugin for neovim 🔥
  "numToStr/FTerm.nvim",
  config = function()
    require("FTerm").setup({
      blend = 0,
    })
  end,
  keys = {
    {
      "<A-w>",
      function()
        local fterm = require("FTerm")

        local mia = fterm:new({
          ft = "fterm_gitui", -- You can also override the default filetype, if you want
          cmd = "yazi",
          dimensions = {
            height = 0.9,
            width = 0.9,
          },
        })
        mia:open()
      end,
      noremap = true,
    },

    {
      "<A-t>",
      function()
        require("FTerm").toggle()
      end,
      noremap = true,
    },
    {
      "<A-t>",
      function()
        require("FTerm").toggle()
      end,
      noremap = true,
      mode = "t",
    },
    {
      "<A-c>",
      function()
        require("FTerm").exit()
      end,
      noremap = true,
      mode = "t",
    },
    {
      "<C-c>",
      "<C-\\><C-n>", -- Es la combinación de teclas para salir de modo terminal y volver al modo normal en Neovim
      noremap = true,
      mode = "t",
    },
  },
}
