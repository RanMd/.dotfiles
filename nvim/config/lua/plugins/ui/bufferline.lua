return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        mode = "tabs",
        themable = true,
        style_preset = bufferline.style_preset.no_italic, -- or bufferline.style_preset.minimal,
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true, -- use a "true" to enable the default, or set your own character
          },
        },
        separator_style = { "", "" },
        show_buffer_close_icons = false,
        custom_filter = function(buf_number)
          if vim.bo[buf_number].filetype ~= "oil" then
            return true
          end
          return false
        end,
      },
      highlights = {
        buffer_selected = {
          -- fg = "#ffffff",
        },
        modified_selected = {
          fg = "#c8c093",
        },
      },
    })
  end,
}
-- return {}
