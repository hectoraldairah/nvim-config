local mason_ok, mason = pcall(require, 'mason')
local mason_lsp_ok, mason_lsp = pcall(require, 'mason-lspconfig')

if not mason_ok or not mason_lsp_ok then
  return
end

mason.setup {
  ui = {
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = "rounded",
  }
}

mason_lsp.setup {
  -- A list of servers to automatically install if they're not already installed
  ensure_installed = { "bash-language-server", "css-lsp", "eslint-lsp", "graphql-language-service-cli", "html-lsp",
    "json-lsp", "lua-language-server", "tailwindcss-language-server", "typescript-language-server",
    "vetur-vls", "vue-language-server", "chrome-debug-adapter", "node-debug2-adapter" },

  -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
  -- This setting has no relation with the `ensure_installed` setting.
  -- Can either be:
  --   - false: Servers are not automatically installed.
  --   - true: All servers set up via lspconfig are automatically installed.
  --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
  --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
  automatic_installation = true,
}

local lspconfig = require("lspconfig")


local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded "}),
  ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
    { virtual_text = true }),
}

local function on_attach(client, bufnr)
  -- set up buffer keymaps, etc.
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if cmp_nvim_lsp_ok then
  capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
end


lspconfig.tsserver.setup {
  on_attach = require('lsp.servers.tsserver').on_attach,
  capabilities = require('lsp.servers.tsserver').capabilities,
  filetypes = require('lsp.servers.tsserver').filetypes,
  cmd = { "typescript-language-server", "--stdio" },
  init_options = { hostInfo = "neovim" },
  root_dir = require('lsp.servers.tsserver').root_dir,
}

lspconfig.sumneko_lua.setup {
  handlers = handlers,
  on_attach = on_attach,
  settings = require('lsp.servers.sumneko_lua').settings,
}

lspconfig.cssls.setup {
  cmd = require('lsp.servers.cssls').cdm,
  filetypes = require('lsp.servers.cssls').filetype,
  root_dir = require('lsp.servers.cssls').root_dir,
  settings = require('lsp.servers.cssls').settings,
  on_attach = require('lsp.servers.cssls').on_attach,
  handlers = require('lsp.servers.cssls').handlers,
}