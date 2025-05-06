local colors = {
  black = "#282828",
  white = "#8992a7",
  red = "#BB5D65",
  green = "#8a9a7b",
  yellow = "#8992a7",
  gray = "#8992a7",
  darkgray = "#1F1F28",
  lightgray = "#282832",
}

local kanagawa = {
  normal = {
    a = { bg = colors.gray, fg = colors.black, gui = "bold" },
    b = { fg = colors.white },
    c = { fg = colors.white },
    y = { fg = colors.white },
  },
  insert = {
    a = { bg = colors.green, fg = colors.black, gui = "bold" },
    b = { fg = colors.green },
    c = { fg = colors.green },
    y = { fg = colors.green },
  },
  visual = {
    a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
    b = { fg = colors.white },
    c = { fg = colors.yellow },
    y = { fg = colors.yellow },
  },
  replace = {
    a = { bg = colors.red, fg = colors.black, gui = "bold" },
    y = { fg = colors.white },
  },
  command = {
    a = { bg = colors.green, fg = colors.black, gui = "bold" },
    b = { fg = colors.white },
    c = { fg = colors.white },
    y = { fg = colors.white },
  },
}

return {
  -- Plugin: lualine.nvim
  -- URL: https://github.com/nvim-lualine/lualine.nvim
  -- Description: A blazing fast and easy to configure Neovim statusline plugin.
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy", -- Load this plugin on the 'VeryLazy' event
  dependencies = {
    -- display macro recording
    { "yavorski/lualine-macro-recording.nvim" },
    -- { "nvim-tree/nvim-web-devicons" },
  },
  opts = {
    options = {
      icons_enabled = true, -- Enable icons in the statusline
      section_separators = { left = "", right = "" },
      theme = kanagawa,
    },
    sections = {
      lualine_a = { { "mode" } },
      lualine_b = { "diff", "diagnostics" },
      lualine_c = { LazyVim.lualine.pretty_path() },
      lualine_x = {
        "macro_recording",
        "branch",
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
      },
      lualine_y = {
        { "location", padding = { left = 0, right = 1 } },
      },
      lualine_z = {},
    },
  },
}
