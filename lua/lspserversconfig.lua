local root_pattern = require'lspconfig'.util.root_pattern; 
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require("nvim-lsp-installer").setup({
    ensure_installed = {'typescript-language-server'},
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

require'lspconfig'.elixirls.setup {
    capabilities = capabilities,
    cmd = {"/Users/hectoraldairaguilarhernandez/lsp-servers/elixir/language_server.sh"};
    filetypes = { "elixir", "eelixir", "heex" };
  }


-- Typescript | Javascript
require'lspconfig'.tsserver.setup{
  capabilities = capabilities,
  cmd = { "typescript-language-server", "--stdio" };
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" };
  init_options = { hostInfo = "neovim" };
  root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"); 
}

--- HTML

require'lspconfig'.html.setup {
  capabilities = capabilities,
  cmd = {"vscode-html-language-server", "--stdio" },
  filetypes = { "html", "nunjucks", ".njk"}
}
