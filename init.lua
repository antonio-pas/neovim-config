vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true

vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.smartindent = true

vim.opt.winborder = "none"
vim.opt.signcolumn = 'yes:1'

vim.opt.hidden = true
vim.opt.scrolloff = 4
vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.showmode = false
vim.opt.termguicolors = true
vim.diagnostic.config({ virtual_text = true })
vim.cmd("set completeopt+=noselect,fuzzy")
vim.opt.background = "dark"
vim.g.mapleader = " "
vim.opt.mouse = 'a'

vim.pack.add({
  'https://github.com/nvim-mini/mini.nvim',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/folke/lazydev.nvim',
  'https://github.com/github/copilot.vim',
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nendix/zen.nvim',
  'https://github.com/windwp/nvim-ts-autotag',
  'https://github.com/wakatime/vim-wakatime',
  'https://github.com/craftzdog/solarized-osaka.nvim',
})

require('nvim-ts-autotag').setup()
require('lazydev').setup()
require('gitsigns').setup()
require('zen').setup({
  transparent = true
})
require('solarized-osaka').setup({
  transparent = true,
})
-- vim.cmd.colorscheme "zen"
vim.cmd.colorscheme "solarized-osaka"

require('mini.jump2d').setup({})
require('mini.git').setup({})
require('mini.files').setup({})
require('mini.clue').setup({})
require('mini.pick').setup({})
require('mini.move').setup({})
require('mini.pairs').setup({})
require('mini.surround').setup({})
require('mini.tabline').setup({})
require('mini.notify').setup({})
require('mini.statusline').setup({})
require('mini.trailspace').setup({})
require('mini.completion').setup({})
require('mini.icons').setup({})
require('mini.snippets').setup({})

vim.lsp.enable('lua_ls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('jsonls')
vim.lsp.enable('tailwindcss')

local pick = require('mini.pick')
local tree = require('mini.files')

vim.keymap.set('n', '<leader>ff', pick.builtin.files)
vim.keymap.set('n', '<leader>lg', pick.builtin.grep_live)
vim.keymap.set('n', '<leader>af', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>tr', tree.open)
vim.keymap.set('n', 'j', "gj")
vim.keymap.set('n', 'k', "gk")
vim.keymap.set('v', 'j', "gj")
vim.keymap.set('v', 'k', "gk")

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'javascriptreact', 'typescript', 'javascript', 'typescriptreact', 'lua', 'rust', 'css' },
  callback = function() vim.treesitter.start() end,
})
