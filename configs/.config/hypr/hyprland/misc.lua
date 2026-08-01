hl.config({
	misc = {
		-- vfr = false,
		vrr = 0,

		allow_session_lock_restore = true,
		middle_click_paste = false,
		focus_on_activate = true,
		session_lock_xray = true,
		initial_workspace_tracking = 2,

		mouse_move_enables_dpms = true,
		key_press_enables_dpms = true,
	},

	scrolling = {
		fullscreen_on_one_column = true,
		focus_fit_method = 1,
		column_width = 0.5,
		follow_focus = true,
		follow_min_visible = 0.0,
		explicit_column_widths = "0.35, 0.5, 0.65, 1.0",
	},

	debug = {
		error_position = 1,
		overlay = false,
	},
})
