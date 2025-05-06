return {
  "RanMd/winbar.nvim",
  name = "winbar.nvim",
  event = "VimEnter",
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    require("winbar").setup({
      icons = true,
      buf_modified = true,
      buf_modified_symbol = "●",
      diagnostics = false,
      dim_inactive = {
        enabled = true,
        highlight = "WinBarNC",
      },
      filetype_exclude = {
        "noice",
        "copilot-chat",
        "oil",
      },
    })
  end,
}
-- return {
--   {
--     "ramilito/winbar.nvim",
--     event = "BufReadPre", -- Alternatively, BufReadPre if we don't care about the empty file when starting with 'nvim'
--     config = function()
--       require("winbar").setup({
--         -- your configuration comes here, for example:
--         icons = true,
--         diagnostics = true,
--         buf_modified = true,
--         buf_modified_symbol = "M",
--         -- or use an icon
--         -- buf_modified_symbol = "●"
--         dim_inactive = {
--           enabled = true,
--           highlight = "Constant",
--           name = true, -- whether to dim the name
--         },
--       })
--     end,
--   },
-- }
