return {
  -- Plugin: snacks.nvim
  -- URL: https://github.com/folke/snacks.nvim/tree/main
  -- Description: A Neovim plugin for creating a customizable dashboard.
  "folke/snacks.nvim",
  opts = {
    -- image = {},
    dashboard = {
      sections = {
        { section = "header" },
        { icon = "", title = "", section = "keys", indent = 2, padding = 1 },
      },
      preset = {
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
                              ||     ||                    
]],
          -- stylua: ignore
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = " ", key = "p", desc = "Projects", action = ":lua Snacks.picker.projects()", indent = 0, padding = 1 },
            { icon = " ", key = "f", desc = "Find file", action = ":lua Snacks.dashboard.pick('files')", indent = 0, padding = 1 },
            { icon = "󱎸 ", key = "g", desc = "Find text", action = ":lua Snacks.dashboard.pick('live_grep')" , indent = 0 , padding = 1},
            { icon = "󰁯 ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" ,indent = 0, padding = 1 },
            { icon = " ", key = "q", desc = "Quit", action = ":qa", indent = 0, padding = 1 },
          },
      },
    },
  },
}
