-- LSP server configurations
vim.pack.add({
  'https://github.com/neovim/nvim-lspconfig',
})
-- Typescript/JavaScript with (or without) JSX
vim.lsp.config('tsc', require('tsc-config'))
vim.lsp.enable('tsc')
-- Lua
-- This is just to enable LSP features with a focus on Neovim plugins
-- and the core LSP API.
vim.lsp.config('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath('config')
          and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
      then
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

-- Leader key
vim.g.mapleader = ' '
vim.g.localmapleader = '\\'

-- Telescope
-- We installed the FZF Telescope extension manually here: ~/.local/share/nvim/site/pack/manual/start
vim.pack.add({
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope.nvim'
})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = 'Telescope document symbols' })
vim.keymap.set('n', '<leader>fw', builtin.lsp_workspace_symbols, { desc = 'Telescope workspace symbols' })

-- LSP Diagnostics
-- Quickfix
vim.keymap.set('n', '<leader>do', function()
  vim.diagnostic.setqflist()
  vim.cmd[[cope]]
end, { desc = 'Open diagnostics in the quickfix list' })
-- Float
vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, { desc = 'Open diagnostics in a floating window' })

-- Git signs (the gutter)
vim.pack.add({
  'https://github.com/lewis6991/gitsigns.nvim'
})
require('gitsigns').setup({
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')
    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end
    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end)
    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)
  end
})

-- Yazi file manager
vim.pack.add({
  'https://github.com/mikavilpas/yazi.nvim'
})
vim.keymap.set('n', '<leader>-', function()
  require('yazi').yazi()
end)
vim.g.loaded_netrwPlugin = 1
vim.api.nvim_create_autocmd('UIEnter', {
  callback = function()
    require('yazi').setup({
      open_for_directories = true
    })
  end
})

-- Surroundings
vim.pack.add({
  {
    src = 'https://github.com/kylechui/nvim-surround',
    version = vim.version.range('4.x')
  }
})

-- Print the installed plugins
vim.api.nvim_create_user_command('Plugins', function()
  local plugin_names = {}

  -- Method 1: Query vim.pack.get()
  local pack_plugins = vim.pack.get()
  for _, p in ipairs(pack_plugins) do
    -- p.spec.name contains the inferred name (e.g. "oil.nvim")
    local name = (p.spec and p.spec.name) or p.name
    if name then
      table.insert(plugin_names, name)
    end
  end

  -- Output results
  if #plugin_names > 0 then
    vim.notify("Installed Plugins:\n- " .. table.concat(plugin_names, "\n- "), vim.log.levels.INFO)
  else
    vim.notify("No plugins found in vim.pack or on disk.", vim.log.levels.WARN)
  end
end, { desc = 'List installed plugins' })

-- Catppuccin colorscheme
vim.pack.add({ { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' } })
vim.cmd.colorscheme 'catppuccin-mocha'
vim.o.background = 'dark'

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

