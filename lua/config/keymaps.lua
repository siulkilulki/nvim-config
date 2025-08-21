-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap

-- Delete keymaps

-- lazygit
--map.del("n", "<leader>gg")
--map.del("n", "<leader>gG")
--map.del("n", "<leader>gl")
--map.del("n", "<leader>gL")

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
map.set("n", "<A-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map.set("n", "<A-L>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer right" })
map.set("n", "<A-H>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer left" })

map.set("n", "<leader>2", "<cmd>wincmd w<cr>", { desc = "Switch windows" })
map.set("n", "<leader>d", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" }) -- was used for debugging in which-key

map.set("n", "<leader>D", "<cmd>bd<cr>", { desc = "Delete Buffer and Window" })

map.set(
  "n",
  "gh",
  "<cmd>on<cr><cmd>vsp<cr><cmd>lua vim.lsp.buf.definition()<cr>",
  { desc = "Go to definition in the right window" }
)
-- Git
map.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Run neogit" })

-- Filesystem

map.set("n", "<leader>O", "<cmd>Oil<cr>", { desc = "Oil" })
--map.set("n", "<leader>fd", "<cmd>Telescope changed_files<cr>", { desc = "Preview changed files" })

-- Orgmode
map.set(
  "n",
  "<leader>o<Tab>",
  "<cmd>lua require('orgmode').action('org_mappings.toggle_checkbox')<cr>",
  { desc = "org toggle checkbox" }
)
map.set("n", "<leader>oil", "o- [ ] ", { desc = "org add checkbox" })

-- Visual debug
map.set(
  "n",
  "<leader>t",
  "Otry:<esc>j>>oexcept:<cr>__import__('ipdb').set_trace()<esc>kk^",
  { desc = "try catch ipdb" }
)

-- Auto import
-- map.set("n", "<leader>i", "ea ", { desc = "Auto import" })

-- Avante.nvim - Simple toggle for auto-suggestions (minimal approach)
-- map.set('n', '<leader>aS', function()
--   -- Test if keymap works first
--   vim.notify("Keymap <leader>aS is working!", vim.log.levels.INFO)
--
--   -- Initialize global state if not exists
--   if vim.g.avante_auto_suggestions == nil then
--     vim.g.avante_auto_suggestions = false
--   end
--
--   -- Toggle the state
--   vim.g.avante_auto_suggestions = not vim.g.avante_auto_suggestions
--
--   -- User feedback
--   local status = vim.g.avante_auto_suggestions and "ENABLED" or "DISABLED"
--   vim.notify("Avante auto-suggestions: " .. status, vim.log.levels.INFO)
-- end, { desc = 'Toggle Avante auto-suggestions' })
