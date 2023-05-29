---@type ChadrcConfig
local M = {}
M.ui = {
	theme = "kanagawa",
	telescope = { style = "bordered" },
	nvdash = {
		load_on_startup = true,
		header = {
			[[                               _           ]],
			[[   ____   ___   ____  _   _   (_) ____ ___ ]],
			[[  / __ \ / _ \ / __ \| | / / / / / __ `__ \]],
			[[ / / / //  __// /_/ /| |/ / / / / / / / / /]],
			[[/_/ /_/ \___/ \____/ |___/ /_/ /_/ /_/ /_/ ]],
		},
	},
	statusline = {
		theme = "vscode_colored",
	},
	cmp = {
		selected_item_bg = "simple",
		border_color = "dark_purple",
	},
}
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")
return M
