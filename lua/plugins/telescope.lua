return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      version = "^1.0.0",
    },
  },
  keys = {
    -- Fixed: Wrapped in a sub-table and updated to use the extension
    {
      "<leader>fg",
      function()
        require("telescope").extensions.live_grep_args.live_grep_args()
      end,
      desc = "Live Grep with Args",
    },
  },
  opts = function(_, opts)
    local actions = require "telescope.actions"
    opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
      preview = {
        treesitter = false,
      },
      mappings = {
        n = { ["<c-d>"] = actions.delete_buffer },
        i = {
          ["<C-h>"] = "which_key",
          ["<c-d>"] = actions.delete_buffer,
        },
      },
    })
  end,
  config = function(_, opts)
    local telescope = require "telescope"
    telescope.setup(opts)
    telescope.load_extension "live_grep_args"
    -- Note: LazyVim usually handles fzf-native loading automatically,
    -- but you can add telescope.load_extension("fzf") here if needed.
  end,
}
