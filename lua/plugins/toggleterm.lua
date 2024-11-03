return {
    'akinsho/toggleterm.nvim',
    event = 'VimEnter',
    config = function()
        local status_ok, toggleterm = pcall(require, 'toggleterm')

        if not status_ok then
            return
        end

        toggleterm.setup({
            size = 15,
            open_mapping = [[<c-\>]],
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = '1',
            start_in_insert = true,
            persist_size = true,
            direction = 'horizontal',
            autochdir = false,
            shell = 'cmd.exe /k C:\\cmder\\vendor\\init.bat'
            -- shell = vim.o.shell,
        })
    end
}
