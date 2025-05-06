return {
  -- Plugin: goto-preview
  -- URL: https://github.com/rmagatti/goto-preview
  -- Description: Provides preview functionality for definitions, declarations, implementations, type definitions, and references.
  "rmagatti/goto-preview",
  event = "BufEnter",
  config = function()
    require("goto-preview").setup({
      same_file_float_preview = false, -- Whether to open a new floating window for a reference within the current file
    })
  end,
  keys = {
    {
      "gpd",
      "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
      noremap = true, -- Do not allow remapping
      desc = "goto preview definition", -- Description for the keybinding
    },
    {
      "gpD",
      "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>",
      noremap = true,
      desc = "goto preview declaration",
    },
    {
      "gpi",
      "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
      noremap = true,
      desc = "goto preview implementation",
    },
    {
      "gpy",
      "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
      noremap = true,
      desc = "goto preview type definition",
    },
    -- Usa telescope
    --{
    --  "gpr",
    --  "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
    --  noremap = true,
    --  desc = "goto preview references",
    --},
    {
      "gP",
      "<cmd>lua require('goto-preview').close_all_win()<CR>",
      noremap = true,
      desc = "close all preview windows",
    },
    {
      "gpe",
      function()
        vim.cmd("vsplit")
        require("goto-preview").close_all_win()
      end,
      noremap = true,
      desc = "Embed the preview window",
    },
  },
}
