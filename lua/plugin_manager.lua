local plugins_folder="$HOME/.local/share/nvim/site/pack/plugins/start/"
local function scandir(directory)
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
    print('Installing...');
    local table = Split(url, ' ');
    local table_len = #(table)
    for i=1, table_len do  
        os.execute('cd "'..plugins_folder..'" && git clone --quiet '..table[i]);
    end
    print('Done');
end
function PluginUpdate()
    print('Updating...');
    local table = scandir(plugins_folder);
    local table_len = #(table);
    for i = 1, table_len do
        if not (table[i] == '.' or table[i]=='..') then
            os.execute('cd "'..plugins_folder..table[i]..'" && git stash --quiet && git pull origin --quiet $(git  rev-parse --abbrev-ref HEAD)');
        end
    end
    print('Done');
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
function PluginDelete(names)
    print('Removing')
    os.execute('cd "'..plugins_folder..'" && rm -rf '..names)
    print('Done');
end
