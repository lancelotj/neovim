return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- NvChad v2.5 pins nvim-treesitter `master`, which is frozen and broken on
  -- Neovim 0.12 (query captures became `table<integer, TSNode[]>`). Use the
  -- maintained `main` rewrite, which targets 0.12. Parsers/queries install to
  -- stdpath('data')/site; run `:TSInstall` after changing `ensure_installed`.
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false, -- `main` does not support lazy-loading
    build = ":TSUpdate",
    opts = function()
      -- NvChad's opts also load the base46 syntax/treesitter caches.
      local opts = require "nvchad.configs.treesitter"
      opts.ensure_installed = {
        "vim",
        "vimdoc",
        "lua",
        "luadoc",
        "printf",
        "markdown",
        "markdown_inline",
        "html",
        "css",
        "typescript",
        "javascript",
        "python",
        "bash",
        "json",
        "yaml",
        "toml",
        "query",
        "elixir",
        "heex",
        "eex",
      }
      return opts
    end,
    config = function(_, opts)
      require("nvim-treesitter").setup(opts)
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      scope = {
        enabled = true,
      },
    },
  },

  -- {
  --   "sindrets/diffview.nvim",
  --   cmd = "DiffviewOpen",
  -- },
}
