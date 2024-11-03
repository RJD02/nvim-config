return {
    "github/copilot.vim",
    cmd = "Copilot",
    config = function()
        -- vim.keymap.set('n', '<A-\\>', '<Cmd>lua require("copilot").accept_suggestion()<CR>', {
        --     noremap = true,
        --     silent = true
        -- })
        require('copilot').setup({

            suggestions = {
                enabled = true
            },
            panel = {
                enabled = true
            }
        })
    end
}
