return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    }
  },
  opts = {
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = 'smart_case'
      }
    }
  },
  config = function(LazyPlugin, opts)
    local telescope = require('telescope')
    telescope.setup(opts)
    telescope.load_extension('fzf')

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<LEADER>f', builtin.find_files, { desc = 'Find files with the telescope' })
    vim.keymap.set('n', '<LEADER>g', builtin.live_grep, { desc = 'Find words with the telescope' })
    vim.keymap.set('n', '<LEADER>e', builtin.help_tags, { desc = 'Find help tags with the telescope' })
    vim.keymap.set('n', '<LEADER>r', builtin.resume, { desc = 'Resume the previous telescope session' })
  end
}
