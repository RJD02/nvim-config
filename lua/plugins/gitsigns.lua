return {
    'lewis6991/gitsigns.nvim',
    event = {'BufReadPre', 'BufNewFile'},
    config = function()
        local status_ok, gitsigns = pcall(require, 'gitsigns')

        if not status_ok then
            return
        end

        gs = require('gitsigns')

        vim.keymap.set('n', '<leader>ha', function()
            gs.blame_line {
                full = true
            }
        end, {
            noremap = true,
            silent = true
        })
        vim.keymap.set('n', '<leader>hb', function()
            gs.toggle_current_line_blame()
        end, {
            noremap = true,
            silent = true
        }, {
            noremap = true,
            silent = true
        })
        vim.keymap.set('n', '<leader>hs', function()
            gs.toggle_signs()
        end, {
            noremap = true,
            silent = true
        })

        gitsigns.setup({})
    end
}
