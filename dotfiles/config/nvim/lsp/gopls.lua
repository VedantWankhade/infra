-- ~/.config/nvim/lsp/gopls.lua (Custom overrides for gopls)
-- This file MUST be located at 'lsp/gopls.lua' relative to your config root.
-- It should return a Lua table containing the settings to merge.
return {
  -- Example: Override capabilities (ensure your LSP client supports this)
  -- capabilities = {
  --   workspace = {
  --     didChangeWatchedFiles = { dynamicRegistration = false },
  --   },
  -- },
  settings = {
    gopls = {
      -- Example: Enable all inlay hints for gopls
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true, -- Example: Also enable constant value hints
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },

      -- Example: Add build tags
      buildFlags = { "-tags=e2e,integration" },
      -- Add other gopls specific settings here
    },
  },
  -- Example: Add a custom on_attach specifically for gopls
  -- on_attach = function(client, bufnr)
  --   print("Attaching gopls with custom settings!")
  --   -- Add gopls-specific keymaps or logic here
  -- end,


  vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    
    -- Request gopls to organize imports synchronously
    -- buf_request_sync defaults to a 1000ms timeout.
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-8"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    
    -- Run standard LSP formatting synchronously
    vim.lsp.buf.format({ async = false })
  end,
})


}
