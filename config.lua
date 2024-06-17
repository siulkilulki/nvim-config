--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "tokyonight-day"
vim.opt.relativenumber = true
vim.opt.fillchars = {
  fold = ' ',
  diff = '╱',
  wbr = '─',
  msgsep = '─',
  horiz = ' ',
  horizup = '│',
  horizdown = '│',
  vertright = '│',
  vertleft = '│',
  verthoriz = '│',
}

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
if vim.env.TERM == 'xterm-kitty' then
  vim.cmd([[autocmd UIEnter * if v:event.chan ==# 0 | call chansend(v:stderr, "\x1b[>1u") | endif]])
  vim.cmd([[autocmd UILeave * if v:event.chan ==# 0 | call chansend(v:stderr, "\x1b[<1u") | endif]])
end
lvim.keys.normal_mode = {
  ['<A-l>'] = ':BufferLineCycleNext<CR>',
  ['<A-h>'] = ':BufferLineCyclePrev<CR>',
  ['<C-x>'] = ':bd<CR>',
  ['<C-l>'] = ':BufferLineMoveNext<CR>',
  ['<C-h>'] = ':BufferLineMovePrev<CR>',
}
-- Swap ':' with ';'
vim.api.nvim_set_keymap('', ';', ':', { noremap = true })
vim.api.nvim_set_keymap('', ':', ';', { noremap = true })

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
-- lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.dap.active = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
}
lvim.builtin.treesitter.ignore_install = { "haskell" }

lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
local opts = {
  settings = {
    pyright = {
      disableOrganizeImports = true,
      analysis = {
        typeCheckingMode = "off",
      },
      typeCheckingMode = "off",
      -- linting = {
      --   mypyEnabled = true
      -- }
    }
  }
} -- check the lspconfig documentation for a list of all possible options

require("lvim.lsp.manager").setup("pyright", opts)
-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
  --   {
  --     command = "prettier",
  --     ---@usage arguments to pass to the formatter
  --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --     args = { "--print-with", "100" },
  --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --     filetypes = { "typescript", "typescriptreact" },
  --   },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "mypy", filetypes = { "python" } },
  {
    command = "shellcheck",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    args = { "--severity", "warning" },
  },
  {
    command = "codespell",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "python" },
  },
}

-- Additional Plugins
lvim.plugins = {
  {
    'ggandor/lightspeed.nvim',
    dependencies = 'tpope/vim-repeat'
  },
  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('diffview').setup({
        merge_tool = {
          layout = "diff3_mixed"
        }
      })
    end,
  },
  {
    'TimUntersberger/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim'
    },
    config = function()
      require('neogit').setup({
        integrations = {
          diffview = true
        }
      })
    end,
    event = "BufRead"
  },
  { "nvim-telescope/telescope-dap.nvim" },
  -- {
  --   "rcarriga/nvim-dap-ui",
  --   requires = { "mfussenegger/nvim-dap" }
  -- },
  { 'mfussenegger/nvim-dap-python' },
  { 'HiPhish/debugpy.nvim' },
  { 'theHamsta/nvim-dap-virtual-text' },
  -- { 'hrsh7th/cmp-nvim-lsp-signature-help' },
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup({
        mapping = { "jk", "kj" },
        timeout = vim.o.timeoutlen,
        clear_empty_lines = false,
        keys = "<Esc>",
      })
    end,
  },
  {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      })
    end,
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  -- {
  --
  --   'folke/tokyonight.nvim',
  --   config = function()
  --     -- require("user.theme").tokyonight()
  --     require("tokyonight").setup() {
  --       style = "day"
  --     }
  --     vim.cmd [[colorscheme tokyonight]]
  --   end
  -- }
  -- {
  --   "nvim-neorg/neorg",
  --   -- tag = "*",
  --   ft = "norg",
  --   after = "nvim-treesitter", -- You may want to specify Telescope here as well
  --   config = function()
  --       require('neorg').setup {
  --         load = {
  --           ["core.defaults"] = {}
  --         }
  --       }
  --   end
  -- }
}

-- Your personal default settings
local default = { justMyCode = false }

-- Implementation which injects your default settings
require('debugpy').run = function(config)
  local final = vim.tbl_extend('keep', config, default)
  require('dap').run(final)
end

vim.list_extend(lvim.builtin.cmp.sources, { { name = "nvim_lsp_signature_help" } })
require("dapui").setup()
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }


-- Additional Leader bindings for WhichKey
lvim.builtin.which_key.mappings["g"].g = { "<cmd>Neogit<CR>", "Neogit" }
-- Additional Plugins
-- lvim.plugins = {
--     {"folke/tokyonight.nvim"},
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands = {
--   {
--     "BufWritePost", {
--       pattern = { "*" },
--       command = "echo strftime('%c')"
--     }
--   },
-- }


require("luasnip.loaders.from_lua").load({ paths = "~/.config/lvim/snippets/my-snippets" })

_G.debug_mode = function()
  require('dap.ext.autocompl').attach()
  vim.cmd([[
      nnoremap <buffer> n :lua require'dap'.step_over()<cr>
      nnoremap <buffer> s :lua require'dap'.step_into()<cr>
      nnoremap <buffer> k :lua require'dap'.up()<cr>
      nnoremap <buffer> j :lua require'dap'.down()<cr>
      nnoremap <buffer> c :lua require'dap'.continue()<cr>
      inoremap <buffer> <C-x> <C-x><C-o>
   ]])
end

-- nnoremap <buffer> p :lua require'dap'.step_back()<cr>


vim.cmd("au FileType dap-repl lua debug_mode()")
_G.debugpy_attach = function()
  local port = vim.fn.input('Debug port: ')
  require("nvim-dap-virtual-text").setup {
    enabled = true,
    enabled_commands = true
  }
  vim.cmd(':Debugpy attach 127.0.0.1 ' .. port)
end


lvim.builtin.which_key.mappings["da"] = { ":lua debugpy_attach()<CR>", "Attach" }
-- lvim.builtin.which_key.mappings["de"] = { ":lua require('dapui').toggle()<CR>", "Toggle UI" }
lvim.builtin.which_key.mappings["de"] = { ":lua require('dapui').repl.open({}, 'vsplit')<CR>", "Toggle UI" }
lvim.builtin.which_key.mappings["r"] = {
  ":echo system('socat - UNIX-CONNECT:/raid/djurkiewicz/.sockets/clipboard.sock', getreg('+'))<CR>",
  "Copy to local machine" }
lvim.builtin.which_key.mappings["w"] = { "<C-w>w", "Switch tab" }
lvim.builtin.which_key.mappings['c'] = {}
lvim.builtin.which_key.mappings['x'] = { "<cmd>BufferKill<CR>", "Close Buffer" }
lvim.builtin.which_key.setup.plugins.marks = true
