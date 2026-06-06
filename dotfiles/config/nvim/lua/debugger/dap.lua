local dap = require("dap")
local dapui = require("dapui")

-- Setup virtual text and UI
require("nvim-dap-virtual-text").setup()
dapui.setup()

-- Automatically open/close DAP UI when debugging starts/ends
dap.listeners.before.attach.dapui_config = function() dapui.open() end
dap.listeners.before.launch.dapui_config = function() dapui.open() end
dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

-- --- Language Specific Setup ---
-- For Go: (Since nvim-dap-go looks for 'dlv' in your PATH, and Nix provided it)
require("dap-go").setup()

-- --- Keymaps ---
vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Start/Continue Debugging" })
vim.keymap.set("n", "<Leader>di", dap.step_into, { desc = "Step Into" })
vim.keymap.set("n", "<Leader>do", dap.step_over, { desc = "Step Over" })
vim.keymap.set("n", "<Leader>dt", dap.terminate, { desc = "Terminate Session" })
