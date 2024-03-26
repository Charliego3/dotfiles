vim.opt.termguicolors = true
vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "#000000" })
require("notify").setup({
	background_color = "#000000",
	stages = "slide",
	timeout = 5000,
})
vim.notify = require("notify")
