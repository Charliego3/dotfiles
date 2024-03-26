require("pantran").setup({
	default_engine = "google",
	engines = {
		google = {
			default_source = "auto",
			default_target = "zh-CN",
		},
	},
})
