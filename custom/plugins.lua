local masonServers = {
	"rust-analyzer",
	"stylua",
	"prettier",
	"tailwindcss-language-server",
	"typescript-language-server",
}

local plugins = {
	{ "folke/which-key.nvim", enabled = false },
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		ft = { "typescriptreact", "html", "javascriptreact" },
		config = function()
			require("nvim-ts-autotag").setup()
		end,
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
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		opts = {
			auto_install = true,
		},
		context_commentstring = {
			enable = true,
		},
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = masonServers, --this shit doesnt even work
		},
	},

	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
		lazy = false,
	},
	{
		"neovim/nvim-lspconfig",

		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("custom.configs.null-ls")
			end,
		},

		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
}
return plugins
