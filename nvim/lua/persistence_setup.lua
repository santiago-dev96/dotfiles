-- load the session for the current directory
vim.keymap.set('n', '<leader>pl', function() require('persistence').load() end, { desc =  'Persistence load session' })

-- select a session to load
vim.keymap.set('n', '<leader>ps', function() require('persistence').select() end, { desc = 'Persistence select session' })

-- load the last session
vim.keymap.set('n', '<leader>pa', function() require('persistence').load({ last = true }) end, { desc = 'Persistence last session' })

-- stop Persistence => session won't be saved on exit
vim.keymap.set('n', '<leader>po', function() require('persistence').stop() end, { desc = 'Persistence stop session' })
