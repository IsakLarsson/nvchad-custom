local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = {
	"rust_analyzer",
	"ts_ls",
	"pyright",
	"cssls",
	"elmls",
	"bashls",
	"groovyls",
	"yamlls",
	"biome",
	"intelephense",
	"gleam",
	"gopls",
	"clojure_lsp",
	"clangd",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
lspconfig.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "html", "elm" },
	init_options = {
		userLanguages = {
			elm = "html",
			html = "html",
		},
	},
	root_dir = require("lspconfig.util").root_pattern(".git"),
	settings = {
		tailwindCSS = {
			includeLanguages = {
				elm = "html",
				html = "html",
			},
			classAttributes = { "class", "className", "classList", "ngClass" },
			experimental = {
				classRegex = {
					'\\bclass[\\s(<|]+"([^"]*)"',
					'\\bclass[\\s(]+"[^"]*"[\\s+]+"([^"]*)"',
					'\\bclass[\\s<|]+"[^"]*"\\s*\\+{2}\\s*" ([^"]*)"',
					'\\bclass[\\s<|]+"[^"]*"\\s*\\+{2}\\s*" [^"]*"\\s*\\+{2}\\s*" ([^"]*)"',
					'\\bclass[\\s<|]+"[^"]*"\\s*\\+{2}\\s*" [^"]*"\\s*\\+{2}\\s*" [^"]*"\\s*\\+{2}\\s*" ([^"]*)"',
					'\\bclassList[\\s\\[\\(]+"([^"]*)"',
					'\\bclassList[\\s\\[\\(]+"[^"]*",\\s[^\\)]+\\)[\\s\\[\\(,]+"([^"]*)"',
					'\\bclassList[\\s\\[\\(]+"[^"]*",\\s[^\\)]+\\)[\\s\\[\\(,]+"[^"]*",\\s[^\\)]+\\)[\\s\\[\\(,]+"([^"]*)"',
				},
			},
			lint = {
				cssConflict = "warning",
				invalidApply = "error",
				invalidConfigPath = "error",
				invalidScreen = "error",
				invalidTailwindDirective = "error",
				invalidVariant = "error",
				recommendedVariantOrder = "warning",
			},
			validate = true,
		},
	},
})
--[[ local custom_attach = function(client)
  if client.config.flags then
    client.config.flags.allow_incremental_sync = true
  end
end
lspconfig.elmls.setup({
   on_attach = custom_attach;
}) ]]
