--- git clone https://github.com/love2d-community/love-api
--- lua love2d.lua > ../src/stubs.lua

local love = require('love-api/love_api')

print([[
-- DO NOT EDIT! Generate by tools/love2d.lua
]])
print('-- love2d version ' .. love.version)
print([[

---@class Love
love = {}
]])

local function print_func(func, ns)
    ns = ns or 'love'

    --todo ограничить длину строк и пероносить на новую (резать по пробелам)
    print(string.format('--- %s\n---', select(1, string.gsub(func.description, '\n', '\n--- '))))

    --for _, variant in ipairs(func.variants) do
    assert(#func.variants == 1)
    local variant = func.variants[1]

    local args = {}
    if variant.arguments then
        for _, r in ipairs(variant.arguments) do
            print(string.format('---@param %s %s %s', r.name, r.type, r.description))
            args[#args + 1] = r.name
        end
    end

    if variant.returns then
        local rets = {}
        print('--- returns:')
        for _, r in ipairs(variant.returns) do
            print(string.format('---     %s %s - %s', r.type, r.name, r.description))
            rets[#rets + 1] = r.type
        end
        print(string.format('---@return %s', table.concat(rets, ', ')))
    end
    --end

    print(string.format('function %s.%s(%s) end\n', ns, func.name, table.concat(args, ', ')))
end

for _, func in ipairs(love.functions) do
    print_func(func)
end

--todo
