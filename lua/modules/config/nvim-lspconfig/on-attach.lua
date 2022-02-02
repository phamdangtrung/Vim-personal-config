local function lua_nmap(key, cmd, opts)
  require('core.utils').keymap.buf_map('n', key, '<cmd>lua ' .. cmd .. '<CR>', opts)
end
local opts = { noremap=true, silent=true }
return function(client)
  vim.opt.omnifunc = 'v:lua.vim.lsp.omnifunc'

  -- lua_nmap('K', 'vim.lsp.buf.hover()', opts)
  -- lua_nmap('<C-k>', 'vim.lsp.buf.signature_help()', opts)
  -- lua_nmap('gd', 'vim.lsp.buf.definition()', opts)
  -- lua_nmap('gD', 'vim.lsp.buf.declaration()', opts)
  -- lua_nmap('gi', 'vim.lsp.buf.implementation()', opts)
  -- lua_nmap('gr', 'vim.lsp.buf.references()', opts)

  -- lua_nmap('<space>ca', 'vim.lsp.buf.code_action()', opts)
  -- lua_nmap('<space>D', 'vim.lsp.buf.type_definition()', opts)
  -- lua_nmap('<space>rn', 'vim.lsp.buf.rename()', opts)
  -- lua_nmap('<space>td', 'require"modules.config.nvim-lspconfig.ui".toggle_virtual_text()', opts)
  -- lua_nmap('<space>f', 'vim.lsp.buf.formatting()', opts)
  
  -- lua_nmap('[d', 'vim.lsp.diagnostic.goto_prev()', opts)
  -- lua_nmap(']d', 'vim.lsp.diagnostic.goto_next()', opts)

  local lsp_signature = safe_require 'lsp_signature'
  if lsp_signature then
    lsp_signature.on_attach()
  end

  -- So that the only client with format capabilities is efm
  if client.name ~= 'efm' then
    client.resolved_capabilities.document_formatting = false
  end

  if client.resolved_capabilities.document_formatting then
    vim.cmd [[
        augroup Format
          au! * <buffer>
          au BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)
        augroup END
      ]]
  end
end
