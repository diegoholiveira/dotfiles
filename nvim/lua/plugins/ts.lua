return {
	{
		'nvim-treesitter/nvim-treesitter',
		branch = 'master',
		lazy = false,
		build = ':TSUpdate',
		config = function()
			local ensure_installed_parsers = {
				'go',
				'typescript',
				'javascript',
				'hcl',
				'html',
				'css',
				'lua',
				'zig',
				'markdown',
				'markdown_inline',
				'python'
			}

			-- Create a set for faster lookup
			local parser_set = {}
			for _, parser in ipairs(ensure_installed_parsers) do
				parser_set[parser] = true
			end

			require('nvim-treesitter.configs').setup({
				ensure_installed = ensure_installed_parsers,
				auto_install = false,
				highlight = {
					enable = true,
					-- Only enable tree-sitter for languages in ensure_installed
					disable = function(lang, buf)
						return not parser_set[lang]
					end,
				},
				indent = {
					enable = true,
					-- Only enable tree-sitter for languages in ensure_installed
					disable = function(lang, buf)
						return not parser_set[lang]
					end,
				},
			})
		end,
	}
}
