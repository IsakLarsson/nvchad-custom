local M = {}

M.disabled = {
  n = {
    ["<A-i>"] = "",
    ["gr"] = "",
  },
}
M.custom = {
  n = {
    ["<leader>;"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Open floating terminal",
    },
    ["<leader>q"] = {
      "<cmd>:q<cr>",
      "Close current buffer",
    },
    ["<leader>Q"] = {
      "<cmd>:qa<cr>",
      "Close all buffers",
    },
    ["<leader>u"] = {
      "<cmd>:UndotreeToggle<CR>",
      "Toggle undo tree",
    },
  },
  i = {
    ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
  },
  v = {
    ["K"] = { ":m '<-2<CR>gv=gv", "Move selected code up" },
    ["J"] = { ":m '>+1<CR>gv=gv", "Move selected code down" },
  },
}

return M
