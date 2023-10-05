local M = {}

-- Enable these to show folds in col
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldcolumn = "1"

M.statuscol = function()
  local builtin = require "statuscol.builtin"
  require("statuscol").setup {
    relculright = true,
    bt_ignore = {
      "nofile",
      "prompt",
      "terminal",
      "lazy",
    },
    ft_ignore = {
      "NvimTree",
      "dashboard",
      "nvdash",
      "Nvdash",
      "nvcheatsheet",
      "help",
      "vim",
      "alpha",
      "dashboard",
      "neo-tree",
      "Trouble",
      "lazy",
      "toggleterm",
    },
    segments = {
      { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
      {
        sign = {
          name = { ".*" },
          maxwidth = 1,
          colwidth = 1,
        },
        auto = true,
        click = "v:lua.ScSa",
      },
      {
        text = { " ", builtin.lnumfunc, " " },
        click = "v:lua.ScLa",
        condition = { true, builtin.not_empty },
      },
    },
  }
end

M.ufo = function()
  require("ufo").setup {
    close_fold_kinds = { "imports" },
    provider_selector = function()
      return { "treesitter", "indent" }
    end,
  }
end

return M
