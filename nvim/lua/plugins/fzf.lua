return {
	{
		'ibhagwan/fzf-lua',
		version = "*",
		keys = {
			{ '<C-o>', '<cmd>lua require(\'fzf-lua\').buffers()<cr>', desc = 'Fuzzy search buffers' },
			{ '<C-p>', '<cmd>lua require(\'fzf-lua\').files()<cr>', desc = 'Fuzzy search files' },
			{ '<C-f>', '<cmd>lua require(\'fzf-lua\').live_grep()<cr>', desc = 'Fuzzy search text' },
		},
	}
}
