-- Trim trailing whitespace and final blank lines on every save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		MiniTrailspace.trim()
		MiniTrailspace.trim_last_lines()
	end
})

-- Treat dot-zshrc, zprofile and zshenv files as zsh scripts
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
	pattern = { "dot-zshrc", "dot-zprofile", "dot-zshenv" },
	callback = function()
		vim.bo.filetype = "zsh"
	end
})
