-- Set leader key
vim.g.mapleader = ","

-- Clear search highlight with Escape
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { silent = true, desc = "Clear search highlight" })

-- Spelling suggestions with Ctrl-E
vim.keymap.set("n", "<C-E>", "z=", { silent = true, desc = "Open spelling suggestions" })

-- ALE key mappings
vim.keymap.set("n", "<leader>f", ":ALEFix<CR>", { silent = true, desc = "ALE Fix" })
vim.keymap.set("n", "<leader>r", ":ALERename<CR>", { silent = true, desc = "ALE Rename" })
vim.keymap.set("n", "<leader>c", ":ALECodeAction<CR>", { silent = true, desc = "ALE Code Action" })
vim.keymap.set("n", "<leader>d", ":ALEGoToDefinition<CR>", { silent = true, desc = "ALE Go to Definition" })
