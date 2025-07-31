return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
    config = function() 
        vim.api.nvim_create_user_command('FormatDisable', function(args)
        if args.bang then
          -- :FormatDisable! disables autoformat for this buffer only
          vim.b.disable_autoformat = true
        else
          -- :FormatDisable disables autoformat globally
          vim.g.disable_autoformat = true
        end
      end, {
        desc = 'Disable autoformat-on-save',
        bang = true, -- allows the ! variant
      })

      vim.api.nvim_create_user_command('FormatEnable', function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
        desc = 'Re-enable autoformat-on-save',
      })
    end,
    keys = {
      {
        '<leader>tf',
        function()
          -- If autoformat is currently disabled for this buffer,
          -- then enable it, otherwise disable it
          if vim.b.disable_autoformat then
            vim.cmd 'FormatEnable'
            vim.notify 'Enabled autoformat for current buffer'
          else
            vim.cmd 'FormatDisable!'
            vim.notify 'Disabled autoformat for current buffer'
          end
        end,
        desc = 'Toggle autoformat for current buffer',
      },
      {
        '<leader>tF',
        function()
          -- If autoformat is currently disabled globally,
          -- then enable it globally, otherwise disable it globally
          if vim.g.disable_autoformat then
            vim.cmd 'FormatEnable'
            vim.notify 'Enabled autoformat globally'
          else
            vim.cmd 'FormatDisable'
            vim.notify 'Disabled autoformat globally'
          end
        end,
        desc = 'Toggle autoformat globally',
      },
    },
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

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
        "html", "css", "typescript", "markdown", "markdown_inline", "python"
  		},
      lazy = false,
      highlight = {
        enabled = true,
      },
  	},
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      scope = {
        enabled = true,
      }
    },
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    ft = { 'markdown' },
    opts = {},
  }
}


