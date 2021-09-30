local plugins_folder="$HOME/.local/share/nvim/site/pack/plugins/start/"
function scandir(directory)
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('ls -a "'..directory..'"')
    for filename in pfile:lines() do
        i = i + 1
        t[i] = filename
    end
    pfile:close()
    return t
end
function Split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end
function PluginInstall(url)
    local array = Split(url, ' ');
    local array_len = #(array)
    for i=1, array_len do  
        os.execute('cd "'..plugins_folder..'" && git clone '..array[i]);
    end
end
function PluginUpdate()
    local table = scandir(plugins_folder);
    local table_len = #(table);
    for i = 1, table_len do
        if not (table[i] == '.' or table[i]=='..') then
            os.execute('cd "'..plugins_folder..table[i]..'" && git pull' );
        end
    end 
end
function PluginList()
   local table = scandir(plugins_folder)
   local table_len = #(table)
   for i = 1, table_len do 
       if not (table[i]=='.' or table[i]=='..') then
           print(table[i])
        end
    end
end
function PluginDelete(name)
    os.execute('cd "'..plugins_folder..'" && rm -rf '..name)
end
