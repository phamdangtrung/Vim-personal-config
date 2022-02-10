local function setup(server_name)
    return require(string.format('modules.lsp.%s', server_name))
end

-- setup('solargraph')
-- setup('csharp_ls')
-- setup('elixirls')