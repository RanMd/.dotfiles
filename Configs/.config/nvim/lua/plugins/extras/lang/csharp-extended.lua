return {
  -- Rerence lazyvim plugin: https://github.com/LazyVim/LazyVim/blob/25abbf546d564dc484cf903804661ba12de45507/lua/lazyvim/plugins/extras/lang/omnisharp.lua
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        cs = { "csharpier" },
      },
      formatters = {
        csharpier = {
          command = "csharpier",
          args = { "format", "--write-stdout", "--no-msbuild-check" },
        },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "csharpier", "roslyn" },
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
    },
  },
  {
    "seblyng/roslyn.nvim",
    ft = { "cs" },
    opts = {},
  },
}
