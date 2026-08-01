return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    sources = {
      "filesystem",
    },
    enable_git_status = false,
    hide_root_node = true,
    retain_hidden_root_indent = true,
    filesystem = {
      filtered_items = {
        show_hidden_count = false,
        hide_dotfiles = false,
        never_show = {
          ".git",
          ".editorconfig",
          "godothost",
        },
        never_show_by_pattern = {
          "*.import",
          "*.uid",
        },
      },
    },
    event_handlers = {
      {
        event = "file_opened",
        handler = function(file_path)
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
    },
    window = {
      position = "right",
    },
    nesting_rules = {
      ["project.godot"] = {
        files = { "*.sln", "*.csproj" },
        pattern = "project.godot",
      },
      [".gitignore"] = {
        files = { "%.gitattributes", "%.gitmodules", "%.gitmessage", "%.lfsconfig", "%.mailmap", "%.git-blame*" },
        pattern = "%.gitignore$",
      },
    },
  },
}
