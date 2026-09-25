return {
	{
		'nvim-treesitter/nvim-treesitter',
		branch = 'main',
		lazy = false,
		build = ':TSUpdate',
		config = function()
			require('nvim-treesitter').install(require('config.treesitter'))

			-- Start treesitter highlighting for any filetype with an available parser
			vim.api.nvim_create_autocmd('FileType', {
				callback = function(args)
					local lang = vim.treesitter.language.get_lang(args.match)
					if lang and vim.treesitter.language.add(lang) then
						vim.treesitter.start(args.buf, lang)
					end
				end,
			})
		end,
	},
}
