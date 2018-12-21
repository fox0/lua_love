-- lua love2d_generate_stubs.lua > love2d_stubs.lua

local function str_replace(s)
    return select(1, string.gsub(s, '\n', '\n--- '))
end

local function print_func(func, ns)
    ns = ns or 'love'
    print(string.format('---\n--- %s\n---', str_replace(func.description)))
    for _, variant in ipairs(func.variants) do
        --todo default table
        local args = {}
        if variant.arguments then
            for _, r in ipairs(variant.arguments) do
                if not r.name:find('"') then
                    print(string.format('---@param %s %s %s', r.name, r.type, str_replace(r.description)))
                    table.insert(args, r.name)
                else
                    -- и фиг с ней
                    print(string.format('-- %s %s %s', r.name, r.type, str_replace(r.description)))
                end
            end
        end
        if variant.returns then
            local rets = {}
            print('--- returns:')
            for _, r in ipairs(variant.returns) do
                print(string.format('---   %s %s - %s', r.type, r.name, str_replace(r.description)))
                if r.table then
                    for _, t in ipairs(r.table) do
                        print(string.format('---     %s %s - %s', t.type, t.name, str_replace(t.description)))
                    end
                end
                table.insert(rets, r.type)
            end
            print(string.format('---@return %s', table.concat(rets, ', ')))
        end
        print(string.format('function %s.%s(%s) end\n', ns, func.name, table.concat(args, ', ')))
    end
end

local function print_type(t)
    print(string.format('---\n--- %s', str_replace(t.description)))
    --todo parenttype supertypes subtypes
    print(string.format('---@class %s', t.name))
    print(string.format('%s = {}\n', t.name))
    if t.functions then
        for _, func in ipairs(t.functions) do
            print_func(func, t.name)
        end
    end
    --todo
    --BaseClass = {}
    --BaseClass.index = {}
    --BaseClass.metatable = {__index = BaseClass.index}
    --
    --DerivedClass = {}
    --DerivedClass.index = setmetatable({}, {__index = BaseClass.index})
    --DerivedClass.metatable = {__index = DerivedClass.index}

    --for _, t2 in ipairs(t.subtypes) do
    --    print_class(t2)
    --end
end

local function main()
    local love = require('love-api/love_api')
    print('-- DO NOT EDIT! Generate by love2d_generate_stubs.lua\n')
    print(string.format('-- love2d version %s', love.version))
    print('love = {}\n')

    for _, func in ipairs(love.functions) do
        print_func(func)
    end

    for _, module in ipairs(love.modules) do
        print(string.format('---\n--- %s\n---', str_replace(module.description)))
        print(string.format('local %s = {}', module.name))
        print(string.format('love.%s = %s\n', module.name, module.name))
        for _, func in ipairs(module.functions) do
            print_func(func, module.name)
        end
        if module.types then
            for _, t in ipairs(module.types) do
                print_type(t)
            end
        end
        --todo enums
    end

    for _, t in ipairs(love.types) do
        print_type(t)
    end

    for _, func in ipairs(love.callbacks) do
        print_func(func)
    end
end

main()
