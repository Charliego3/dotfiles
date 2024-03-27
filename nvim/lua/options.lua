vim.opt.completeopt = { "menuone" }
vim.g.codeium_disable_bindings = 1

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*", "!*.java" },
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- vim.cmd("hi TreesitterContext gui=standout guisp=#242525")
vim.cmd("hi TreesitterContextBottom gui=underline guisp=#464646")
vim.cmd("hi TreesitterContextLineNumberBottom gui=underline guisp=#464646")

-- local function get_color(group, attr)
-- 	local fn = vim.fn
-- 	return fn.synIDattr(fn.synIDtrans(fn.hlID(group)), attr)
-- end
-- vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = get_color("GitSignsAdd", "fg"), bg = "#DFAF67" })
-- vim.api.nvim_set_hl(0, "GitSignsChange", { fg = get_color("GitSignsChange", "fg"), bg = "#ff7500" })
-- vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = get_color("GitSignsDelete", "fg"), bg = "#E2E2E2" })
-- vim.api.nvim_set_hl(0, "GitSignsChangeDelete", { fg = get_color("GitSignsChangeDelete", "fg"), bg = "#FF40FF" })

vim.cmd([[
    augroup illuminate_augroup
        autocmd!
        autocmd VimEnter * hi link illuminatedWord CursorLine
    augroup END

    augroup illuminate_augroup
    autocmd!
        autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline
    augroup END

    augroup illuminate_augroup
        autocmd!
        autocmd VimEnter * hi illuminatedCurWord cterm=italic gui=italic
    augroup END
]])

vim.cmd("highlight NvimTreeFolderIcon guifg=#DFAF67")
vim.cmd("highlight NvimTreeOpenedFolderIcon guifg=#ff7500")

-- vim.api.nvim_create_autocmd("LSPAttach", {
-- 	callback = function(event)
-- 		local client_id = event.data.client_id
-- 		local client = vim.lsp.get_client_by_id(client_id)
--
-- 		if client.server_capabilities.inlayHintProvider then
-- 			vim.lsp.buf.inlay_hint(0, true)
-- 			vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "red" })
-- 		end
-- 	end,
-- })
