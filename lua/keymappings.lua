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

-- FloatTerm
keymap("n", "<leader>fn", "<cmd>:FloatermNew<cr>", opts)
 

-- NvimTree
keymap("n", "<C-n>", "<cmd>:NvimTreeToggle<cr>", opts)
keymap("n", "<leader>f", "<cmd>:NvimTreeFindFile<cr>", opts)
keymap("n", "<leader>r", "<cmd>:NvimTreeRefresh<cr>", opts)
keymap("n", "<C-m>", "<cmd>:NvimTreeFocus<cr>", opts)

-- LSP Saga
keymap("n", "gh", "<cmd>:Lspsaga lsp_finder<cr>", opts)
keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
keymap("n", "gr", "<cmd>Lspsaga rename<cr>", opts)
keymap("n", "gs", "<cmd>Lspsaga signature_help<cr>", opts)
keymap("n", "gd", "<cmd>Lspsaga preview_definition<cr>", opts)

-- FloatTerm
keymap("n", "<leader>fn", "<cmd>FloatermNew<cr>", opts)
keymap("n", "<leader>fb", "<cmd>FloatermNew<cr>", opts)
