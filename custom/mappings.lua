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
		["Ä"] = {
			",",
			"Goto previous find character",
		},
		["ä"] = {
			";",
			"Goto next find character",
		},
		["<leader>;"] = {
			function()
				require("nvterm.terminal").toggle("float")
			end,
			"Open floating terminal",
		},
		["<leader>gg"] = {
			function()
				require("nvterm.terminal").send("lazygit", "float") -- the 2nd argument i.e direction is optional
			end,
			"Open floating terminal",
		},
		["<leader>q"] = {
			"<cmd>:q<cr>",
			"Close current window",
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
M.tmux = {
	n = {
		["<C-h>"] = { ":TmuxNavigateLeft <CR>", "Tmux focus left", opts = { silent = true } },
		["<C-j>"] = { ":TmuxNavigateDown <CR>", "Tmux focus down", opts = { silent = true } },
		["<C-k>"] = { ":TmuxNavigateUp <CR>", "Tmux focus up", opts = { silent = true } },
		["<C-l>"] = { ":TmuxNavigateRight <CR>", "Tmux focus right", opts = { silent = true } },
	},
}
M.diagnostics = {
	n = {

		["öd"] = {
			function()
				vim.diagnostic.goto_next({ float = { border = "rounded" } })
			end,
			"Goto next",
		},
	},
}

return M
