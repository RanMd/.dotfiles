local var = require("variables")

hl.on("hyprland.start", function()
	hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
	hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")

	-- Clipboard history
	hl.exec_cmd("wl-paste --type text --watch cliphist -max-items 5 store")
	hl.exec_cmd("wl-paste --type image --watch cliphist -max-items 5 store")

	-- Clipboard persistence
	hl.exec_cmd("wl-clip-persist --clipboard regular")

	-- Auto delete trash 10 days old
	hl.exec_cmd("trash-empty 10 -f")

	-- Cursors
	hl.exec_cmd("hyprctl setcursor " .. var.misc.cursor_theme .. " " .. var.misc.cursor_size)
	hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme '" .. var.misc.cursor_theme .. "'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size " .. var.misc.cursor_size)

	-- Location provider and night light
	-- hl.exec_cmd("/usr/lib/geoclue-2.0/demos/agent
	-- hl.exec_cmd("sleep 1 && gammastep")

	-- Forward bluetooth media commands to MPRIS
	hl.exec_cmd("mpris-proxy")

	-- Start shell
	-- hl.exec_cmd("qs -c noctalia-shell")
	hl.exec_cmd("noctalia")
end)
