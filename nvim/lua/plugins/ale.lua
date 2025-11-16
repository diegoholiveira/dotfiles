return {
	{
		'dense-analysis/ale',
		version = "*",
		-- Settings that must be configured BEFORE ALE loads
		init = function()
			-- Disable Neovim's LSP API integration to avoid gopls configuration errors
			-- This makes ALE use its own LSP implementation (same as Vim)
			vim.g.ale_use_neovim_lsp_api = false

			-- Enable ALE completion
			vim.g.ale_completion_enabled = 1
		end,
		-- Settings that can be configured AFTER ALE loads
		config = function()
			-- ALE global settings
			vim.g.ale_linters_explicit = 1
			vim.g.ale_fix_on_save = 1

			-- C settings
			vim.b.ale_c_clangformat_options = '-style="{BasedOnStyle: mozilla, IndentWidth: 4, ColumnLimit: 120}"'

			-- Go settings
			vim.b.ale_go_golangci_lint_package = 1
			vim.b.go_gopls_use_global = 1

			-- Python settings
			vim.b.ale_python_auto_uv = 1

			-- Linters by filetype
			vim.g.ale_linters = {
				c = {'cc', 'clang-format'},
				go = {'golangci-lint', 'gopls'},
				hcl = {'terraform'},
				javascript = {'eslint'},
				markdown = {},
				python = {'ruff', 'jedi_language_server'},
				ruby = {'rails_best_practices', 'ruby', 'rubocop'},
				rust = {'analyzer'},
				sh = {'shellcheck'},
				typescript = {'eslint', 'tsserver'},
				typescriptreact = {'eslint', 'tsserver'},
				vim = {'vint'},
			}

			-- Fixers by filetype
			vim.g.ale_fixers = {
				c = {'clang-format'},
				css = {'prettier'},
				go = {'gofumpt', 'goimports'},
				hcl = {'terraform'},
				html = {'prettier'},
				javascript = {'prettier', 'eslint'},
				json = {'jq'},
				markdown = {},
				python = {'ruff', 'ruff_format', 'isort'},
				ruby = {'rubocop'},
				rust = {'rustfmt'},
				sh = {'shfmt'},
				typescript = {'prettier', 'eslint'},
				typescriptreact = {'prettier', 'eslint'},
			}
		end
	}
}
