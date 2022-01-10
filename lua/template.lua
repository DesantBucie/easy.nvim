function template()
    local extension = vim.fn.expand('%:e')
    local check_file = templates.."skel."..extension
    local file = io.open(check_file, "r")
    if file ~= nil then
        io.close(file)
        local command = "read "..check_file
        vim.cmd(command)
    else
        print("Template doesn't exist")
    end
end
