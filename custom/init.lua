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

vim.api.nvim_command("command ReloadApp :silent !tmux send-keys -t app:2 'r'")

local api = vim.api
local group = api.nvim_create_augroup("internal.autocmd", {})

api.nvim_create_autocmd("BufEnter", {
	pattern = ".env**",
	group = group,
	callback = function(args)
		vim.diagnostic.disable(args.buf)
	end,
})

function CloseAllBuffersExceptCurrent()
	local current_buffer = vim.api.nvim_get_current_buf()
	local buffers = vim.api.nvim_list_bufs()

	for _, buf in ipairs(buffers) do
		if vim.api.nvim_buf_is_loaded(buf) and buf ~= current_buffer then
			vim.api.nvim_buf_delete(buf, {})
		end
	end
end

vim.api.nvim_create_user_command("CloseOtherBuffers", CloseAllBuffersExceptCurrent, {})
