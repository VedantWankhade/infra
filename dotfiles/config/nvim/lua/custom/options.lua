vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.termguicolors = true    -- 24 bit terminal colors

-- tabs to spaces
vim.opt.expandtab = true    -- convert tab to spaces
vim.opt.softtabstop = 4     -- insert 4 spaces for a tab
vim.opt.tabstop = 4         -- keep this at 4 so that editing operations like using 'x' to delete will work on single character (space), but hitting backspace deletes as tab
vim.opt.shiftwidth = 4      -- keep same as softtabstop

vim.opt.scrolloff = 20      -- keep the cursor above 20 lines
vim.opt.signcolumn = "yes"  -- show symbols and signs in gutter when available - warnings, hints etc from git, lsp or other stuff
vim.opt.winborder = "rounded"

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], {desc = 'Exit terminal insert mode'})
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  callback = function()
      vim.opt.number = false
      vim.opt.relativenumber = false
    vim.cmd('startinsert')
  end,
})
