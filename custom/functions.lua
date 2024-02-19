local api = vim.api
local group = api.nvim_create_augroup("internal.autocmd", {})

api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.argv(0) == "" then require("telescope.builtin").find_files() end
	end,
})

api.nvim_command("command ReloadApp :silent !tmux send-keys -t app:2 'r'")

api.nvim_create_autocmd("BufEnter", {
	pattern = ".env**",
	group = group,
	callback = function(args) vim.diagnostic.disable(args.buf) end,
})

function CloseAllBuffersExceptCurrent()
	local current_buffer = api.nvim_get_current_buf()
	local buffers = api.nvim_list_bufs()

	for _, buf in ipairs(buffers) do
		if api.nvim_buf_is_loaded(buf) and buf ~= current_buffer then api.nvim_buf_delete(buf, {}) end
	end
	vim.notify("Buffers closed!", 2)
end
api.nvim_create_user_command("CloseOtherBuffers", CloseAllBuffersExceptCurrent, {})

local function telescope_error_diagnostics()
	require("telescope.builtin").diagnostics({
		{},
		severity = vim.diagnostic.severity.ERROR,
	})
end
api.nvim_create_user_command("SearchErrorDiagnostics", telescope_error_diagnostics, {})

local function invert_boolean()
	local word = vim.fn.expand("<cword>")
	local bool_table = { ["true"] = "false", ["True"] = "False", ["false"] = "true", ["False"] = "True" }
	if not bool_table[word] then
		print("Not a boolean!")
		return
	end
	vim.cmd("normal! ciw" .. bool_table[word])
end
api.nvim_create_user_command("InvertBoolean", invert_boolean, {})
