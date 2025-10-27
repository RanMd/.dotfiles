local colors = {
  black = "#282828",
  white = "#b6927b",
  red = "#BB5D65",
  green = "#8a9a7b",
  yellow = "#8992a7",
  gray = "#8992a7",
  darkgray = "#1F1F28",
  lightgray = "#282832",
}

local kanagawa = {
  normal = {
    b = { fg = colors.white },
    c = { fg = colors.white },
    y = { fg = colors.white },
  },
  insert = {
    b = { fg = colors.green },
    z = { fg = colors.green },
  },
  visual = {
    b = { fg = colors.white },
    z = { fg = colors.yellow },
  },
  replace = {
    z = { fg = colors.white },
  },
  command = {
    b = { fg = colors.white },
    z = { fg = colors.white },
  },
}

return {
  -- Plugin: lualine.nvim
  -- URL: https://github.com/nvim-lualine/lualine.nvim
  -- Description: A blazing fast and easy to configure Neovim statusline plugin.
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    -- display macro recording
    { "yavorski/lualine-macro-recording.nvim" },
    -- { "nvim-tree/nvim-web-devicons" },
  },
  opts = {
    options = {
      icons_enabled = true, -- Enable icons in the statusline
      section_separators = {},
      theme = kanagawa,
    },
    sections = {
      lualine_a = {},
      lualine_b = { "filename" },
      lualine_c = { "diagnostics" },
      lualine_x = { "macro_recording" },
      lualine_y = {
        { "location", padding = { left = 0, right = 1 } },
      },
      lualine_z = {},
    },
  },
}
