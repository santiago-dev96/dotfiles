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
  'gitcommit',
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

-- LSP
vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' },
}
vim.lsp.enable('bashls')
vim.lsp.enable('csskit')
vim.lsp.enable('cssmodules_ls')
vim.lsp.enable('docker_language_server')
vim.lsp.enable('eslint')
vim.lsp.enable('gopls')
vim.lsp.enable('graphql')
vim.lsp.enable('html')
vim.lsp.enable('htmx')
vim.filetype.add({
  extension = {
    jinja = 'jinja',
    jinja2 = 'jinja',
    j2 = 'jinja'
  }
})
vim.lsp.enable('jinja_lsp')
vim.lsp.enable('jsonls')
vim.lsp.config('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if path ~= vim.fn.stdpath('config')
        and (vim.uv.fs_stat(path .. '/.luarc.json')
        or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using (most
        -- likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Tell the language server how to find Lua modules same way as Neovim
        -- (see `:h lua-module-load`)
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          -- For LSP Settings Type Annotations: https://github.com/neovim/nvim-lspconfig#lsp-settings-type-annotations
          vim.api.nvim_get_runtime_file("lua/lspconfig", false)[1],
        },
        -- Or pull in all of 'runtimepath'.
        -- NOTE: this is a lot slower and will cause issues when working on
        -- your own configuration.
        -- See https://github.com/neovim/nvim-lspconfig/issues/3189
        -- library = vim.api.nvim_get_runtime_file('', true),
      },
    })
  end,
  settings = {
    Lua = {},
  },
})
vim.lsp.enable('lua_ls')
vim.lsp.enable('mdx-analyzer')
vim.lsp.enable('nginx_language_server')
vim.lsp.enable('pyright')
vim.lsp.enable('ruff')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('somesass_ls')
vim.lsp.enable('sqlls')
vim.lsp.enable('tailwindcss')
vim.lsp.enable('ts_ls')
vim.lsp.enable('yamlls')
