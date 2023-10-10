local plugins = {
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
        "stylua", -- lua formatting
        "clangd", -- c/cpp lsp
        "clang-format", -- c/cpp format
        "pyright", -- python lsp
        "ruff", -- python linter
        "black", -- python formatter
        "pylama", -- python linter
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    config = function()
      require "custom.configs.nvim-lint"
    end,
  },
  {
    "stevearc/conform.nvim",
    event = "VimEnter",
    config = function()
      require "custom.configs.conform"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "c",
        "cpp",
        "python",
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      M.completion.completeopt = "menu,menuone,noselect" -- tab selects first option
      return M
    end,
    dependencies = {
      -- snippet plugin
      "L3MON4D3/LuaSnip",
      config = function(_, opts)
        -- load default luasnip config
        require("plugins.configs.others").luasnip(opts)
        require("luasnip/loaders/from_vscode").lazy_load()
      end,
    },
  },
  {
    "NvChad/nvcommunity",
    { import = "nvcommunity.diagnostics.trouble" },
    { import = "nvcommunity.editor.biscuits" },
    { import = "nvcommunity.editor.rainbowdelimiters" },
    { import = "nvcommunity.git.lazygit" },
  },
  {
    "kevinhwang91/nvim-ufo",
    event = "VimEnter",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        event = "BufAdd",
        config = function()
          require("custom.configs.ufo").statuscol()
        end,
      },
    },
    config = function()
      require("custom.configs.ufo").ufo()
    end,
  },
  {
    "anuvyklack/pretty-fold.nvim",
    event = "VimEnter",
    dependencies = {
      "anuvyklack/keymap-amend.nvim",
      {
        "anuvyklack/fold-preview.nvim",
        opts = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
      },
    },
    config = function()
      require "custom.configs.pretty-fold"
    end,
  },
}
return plugins
