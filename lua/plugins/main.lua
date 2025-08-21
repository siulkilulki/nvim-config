local actions = require("telescope.actions")

return {
  {
    "folke/noice.nvim",
    opts = {
      routes = {
        {
          view = "notify",
          filter = { event = "msg_showmode" },
        },
      },
    },
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      -- "ibhagwan/fzf-lua", -- optional
    },
    config = true,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
          },
        },
      },
    },
  },
  {
    "N1kica/telescope-changed-files",
    config = function()
      require("telescope").load_extension("changed_files")
    end,
  },
  -- lua with lazy.nvim
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },
  -- {
  --   "max397574/better-escape.nvim",
  --   -- enabled = false,
  --   opts = {
  --     mapping = { "jk", "kj" }, -- a table with mappings to use
  --     timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
  --     clear_empty_lines = false, -- clear line after escaping if there is only whitespace
  --     keys = "<Esc>",
  --   },
  -- },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
    },
  },
  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "cuducos/yaml.nvim",
    ft = { "yaml" }, -- optional
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
    },
  },
  { -- just for yaml key/value in lualine
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        sections = {
          lualine_x = { require("yaml_nvim").get_yaml_key_and_value },
        },
      })
    end,
  },
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    config = function()
      -- Setup orgmode
      require("orgmode").setup({
        org_agenda_files = "~/orgfiles/**/*",
        org_default_notes_file = "~/orgfiles/refile.org",
      })

      -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
      -- add ~org~ to ignore_install
      -- require('nvim-treesitter.configs').setup({
      --   ensure_installed = 'all',
      --   ignore_install = { 'org' },
      -- })
    end,
  },
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   opts = {
  --     model = "claude-sonnet-4",
  --   },
  -- },
  {
    "zbirenbaum/copilot.lua",
    -- Use opts override so it merges with LazyExtras and forces gpt-5
    opts = function(_, opts)
      opts = opts or {}
      opts.copilot_model = "gpt-5"
      return opts
    end,
  },

}
