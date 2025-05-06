return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
    },
    completion = {
      menu = {
        scrollbar = false,
        draw = {
          align_to = "cursor",
        },
      },
      documentation = {
        auto_show = false,
        window = {
          max_width = 50,
        },
      },
      list = {
        selection = {
          preselect = true,
          auto_insert = false,
        },
      },
      ghost_text = {
        enabled = false,
      },
      -- accept = {
      --   auto_brackets = {
      --     enabled = false,
      --   },
      -- },
    },
    signature = {
      enabled = false,
      window = {
        border = "rounded",
        show_documentation = true,
      },
      -- trigger = {
      --   enabled = false,
      -- },
    },
  },
}
