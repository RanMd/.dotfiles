return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      auto_insert_mode = false,
      window = {
        width = 0.3,
      },
      headers = {
        user = "  User ",
        assistant = "  Copilot ",
        tool = "󱌣 Tool ",
      },
    },
    config = function(_, opts)
      local chat = require("CopilotChat")

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "copilot-chat",
        callback = function()
          vim.opt_local.relativenumber = false
          vim.opt_local.number = false
        end,
      })

      vim.keymap.set("n", "<leader>o", "", { desc = "+ai" })

      vim.keymap.set({ "n", "v" }, "<leader>oo", function()
        chat.toggle()
      end, { desc = "Toggle chat" })

      vim.keymap.set({ "n", "v" }, "<leader>op", function()
        chat.select_prompt()
      end, { desc = "Prompts actions" })

      vim.keymap.set("n", "<leader>ox", function()
        chat.reset()
      end, { desc = "Reset chat" })

      chat.setup(opts)
    end,
  },
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
    config = function()
      require("mcphub").setup()
    end,
  },
}
