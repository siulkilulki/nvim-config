-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/snippets/my-snippets" } })
vim.cmd("highlight! Folded guibg=NONE")
--vim.g.TELESCOPE_CHANGED_FILES_BASE_BRANCH = "main"
