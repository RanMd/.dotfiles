return {
  "folke/snacks.nvim",
  dependencies = {
    "folke/todo-comments.nvim",
  },
  opts = {
    picker = {
      sources = {
        explorer = {
          matcher = {
            fuzzy = true, -- Enables fuzzy matching, so you can be a bit imprecise with your search terms
            smartcase = true, -- If your search term has uppercase letters, the search becomes case-sensitive
            ignorecase = true, -- Ignores case when searching, unless smartcase is triggered
            filename_bonus = true, -- Gives a higher priority to matches in filenames
            sort_empty = false, -- If no matches are found, it won't sort the results
          },
        },
      },
      matcher = {
        fuzzy = true,
        smartcase = true,
        ignorecase = true,
        filename_bonus = true,
      },
      layout = {
        reverse = false,
        layout = {
          box = "horizontal",
          backdrop = false,
          width = 0.7,
          height = 0.8,
          min_height = 10,
          border = "none",
          {
            box = "vertical",
            { win = "input", height = 1, border = "rounded", title = "{title} {live} {flags}", title_pos = "center" },
            { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
          },
          {
            win = "preview",
            title = "Preview",
            width = 0.45,
            border = "rounded",
            title_pos = "center",
          },
        },
      },
      win = {
        input = {
          keys = {
            ["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
            ["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["<a-CR>"] = { "edit_vsplit", mode = { "i", "n" } },
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
