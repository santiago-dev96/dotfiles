-- Folding
vim.o.foldmethod = 'indent'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Visual aid
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

-- Indentation
vim.o.sw = 2
vim.o.expandtab = true
vim.o.tabstop = 2

-- Statusline
vim.pack.add({
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-lualine/lualine.nvim'
})
vim.o.showmode = false
require('lualine').setup()

-- Language syntax parsers (Treesitter)
-- `:TSUpdate` is defined in the plugin's plugin/ script, which is sourced
-- after init.lua finishes, so it can't be called directly here. Run it as a
-- build hook when the plugin is installed or updated.
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    if ev.data.spec.name == 'nvim-treesitter'
      and (ev.data.kind == 'install' or ev.data.kind == 'update') then
      if not ev.data.active then
        vim.cmd.packadd('nvim-treesitter')
      end
      vim.cmd('TSUpdate')
    end
  end,
})
vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter'
})
local nvim_treesitter = require('nvim-treesitter')
nvim_treesitter.setup({
  install_dir = vim.fn.stdpath('data') .. '/site'
})
nvim_treesitter.install({
  'angular',
  'bash',
  'css',
  'csv',
  'dockerfile',
  'git_commit',
  'git_rebase',
  'gitignore',
  'go',
  'gomod',
  'gosum',
  'gotmpl',
  'gowork',
  'graphql',
  'html',
  'http',
  'java',
  'javascript',
  'jinja',
  'jinja_inline',
  'json',
  'jsx',
  'kotlin',
  'lua',
  'make',
  'markdown',
  'mermaid',
  'nginx',
  'nix',
  'python',
  'requirements',
  'rust',
  'scss',
  'sql',
  'ssh_config',
  'svelte',
  'swift',
  'toml',
  'tsv',
  'tsx',
  'typescript',
  'vim',
  'vimdoc',
  'vue',
  'xml',
  'xresources',
  'yaml',
  'zig',
  'zsh',
})

-- Colors
vim.pack.add {
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" }
}
vim.cmd.colorscheme 'catppuccin-mocha'
vim.o.background = 'dark'

