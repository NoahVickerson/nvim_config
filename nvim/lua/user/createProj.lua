vim.api.nvim_create_user_command('MakeProj', 
    function(opts)
        local cwd = vim.fn.getcwd()
        local cmd = opts.fargs
        if #cmd ~= 2 then
            vim.notify("MakeProj should have two commands, ex 'cpp' and 'myProjName'", vim.log.levels.ERROR)
            return
        end
 
        if cmd[1] == 'cpp' then
           vim.cmd('!~/.local/share/nvim/projectTemplates/' .. cmd[1] .. '/makeProj.sh ' .. cwd .. '/' .. cmd[2])
        else 
            vim.cmd('echo "project type not found"')
        end
    end, { nargs = '*' })  


vim.api.nvim_create_user_command('MakeFile',
    function(opts)
        local cwd = vim.fn.getcwd()
        local cmd = opts.fargs
        if #cmd ~= 2 then
            vim.notify("MakeProj should have two commands, ex 'cpp' and 'myProjName'", vim.log.levels.ERROR)
            return
        end
 
        if cmd[1] == 'cpp' then
           vim.cmd('!~/.local/share/nvim/projectTemplates/' .. cmd[1] .. './makeFile.sh' .. cwd .. '/' .. cmd[2])
        else 
            vim.cmd('echo "project type not found"')
        end
end, { nargs = '*' })
