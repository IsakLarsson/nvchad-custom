require("custom.functions")

local opt = vim.opt -- for conciseness
vim.keymap.set("n", "U", "<C-r>") --Redo
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "red" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "yellow" })
opt.confirm = true
opt.scrolloff = 10
opt.relativenumber = true
opt.hlsearch = true

-- tabs & indentation
-- opt.tabstop = 4
-- opt.shiftwidth = 4
-- opt.expandtab = true
-- opt.autoindent = true

-- line wrapping
-- opt.wrap = false

-- search settins
opt.incsearch = true
-- cursor line
opt.cursorline = true
-- appearance
opt.termguicolors = true
-- opt.background = "dark"
-- opt.signcolumn = "yes"
-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

opt.iskeyword:append("-")
