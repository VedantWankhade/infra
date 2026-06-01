-- lua/lsp.lua (Main LSP setup file)
-- Define global LSP settings using vim.lsp.config('*', ...)
-- These apply to ALL language servers unless overridden.
vim.lsp.config("*", {
  flags = {
    -- Debounce settings can improve performance
    debounce_text_changes = 150,
  },
  -- Example: Define common on_attach or capabilities here if desired
})

-- Initialize lspconfig to add its configurations to the runtime path
require("lspconfig")

-- List the servers you want to enable
local servers = {
  "lua_ls",
  "gopls",
  -- Add other servers like "tsserver", "pyright", etc.
}

-- Enable the listed servers.
-- This triggers Neovim to look for configurations in the runtime path
-- (both from lspconfig and your custom ~/.config/nvim/lsp/)
vim.lsp.enable(servers)

-- Optional: Add global keymaps for LSP functions here,
-- perhaps within a general on_attach function passed to vim.lsp.config('*', ...)