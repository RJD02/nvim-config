require('lspconfig').clangd.setup {
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = true

        -- Set up tab size for clangd
        vim.api.nvim_buf_set_option(bufnr, 'tabstop', 4)
        vim.api.nvim_buf_set_option(bufnr, 'shiftwidth', 4)
        vim.api.nvim_buf_set_option(bufnr, 'expandtab', true)
    end,
    settings = {
        clangd = {
            fallbackFlags = { "-std=c++20" },
            -- If you're using compile_commands.json, you might not need fallbackFlags
        }
    }
}

