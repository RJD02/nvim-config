return {{
    'folke/neodev.nvim',
    event = {'BufReadPre', 'BufNewFile'},
    config = function()
        local neodev_status_ok, neodev = pcall(require, 'neodev')

        if not neodev_status_ok then
            return
        end

        neodev.setup()
    end
}, {
    'VonHeikemen/lsp-zero.nvim',
    event = {'BufReadPre', 'BufNewFile'},
    cmd = 'Mason',
    branch = 'v2.x',
    dependencies = {{'neovim/nvim-lspconfig'}, {
        'williamboman/mason.nvim',
        build = function()
            pcall(vim.cmd, 'MasonUpdate')
        end
    }, {'williamboman/mason-lspconfig.nvim'}, {'hrsh7th/nvim-cmp'}, {'hrsh7th/cmp-nvim-lsp'}, {'L3MON4D3/LuaSnip'},
                    {'SmiteshP/nvim-navic'}},
    config = function()
        local lsp = require('lsp-zero').preset({})

        local navic = require('nvim-navic')

        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({
                buffer = bufnr
            })
            if client.server_capabilities.documentSymbolProvider then
                navic.attach(client, bufnr)
            end
        end)

        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

        lsp.ensure_installed({'pyright', 'lua_ls', 'gopls', 'clangd'})

        lsp.setup()

        local cmp = require('cmp')
        -- local cmp_action = require('lsp-zero').cmp_action()

        require('luasnip.loaders.from_vscode').lazy_load()
        local cmp_select = {
            behavior = cmp.SelectBehavior.Select
        }

        cmp.setup({
            preselect = cmp.PreselectMode.None,
            sources = {{
                name = 'nvim_lsp'
            }, {
                name = 'luasnip'
            }},
            mapping = {
                ['<A-j>'] = cmp.mapping.select_next_item(cmp_select),
                ['<A-k>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<Tab>'] = cmp.mapping.confirm({
                    select = true
                }),
                ['<CR>'] = cmp.mapping.confirm({
                    select = true
                }),
                ['<C-Space>'] = cmp.mapping.complete()
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            },
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end
            }
        })
    end
}, {
    'L3MON4D3/LuaSnip',
    dependencies = {'nvim-cmp'}

}, {'saadparwaiz1/cmp_luasnip'}, {'rafamadriz/friendly-snippets'} -- {
--     'dgagn/diagflow.nvim',
--     opts = {
--         -- placement = 'inline',
--         scope = 'line',
--         padding_right = 5
--     }
-- }
}
