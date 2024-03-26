require("lsp_signature").setup({
	bind = true,
	handler_opts = {
		border = "rounded",
	},
	floating_window = true,
	hint_enable = true,
	hint_prefix = "📌 ",
	hint_scheme = "String",
	hi_parameter = "LspSignatureActiveParameter",
	zindex = 2000,
	padding = "",
})
