---@param names string[]
local function snacks_provider_cmd(names)
  local commands = {}
  for _, name in ipairs(names) do
    commands[name] = { opts = { provider = "snacks" } }
  end
  return commands
end

local providers = snacks_provider_cmd({
  "file",
  "buffer",
  "fetch",
  "help",
  "image",
  "symbols",
})

providers.image = {
  opts = {
    dirs = { "~/Pictures" },
    filetypes = { "png", "jpg", "jpeg", "gif", "webp" },
    provider = "snacks",
  },
}

return {
  {
    "olimorris/codecompanion.nvim",
    opts = {
      display = {
        chat = {
          window = {
            width = 0.35,
            opts = {
              number = false,
              relativenumber = false,
              signcolumn = "yes:1",
            },
          },
        },
        action_palette = {
          provider = "snacks",
        },
      },
      strategies = {
        chat = {
          roles = { llm = " Copilot Chat", user = " User" },
          slash_commands = providers,
          keymaps = {
            close = {
              modes = {
                n = "q",
              },
              index = 3,
              callback = "keymaps.close",
              description = "Close Chat",
            },
            stop = {
              modes = {
                n = "<C-c>",
              },
              index = 4,
              callback = "keymaps.stop",
              description = "Stop Request",
            },
          },
        },
      },
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
      },
    },
    config = function(_, opts)
      local codecompanion = require("codecompanion")

      vim.keymap.set("n", "<leader>o", "", { desc = "+ai" })

      vim.keymap.set({ "n", "v" }, "<leader>oo", function()
        codecompanion.toggle()
      end, { desc = "Toggle Chat" })

      vim.keymap.set({ "n", "v" }, "<leader>op", function()
        codecompanion.actions({})
      end, { desc = "action palette" })

      vim.keymap.set("n", "<leader>oi", "<cmd>CodeCompanion<cr>", { desc = "Inline prompt" })

      vim.keymap.set("v", "<leader>oi", "<cmd>'<,'>CodeCompanion<cr>", { desc = "Inline prompt" })

      codecompanion.setup(opts)
    end,
  },
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest",
    config = function()
      require("mcphub").setup()
    end,
  },
  {
    "nvim-mini/mini.diff",
    config = function()
      local diff = require("mini.diff")
      diff.setup({
        -- Disabled by default
        source = diff.gen_source.none(),
      })
    end,
  },
}
