require("nvchad.mappings")

-- add yours here
local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })
map("i", "jk", "<ESC>", { desc = "Escape insert mode" })
map("i", "<C-s>", "<ESC>:w<CR>", { noremap = true, silent = true, desc = "Save current buffer" })
map("n", "<C-q>", ":q<CR>", opts)

-- debugging
map(
	"n",
	"<leader>db",
	"<ESC>:lua require('dap').toggle_breakpoint()<CR>",
	{ noremap = true, desc = "Toggle Breakpoint" }
)
map("n", "<leader>dr", "<ESC>:lua require('dap').continue()<CR>", { noremap = true, desc = "Launch Debug Session" })
map("n", "<leader>du", "<ESC>:lua require('dapui').toggle()<CR>", { noremap = true, desc = "Toggle Dap UI" })

-- Move current line / block with Alt-j/k ala vscode.
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- Move current line / block with Alt-j/k ala vscode.
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
-- move better
map("x", "<A-j>", ":m '>+1<CR>gv-gv", opts)
map("x", "<A-k>", ":m '<-2<CR>gv-gv", opts)
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)
-- navigation on nomal mode
map("n", "<", "v<gv", opts)
map("n", ">", "v>gv", opts)
map("n", "<Tab>", "v<gv", opts)
map("n", "<S-Tab>", "v>gv", opts)

-- navigation
map("i", "<A-Up>", "<C-\\><C-N><C-w>k", opts)
map("i", "<A-Down>", "<C-\\><C-N><C-w>j", opts)
map("i", "<A-Left>", "<C-\\><C-N><C-w>h", opts)
map("i", "<A-Right>", "<C-\\><C-N><C-w>l", opts)
-- Resize with arrows
map("n", "<A-Up>", ":resize -2<CR>", opts)
map("n", "<A-Down>", ":resize +2<CR>", opts)
map("n", "<A-Left>", ":vertical resize -2<CR>", opts)
map("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- Terminal window navigatio
map("t", "<C-h>", "<C-\\><C-N><C-w>h", opts)
map("t", "<C-j>", "<C-\\><C-N><C-w>j", opts)
map("t", "<C-k>", "<C-\\><C-N><C-w>k", opts)
map("t", "<C-l>", "<C-\\><C-N><C-w>l", opts)

-- Better indenting
map("v", "<", "<gv", opts)
map("v", "<", "<gv", opts)
map("v", "<Tab>", ">gv", opts)
map("v", "<S-Tab>", "<gv", opts)

-- toggle terminal
map(
	"n",
	"<leader>tt",
	"<ESC>:ToggleTerm direction=float<CR>",
	{ noremap = true, desc = "Toggle Float Terminal Window" }
)
map(
	"n",
	"<leader>tg",
	"<ESC>:lua require('configs.terminal').lazygit_toggle()<CR>",
	{ noremap = true, desc = "Toggle Lazygit Widnow" }
)
map("n", "<leader>fr", "<ESC>:Telescope lsp_references<CR>", { noremap = true, desc = "Telescope find lsp references" })
map(
	"n",
	"<leader>tb",
	"<ESC>:lua require('trouble').toggle()<CR>",
	{ noremap = true, desc = "Toggle Trouble with LSP" }
)
map("n", "<leader>tw", function()
	require("trouble").toggle("workspace_diagnostics")
end, { noremap = true, desc = "Toggle Trouble with workspace_diagnostics" })
map("n", "<leader>td", function()
	require("trouble").toggle("document_diagnostics")
end, { noremap = true, desc = "Toggle Trouble with document_diagnostics" })
map("n", "<leader>tq", function()
	require("trouble").toggle("quickfix")
end, { noremap = true, desc = "Toggle Trouble Quick fix" })
map("n", "<leader>tl", function()
	require("trouble").toggle("loclist")
end, { noremap = true, desc = "Toggle Trouble loclist" })
map("n", "<leader>tr", "<ESC>:TroubleRefresh<CR>", { noremap = true, desc = "Refresh Trouble" })
map("n", "gR", "<ESC>:lua require('trouble').toggle('lsp_references')<CR>", { noremap = true })
