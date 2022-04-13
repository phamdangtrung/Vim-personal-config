---@diagnostic disable: different-requires
require 'core.options'
require('modules.config.packer'):init()
require('modules.config.packer'):load(require 'modules.plugins')
require 'core.keymaps'
-- require 'modules.lspservers'

-- CMP
local cmp = require "cmp"

cmp.setup(
    {
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                require'luasnip'.lsp_expand(args.body)
                -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            end
        },
        mapping = {
            ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
            ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
            ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            ["<C-e>"] = cmp.mapping(
                {
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close()
                }
            ),
            ["<CR>"] = cmp.mapping.confirm({select = true}) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        },
        sources = cmp.config.sources(
            {
                {name = "nvim_lsp"},
                -- {name = "vsnip"}, -- For vsnip users.
                {name = "luasnip"},
            },
            {
                {name = "buffer"}
            }
        )
    }
)

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(
    "/",
    {
        sources = {
            {name = "buffer"}
        }
    }
)

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

local lspconfig = require "lspconfig"
lspconfig.solargraph.setup {
    cmd = {
        "solargraph",
        "stdio"
    },
    filetypes = {
        "ruby"
    },
    on_attach = require 'modules.lsp.on_attach',
    root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
    capabilities = capabilities,
    handlers = handlers,
    settings = {
        solargraph = {
            bundlerPath = "bundle",
            autoformat = true,
            completion = true,
            diagnostic = true,
            folding = true,
            references = true,
            rename = true,
            symbols = true,
            definitions = true,
            formatting = true,
            useBundler = true
        }
    }
}

lspconfig.elixirls.setup {
    cmd = {"/home/phamd/.lsp/elixirls/language_server.sh"},
    capabilities = capabilities,
    on_attach = require 'modules.lsp.on_attach',
}
