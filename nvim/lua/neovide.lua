if vim.g.neovide then
	vim.o.guifont = "MonoLisa Nerd Font:h20"
	vim.opt.linespace = 20
	vim.g.neovide_scale_factor = 1

	vim.g.neovide_padding_top = 0
	vim.g.neovide_padding_bottom = 0
	vim.g.neovide_padding_right = 0
	vim.g.neovide_padding_left = 0

	vim.g.neovide_transparency = 0.1
	vim.g.transparency = 0.1
	vim.g.neovide_window_blurred = true

	vim.g.neovide_floating_blur_amount_x = 5.0
	vim.g.neovide_floating_blur_amount_y = 5.0

	vim.g.neovide_floating_shadow = true
	vim.g.neovide_floating_z_height = 10
	vim.g.neovide_light_angle_degrees = 45
	vim.g.neovide_light_radius = 5

	vim.g.neovide_show_border = true
	vim.g.neovide_scroll_animation_length = 0.3
	vim.g.neovide_scroll_animation_far_lines = 1
	vim.g.neovide_hide_mouse_when_typing = false
	vim.g.neovide_underline_stroke_scale = 1.0

	vim.g.neovide_unlink_border_highlights = true
	vim.g.neovide_refresh_rate = 60
	vim.g.neovide_refresh_rate_idle = 5
	vim.g.neovide_no_idle = true
	vim.g.neovide_confirm_quit = true
	vim.g.neovide_remember_window_size = true
end
