return {
	{
		'MeanderingProgrammer/render-markdown.nvim',
		version = "*",
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		opts = {
			latex = { enabled = false },
			yaml = { enabled = false },
			code = {
				language_icon = false,
			},
		},
	}
}
