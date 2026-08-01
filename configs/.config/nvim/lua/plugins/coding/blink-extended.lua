return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
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
        window = { border = "single" },
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
    },
  },
}
