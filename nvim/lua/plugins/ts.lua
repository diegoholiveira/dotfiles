return {
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = ':TSUpdate',
		config = function()
			local langs = {
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
			require('nvim-treesitter.install').ensure_installed(langs)
		end,
	}
}
