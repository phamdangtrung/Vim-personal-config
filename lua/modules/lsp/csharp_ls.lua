local capabilities = vim.lsp.protocol.make_client_capabilities()
local on_attach = require "modules.lsp.on_attach"

if package.loaded['cmp_nvim_lsp'] then
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
end

local lspconfig = require "lspconfig"
lspconfig.csharp_ls.setup {
  cmd = {"csharp-ls"},
  filetypes = {"cs"},
  init_options = {
    AutomaticWorkspaceInit = true
  },
  -- root_dir = lspconfig.util.root_pattern(".git", "."),
  capabilities = capabilities,
  on_attach = on_attach,
}