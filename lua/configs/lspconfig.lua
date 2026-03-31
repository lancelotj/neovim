require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "ts_ls", "gopls", "pyright", "gopls", "templ" }

-- read :h vim.lsp.config for changing options of lsp servers
-- 1. Setup ts_ls (TypeScript/JavaScript logic)

vim.lsp.config("ts_ls", {
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
  -- This ensures ts_ls doesn't try to format if you want Prettier/Eslint to do it
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
})

vim.lsp.enable(servers)
