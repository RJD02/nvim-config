return {
    'elentok/format-on-save.nvim',
    event = {'BufReadPre', 'BufNewFile'},
    config = function()
        vim.lsp.set_log_level("off")
        require('lspconfig').pyright.setup {}
        local format_on_save = require('format-on-save')
        local formatters = require('format-on-save.formatters')

        format_on_save.setup({
            exclude_path_patterns = {'/node_modules/', '.local/share/nvim/lazy'},
            formatter_by_ft = {
                go = formatters.lsp,
                lua = formatters.lsp,
                cpp = formatters.lsp,
                c = formatters.lsp,
                python = formatters.lsp,
                rust = formatters.lsp,
                javascript = formatters.lsp,
                typescript = formatters.lsp,
                typescriptreact = formatters.lsp
            }
        })
    end
}
