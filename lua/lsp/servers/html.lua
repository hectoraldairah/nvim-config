local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

local root_pattern = require 'lspconfig'.util.root_pattern;

M.capabilities = capabilities;
M.cmd = { "vscode-html-language-server", "--stdio" };
M.filetypes = { "html", "nunjucks", "njk" };
M.init_options = {
  configurationSection = { "html", "css", "javascript" },
  embeddedLanguages = { css = true, javascript = true },
  provideFormatter = true
}

return M;
