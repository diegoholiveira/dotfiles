return {
	{
		'airblade/vim-gitgutter',
		version = "*",
		config = function()
			vim.g.gitgutter_map_keys = 0
			-- Git hunk navigation
			vim.keymap.set('n', '<leader>gn', '<Plug>(GitGutterNextHunk)', { desc = 'Git next hunk' })
			vim.keymap.set('n', '<leader>gp', '<Plug>(GitGutterPrevHunk)', { desc = 'Git previous hunk' })
			-- Git hunk actions
			vim.keymap.set('n', '<leader>gs', '<Plug>(GitGutterStageHunk)', { desc = 'Git stage hunk' })
			vim.keymap.set('n', '<leader>gu', '<Plug>(GitGutterUndoHunk)', { desc = 'Git undo hunk' })
			vim.keymap.set('n', '<leader>gv', '<Plug>(GitGutterPreviewHunk)', { desc = 'Git preview hunk' })
		end
	}
}
