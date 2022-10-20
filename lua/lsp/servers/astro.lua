local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

local root_pattern = require'lspconfig'.util.root_pattern;

M.cmd = { "astro-ls", "--stdio" };
M.filetypes = { "astro" };
M.root = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git");

return M;
