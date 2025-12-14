return {
  -- Plugin: treesj.nvim
  -- URL: https://github.com/Wansmer/treesj
  -- Description: Neovim plugin for splitting/joining blocks of code
  "Wansmer/treesj",
  keys = {
    {
      "<leader>cm",
      "<CMD>TSJToggle<CR>",
      desc = "Toggle splitting/joining",
      noremap = true,
    },
  },
  cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
  config = function()
    local lang_utils = require("treesj.langs.utils")
    require("treesj").setup({
      use_default_keymaps = false,
      langs = {
        xml = {
          start_tag = lang_utils.set_default_preset({
            both = {
              omit = { "tag_name" },
            },
          }),
          self_closing_tag = lang_utils.set_default_preset({
            both = {
              omit = { "tag_name" },
              no_format_with = {},
            },
          }),
          element = lang_utils.set_default_preset({
            join = {
              space_separator = false,
            },
          }),
        },
      },
    })
  end,
}
