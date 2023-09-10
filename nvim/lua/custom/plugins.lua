local plugins = {
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"cpp", "c", "python", "rust"},
    event = "VeryLazy",
    opts = function ()
      return require "custom.configs.null-ls"
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "clangd",       -- c/cpp lsp
        "clang-format", -- c/cpp format
        "pyright",      -- python lsp
        "ruff",         -- python linter
        "black",        -- python formatter
        "pylama",       -- python linter
      }
    }
  },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    config = function()
      require("trouble").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "cpp",
        "python",
      }
    }
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      M.completion.completeopt = "menu,menuone,noselect" -- tab selects first option
      return M
    end,
  },
}
return plugins
