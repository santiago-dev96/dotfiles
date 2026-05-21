local harpoon = require('harpoon')

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set('n', '<leader>ha', function() harpoon:list():add() end, { desc = 'Harpoon add' })
vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Harpoon menu' })

vim.keymap.set('n', '<leader>h1', function() harpoon:list():select(1) end, { desc = 'Harpoon file 1' })
vim.keymap.set('n', '<leader>h2', function() harpoon:list():select(2) end, { desc = 'Harpoon file 2' })
vim.keymap.set('n', '<leader>h3', function() harpoon:list():select(3) end, { desc = 'Harpoon file 3' })
vim.keymap.set('n', '<leader>h4', function() harpoon:list():select(4) end, { desc = 'Harpoon file 4' })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set('n', '<leader>hp', function() harpoon:list():prev() end, { desc = 'Harpoon previous file' })
vim.keymap.set('n', '<leader>hn', function() harpoon:list():next() end, { desc = 'Harpoon next file' })

-- Opens buffer in splits or tabs (while in the harpoon list UI)
harpoon:extend({
  UI_CREATE = function(cx)
    vim.keymap.set('n', '<C-v>', function()
      harpoon.ui:select_menu_item({ vsplit = true })
    end, { buffer = cx.bufnr, desc = 'Harpoon vsplit file' })

    vim.keymap.set('n', '<C-x>', function()
      harpoon.ui:select_menu_item({ split = true })
    end, { buffer = cx.bufnr, desc = 'Harpoon hsplit file' })

    vim.keymap.set('n', '<C-t>', function()
      harpoon.ui:select_menu_item({ tabedit = true })
    end, { buffer = cx.bufnr, desc = 'Harpoon file in new tab' })
  end,
})

-- Highlights the current file in the harpoon list
local harpoon_extensions = require('harpoon.extensions')
harpoon:extend(harpoon_extensions.builtins.highlight_current_file())
