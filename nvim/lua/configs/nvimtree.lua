local icons = require("icons")

return {
	renderer = {
		group_empty = false,
		add_trailing = true,
		highlight_git = true,
		highlight_opened_files = "all",
		highlight_modified = "all",
		indent_width = 2,
		root_folder_label = ":~:s?$?/..?",
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "╰─",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = "after",
			modified_placement = "after",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
				modified = true,
			},
			glyphs = {
				default = icons.ui.Text,
				symlink = icons.ui.FileSymlink,
				bookmark = icons.ui.BookMark,
				modified = icons.git.FileUnstaged,
				folder = {
					arrow_closed = icons.ui.ChevronShortRight,
					arrow_open = icons.ui.ChevronShortDown,
					default = icons.ui.Folder,
					open = icons.ui.FolderOpen,
					empty = icons.ui.EmptyFolder,
					empty_open = icons.ui.EmptyFolderOpen,
					symlink = icons.ui.FileSymlink,
					symlink_open = icons.ui.FolderSymlink,
				},
				git = {
					unstaged = icons.git.FileUnstaged,
					staged = "✓",
					unmerged = icons.git.FileUnmerged,
					renamed = icons.git.FileRenamed,
					untracked = icons.git.FileUntracked,
					deleted = icons.git.FileDeleted,
					ignored = icons.git.FileIgnored,
				},
			},
		},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		show_on_open_dirs = false,
		severity = {
			min = vim.diagnostic.severity.HINT,
			max = vim.diagnostic.severity.ERROR,
		},
		icons = {
			hint = icons.diagnostics.BoldHint,
			info = icons.diagnostics.BoldInformation,
			warning = icons.diagnostics.BoldWarning,
			error = icons.diagnostics.BoldError,
		},
	},
	git = {
		enable = true,
		ignore = false,
		show_on_dirs = true,
		show_on_open_dirs = false,
	},
	modified = {
		enable = true,
		show_on_dirs = true,
		show_on_open_dirs = false,
	},
}
