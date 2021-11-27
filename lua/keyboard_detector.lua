local filepath = "$HOME/.local/share/nvim/site/pack/plugins/start/easy.nvim/bin/kbd"
function map_leader()
    if jit and jit.os and jit.arch then
        os_name = jit.os
        if os_name == "OSX" and arch == "arm64" then
            local handle = io.popen(filepath);
            local result = handle:read("*a");
            handle:close();
            if result == "US\n" then
                vim.cmd [[ let mapleader = "'" ]] 
            end
        end
    end
end
