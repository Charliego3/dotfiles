local icons = require("icons")

local opts = {
	defaults = {
		prompt_prefix = " " .. icons.ui.Telescope .. " ",
		selection_caret = icons.ui.ChevronRight .. " ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		wrap_results = true,
		layout_config = {
			width = 0.95,
			height = 0.9,
			preview_cutoff = 120,
			horizontal = {
				preview_width = function(_, cols, _)
					if cols < 120 then
						return math.floor(cols * 0.5)
					end
					return math.floor(cols * 0.65)
				end,
				mirror = false,
				prompt_position = "top",
			},
			vertical = {
				mirror = false,
			},
		},
		vimgrep_arguments = {
			"rg",
			"-L",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--glob=!.git/",
		},
		file_ignore_patterns = {
			".git/",
			".idea/",
			".settings/",
			".vscode/",
			".fleet/",
			"node_modules/",
			"target/",
			"*.iml",
			"%.zip",
			"%.class",
		},
		path_display = {
			shorten = {
				len = 1,
				exclude = { -1, -2, -3 },
			},
		},
		winblend = 0,
		border = true,
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		dynamic_preview_title = true,
		set_env = {
			COLORTERM = "truecolor",
		},
	},
	pickers = {
		planets = {
			show_pluto = true,
			show_moon = true,
		},
		git_files = {
			-- theme = "dropdown",
			hidden = true,
			-- previewer = false,
			show_untracked = true,
		},
		lsp_references = {
			-- theme = "dropdown",
			initial_mode = "normal",
		},
		lsp_definitions = {
			-- theme = "dropdown",
			initial_mode = "normal",
		},
		lsp_declarations = {
			-- theme = "dropdown",
			initial_mode = "insert",
		},
		lsp_implementations = {
			-- theme = "dropdown",
			initial_mode = "normal",
		},
		find_files = {
			-- theme = "dropdown",
			hidden = true,
			-- previewer = true,
		},
		live_grep = {
			only_sort_text = true,
			-- theme = "dropdown",
		},
		grep_string = {
			only_sort_text = true,
			-- theme = "dropdown",
		},
		buffers = {
			theme = "dropdown",
			previewer = false,
			initial_mode = "normal",
		},
	},
	extensions_list = { "fzf" },
	extensions = {
		fzf = {
			fuzzy = false, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "ignore_case", -- smart_case or "ignore_case" or "respect_case"
		},
	},
}

return opts
