local M = {}

local opts = {
	-- size can be a number or function which is passed the current terminal
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		else
			return 20
		end
	end,
	open_mapping = [[<c-\>]],
	hide_numbers = true, -- hide the number column in toggleterm buffers
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
	start_in_insert = true,
	insert_mappings = true, -- whether or not the open mapping applies in insert mode
	persist_size = false,
	-- direction = 'vertical' | 'horizontal' | 'window' | 'float',
	direction = "float",
	close_on_exit = true, -- close the terminal window when the process exits
	shell = vim.o.shell, -- change the default shell
	-- This field is only relevant if direction is set to 'float'
	float_opts = {
		-- The border key is *almost* the same as 'nvim_win_open'
		-- see :h nvim_win_open for details on borders however
		-- the 'curved' border is a custom border type
		-- not natively supported but implemented in this plugin.
		-- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
		border = "curved",
		-- width = <value>,
		-- height = <value>,
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
	-- Add executables on the config.lua
	-- { exec, keymap, name}
	-- lvim.builtin.terminal.execs = {{}} to overwrite
	-- lvim.builtin.terminal.execs[#lvim.builtin.terminal.execs+1] = {"gdb", "tg", "GNU Debugger"}
	-- TODO: pls add mappings in which key and refactor this
	execs = {
		{ vim.o.shell, "<M-1>", "Horizontal Terminal", "horizontal", 0.3 },
		{ vim.o.shell, "<M-2>", "Vertical Terminal", "vertical", 0.4 },
		{ vim.o.shell, "<M-3>", "Float Terminal", "float", nil },
	},
}

local function get_buf_size()
	local cbuf = vim.api.nvim_get_current_buf()
	local bufinfo = vim.tbl_filter(function(buf)
		return buf.bufnr == cbuf
	end, vim.fn.getwininfo(vim.api.nvim_get_current_win()))[1]
	if bufinfo == nil then
		return { width = -1, height = -1 }
	end
	return { width = bufinfo.width, height = bufinfo.height }
end

local function get_dynamic_terminal_size(direction, size)
	if direction ~= "float" and tostring(size):find(".", 1, true) then
		size = math.min(size, 1.0)
		local buf_sizes = get_buf_size()
		local buf_size = direction == "horizontal" and buf_sizes.height or buf_sizes.width
		return buf_size * size
	else
		return size
	end
end

M._exec_toggle = function(opt)
	local Terminal = require("toggleterm.terminal").Terminal
	local term = Terminal:new({ cmd = opt.cmd, count = opt.count, direction = opt.direction })
	term:toggle(opt.size, opt.direction)
end

M.add_exec = function(opt)
	local binary = opt.cmd:match("(%S+)")
	if vim.fn.executable(binary) ~= 1 then
		return
	end

	vim.keymap.set({ "n", "t" }, opt.keymap, function()
		M._exec_toggle({ cmd = opt.cmd, count = opt.count, direction = opt.direction, size = opt.size() })
	end, { desc = opt.label, noremap = true, silent = true })
end

M.setup = function()
	local terminal = require("toggleterm")
	terminal.setup(opts)

	for i, exec in pairs(opts.execs) do
		local direction = exec[4]
		local opt = {
			cmd = exec[1],
			keymap = exec[2],
			count = i + 100,
			direction = direction,
			size = function()
				return get_dynamic_terminal_size(direction, exec[5])
			end,
		}

		M.add_exec(opt)
	end
end

M.lazygit_toggle = function()
	local terminal = require("toggleterm.terminal").Terminal
	local lazygit = terminal:new({
		cmd = "lazygit",
		hidden = false,
		direction = "float",
		size = function()
			return get_dynamic_terminal_size("float", 0.3)
		end,
		float_opts = {
			border = "curved", -- 'single' | 'double' | 'shadow' | 'curved'
			-- width = 100000,
			-- height = 100000,
		},
		on_open = function(_)
			vim.cmd("startinsert!")
		end,
		on_close = function(_) end,
		count = 99,
	})
	lazygit:toggle()
end

return M
