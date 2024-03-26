local options = {
	lsp_fallback = true,

	formatters_by_ft = {
		lua = { "stylua" },
		go = { "goimports", "gofumt" },
		-- java = { "google_java" },
	},

	format_on_save = {
		lsp_fallback = true,
		timeout_ms = 500,
	},
}

local conform = require("conform")
conform.setup(options)

-- local google_java = vim.deepcopy(require("conform.formatters.google-java-format"))
-- require("conform.util").add_formatter_args(google_java, { "-a" })
-- conform.formatters.google_java = google_java
