local color = "@variable.parameter"

return {
  -- Plugin: snacks.nvim
  -- URL: https://github.com/folke/snacks.nvim/tree/main
  -- Description: A Neovim plugin for creating a customizable dashboard.
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      sections = {
        { section = "header" },
        { section = "keys" },
      },
      formats = {
        header = { "%s", align = "center", hl = color },
        key = function(item)
          return { { item.key, hl = color } }
        end,
        desc = function(item)
          return { { item.desc, hl = color } }
        end,
        icon = function(item)
          return { { item.icon, hl = color } }
        end,
      },
      preset = {
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "p", desc = "Projects", action = ":lua Snacks.picker.projects()", indent = 0, padding = 1 },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert", indent = 0, padding = 1 },
          { icon = " ", key = "f", desc = "Find file", action = ":lua Snacks.dashboard.pick('files')", indent = 0, padding = 1 },
          { icon = "󱎸 ", key = "g", desc = "Find text", action = ":lua Snacks.dashboard.pick('live_grep')" , indent = 0 , padding = 1},
          { icon = "󰁯 ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" ,indent = 0, padding = 1 },
          { icon = " ", key = "q", desc = "Quit", action = ":qa", indent = 0, padding = 1 },
        },
        header = [[
 _________________________________________________________ 
|                                                         |
| ███    ██ ███████  ██████  ███    ███  ██████   ██████  |
| ████   ██ ██      ██    ██ ████  ████ ██    ██ ██    ██ |
| ██ ██  ██ █████   ██    ██ ██ ████ ██ ██    ██ ██    ██ |
| ██  ██ ██ ██      ██    ██ ██  ██  ██ ██    ██ ██    ██ |
| ██   ████ ███████  ██████  ██      ██  ██████   ██████  |
|                                                         |
 --------------------------------------------------------- 
                      \   ^__^                             
                       \  (oo)\_______                     
                          (__)\       )\/\                 
                              ||----w |                    
                              ||     ||                    ]],
      },
    },
  },
}
