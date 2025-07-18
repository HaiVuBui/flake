-- indentation tab == 2 spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number relativenumber")

vim.opt.conceallevel = 2
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})


-- Send all yank/delete/put operations to the system clipboard
vim.opt.clipboard = 'unnamedplus'


vim.api.nvim_set_keymap('n', '<leader>b', ':w<CR>:!make<CR>', { noremap = true, silent = false, desc= "build"})

-- lazy.nvim
require("config.lazy")
