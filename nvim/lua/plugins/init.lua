return {
	-- {
	-- 	"neovim/nvim-lspconfig",
	-- 	opts = {
	-- 		inlay_hints = { enabled = true },
	-- 		servers = {
	-- 			lua_ls = {
	-- 				settings = {
	-- 					Lua = {
	-- 						hint = { enable = true },
	-- 					},
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- },

	{
		"rcarriga/nvim-notify",
		lazy = false,
		config = function()
			require("configs.notify")
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server",
				"stylua",
				"delve",
				"gofumpt",
				"jdtls",
				"google-java-format",
			},
		},
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("configs.conforms")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = require("configs.gitsign"),
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = require("configs.nvimtree"),
	},
	{
		"karb94/neoscroll.nvim",
		lazy = false,
		config = function()
			require("neoscroll").setup({})
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		requires = { "nvim-telescope/telescope.nvim" },
		build = "make",
	},
	{
		"nvim-telescope/telescope.nvim",
		opts = require("configs.telescope"),
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"java",
				"go",
				"gomod",
				"gosum",
				"gowork",
				"gotmpl",
				"javascript",
				"typescript",
				"properties",
				"sql",
				"make",
				"markdown",
				"json",
				"json5",
				"jsonc",
				"jsdoc",
			},
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_line = 1000,
			},
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "VeryLazy",
		config = function()
			require("configs.treesitterctx")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		event = "BufWinEnter",
		branch = "main",
		config = require("configs.terminal").setup,
	},

	-- automatically highlighting other uses of the word under the cursor
	{
		"RRethy/vim-illuminate",
		event = "VeryLazy",
		config = function()
			require("configs.illuminate")
		end,
	},

	-- breadcrumbs
	{
		"utilyre/barbecue.nvim",
		event = "VeryLazy",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"kyazdani42/nvim-web-devicons", -- optional dependency
		},
		config = function()
			require("configs.barbecue")
		end,
	},
	-- adds indentation guides to all lines
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("configs.blankline")
		end,
	},

	-- Automatically provides suggestions as you type & High level of customisation
	{ "romgrk/fzy-lua-native" },
	{
		"gelguy/wilder.nvim",
		event = "VeryLazy",
		build = ":UpdateRemotePlugins",
		config = function()
			require("configs.wilder")
		end,
	},

	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, _)
			require("configs.signature")
		end,
	},

	{ "folke/neodev.nvim", opts = {} },
	-- debugging adapter
	{ "nvim-neotest/nvim-nio" },
	{
		"theHamsta/nvim-dap-virtual-text",
		event = "VeryLazy",
		config = function()
			require("configs.dap-virtual")
		end,
	},
	-- { "mfussenegger/nvim-jdtls" },
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			config = function()
				require("configs.dapx")
			end,
		},
		config = function()
			require("neodev").setup({
				library = { plugins = { "nvim-dap-ui" }, types = true },
			})

			local dap, dapui = require("dap"), require("dapui")
			dapui.setup()
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			-- dap.listeners.before.event_terminated.dapui_config = function()
			-- 	dapui.close()
			-- end
			-- dap.listeners.before.event_exited.dapui_config = function()
			-- 	dapui.close()
			-- end
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- Translate plugin
	{
		"potamides/pantran.nvim",
		event = "VeryLazy",
		config = function()
			require("configs.pantran")
		end,
	},
	{
		"sindrets/diffview.nvim",
		event = "VeryLazy",
		config = function()
			require("diffview").setup({
				enhanced_diff_hl = true,
				view = {
					default = {
						winbar_info = true,
					},
				},
			})
		end,
	},
	-- {
	-- 	"Exafunction/codeium.vim",
	-- 	event = "BufEnter",
	-- 	disabled = true,
	-- },
}
