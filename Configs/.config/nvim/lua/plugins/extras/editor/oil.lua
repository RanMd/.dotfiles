return {
  {
    -- Plugin: oil.nvim
    -- URL: https://github.com/stevearc/oil.nvim
    -- Description: A Neovim plugin for managing and navigating directories.
    "stevearc/oil.nvim",
    dependencies = { { "nvim-mini/mini.icons" } },
    opts = _G.oil_config,
    config = function(_, opts)
      local oil = require("oil")

      vim.keymap.set("n", "<leader>e", oil.open, { desc = "(Oil) Open parent directory" })

      vim.keymap.set("n", "<leader>bd", function()
        local buffers = vim.fn.getbufinfo({ buflisted = 1 })
        Snacks.bufdelete()
        if #buffers == 1 then
          oil.open()
        end
      end, { desc = "Delete Buffer aa", noremap = false })

      oil.setup(opts)
    end,
  },
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
}

-- opts = {
--   use_default_keymaps = true,
--   default_file_explorer = true,
--   skip_confirm_for_simple_edits = true,
--   view_options = {
--     show_hidden = true,
--     is_always_hidden = function(name, _)
--       return name == ".." or name == ".git"
--     end,
--   },
--   lsp_file_methods = {
--     enabled = true,
--     timeout_ms = 1000,
--     -- Set to true to autosave buffers that are updated with LSP willRenameFiles
--     -- Set to "unmodified" to only save unmodified buffers
--     autosave_changes = false,
--   },
--   keymaps = {
--     ["<A-enter>"] = { "actions.select", opts = { vertical = true } },
--     ["q"] = { "actions.close", mode = "n" },
--   },
-- }
