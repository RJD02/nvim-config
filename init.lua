vim.g.clipboard = {
    name = 'LinuxClipboard',
    copy = {
        ['+'] = 'xclip -selection clipboard',
        ['*'] = 'xclip -selection primary',
    },
    paste = {
        ['+'] = 'xclip -selection clipboard -o',
        ['*'] = 'xclip -selection primary -o',
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
