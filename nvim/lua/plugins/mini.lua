return {
	{
		'nvim-mini/mini.trailspace',
		version = "*",
		config = function()
			require('mini.trailspace').setup()
		end
	},
	{
		'nvim-mini/mini.statusline',
		version = "*",
		config = function()
			local statusline = require('mini.statusline')
			statusline.setup({
				content = {
					active = function()
						local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })

						-- Custom filename: relative if in cwd, full path otherwise
						local filepath = vim.fn.expand('%:p')
						local cwd = vim.fn.getcwd()
						local filename
						if vim.startswith(filepath, cwd .. '/') then
							-- File is within cwd, show relative path
							filename = vim.fn.expand('%:.')
						else
							-- File is outside cwd, show full path with ~ expansion
							filename = vim.fn.fnamemodify(filepath, ':~')
						end

						-- Add treesitter context if available
						local ts_context = vim.fn['nvim_treesitter#statusline'](90)
						if ts_context and ts_context ~= '' then
							filename = filename .. ' | ' .. ts_context
						end

						-- Custom fileinfo: format | encoding | filetype
						local format = vim.bo.fileformat
						local encoding = vim.bo.fileencoding ~= '' and vim.bo.fileencoding or vim.o.encoding
						local filetype = vim.bo.filetype ~= '' and vim.bo.filetype or 'no ft'
						local fileinfo = format .. ' | ' .. encoding .. ' | ' .. filetype

						local location = tostring(vim.fn.line('.')) .. ':' .. tostring(vim.fn.col('.'))
						return statusline.combine_groups({
							{ hl = mode_hl, strings = { mode } },
							'%<',
							{ hl = 'MiniStatuslineFilename', strings = { filename } },
							'%=',
							{ hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
							{ hl = mode_hl, strings = { location } },
						})
					end
				}
			})
		end
	}
}
