return {
    'tpope/vim-fugitive',
    event = 'VimEnter',
    config = function()
        vim.keymap.set('n', '<leader>gs', '<Cmd>Git<CR>', {noremap= true, silent= true})
        vim.keymap.set('n', '<leader>gd', '<Cmd>Git diff<CR>', {noremap= true, silent= true})
        vim.keymap.set('n', '<leader>gc', '<Cmd>Git commit<CR><CR>', {noremap= true, silent= true})
        vim.keymap.set('n', '<leader>gp', '<Cmd>Git push<CR>', {noremap= true, silent= true})
        vim.keymap.set('n', '<leader>gl', '<Cmd>Git log<CR>', {noremap= true, silent= true})
        vim.keymap.set('n', '<leader>gm', '<Cmd>Gvdiffsplit<CR>', {noremap= true, silent= true})
        vim.keymap.set('n', '<leader>gb', '<Cmd>Git branch<CR>', {noremap= true, silent= true})
    end
}
