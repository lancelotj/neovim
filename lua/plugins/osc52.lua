return {
  "ojroques/nvim-osc52",
  lazy = false,
  config = function()
    -- require("osc52").setup({
    --   max_length = 0,           -- Maximum length of selection (0 for no limit)
    --   silent = false,           -- Disable message on successful copy
    --   trim = false,             -- Trim surrounding whitespaces before copy
    --   tmux_passthrough = true,  -- SET TO TRUE IF USING TMUX (see note below)
    -- })

    -- OPTION 1: Manual Keymaps
    -- <leader>c  is an operator (e.g., <leader>cip copies a paragraph)
    -- <leader>cc copies the current line
    -- <leader>c  in visual mode copies the selection
    -- vim.keymap.set('n', '<leader>c', require('osc52').copy_operator, { expr = true, desc = "Copy via OSC52" })
    -- vim.keymap.set('n', '<leader>cc', '<leader>c_', { remap = true, desc = "Copy line via OSC52" })
    -- vim.keymap.set('v', '<leader>c', require('osc52').copy_visual, { desc = "Copy selection via OSC52" })

    -- OPTION 2: Use as your default clipboard provider
    -- This makes any yank (y) to the + or * register use OSC52 automatically
    local function copy(lines, _)
      require('osc52').copy(table.concat(lines, '\n'))
    end

    local function paste()
      return {vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('')}
    end

    vim.g.clipboard = {
      name = 'osc52',
      copy = {['+'] = copy, ['*'] = copy},
      paste = {['+'] = paste, ['*'] = paste},
    }

    -- Now the '+' register will copy to system clipboard using OSC52
    vim.keymap.set('n', '<leader>y', '"+y')
    vim.keymap.set('n', '<leader>yy', '"+yy')
  end,
}
