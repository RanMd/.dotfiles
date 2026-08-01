return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      sticky = "@neovim",
      auto_insert_mode = false,
      window = {
        width = 0.35,
      },
      headers = {
        user = " User ",
        assistant = " Copilot ",
        tool = "󱌣 Tool ",
      },
      separator = " ",
      show_folds = false,
    },
    config = function(_, opts)
      local chat = require("CopilotChat")

      -- Disable line numbers in the Copilot chat buffer

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "copilot-chat",
        callback = function()
          vim.opt_local.relativenumber = false
          vim.opt_local.number = false
        end,
      })

      vim.keymap.set("n", "<leader>o", "", { desc = "+ai" })
      -- Toggle Copilot chat window

      vim.keymap.set({ "n", "v" }, "<leader>oo", function()
        chat.toggle()
      end, { desc = "Toggle chat" })

      vim.keymap.set({ "n", "v" }, "<leader>op", function()
        chat.select_prompt()
        -- Reset Copilot chat session
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
    build = "npm install -g mcp-hub@latest",
    config = function()
      require("mcphub").setup({
        extensions = {
          copilotchat = {
            enabled = true,
            convert_tools_to_functions = true,
            convert_resources_to_functions = true,
            add_mcp_prefix = false,
          },
        },
      })
    end,
  },
}
