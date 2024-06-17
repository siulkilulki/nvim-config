-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap

map.del("n", "<leader>gg")
map.del("n", "<leader>gG")
map.del("n", "<leader>gl")
map.del("n", "<leader>gL")
map.del("n", "<S-h>")
map.del("n", "<S-l>")
map.del("n", "<C-h>")
map.del("n", "<C-l>")

-- Swap ':' with ';'
vim.api.nvim_set_keymap("", ";", ":", { noremap = true })
vim.api.nvim_set_keymap("", ":", ";", { noremap = true })

-- Buffers
map.set("n", "<A-l>", ":BufferLineCycleNext<cr>", { desc = "Next buffer" })
map.set("n", "<A-h>", ":BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
map.set("n", "<A-L>", ":BufferLineMoveNext<CR>", { desc = "Move buffer right" })
map.set("n", "<A-H>", ":BufferLineMovePrev<CR>", { desc = "Move buffer left" })

-- Git
map.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Run neogit" })
