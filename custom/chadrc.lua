---@type ChadrcConfig
local M = {}
M.ui = {
	theme = "rosepine",
	telescope = { style = "borderless" },
	nvdash = {
		-- load_on_startup = true,
		header = {
			[[   ┌┐┌┬─┐┌─┐┬  ┬┬┌┬┐   ]],
			[[   │││├┤ │ │└┐┌┘││││   ]],
			[[   ┘└┘└─┘└─┘ └┘ ┴┴ ┴   ]],
		},
	},
	statusline = {
		theme = "vscode_colored",
	},
	cmp = {
		selected_item_bg = "colored",
	},
}
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

--For changing tabs
for i = 1, 9, 1 do
	vim.keymap.set("n", string.format("<A-%s>", i), function()
		vim.api.nvim_set_current_buf(vim.t.bufs[i])
	end)
end

return M
