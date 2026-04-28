vim.g.mapleader = " "

require("config.lazy")
require("oil").setup({
  default_file_explorer = false,
  keymaps = {
    ['<C-p>'] = {},
  },
  view_options = {
    show_hidden = true,
    width = 30,
  }
})
require('neo-tree').setup({
  -- options go here
  auto_clean_after_session_restore = false,
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function()
        vim.opt_local.number = true          -- Show absolute line numbers
        vim.opt_local.relativenumber = true  -- Show relative line numbers
      end,
    },
    {
      event = "file_opened",
      handler = function()
        vim.opt.number = true
	vim.opt.relativenumber = true
      end
    }
  },
  window = {
    width = 30,
    mappings = {
      ['.'] = 'toggle_hidden',
    },
  },
  filesystem = {
    hijack_netrw_behavior = "open_default",
    use_libuv_file_watcher = true,
	follow_current_file = { enabled = true },
  },
})

require('auto-session').setup({
  pre_save_cmds = { 'Neotree close' },
  post_restore_cmds = { 'Neotree filesystem show' },
})
require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }

      -- pseudo code / specification for writing custom displays, like the one
      -- for "codeactions"
      -- specific_opts = {
      --   [kind] = {
      --     make_indexed = function(items) -> indexed_items, width,
      --     make_displayer = function(widths) -> displayer
      --     make_display = function(displayer) -> function(e)
      --     make_ordinal = function(e) -> string
      --   },
      --   -- for example to disable the custom builtin "codeactions" display
      --      do the following
      --   codeactions = false,
      -- }
    }
  }
}
require("telescope").load_extension("ui-select")
require('lualine').setup()

vim.lsp.enable('ts_ls')
vim.lsp.enable('pylsp')

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.laststatus = 3
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.o.winborder = 'single'
vim.o.confirm = true
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- noremap - binds to what the original keybind did by default
vim.keymap.set('n', '<leader>p', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '-', '<cmd>Oil --float<cr>')
vim.keymap.set({'n', 't', 'v'}, '<leader>`', '<cmd>2ToggleTerm<cr>')
vim.keymap.set('t', '<leader><Esc>', [[<C-\><C-n>]], { noremap = true })
vim.keymap.set('n', '<leader>g', '<cmd>lua _lazygit_toggle()<cr>', {silent = true})
vim.keymap.set('n', '<leader>s', '<cmd>AutoSession search<cr>')
vim.keymap.set("n", "<Tab>", "<C-W>w", { noremap = true })
vim.keymap.set("n", "<S-Tab>", "<C-W>W", { noremap = true })
vim.keymap.set("n", "<C-s>", "<cmd>Neotree toggle filesystem<cr>")
vim.keymap.set("n", "<leader>i", vim.lsp.buf.implementation, { noremap = true})
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { noremap = true})
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, { noremap = true})
vim.keymap.set("n", "<leader>/", "<cmd>Telescope keymaps<cr>")

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

