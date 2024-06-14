vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", ":Oil --float<CR>")

-- enable VSCode-like alt-arrow-key navigation using the J and K keys
-- when in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- joins two lines together, but keeps the cursor at its initial position when
-- in normal mode
vim.keymap.set("n", "J", "mzJ`z")

-- move up or down the page, keeping the cursor in the center of the screen
-- when in normal mode
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- after performing a search and jumping to next/previous instances, keep the
-- cursor in the center of the screen when in normal mode
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- dump the replaced contents to the void register and paste over it
vim.keymap.set("x", "<leader>p", '"_dP')

-- shortcut to add yanked text to system clipboard when in normal or visual
-- mode
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- dump the cut contents to the void register when in normal or visual mode
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- don't ever press Q
vim.keymap.set("n", "Q", "<nop>")

-- quickly replace all instances of the word the cursor is in. For more
-- granular symbol renaming, use `<leader>rs`, provided in /after/plugin/lspconfig.lua
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- quickly shoutout a file
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)
