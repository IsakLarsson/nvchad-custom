local masonServers = {
	"rust-analyzer",
	"stylua",
	"prettier",
	"tailwindcss-language-server",
	"typescript-language-server",
}

local plugins = {
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function() require("refactoring").setup() end,
	},
	{ "tpope/vim-fugitive", event = {
		"VeryLazy",
	} },
	{
		"NvChad/nvterm",
		config = function()
			require("nvterm").setup({
				terminals = {
					type_opts = {
						float = {
							row = 0.05,
							col = 0.1,
							width = 0.8,
							height = 0.8,
						},
					},
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = true,
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@conditional.outer",
							["ic"] = "@conditional.inner",
							["ie"] = "@comment.inner",
							["l="] = "@assignment.lhs",
							["r="] = "@assignment.rhs",
							["a="] = "@assignment.outer",
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>pn"] = "@parameter.inner",
							["<leader>cn"] = "@conditional.inner",
						},
						swap_previous = {
							["<leader>pp"] = "@parameter.inner",
							["<leader>cp"] = "@conditional.inner",
						},
					},
					goto_next_start = {
						["]n"] = "@function.outer",
					},
					goto_previous_start = {
						["[n"] = "@function.outer",
					},

					lsp_interop = {
						enable = true,
						peek_definition_code = {
							["<leader>p"] = "@function.outer",
						},
					},
				},
			})
		end,
	},
	{
		"nvim-pack/nvim-spectre",
		config = function() require("spectre").setup() end,
		keys = {
			{
				"<leader>SP",
				function() require("spectre").toggle() end,
				desc = "Spectre",
			},
			{
				"<leader>SW",
				function() require("spectre").open_visual({ select_word = true }) end,
				desc = "Spectre",
			},
			{
				"<leader>SF",
				function() require("spectre").open_file_search({ select_word = true }) end,
				desc = "Spectre",
			},
		},
	},
	{
		"gbprod/substitute.nvim",
		opts = {
			highlight_substituted_text = {
				timer = 50,
			},
		},
		keys = {
			{
				"s",
				mode = "n",
				function() require("substitute").operator() end,
				desc = "Substitute",
			},
			{
				"ss",
				mode = "n",
				function() require("substitute").line() end,
				desc = "Substitute Line",
			},
			{
				"S",
				mode = "n",
				function() require("substitute").eol() end,
				desc = "Substitute to end of line",
			},
			{
				"sx",
				mode = "n",
				function() require("substitute.exchange").operator() end,
			},
			{
				"sxx",
				mode = "n",
				function() require("substitute.exchange").line() end,
			},
		},
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					auto_trigger = true,
					keymap = {
						accept = "<C-t>",
					},
				},
			})
		end,
	},
	{
		"theprimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function() require("harpoon"):setup() end,
		event = "VeryLazy",
		keys = {
			{
				"<leader>ha",
				function() require("harpoon"):list():add() end,
				desc = "harpoon file",
			},
			{
				"<leader>a",
				function()
					local harpoon = require("harpoon")
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "harpoon quick menu",
			},
			{
				"<leader>n",
				function() require("harpoon"):list():select(1) end,
				desc = "harpoon to file 1",
			},
			{
				"<leader>e",
				function() require("harpoon"):list():select(2) end,
				desc = "harpoon to file 2",
			},
			{
				"<leader>i",
				function() require("harpoon"):list():select(3) end,
				desc = "harpoon to file 3",
			},
			{
				"<leader>o",
				function() require("harpoon"):list():select(4) end,
				desc = "harpoon to file 4",
			},
		},
	},
	{
		"sindrets/diffview.nvim",
		event = "VeryLazy",
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{
		"windwp/nvim-autopairs",
		opts = {
			fast_wrap = {},
			disable_filetype = { "TelescopePrompt", "vim" },
		},
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)

			-- setup cmp for autopairs
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			require("cmp").event:on(
				"confirm_done",
				cmp_autopairs.on_confirm_done({
					filetypes = {
						elm = false,
					},
				})
			)
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		event = {
			"VeryLazy",
		},
	},
	{ "folke/which-key.nvim", enabled = false },
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function() require("nvim-surround").setup({}) end,
	},
	{
		"windwp/nvim-ts-autotag",
		ft = { "typescriptreact", "html", "javascriptreact" },
		config = function() require("nvim-ts-autotag").setup() end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				--To allow for context aware commenting in i.e tsx files where comments may have to be surrounded with braces in the tsx code
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	{
		"mbbill/undotree",
		lazy = false,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		opts = {
			auto_install = true,
		},
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = masonServers, --this shit doesnt even work
		},
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			modes = { search = { enabled = false }, char = { multi_line = false, highlight = { backdrop = false } } },
			highlight = {
				backdrop = false,
			},
		},
		keys = {
			{
				"<leader>s",
				mode = { "n", "x", "o" },
				function() require("flash").jump() end,
				desc = "Flash",
			},
			{
				"<leader>S",
				mode = { "n", "x", "o" },
				function() require("flash").treesitter() end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function() require("flash").remote() end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function() require("flash").treesitter_search() end,
				desc = "Treesitter Search",
			},
			{
				"<c-t>",
				mode = { "c" },
				function() require("flash").toggle() end,
				desc = "Toggle Flash Search",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",

		dependencies = {
			"nvimtools/none-ls.nvim",
			config = function() require("custom.configs.null-ls") end,
		},

		config = function() require("custom.configs.lspconfig") end,
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
}
return plugins
