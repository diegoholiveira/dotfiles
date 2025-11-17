-- General Editor Settings
vim.opt.termguicolors = true                     -- Enable true color support (24-bit RGB)
vim.opt.number = true                            -- Show absolute line numbers
vim.opt.spell = true                             -- Enable spell check
vim.opt.spelllang = "en_us"                      -- Use US English dictionary
vim.opt.showmatch = true                         -- Highlight matching brackets, parentheses, etc.
vim.opt.list = true                              -- Show invisible characters
vim.opt.listchars = { tab = ">-", trail = "·" }  -- Display tabs as ">-" and trailing spaces as dots
vim.opt.ignorecase = true                        -- Make search case-insensitive
vim.opt.wrap = false                             -- Prevent line wrapping
vim.opt.scrolloff = 3                            -- Keep 3 lines visible above/below cursor when scrolling
vim.opt.mouse = ""                               -- Completely disable the mouse

-- Security
vim.opt.modeline = false                         -- Disable modelines (avoid config injection)

-- Files
vim.opt.swapfile = false                         -- Disable creation of swap files
vim.filetype.add({                               -- Configure tf and tfvars extensions as hcl files
  extension = {
    tf     = "hcl",
    tfvars = "hcl",
  },
})

-- Tabs and Indentation
vim.opt.tabstop = 4                              -- A tab character appears as 4 spaces
vim.opt.softtabstop = 4                          -- Number of spaces inserted/deleted with <Tab>/<BS>
vim.opt.shiftwidth = 4                           -- Number of spaces used for each indentation step
vim.opt.expandtab = true                         -- Insert spaces instead of tab characters

-- Setup mappings
require("mappings")

-- Setup plugins
require("config.lazy")

-- Setup autocmd
require("autocmd")
