return {
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "plugins.extras.formatting.biome" },
  { import = "plugins.extras.formatting.prettier-extended" },
  -- Plugin: tsc.nvim
  -- URL: https://github.com/dmmulroy/tsc.nvim
  -- Description: A Neovim plugin for seamless, asynchronous project-wide TypeScript type-checking using the TypeScript compiler (tsc)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "javascript",
        "jsdoc",
      },
    },
  },
  -- Evitar que se cargue el plugin de angular
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        angularls = {
          root_dir = function(bufnr, on_dir)
            local root = vim.fs.root(bufnr, { "angular.json", "nx.json" })
            return root and on_dir(root) or nil
          end,
          single_file_support = false,
        },
      },
    },
  },
}
