return {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    config = function ()
        local status_ok, telescope = pcall(require, 'telescope')

        if not status_ok then
            return
        end

        telescope.setup()
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>pa', builtin.find_files, {})
        vim.keymap.set('n', '<leader>pf', builtin.git_files, {})
        vim.keymap.set('n', '<leader>r', builtin.oldfiles, {})
        vim.keymap.set('n', '<leader>ps', function() 
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
        vim.keymap.set('n', '<leader>tgs', builtin.git_status, {})
        vim.keymap.set('n', '<leader>tgc', builtin.git_commits, {})
        vim.keymap.set('n', '<leader>tgb', builtin.git_branches, {})
        vim.keymap.set('n', '<leader>fj', builtin.help_tags, {})
    end
}
