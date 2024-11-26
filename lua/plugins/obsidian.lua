return {
    'epwalsh/obsidian.nvim',
    event = { 'BufReadPre E:/vault/Development/*/**.md' },
    dependencies = {
        -- Required.
        'nvim-lua/plenary.nvim',

        -- Optional, for completion.
        'hrsh7th/nvim-cmp',

        -- Optional, for search and quick-switch functionality.
        'nvim-telescope/telescope.nvim',
    },
    opts = {
        dir = 'E:/vault/Development',  -- no need to call 'vim.fn.expand' here

        -- see below for full list of options 👇
    },
    config = function(_, opts)
        require('obsidian').setup(opts)

        -- Optional, override the 'gf' keymap to utilize Obsidian's search functionality.
        -- see also: 'follow_url_func' config option below.
        vim.keymap.set('n', 'gf', function()
            if require('obsidian').util.cursor_on_markdown_link() then
                return '<cmd>ObsidianFollowLink<CR>'
            else
                return 'gf'
            end
        end, { noremap = false, expr = true })
    end
}
