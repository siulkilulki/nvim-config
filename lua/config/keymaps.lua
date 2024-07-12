-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap

-- Delete keymaps

-- lazygit
map.del("n", "<leader>gg")
map.del("n", "<leader>gG")
map.del("n", "<leader>gl")
map.del("n", "<leader>gL")

-- windows
-- map.del("n", "<leader>ww")
-- map.del("n", "<leader>wd")
-- map.del("n", "<leader>w-")
-- map.del("n", "<leader>w|")
-- map.del("n", "<leader>-")
-- map.del("n", "<leader>|")
-- map.del("n", "<leader>wm")
--
-- window and buffer movements
map.del("n", "<S-h>")
map.del("n", "<S-l>")
map.del("n", "<C-h>")
map.del("n", "<C-l>")

-- Adding own keymaps

-- Swap ':' with ';'
vim.api.nvim_set_keymap("", ";", ":", { noremap = true })
vim.api.nvim_set_keymap("", ":", ";", { noremap = true })

-- Buffers and windows
map.set("n", "<A-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map.set("n", "<A-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
map.set("n", "<A-L>", "<cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right" })
map.set("n", "<A-H>", "<cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left" })

map.set("n", "<leader>a", "<cmd>wincmd w<cr>", { desc = "Switch windows" })
map.set("n", "<leader>d", LazyVim.ui.bufremove, { desc = "Delete Buffer" })
map.set("n", "<leader>D", "<cmd>bd<cr>", { desc = "Delete Buffer and Window" })

-- Git
map.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Run neogit" })

-- Filesystem
map.set("n", "<leader>o", "<cmd>Oil<cr>", { desc = "Oil" })
