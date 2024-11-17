-- Tab
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Numbers
vim.cmd("set rnu")
vim.cmd("set number")

-- Sync clipboard
vim.cmd("set clipboard+=unnamed,unnamedplus")

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on
vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

--Hhow new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Display whitespaces
--vim.opt.list = true
--vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live
vim.opt.inccommand = 'split'

-- Show which line the cursor is on && Minimal number of screen lines
vim.opt.cursorline = true
vim.opt.scrolloff = 10

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- The leader key
vim.g.maplocalleader = ' '
vim.g.mapleader = " "

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>oq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Tabs
vim.keymap.set('n', '<leader>nt', ':tabnew<CR>')
vim.keymap.set('n', '<leader>tn', ':tabn<CR>')
vim.keymap.set('n', '<leader>tp', ':tabp<CR>')

-- Splits
vim.keymap.set('n', '<leader>sv', '<C-w>v')
vim.keymap.set('n', '<leader>sh', '<C-w>s')

-- Move between splits
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-m>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-n>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Highlight when yanking (copying) text
-- See `:help lua-guide-autocommands`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Costume keymaps
vim.keymap.set({"n","i","v"}, "<leader>w", "<ESC>:w<CR>", {})
vim.keymap.set({"n","i","v"}, "<leader>q", "<ESC>:q<CR>", {})
vim.keymap.set({"n","i","v"}, "<leader>1q", "<ESC>:q!<CR>", {})
vim.keymap.set({"n","i","v"}, "<leader>x", "<ESC>:x<CR>", {})
vim.keymap.set({"n","i","v"}, "kj", "<ESC>", {})
vim.keymap.set("n", "<C-j>", ":cnext<CR>", {})
vim.keymap.set("n", "<C-k>", ":cprev<CR>", {})
vim.keymap.set("n", "<leader>k", ":m -2<CR>", {})
vim.keymap.set("n", "<leader>j", ":m +1<CR>", {})
vim.keymap.set("i", "<leader>k", "<up>", {})
vim.keymap.set("i", "<leader>j", "<down>", {})
