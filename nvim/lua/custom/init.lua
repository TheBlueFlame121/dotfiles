local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

autocmd({"BufNewFile", "BufRead"}, {
  pattern = {"*.sage"},
  command = "set filetype=python",
})

opt.linebreak = true
