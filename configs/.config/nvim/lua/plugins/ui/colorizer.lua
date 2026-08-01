-- #f99
return {
  -- Plugin: nvim-colorizer.lua
  -- URL: https://github.com/catgoose/nvim-colorizer.lua
  -- Description: The fastest Neovim colorizer
  "catgoose/nvim-colorizer.lua",
  cmd = { "ColorizerToggle", "ColorizerAttachToBuffer", "ColorizerDetachFromBuffer" },
  config = function()
    require("colorizer").setup()
  end,
  keys = {
    {
      "<leader>cp",
      "<CMD>ColorizerToggle<CR>",
      noremap = true,
      desc = "Toggle colorizer",
    },
  },
}
