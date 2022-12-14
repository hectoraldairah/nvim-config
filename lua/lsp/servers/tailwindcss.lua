local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded " }),
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

local root_pattern = require 'lspconfig'.util.root_pattern;

M.capabilities = capabilities;

M.filetypes = {
  "html",
  "css",
  "scss",
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact"
};
M.cmd = { "tailwindcss-language-server", "--stdio" };
M.root_dir = root_pattern("tailwind.config.js", "tailwind.config.cjs", "tailwind.config.ts", "postcss.config.js",
  "postcss.config.ts", "package.json", "node_modules", ".git");
M.handlers = handlers;

return M;
