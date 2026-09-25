-- TypeScript 7 (native) ships a real LSP server behind `tsc --lsp --stdio`,
-- which ALE does not know about yet
local function define_tsgo_linter()
	local function project_root(buffer)
		return vim.fs.root(buffer, { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' }) or ''
	end

	for _, filetype in ipairs({ 'typescript', 'typescriptreact', 'javascript' }) do
		vim.fn['ale#linter#Define'](filetype, {
			name = 'tsgo',
			lsp = 'stdio',
			executable = 'tsc',
			command = '%e --lsp --stdio',
			project_root = project_root,
			language = filetype,
		})
	end
end

return {
	{
		'dense-analysis/ale',
		branch = 'master',
		config = function()
			require('ale').setup({
				linters_explicit = true,
				fix_on_save = true,

				-- C settings
				c_clangformat_options = '-style="{BasedOnStyle: mozilla, IndentWidth: 4, ColumnLimit: 120}"',

				-- Go settings
				go_golangci_lint_package = true,
				go_gopls_init_options = {
					gofumpt = true,
					staticcheck = true,
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						constantValues = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
				},

				-- Rust settings
				rust_analyzer_config = { check = { command = 'clippy' } },
				rust_rustfmt_options = '--edition 2024',

				-- Zig settings
				zig_zls_config = { zls = { enable_build_on_save = true } },

				-- Linters by filetype
				linters = {
					c = { 'cc', 'clang-format' },
					go = { 'golangci-lint', 'gopls' },
					hcl = { 'terraform' },
					javascript = { 'eslint', 'tsgo' },
					lua = { 'lua_language_server' },
					rust = { 'analyzer' },
					sh = { 'shellcheck' },
					typescript = { 'eslint', 'tsgo' },
					typescriptreact = { 'eslint', 'tsgo' },
					zig = { 'zls' },
				},

				-- Fixers by filetype
				fixers = {
					c = { 'clang-format' },
					css = { 'prettier' },
					go = { 'goimports', 'gofumpt' },
					hcl = { 'terraform' },
					html = { 'prettier' },
					javascript = { 'prettier' },
					json = { 'jq' },
					lua = { 'stylua' },
					rust = { 'rustfmt' },
					sh = { 'shfmt' },
					typescript = { 'prettier' },
					typescriptreact = { 'prettier' },
					zig = { 'zigfmt' },
				},
			})

			define_tsgo_linter()

			-- ALE reports through vim.diagnostic: show the message of the current line
			vim.diagnostic.config({ virtual_text = { current_line = true } })

			-- ALE starts language servers with Neovim's LSP client, so the built-in
			-- LSP features (K, grn, gra, grr, gri, completion, inlay hints) work
			vim.api.nvim_create_autocmd('LspAttach', {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client then
						return
					end

					if client:supports_method('textDocument/completion') then
						vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
					end

					if client:supports_method('textDocument/inlayHint') then
						vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
					end
				end,
			})
		end,
	},
}
