return {
  'nvim-mini/mini.nvim',
  version = false,
  config = function()
    require('mini.ai').setup()
    require('mini.operators').setup()
    require('mini.surround').setup()
    require('mini.comment').setup()
    require('mini.pairs').setup()
  end
}
