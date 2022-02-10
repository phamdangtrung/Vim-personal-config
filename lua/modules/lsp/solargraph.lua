local capabilities = vim.lsp.protocol.make_client_capabilities()
local on_attach = require "modules.lsp.on_attach"
if package.loaded['cmp_nvim_lsp'] then
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
end
local lspconfig = require "lspconfig"
lspconfig.solargraph.setup {
  cmd = {
      "solargraph",
      "stdio"
  },
  filetypes = {
      "ruby"
  },
  init_options = {
    formatting = true
  },
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
  capabilities = capabilities,
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