local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local sources = {
	formatting.prettier.with({ filetypes = { "html" } }),
	formatting.stylua,
	formatting.gofmt,
	-- formatting.rustfmt,
	formatting.elm_format,
	code_actions.refactoring,
	formatting.biome,
	formatting.gleam_format,
	formatting.purs_tidy,
	formatting.black,
	formatting.clang_format,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	debug = true,
	sources = sources,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						filter = function(client) return client.name == "null-ls" end,
					})
				end,
			})
		end
	end,
})
