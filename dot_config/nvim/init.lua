-- OPTIONS
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.smarttab = true

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

-- vim.opt.winborder = 'single'

vim.diagnostic.config({
  -- Enable/disable inline virtual text at the end of the line
  virtual_text = true, 
  
  -- Show signs in the gutter (left sidebar next to line numbers)
  signs = true,
  
  -- Underline the problematic code
  underline = true,
  
  -- Keep error highlights updated while typing in Insert mode
  update_in_insert = false,
  
  -- Customize the floating window appearance
  float = {
    focused = false,
    style = "minimal",
    border = "rounded",
    source = "always", -- Shows the name of the LSP source (e.g., tsserver, pyright)
    header = "",
    prefix = "",
  },
})

-- BINDS
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>p', '<cmd>Telescope find_files<cr>', { desc = 'Telescope find_files' })
vim.keymap.set('n', '<leader>/', '<cmd>Telescope keymaps<cr>', { desc = 'Telescope keymaps' })

vim.keymap.set('n', '<leader>t', '<cmd>terminal<cr>i', { desc = 'Launch terminal' })
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, desc = 'Unfocus terminal' })

vim.keymap.set('n', '<Tab>', '<C-W>w', { noremap = true, desc = 'Focus next split' })
vim.keymap.set('n', '<S-Tab>', '<C-W>W', { noremap = true, desc = 'Focus previous split' })
vim.keymap.set('n', '<leader>sh', '<C-W>s', { noremap = true, desc = 'Create horizontal split' })
vim.keymap.set('n', '<leader>sv', '<C-W>v', { noremap = true, desc = 'Create vertical split' })
vim.keymap.set('n', '<leader>sq', '<C-W>c', { noremap = true, desc = 'Close focused split' })

vim.keymap.set('n', '<leader>q', '<cmd>b#|bd#<cr>', { desc = 'Close focused buffer' })

vim.keymap.set('n', '<leader>b.', '<cmd>bnext<cr>', { desc = 'Focus next buffer' })
vim.keymap.set('n', '<leader>b,', '<cmd>bprev<cr>', { desc = 'Focus previous buffer' })
vim.keymap.set('n', '<leader>b/', '<cmd>b#<cr>', { desc = 'Focus alternate buffer' })

vim.keymap.set('n', '<leader>t.', '<cmd>tabnext<cr>', { desc = 'Focus next tab' })
vim.keymap.set('n', '<leader>t,', '<cmd>tabprevious<cr>', { desc = 'Focus previous tab' })
vim.keymap.set('n', '<leader>t/', '<cmd>tabnew<cr>', { desc = 'Create new tab' })
vim.keymap.set('n', '<leader>tq', '<cmd>tabclose<cr>', { desc = 'Close focused tab' })

-- PLUGINS
require('config.lazy')

vim.cmd[[colorscheme tokyonight]]

require('nvim-treesitter').setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}

-- LSP
vim.lsp.enable('ts_ls')

-- SYNTAX HIGHLIGHTING
local languages = {
    'javascript',
    'typescript'
}

require('nvim-treesitter').install(languages)
vim.api.nvim_create_autocmd('FileType', {
  pattern = languages,
  callback = function() vim.treesitter.start() end,
})
