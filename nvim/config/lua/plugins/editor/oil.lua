function _G.get_oil_winbar()
  local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
  local dir = require("oil").get_current_dir(bufnr)
  if dir then
    return vim.fn.fnamemodify(dir, ":.")
  else
    -- If there is no current directory (e.g. over ssh), just show the buffer name
    return vim.api.nvim_buf_get_name(0)
  end
end

function get_path(winid)
  return vim.fn.fnamemodify(vim.fn.expand("%:p:h"), ":.")
end

return {
  -- Plugin: oil.nvim
  -- URL: https://github.com/stevearc/oil.nvim
  -- Description: A Neovim plugin for managing and navigating directories.
  "stevearc/oil.nvim",
  opts = {
    float = {
      -- Padding around the floating window
      padding = 2,
      max_width = 100,
      max_height = 35,
      get_win_title = function(winid) end,
    },
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        return name == ".." or name == ".git"
      end,
    },
    lsp_file_methods = {
      -- Enable or disable LSP file operations
      enabled = true,
      -- Time to wait for LSP file operations to complete before skipping
      timeout_ms = 1000,
      -- Set to true to autosave buffers that are updated with LSP willRenameFiles
      -- Set to "unmodified" to only save unmodified buffers
      autosave_changes = false,
    },
    -- Key mappings for oil.nvim actions
    keymaps = {
      ["g?"] = "actions.show_help", -- Show help
      ["<CR>"] = "actions.select", -- Select entry
      ["<A-enter>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" }, -- Open entry in vertical split
      ["<C-d>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" }, -- Open entry in horizontal split
      ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" }, -- Open entry in new tab
      ["<C-p>"] = "actions.preview", -- Preview entry
      ["q"] = "actions.close", -- Close oil.nvim
      ["<C-l>"] = "actions.refresh", -- Erserfu bvy.aivz
      ["-"] = "actions.parent", -- Go to parent directory
      ["_"] = "actions.open_cwd", -- Open current working directory
      ["`"] = "actions.cd", -- Change directory
      ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" }, -- Change directory for the current tab
      ["gs"] = "actions.change_sort", -- Change sorting method
      ["g."] = "actions.toggle_hidden", -- Toggle hidden files
      ["g\\"] = "actions.toggle_trash", -- Toggle trash
    },
    use_default_keymaps = false, -- Do not use default key mappings
  },
  dependencies = {
    {
      "echasnovski/mini.icons",
      opts = {
        filetype = {
          ["oil"] = { glyph = "󰏇", hl = "MiniIconsBlue" },
        },
      },
    },
  },
}
