return {
    'lukas-reineke/indent-blankline.nvim',
    event = {'BufReadPre', 'BufNewFile'},
    main = 'ibl',
    opts = {},
    config = function()
        -- never enable this god forsaken option again...
        -- vim.opt.list = true
        vim.cmd([[highlight IndentBlanklineIndent1 guifg=#515151 gui=nocombine]])

        require('ibl').setup({})
    end
}
