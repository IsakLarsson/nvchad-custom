local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = {
	"rust_analyzer",
	"tsserver",
	"tailwindcss",
	"pyright",
	"cssls",
	"elmls",
	"bashls",
	"groovyls",
	"yamlls",
	"biome",
	"intelephense",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

--[[ local custom_attach = function(client)
  if client.config.flags then
    client.config.flags.allow_incremental_sync = true
  end
end
lspconfig.elmls.setup({
   on_attach = custom_attach;
}) ]]
