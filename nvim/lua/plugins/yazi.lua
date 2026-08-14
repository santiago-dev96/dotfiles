return {
  'mikavilpas/yazi.nvim',
  version = '*', -- use the latest stable version
  event = 'VeryLazy',
  dependencies = {
    { 'nvim-lua/plenary.nvim', lazy = true }
  },
  keys = {
    -- 👇 in this section, choose your own keymappings!
    {
      '<LEADER>y',
      mode = { 'n', 'v' },
      '<CMD>Yazi<CR>',
      desc = 'open yazi at the current file'
    },
    {
      -- Open in the current working directory
      '<LEADER>w',
      '<CMD>Yazi cwd<CR>',
      desc = 'open yazi in the current directory'
    },
    {
      '<LEADER>t',
      '<CMD>Yazi toggle<CR>',
      desc = 'resume the last yazi session'
    }
  },
  opts = {
    -- if you want to open yazi instead of netrw
    open_for_directories = true,
    keymaps = {
      show_help = '<F1>'
    }
  },
  init = function()
    -- mark netrw as loaded so it's not loaded at all.
    vim.g.loaded_netrwPlugin = 1
  end
}
