function template()
    local lang = vim.fn.expand('%:e')
    local check_file = templates..lang..".template"
    local file = io.open(check_file, "r")
    if file ~= nil then
        io.close(file)
        local command = "read "..check_file
        vim.cmd(command)
    else
        print("Template doesn't exist")
    end
end
