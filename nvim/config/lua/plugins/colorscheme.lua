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
        palette = {
          dragonYellow = "#bfb590",
        },
        theme = {
          dragon = {
            ui = {
              bg_gutter = "none",
            },
            syn = {
              -- special3 = "yellow", -- i.e. return
              preproc = "#b6927b", -- i.e import - from
            },
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme

        local red = "#BB5D65"
        return {
          NormalFloat = { bg = "none" }, -- Transparent background for floating windows
          FloatBorder = { bg = "none" }, -- Transparent background for floating window borders
          FloatTitle = { bg = "none" }, -- Transparent background for floating window titles

          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 }, -- Custom colors for dark mode

          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim }, -- Custom colors for Lazy plugin
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim }, -- Custom colors for Mason plugin

          -- TelescopeTitle = { fg = theme.ui.special, bold = true }, -- Custom colors for Telescope titles
          -- TelescopePromptQuery = { fg = "#c5c9c5" }, -- Custom colors for Telescope prompt
          -- TelescopePromptNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_dim }, -- Custom colors for Telescope prompt
          -- TelescopePromptBorder = { fg = theme.ui.fg_dim, bg = theme.ui.bg_dim }, -- Custom colors for Telescope prompt border
          -- TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 }, -- Custom colors for Telescope results
          -- TelescopeResultsBorder = { fg = theme.ui.special, bg = theme.ui.bg_m1 }, -- Custom colors for Telescope results border
          -- TelescopeResultsTitle = { bg = theme.ui.bg_m1, fg = theme.ui.special },
          -- TelescopePreviewNormal = { bg = theme.ui.bg_dim }, -- Custom colors for Telescope preview
          -- TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim }, -- Custom colors for Telescope preview border
          -- TelescopePreviewTitle = { bg = theme.ui.bg_dim, fg = theme.ui.special },
          -- TelescopeSelection = { bg = theme.ui.bg_p1, fg = theme.ui.fg_dim },
          -- TelescopeSelectionCaret = { fg = theme.ui.shade0 },

          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- Custom colors for popup menu
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 }, -- Custom colors for selected item in popup menu
          PmenuSbar = { bg = theme.ui.bg_m1 }, -- Custom colors for popup menu scrollbar
          PmenuThumb = { bg = theme.ui.bg_p2 }, -- Custom colors for popup menu thumb

          -- Custom colors to Diagnostics
          DiagnosticError = { fg = red },
          DiagnosticSignError = { fg = red },
          DiagnosticSignWarn = { fg = theme.ui.fg_dim },
          DiagnosticWarn = { fg = theme.ui.fg_dim },

          -- -- Custom color fzflua directories and strings
          -- FzfLuaHeaderText = { fg = "#8992a7" },

          MiniIndentscopeSymbol = { fg = theme.ui.special },

          -- Custom color cursorline
          CursorLineNr = { fg = theme.ui.fg_dim },

          -- -- Custom color modified file
          -- MatchParen = { fg = "#BFA45B" },

          -- Custom color file icon
          MiniIconsAzure = { fg = "#8992a7" },

          -- Custom special color (color de la carpeta con el icono)
          Special = { fg = "#8992a7" },

          -- Custom normal color (reemplaza al blanco)
          -- Normal = { fg = "#b6c0d6" },

          -- Custom color for the winbar
          WinBar = { fg = "#8ba4b0" },
          WinBarDir = { fg = "#697a83" },
          WinBarNC = { fg = "#4b5d5c" },
          BufferCurrentMod = { fg = theme.ui.fg_dim },
        }
      end,
    },
  },
  -- {
  --   "gmr458/cold.nvim",
  --   build = ":ColdCompile",
  --   config = function()
  --     require("cold").setup({
  --       transparent_background = true,
  --       cursorline = false,
  --       treesitter_context_bg = false,
  --       float_borderless = false,
  --     })
  --   end,
  -- },
  -- {
  --   -- Plugin for the Catppuccin color scheme
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   lazy = false, -- Load this plugin immediately
  --   opts = {
  --     transparent_background = true, -- Enable transparent background
  --     flavour = "mocha", -- Set the flavor of the color scheme
  --   },
  --   integrations = {
  --     cmp = true, -- Enable integration with nvim-cmp
  --     gitsigns = true, -- Enable integration with gitsigns
  --     nvimtree = true, -- Enable integration with nvim-tree
  --     treesitter = true, -- Enable integration with treesitter
  --     notify = false, -- Disable integration with nvim-notify
  --     mini = {
  --       enabled = true, -- Enable mini plugin integration
  --       indentscope_color = "", -- Set indentscope color (empty means default)
  --     },
  --     -- Additional plugin integrations can be found in the documentation
  --   },
  -- },
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   priority = 1000,
  --   config = function()
  --     require("gruvbox").setup({
  --       terminal_colors = true, -- add neovim terminal colors
  --       undercurl = true,
  --       underline = true,
  --       bold = true,
  --       italic = {
  --         strings = true,
  --         emphasis = true,
  --         comments = true,
  --         operators = false,
  --         folds = true,
  --       },
  --       strikethrough = true,
  --       invert_selection = false,
  --       invert_signs = false,
  --       invert_tabline = false,
  --       invert_intend_guides = false,
  --       inverse = true, -- invert background for search, diffs, statuslines and errors
  --       contrast = "", -- can be "hard", "soft" or empty string
  --       palette_overrides = {},
  --       overrides = {},
  --       dim_inactive = false,
  --       transparent_mode = true,
  --     })
  --   end,
  --   opts = ...,
  -- },
  {
    -- LazyVim configuration
    "LazyVim/LazyVim",
    opts = {
      -- Set the default colorscheme
      colorscheme = "kanagawa-dragon",
    },
  },
}
