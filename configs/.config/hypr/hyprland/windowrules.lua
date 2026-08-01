-- Idleinhibit rules

hl.window_rule({
	match = {
		class = "^(.*celluloid.*)$|^(.*mpv.*)$|^(.*vlc.*)$",
	},
	idle_inhibit = "fullscreen",
})

hl.window_rule({
	match = {
		class = "^(.*[Ss]potify.*)$",
	},
	idle_inhibit = "fullscreen",
})

hl.window_rule({
	match = {
		class = "^(.*[Ll]ibreWolf.*)$|^(.*[Ff]loorp.*)$|^(.*[Bb]rave-browser.*)$|^(.*[Ff]irefox.*)$|^(.*[Cc]hromium.*)$|^(.*[Zz]en.*)$|^(.*[Vv]ivaldi.*)$",
	},
	idle_inhibit = "fullscreen",
})

hl.window_rule({
	match = {
		class = "(steam_app_(default|[0-9]+))|gamescope",
	},
	idle_inhibit = "always",
})

-- Picture-in-Picture

hl.window_rule({
	name = "picture_in_picture",
	match = {
		title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$",
	},
	tag = "+picture-in-picture",
	float = true,
	keep_aspect_ratio = true,
	move = { "monitor_w * 0.73", "monitor_h * 0.72" },
	size = { "monitor_w * 0.25", "monitor_h * 0.25" },
	pin = true,
})

-- Float

hl.window_rule({
	match = {
		class = "blueman-manager",
	},
	float = true,
})

hl.window_rule({
	match = {
		initial_class = "^qt.*",
	},
	float = true,
})

-- Games

hl.window_rule({
	match = {
		class = "(steam_app_(default|[0-9]+))|gamescope",
	},
	opaque = true,
	immediate = true,
})

-- # Workspace rules

hl.workspace_rule({
	workspace = "w[tv1]",
	gaps_out = 16,
})

-- # Creative software

hl.window_rule({
	match = {
		initial_class = "^(krita|gimp|inkscape|Unity|Godot|Alacritty|shotcut|blender|firefox|libresprite|HTTPie)$",
	},
	opaque = true,
})

-- Special workspaces

hl.window_rule({
	name = "music",
	match = {
		initial_class = "^(Spotify|Spotatui)$",
	},
	workspace = "special:music",
})

-- # Workspace rules

hl.window_rule({
	match = {
		workspace = "special:music",
	},
	xray = true,
})

hl.window_rule({
	match = {
		workspace = "special:special",
	},
	xray = true,
})

-- Layer rules

hl.layer_rule({
	match = {
		namespace = "hyprpicker|logout_dialog|selection|wayfreeze",
	},
	animation = "fade",
})

hl.layer_rule({
	name = "noctalia",
	match = {
		namespace = "noctalia-background-.*$",
	},
	ignore_alpha = 1,
	blur = true,
})

-- Floating rules

hl.window_rule({
	name = "floating_apps",
	match = {
		initial_class = "^(Alacritty)$",
		initial_title = "^(Notepad|Explorer)$",
	},
	size = { "monitor_w * 0.6", "monitor_h * 0.6" },
	center = true,
	float = true,
})

hl.window_rule({
	name = "control_center_floater",
	match = {
		initial_class = "^(octopi.*|org.pulseaudio.pavucontrol)$",
	},
	size = { "monitor_w * 0.5", "monitor_h * 0.5" },
	center = true,
	float = true,
})

hl.window_rule({
	name = "ueberzug_floater",
	match = {
		initial_class = "^(ueberzugpp.*)$",
	},
	float = true,
	no_focus = true,
})
