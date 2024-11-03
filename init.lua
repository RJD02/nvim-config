vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
        ['+'] = 'clip.exe',
        ['*'] = 'clip.exe',
    },
    paste = {
        ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring():gsub("\\r", ""))',
        ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring():gsub("\\r", ""))',
    },
    cache_enabled = 0,
}

require('v9.options')
require('v9.keymaps')
require('v9.lazy')
require('v9.colorscheme')
require('v9.clangd')
require('v9.cp')
vim.opt.guicursor = 'i:block'

vim.cmd([[autocmd FileType yaml setlocal indentexpr=]])
vim.cmd([[autocmd FileType yml setlocal indentexpr=]])
