-- lazy.nvim
require("config.lazy")

-- Set relative line numbers and current line number
vim.o.number = true
vim.o.relativenumber = true

vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " "

-- Navigate panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Clear search highlights with esc in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Share clipboard with OS
-- Schedule the setting after 'UiEnter' because it can increase startup time
vim.schedule(function()
	vim.o.clipboard = 'unnamedplus'
end)

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Lines to keep above and below cursor
vim.o.scrolloff = 10
