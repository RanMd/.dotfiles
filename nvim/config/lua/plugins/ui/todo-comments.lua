-- TODO:    todo
-- FIX:     fix
-- PERF:    perf
-- NOTE:    note
-- WARNING: warning
-- TEST:    test

return {
  -- Plugin: folke/todo-comments.nvim
  -- URL: https://github.com/folke/todo-comments.nvim
  -- Description: Plugin to highlight and search for TODO, FIX, HACK, etc. comments in your code.
  -- IMPORTANT: using version "*" to fix a bug
  {
    "folke/todo-comments.nvim",
    version = "*",
    opts = {
      signs = false,
      colors = {
        error = { "#BB5D65" },
      },
    },
  },
}
