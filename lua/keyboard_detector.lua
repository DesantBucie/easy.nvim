local filepath = "$HOME/.local/share/nvim/site/pack/plugins/start/easy.nvim/bin/kbd"
function map_leader()
    if jit and jit.os then
        os_name = jit.os
    end
    if os_name == "OSX" then
        local handle = io.popen(filepath);
        local result = handle:read("*a");
        handle:close();
        if result == "US\n" then
            vim.cmd [[ let mapleader = "'" ]] 
        end
    end
end
