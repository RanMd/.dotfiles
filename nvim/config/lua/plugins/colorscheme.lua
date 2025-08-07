return {
  {
    -- Plugin for the Kanagawa color scheme
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    priority = 1000, -- High priority to ensure it loads early
    opts = {
      transparent = true, -- Enable transparent background
      theme = "dragon", -- Set the theme variant to 'dragon'
      colors = {
        theme = {
          dragon = {
            ui = {
              bg_gutter = "none",
            },
            -- syn = {
            --   preproc = "#b6927b", -- i.e import - from
            -- },
            diag = {
              error = "#E46876",
              warning = "#E6C384",
            },
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme

        return {
          NormalFloat = { bg = "none" }, -- Transparent background for floating windows
          FloatBorder = { bg = "none" }, -- Transparent background for floating window borders
          FloatTitle = { bg = "none" }, -- Transparent background for floating window titles

          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 }, -- Custom colors for dark mode

          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim }, -- Custom colors for Lazy plugin
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim }, -- Custom colors for Mason plugin

          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- Custom colors for popup menu
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 }, -- Custom colors for selected item in popup menu
          PmenuSbar = { bg = theme.ui.bg_m1 }, -- Custom colors for popup menu scrollbar
          PmenuThumb = { bg = theme.ui.bg_p2 }, -- Custom colors for popup menu thumb

          -- Custom colors to Diagnostics
          MiniIndentscopeSymbol = { fg = theme.ui.special },

          -- Custom color cursorline
          CursorLineNr = { fg = theme.ui.fg_dim },

          -- Custom color file icon
          MiniIconsAzure = { fg = "#8992a7" },

          -- Custom special color (color de la carpeta con el icono)
          Special = { fg = "#8992a7" },

          -- Custom colors for TreeSitter
          ["@json.key.level0"] = { fg = theme.syn.number }, -- color for properties
          ["@json.key.level1"] = { fg = theme.syn.identifier }, -- color for properties
          ["@json.key.level2"] = { fg = theme.syn.constant }, -- color for properties
          ["@json.key.level3"] = { fg = theme.syn.operator }, -- color for properties
          ["@json.key.level4"] = { fg = theme.syn.constant }, -- color for properties
          ["@json.key.level5"] = { fg = theme.syn.fun }, -- color for properties

          ["@module"] = { fg = theme.syn.identifier },
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- Set the default colorscheme
      colorscheme = "kanagawa-dragon",
    },
  },
}
