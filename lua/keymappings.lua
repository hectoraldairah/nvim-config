local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ","
vim.g.maplocalleader = ","


-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Save faster
keymap("n", "<leader>w", "<cmd>:w!<CR>", opts) 

-- Remove highlights
keymap("n", "<CR>", ":noh<CR><CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Naviagate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Telescope
keymap("n", "<C-o>", "<cmd>lua require('telescope.builtin').find_files({hidden=true}) <cr>", opts)
keymap("n", "<C-p>", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)


-- Open links under cursor in browser with gx
if vim.fn.has('macunix') == 1 then
  keymap("n", "gx", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>", opts)
else
  keymap("n", "gx", "<cmd>silent execute '!xdg-open ' . shellescape('<cWORD>')<CR>", opts)
end


-- NvimTree
keymap("n", "<C-n>", "<cmd>:NvimTreeToggle<cr>", opts)
keymap("n", "<leader>f", "<cmd>:NvimTreeFindFile<cr>", opts)
keymap("n", "<leader>r", "<cmd>:NvimTreeRefresh<cr>", opts)
keymap("n", "<C-m>", "<cmd>:NvimTreeFocus<cr>", opts)


-- FloatTerm
keymap("n", "<leader>fn", "<cmd>FloatermNew<cr>", opts)
keymap("n", "<leader>fb", "<cmd>FloatermNew<cr>", opts)

-- Spectre
keymap("n", "<Leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", opts)
keymap("v", "<Leader>S", "<cmd>lua require('spectre').open()<CR>", opts)


-- LSP
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references({ includeDeclaration = false })<CR>", opts)
keymap("n", "<C-Space>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("v", "<leader>ca", "<cmd>'<,'>lua vim.lsp.buf.range_code_action()<CR>", opts)
keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
keymap("v", "<leader>cf", "<cmd>'<.'>lua vim.lsp.buf.format()<CR>", opts)
keymap("n", "<leader>cl", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>", opts)
keymap("n", "L", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
keymap("n", "]g", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded', max_width = 100 }})<CR>", opts)
keymap("n", "[g", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded', max_width = 100 }})<CR>", opts)

-- Buffers
keymap("n", "<Tab>", ":BufferNext<CR>", opts)
keymap("n", "gn", ":bn<CR>", opts)
keymap("n", "<S-Tab>", ":BufferPrevious<CR>", opts)
keymap("n", "gp", ":bp<CR>", opts)
keymap("n", "<S-q>", ":BufferClose<CR>", opts)


