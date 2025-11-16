return {
	{
		'shaunsingh/nord.nvim',
		version = "*",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme nord]])
		end
	}
}
