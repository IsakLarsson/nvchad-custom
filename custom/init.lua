local opt = vim.opt -- for conciseness
vim.keymap.set("n", "U", "<C-r>") --Redo

opt.confirm = true
opt.scrolloff = 10
opt.relativenumber = true
-- tabs & indentation
-- opt.tabstop = 4
-- opt.shiftwidth = 4
-- opt.expandtab = true
-- opt.autoindent = true

-- line wrapping
-- opt.wrap = false

-- search settins
opt.incsearch = true
opt.hlsearch = false
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
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.argv(0) == "" then
			require("telescope.builtin").find_files()
		end
	end,
})

vim.api.nvim_command("command ReloadApp :!tmux send-keys -t app:2 'r'")
