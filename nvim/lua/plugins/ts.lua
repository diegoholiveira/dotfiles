return {
	{
		'nvim-treesitter/nvim-treesitter',
		branch = 'master',
		lazy = false,
		build = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup({
				ensure_installed = {
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
				},
				auto_install = true,
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
			})
		end,
	}
}
