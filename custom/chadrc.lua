---@type ChadrcConfig
local M = {}
M.ui = {
	theme = "everforest",
	telescope = { style = "bordered" },
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
	tabufline = {
		enabled = false,
	},
	hl_override = {
		TelescopeSelection = { bg = "nord_blue", fg = "one_bg" },
		TelescopeResultsTitle = { bg = "NONE", fg = "nord_blue" },
		TelescopePromptTitle = { bg = "NONE", fg = "vibrant_green" },
		TelescopePreviewTitle = { bg = "NONE", fg = "dark_purple" },
		Visual = { bg = "vibrant_green", fg = "one_bg" },
	},
}
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

--For changing tabs
for i = 1, 9, 1 do
	vim.keymap.set("n", string.format("<A-%s>", i), function() vim.api.nvim_set_current_buf(vim.t.bufs[i]) end)
end
--treesitter textobjects
local links = {
	["@lsp.type.namespace"] = "@namespace",
	["@lsp.type.type"] = "@type",
	["@lsp.type.class"] = "@type",
	["@lsp.type.enum"] = "@type",
	["@lsp.type.interface"] = "@type",
	["@lsp.type.struct"] = "@structure",
	["@lsp.type.parameter"] = "@parameter",
	["@lsp.type.variable"] = "@variable",
	["@lsp.type.property"] = "@property",
	["@lsp.type.enumMember"] = "@constant",
	["@lsp.type.function"] = "@function",
	["@lsp.type.method"] = "@method",
	["@lsp.type.macro"] = "@macro",
	["@lsp.type.decorator"] = "@function",
}
for newgroup, oldgroup in pairs(links) do
	vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true })
end
return M
