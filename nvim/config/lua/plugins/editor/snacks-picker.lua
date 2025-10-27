return {
  "folke/snacks.nvim",
  dependencies = {
    "folke/todo-comments.nvim",
  },
  opts = {
    picker = {
      sources = {
        projects = {
          dev = { "~/Desktop" },
          matcher = {
            sort_empty = false,
          },
        },
      },
      layout = {
        reverse = false,
        layout = {
          box = "horizontal",
          width = 0.7,
          height = 0.8,
          min_height = 10,
          {
            box = "vertical",
            { win = "input", height = 1, border = "rounded", title = "{title} {live} {flags}", title_pos = "center" },
            { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
          },
          {
            win = "preview",
            title = "Preview",
            border = "rounded",
            title_pos = "center",
          },
        },
      },
      win = {
        input = {
          keys = {
            ["<C-U>"] = { "preview_scroll_up", mode = { "i", "n" } },
            ["<C-D>"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["<A-CR>"] = { "edit_vsplit", mode = { "i", "n" } },
          },
        },
        preview = {
          minimal = true,
        },
      },
      on_show = function()
        vim.cmd("stopinsert")
      end,
      exclude = {
        "node_modules",
        "cache",
        -- "yarn.lock",
        -- "bun.lockb",
      },
    },
  },
}
