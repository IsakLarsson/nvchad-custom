local M = {}

M.disabled = {
	n = {
		["<A-i>"] = "",
		-- ["gr"] = "",
		["gi"] = "",
		["<leader>h"] = "",
		["<leader>ma"] = "",
	},
	i = {

		["jk"] = "",
	},
}
M.git = {
	n = {
		["<leader>gg"] = {
			"<cmd>LazyGit<cr>",
			"Open Lazygit",
		},
		["<leader>gc"] = {
			":!git commit -m ",
			"Git commit",
		},
		["<leader>gaa"] = {
			"<cmd>silent !git add . <cr>",
			"Git add all",
		},
		["<leader>gp"] = {
			"<cmd>!git push<cr>",
			"Git push",
		},
	},
}
M.custom = {
	n = {
		["<C-u>"] = {
			"<C-u>zz",
			"Keep code centered when scrolling halfpages",
		},
		["<leader>s"] = {
			"<cmd>vs<cr>",
			"Vertical split",
		},
		["-"] = {
			"<cmd>InvertBoolean<cr>",
			"Invert boolean value",
		},
		["<leader>rr"] = {
			"<cmd>ReloadApp<cr>",
			"Reload mobile app in other tmux session",
		},
		["<C-d>"] = {
			"<C-d>zz",
			"Keep code centered when scrolling halfpages",
		},
		["x"] = {
			'"_x"',
			"Delete character into black hole register",
		},
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
		["<leader>q"] = {
			"<cmd>:q<cr>",
			"Close current window",
		},
		["<leader>Q"] = {
			"<cmd>:qa<cr>",
			"Close all windows",
		},
		["<leader>kk"] = {
			"<cmd>CloseOtherBuffers<cr>",
			"Close all buffers except current open one",
		},
		["Q"] = {
			"@q",
			"Quickly execute Q macro",
		},
		["<leader>u"] = {
			"<cmd>:UndotreeToggle<CR>",
			"Toggle undo tree",
		},
		["<leader>rs"] = {
			"<cmd>:LspRestart<CR>",
			"Lsp Restart",
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
M.telescope = {
	n = {
		["gr"] = {
			"<cmd>Telescope lsp_references theme=ivy<cr>",
			"Show all lsp references in telescope",
		},
		["<leader>ft"] = {
			"<cmd>:Telescope file_browser initial_mode=normal<cr>",
			"Open Telescope file browser",
		},
		["<leader>fr"] = {
			"<cmd>:Telescope resume<cr>",
			"Resume last Telescope search",
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

		["<leader>fd"] = {
			function()
				vim.diagnostic.open_float({ border = "rounded" })
			end,
			"Floating diagnostic",
		},

		["]d"] = {
			function()
				vim.diagnostic.goto_next({ float = { border = "rounded" } })
			end,
			"Goto next",
		},
		["<leader>da"] = {
			"<cmd>SearchErrorDiagnostics<cr>",
			"Telescope errors",
		},
	},
}

return M
