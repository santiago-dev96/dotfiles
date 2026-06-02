return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    -- Top Pickers and Explorer
    { '<leader>ff', function() Snacks.picker.smart() end, desc = 'Smart find files' },
    { '<leader>fb', function() Snacks.picker.buffers() end, desc = 'Find buffers' },
    { '<leader>ft', function() Snacks.picker.grep() end, desc = 'Find text (grep)' },
    { '<leader>fc', function() Snacks.picker.command_history() end, desc = 'Find in command history' },
    { '<leader>fn', function() Snacks.picker.notifications() end, desc = 'Find in notifications history' },
    { '<leader>fe', function() Snacks.picker.explorer() end, desc = 'Find by using the explorer' }
  }
}
