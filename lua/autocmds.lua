require "nvchad.autocmds"

-- always open quickfix window automatically.
-- this uses cwindows which will open it only if there are entries.
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
	group = vim.api.nvim_create_augroup("AutoOpenQuickfix", { clear = true }),
	pattern = { "[^l]*" },
	command = "cwindow"
})

