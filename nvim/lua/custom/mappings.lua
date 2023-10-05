local M = {}

M.disabled = {
  n = {
    ["<leader>b"] = "",
    ["<tab>"] = "",
    ["<leader>wa"] = "",
    ["<leader>wr"] = "",
    ["<leader>wl"] = "",
    ["<C-c>"] = "",
  },
}

M.general = {
  n = {
    -- Save/Write
    ["<leader>w"] = { "<cmd> w <CR>", "Save file" },
    -- Quit
    ["<leader>q"] = { "<cmd> q <CR>", "Quit" },

    -- New buffer
    ["<leader>bn"] = { "<cmd> enew <CR>", "New buffer" },
    -- Find buffer (both bf and fb exit)
    ["<leader>bf"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },

    -- switch between windows
    ["<C-Left>"] = { "<C-w>h", "Window left" },
    ["<C-Right>"] = { "<C-w>l", "Window right" },
    ["<C-Down>"] = { "<C-w>j", "Window down" },
    ["<C-Up>"] = { "<C-w>k", "Window up" },

    ["<leader>+"] = { "<C-w>+", "Increase height" },
    ["<leader>-"] = { "<C-w>-", "Decrease height" },
    ["<leader>>"] = { "<C-w>>", "Increase length" },
    ["<leader><"] = { "<C-w><", "Decrease width" },

    -- move lines
    ["<A-j>"] = { "<cmd> m .-2<CR>==", "Move line up" },
    ["<A-k>"] = { "<cmd> m .+1<CR>==", "Move line down" },

    -- Format using conform
    ["<leader>fm"] = {

      function()
        require("conform").format()
      end,
      "format with conform",
    },
  },
}

M.lspconfig = {
  n = {
    -- Add fold preview to lsp hover
    ["K"] = {
      function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end,
      "Lsp hover/fold preview",
    },
  },
}

function GetCC(input)
  CC = input
  if CC == "d" then -- Default compile commands
    local filetype = vim.bo.filetype
    if filetype == "cpp" then
      CC = string.format("g++ -pipe -O2 -std=c++11 %s -o main && ./main", vim.fn.expand "%")
    elseif filetype == "python" then
      CC = string.format("python3 %s", vim.fn.expand "%")
    elseif filetype == "rust" then
      CC = "cargo run"
    else
      CC = nil
    end
  end
end

M.compilation = {
  n = {
    -- Set compile command
    ["<leader>cc"] = {
      function()
        vim.ui.input({ prompt = "Compile Command: " }, function(input)
          GetCC(input)
        end)
      end,
      "Set Compile Command",
    },
    -- Run compile command
    ["<leader>cr"] = {
      function()
        if CC then
          require("nvterm.terminal").send("clear", "horizontal") -- Don't wanna show pfetch
          require("nvterm.terminal").send(CC, "horizontal") -- run compile command
          vim.cmd "wincmd j" -- Bring cursor to terminal
        else
          print "Compile Command not set"
        end
      end,
      "Run Compile Command",
    },
  },
}

M.tabufline = {
  plugin = true,

  n = {
    -- Next buffer
    ["<leader>bn"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    -- Previous buffer
    ["<leader>bp"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },

    -- close buffer + hide terminal buffer
    ["<leader>bc"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  },
}

M.sage = {
  n = {
    ["<leader>si"] = {
      function()
        local command = string.format(
          '0r !rg -IN -e "^from .+ import %s\\$" /usr/lib/python3.11/site-packages/sage | head -n 1',
          vim.fn.expand "<cword>"
        )
        vim.cmd(command)
      end,
      "Auto Sage Import",
    },
  },
}
return M
