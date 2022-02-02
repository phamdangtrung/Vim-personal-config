local function lua_nmap(key, cmd, opts)
  require('core.utils').keymap.buf_map('n', key, '<cmd>lua ' .. cmd .. '<CR>', opts)
end
return function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  local opts = { noremap=true, silent=true }

  lua_nmap('K', 'vim.lsp.buf.hover()', opts)
  lua_nmap('<C-k>', 'vim.lsp.buf.signature_help()', opts)
  lua_nmap('gd', 'vim.lsp.buf.definition()', opts)
  lua_nmap('gD', 'vim.lsp.buf.declaration()', opts)
  lua_nmap('gi', 'vim.lsp.buf.implementation()', opts)
  lua_nmap('gr', 'vim.lsp.buf.references()', opts)

  lua_nmap('<space>ca', 'vim.lsp.buf.code_action()', opts)
  lua_nmap('<space>D', 'vim.lsp.buf.type_definition()', opts)
  lua_nmap('<space>rn', 'vim.lsp.buf.rename()', opts)
  lua_nmap('<space>td', 'require"modules.config.nvim-lspconfig.ui".toggle_virtual_text()', opts)
  lua_nmap('<space>f', 'vim.lsp.buf.formatting()', opts)
end

