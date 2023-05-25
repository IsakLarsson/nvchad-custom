local masonServers = {
  "rust-analyzer",
  "stylua",
  "prettier",
  "tailwindcss-language-server",
  "typescript-language-server",
}

local plugins = {
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  --[[ {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    opts = {
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    },
  }, ]]
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup {
        -- pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
  {
    "mbbill/undotree",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
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
    "neovim/nvim-lspconfig",

    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
}
return plugins
