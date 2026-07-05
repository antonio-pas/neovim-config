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
  'https://github.com/chomosuke/typst-preview.nvim',
  'https://github.com/rafamadriz/friendly-snippets',
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    version = 'main'
  },
  -- 'https://github.com/obsidian-nvim/obsidian.nvim',
  'https://github.com/windwp/nvim-ts-autotag',
  'https://github.com/wakatime/vim-wakatime',
  'https://github.com/christoomey/vim-tmux-navigator',

  'https://github.com/craftzdog/solarized-osaka.nvim',
  'https://github.com/vague-theme/vague.nvim',
  'https://github.com/catppuccin/nvim',
  'https://github.com/projekt0n/github-nvim-theme',
  'https://github.com/loctvl842/monokai-pro.nvim',
  'https://github.com/filipjanevski/0x96f.nvim',
  -- 'https://github.com/rose-pine/neovim'
})
require('nvim-ts-autotag').setup()
require('lazydev').setup()
require('gitsigns').setup()
require('solarized-osaka').setup({
  transparent = true,
})
require('catppuccin').setup({
  background = {
    dark = "mocha",
    light = "mocha"
  },
  transparent_background = true
})
require('vague').setup({
  transparent = true,
})
require("monokai-pro").setup({
  transparent_background = true,
  filter = "spectrum"
})
require('0x96f').setup({
  transparent = true,
})
vim.cmd.colorscheme "catppuccin-mocha"
-- vim.cmd.colorscheme "solarized-osaka"
-- vim.cmd.colorscheme "github_dark_high_contrast"
-- vim.cmd.colorscheme "monokai-pro"
-- vim.cmd.colorscheme "zen"

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

local snippets = require('mini.snippets')
local friendly_snippets_path = vim.fn.stdpath("data") .. "/site/pack/core/opt/friendly-snippets/snippets/"
snippets.setup({
  snippets = {
     snippets.gen_loader.from_lang({
      base = friendly_snippets_path
    }),
  }
})


vim.lsp.enable('lua_ls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('jsonls')
vim.lsp.enable('tailwindcss')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('tinymist')

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

require('typst-preview').setup()
require('nvim-treesitter').setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'typescript', 'typescriptreact', 'wgsl' },
  callback = function() vim.treesitter.start() end,
})

-- require('obsidian').setup({
--   legacy_commands = false,
--   workspaces = {
--     {
--       name = "personal",
--       path = "~/Documents/Vault",
--     },
--   },
--   sync = {
--     enabled = true
--   }
-- })
