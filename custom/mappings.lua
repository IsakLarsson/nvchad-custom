local M = {}

M.disabled = {
	n = {
		["<A-i>"] = "",
		-- ["gr"] = "",
		["gi"] = "",
	},
	i = {

		["jk"] = "",
	},
}
M.custom = {
	n = {
		["<leader>;"] = {
			function()
				require("nvterm.terminal").toggle("float")
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
		["Q"] = {
			"@q",
			"Quickly execute Q macro",
		},
		["<leader>u"] = {
			"<cmd>:UndotreeToggle<CR>",
			"Toggle undo tree",
		},
		["<leader>fd"] = {
			function()
				vim.diagnostic.open_float({ border = "rounded" })
			end,
			"Floating diagnostic",
		},

		["†"] = {
			function()
				require("nvterm.terminal").toggle("horizontal")
			end,
			"Toggle horizontal term",
		},

		["‹"] = {
			function()
				require("nvterm.terminal").toggle("vertical")
			end,
			"Toggle vertical term",
		},
	},

	i = {
		["jkl"] = {
			"()=>{}<esc>i",
			"arrow function",
		},
	},

	v = {
		["K"] = { ":m '<-2<CR>gv=gv", "Move selected code up" },
		["J"] = { ":m '>+1<CR>gv=gv", "Move selected code down" },
	},

	t = {

		["†"] = {
			function()
				require("nvterm.terminal").toggle("horizontal")
			end,
			"Toggle horizontal term",
		},

		["‹"] = {
			function()
				require("nvterm.terminal").toggle("vertical")
			end,
			"Toggle vertical term",
		},
	},
}

M.tabufline = {
	n = {

		["öd"] = {
			function()
				vim.diagnostic.goto_next({ float = { border = "rounded" } })
			end,
			"Goto next",
		},
		["<leader>k"] = {
			function()
				require("nvchad_ui.tabufline").tabuflineNext()
			end,
			"Goto next buffer",
		},

		["<leader>j"] = {
			function()
				require("nvchad_ui.tabufline").tabuflinePrev()
			end,
			"Goto prev buffer",
		},
	},
}

return M
