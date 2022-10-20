local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded "}),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
  ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
    { virtual_text = true }),
}

if cmp_nvim_lsp_ok then
  capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.preselectSupport = true
  capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
  capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
end

local root_pattern = require'lspconfig'.util.root_pattern;

local function on_attach(client, bufnr)
  -- set up buffer keymaps, etc.
end

M.capabilities = capabilities;
M.cdm = { "vscode-css-language-server", "--stdio" };
M.filetype = { "css", "scss", "less" };
M.root_dir = root_pattern("package.json", ".git");
M.on_attach = on_attach;
M.handlers = handlers;
M.settings = {
  css = {
    validate = true
  },
  less = {
    validate = true
  },
  scss = {
    validate = true
  }
}

return M;
