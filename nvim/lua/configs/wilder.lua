local wilder = require("wilder")
wilder.setup({ modes = { ":", "/", "?" } })

wilder.set_option("pipeline", {
	wilder.branch(wilder.cmdline_pipeline(), wilder.search_pipeline()),
})

local highlighters = {
	wilder.pcre2_highlighter(),
	wilder.lua_fzy_highlighter(),
}

local border_theme = {
	border = "rounded",
	empty_message = wilder.popupmenu_empty_message_with_spinner(),
	highlighter = highlighters,
	highlights = {
		accent = wilder.make_hl("WilderAccent", "Pmenu", { { a = 1 }, { a = 1 }, { foreground = "#f4468f" } }),
	},
	left = {
		" ",
		wilder.popupmenu_devicons(),
	},
	right = {
		" ",
		wilder.popupmenu_buffer_flags({
			flags = " a + ",
			icons = { ["+"] = "", a = "", h = "" },
		}),
		wilder.popupmenu_scrollbar(),
	},
}

local popupmenu_renderer = wilder.popupmenu_renderer(wilder.popupmenu_border_theme(border_theme))
local wildmenu_renderer = wilder.wildmenu_renderer({
	highlighter = highlighters,
	separator = " · ",
	left = { " ", wilder.wildmenu_spinner(), " " },
	right = { " ", wilder.wildmenu_index() },
})

wilder.set_option(
	"renderer",
	wilder.renderer_mux({
		[":"] = popupmenu_renderer,
		["/"] = popupmenu_renderer,
		substitute = wildmenu_renderer,
	})
)
