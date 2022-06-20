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
            ["<CR>"] = cmp.mapping.confirm({select = true}),
            ['<Tab>'] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
              end
            end, {
              'i',
              's',
            }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
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
    cmd = {"/home/phamd/.lsp/elixir/language_server.sh"},
    capabilities = capabilities,
    on_attach = require 'modules.lsp.on_attach',
}

local dap = require "dap"

dap.adapters.go = function(callback, config)
    local stdout = vim.loop.new_pipe(false)
    local handle
    local pid_or_err
    local port = 38697
    local opts = {
      stdio = {nil, stdout},
      args = {"dap", "-l", "127.0.0.1:" .. port},
      detached = true
    }
    handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
      stdout:close()
      handle:close()
      if code ~= 0 then
        print('dlv exited with code', code)
      end
    end)
    assert(handle, 'Error running dlv: ' .. tostring(pid_or_err))
    stdout:read_start(function(err, chunk)
      assert(not err, err)
      if chunk then
        vim.schedule(function()
          require('dap.repl').append(chunk)
        end)
      end
    end)
    -- Wait for delve to start
    vim.defer_fn(
      function()
        callback({type = "server", host = "127.0.0.1", port = port})
      end,
      100)
end
  -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
    {
      type = "go",
      name = "Debug",
      request = "launch",
      program = "${file}"
    },
    {
      type = "go",
      name = "Debug test", -- configuration for debugging test files
      request = "launch",
      mode = "test",
      program = "${file}"
    },
    -- works with go.mod packages and sub packages
    {
      type = "go",
      name = "Debug test (go.mod)",
      request = "launch",
      mode = "test",
      program = "./${relativeFileDirname}"
    }
}

dap.adapters.ruby = {
    type = 'executable';
    command = 'bundle';
    args = {'exec', 'readapt', 'stdio'};
}

dap.configurations.ruby = {
    {
        type = 'ruby';
        request = 'launch';
        name = 'Rails';
        program = 'bundle';
        programArgs = {'exec', 'rails', 's'};
        useBundler = true;
    },
}

dap.adapters.haskell = {
    type = 'executable';
    command = 'haskell-debug-adapter';
    args = {'--hackage-version=0.0.33.0'};
}
dap.configurations.haskell = {
    {
      type = 'haskell',
      request = 'launch',
      name = 'Debug',
      workspace = '${workspaceFolder}',
      startup = "${file}",
      stopOnEntry = true,
      logFile = vim.fn.stdpath('data') .. '/haskell-dap.log',
      logLevel = 'WARNING',
      ghciEnv = vim.empty_dict(),
      ghciPrompt = "λ: ",
      -- Adjust the prompt to the prompt you see when you invoke the stack ghci command below
      ghciInitialPrompt = "λ: ",
      ghciCmd= "stack ghci --test --no-load --no-build --main-is TARGET --ghci-options -fprint-evld-with-show",
    },
}

dap.adapters.mix_task = {
    type = 'executable',
    command = '/home/phamd/.lsp/elixirls/language_server.sh', -- debugger.bat for windows
    args = {}
}

dap.configurations.elixir = {
    {
      type = "mix_task",
      name = "mix test",
      task = 'test',
      taskArgs = {"--trace"},
      request = "launch",
      startApps = true, -- for Phoenix projects
      projectDir = "${workspaceFolder}",
      requireFiles = {
        "test/**/test_helper.exs",
        "test/**/*_test.exs"
      }
    },
}