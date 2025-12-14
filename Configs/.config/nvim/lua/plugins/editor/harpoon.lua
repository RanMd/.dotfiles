return {
  -- Plugin: goto-preview
  -- URL: https://github.com/rmagatti/goto-preview
  -- Description: Provides preview functionality for definitions, declarations, implementations, type definitions, and references.
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = function()
    local keys = {
      {
        "<leader>a",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon File",
        noremap = true,
      },
      {
        "<leader>i",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon Quick Menu",
      },
      {
        "<leader>h",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "Harpoon to File 1",
      },
      {
        "<leader>j",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "Harpoon to File 2",
      },
      {
        "<leader>k",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "Harpoon to File 3",
      },
      {
        "<leader>l",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "Harpoon to File 4",
      },
    }

    return keys
  end,
}
