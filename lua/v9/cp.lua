vim.cmd([[autocmd BufNewFile,BufRead *.cpp set filetype=cpp]])

function CompileAndRun()
    print('Compiling')
    local fileName = vim.fn.expand('%')
    if fileName == "" then
        print("No inpuit file. Please save the first first.")
        return
    end
    print(fileName)
    if string.match(fileName, "%.cpp$") then
        vim.cmd('w | !g++ -std=c++11 -Wall -Wextra -Wpedantic -O2 ' .. fileName .. ' -o a.out')
        vim.cmd('!a.out < input.txt > output.txt')
    else
        print('Not a C++ file')
    end
end

-- vim.keymap.nnoremap('<F5>', ':lua CompileAndRun()<CR>')
vim.api.nvim_set_keymap('n', '<F5>', ':lua CompileAndRun()<Enter>', { noremap = true, silent = true })
