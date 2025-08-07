return {
  -- Plugin: smart-splits.nvim
  -- URL: https://github.com/mrjones2014/smart-splits.nvim
  -- Description: About 🧠 Smart, seamless, directional navigation and resizing of Neovim + terminal multiplexer splits.
  "mrjones2014/smart-splits.nvim",
  keys = {
    {
      "<C-A-h>",
      function()
        require("smart-splits").resize_left()
      end,
      noremap = true,
      desc = "Resize left",
    },
    {
      "<C-A-j>",
      function()
        require("smart-splits").resize_down()
      end,
      noremap = true,
      desc = "Resize down",
    },
    {
      "<C-A-k>",
      function()
        require("smart-splits").resize_up()
      end,
      noremap = true,
      desc = "Resize up",
    },
    {
      "<C-A-l>",
      function()
        require("smart-splits").resize_right()
      end,
      noremap = true,
      desc = "Resize right",
    },

    -- Moving between splits
    {
      "<C-h>",
      function()
        require("smart-splits").move_cursor_left()
      end,
      noremap = true,
      desc = "Move cursor left",
    },
    {
      "<C-j>",
      function()
        require("smart-splits").move_cursor_down()
      end,
      noremap = true,
      desc = "Move cursor down",
    },
    {
      "<C-k>",
      function()
        require("smart-splits").move_cursor_up()
      end,
      noremap = true,
      desc = "Move cursor up",
    },
    {
      "<C-l>",
      function()
        require("smart-splits").move_cursor_right()
      end,
      noremap = true,
      desc = "Move cursor right",
    },
    {
      "<C-\\>",
      function()
        require("smart-splits").move_cursor_previous()
      end,
      noremap = true,
      desc = "Move to previous split",
    },

    -- Swapping buffers between windows
    {
      "<leader><leader>h>",
      function()
        require("smart-splits").swap_buf_left()
      end,
      noremap = true,
      desc = "Swap buffer left",
    },
    {
      "<leader><leader>j>",
      function()
        require("smart-splits").swap_buf_down()
      end,
      noremap = true,
      desc = "Swap buffer down",
    },
    {
      "<leader><leader>k>",
      function()
        require("smart-splits").swap_buf_up()
      end,
      noremap = true,
      desc = "Swap buffer up",
    },
    {
      "<leader><leader>l>",
      function()
        require("smart-splits").swap_buf_right()
      end,
      noremap = true,
      desc = "Swap buffer right",
    },
  },
}
