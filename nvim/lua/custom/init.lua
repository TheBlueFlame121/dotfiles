local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

autocmd("FileType", {
  callback = function()
    if vim.bo.ft == "nvdash" then
      vim.o.foldcolumn = "0"
    else
      vim.o.foldcolumn = "1"
    end
  end,
})

autocmd({ "InsertLeave", "BufWritePost" }, {
  callback = function()
    local lint_status, lint = pcall(require, "lint")
    if lint_status then
      lint.try_lint()
    end
  end,
})

opt.linebreak = true
opt.foldlevelstart = 5
