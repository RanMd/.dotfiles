local ipc = "noctalia msg "

local var = require("variables")

local function toggle_special_workspace()
	local active_workspace = hl.get_active_special_workspace()

	if not active_workspace then
		hl.dispatch(hl.dsp.workspace.toggle_special("special"))
		return
	end

	local pos = string.find(active_workspace.name, ":")

	local sub = string.sub(active_workspace.name, pos + 1)

	hl.dispatch(hl.dsp.workspace.toggle_special(sub))
end

-- Shell keybinds

hl.bind("SUPER + Backspace", hl.dsp.exec_cmd(ipc .. "session lock"))

-- hl.bind("SUPER + SUPER_L", hl.dsp.exec_cmd(ipc .. " controlCenter toggle"))

hl.bind("SUPER + comma", hl.dsp.exec_cmd(ipc .. "settings-toggle"))

hl.bind("SUPER + semicolon", hl.dsp.exec_cmd(ipc .. "panel-toggle control-center"))

-- Window actions

hl.bind("SUPER + Q", hl.dsp.window.close())

hl.bind("SUPER + W", hl.dsp.window.float({ action = "toggle" }))

hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "maximized", toggle = true }))

-- Move focus

hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))

hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))

hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))

hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))

-- Resize windows

hl.bind("SUPER + R", hl.dsp.submap("resize"))

hl.define_submap("resize", function()
	hl.bind("right", hl.dsp.window.resize({ x = 40, y = 0, relative = true }), { repeating = true })

	hl.bind("left", hl.dsp.window.resize({ x = -40, y = 0, relative = true }), { repeating = true })

	hl.bind("up", hl.dsp.window.resize({ x = 0, y = 40, relative = true }), { repeating = true })

	hl.bind("down", hl.dsp.window.resize({ x = 0, y = -40, relative = true }), { repeating = true })

	hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Move windows

hl.bind("SUPER + CONTROL + H", hl.dsp.window.move({ direction = "left" }))

hl.bind("SUPER + CONTROL + L", hl.dsp.window.move({ direction = "right" }))

hl.bind("SUPER + CONTROL + K", hl.dsp.window.move({ direction = "up" }))

hl.bind("SUPER + CONTROL + J", hl.dsp.window.move({ direction = "down" }))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })

hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Applications

hl.bind("SUPER + Return", hl.dsp.exec_cmd(var.app.terminal))

hl.bind("SUPER + E", hl.dsp.exec_cmd(var.app.file_explorer))

hl.bind("SUPER + B", hl.dsp.exec_cmd(var.app.browser))

hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("pkill -x rofi || rofi -show drun"))

hl.bind("SUPER + V", hl.dsp.exec_cmd(ipc .. "panel-toggle clipboard"))

hl.bind(
	"SUPER + SHIFT + Return",
	hl.dsp.exec_cmd(var.app.terminal, { float = true, size = { "monitor_w*0.6", "monitor_h*0.6" } })
)

-- Media

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(ipc .. "media toggle"), { locked = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd(ipc .. "media next"), { locked = true })

hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(ipc .. "media previous"), { locked = true })

-- Volume

hl.bind("SHIFT + XF86AudioMute", hl.dsp.exec_cmd(ipc .. "mic-mute"), { locked = true })

hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. "volume-mute"), { locked = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "volume-up"), { locked = true })

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume-down"), { locked = true })

-- Brightness

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. " brightness-up"), { locked = true })

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. " brightness-down"), { locked = true })

-- Power Profiles

-- hl.bind("SUPER + ALT + G", hl.dsp.exec_cmd(ipc .. " powerProfile toggleNoctaliaPerformance"))

-- Screenshots

hl.bind("SUPER + P", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))

hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("hyprpicker -an"))

-- Workspace actions

hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))

hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))

hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))

hl.bind("SUPER + 4", hl.dsp.focus({ workspace = 4 }))

hl.bind("SUPER + 5", hl.dsp.focus({ workspace = 5 }))

hl.bind("SUPER + 6", hl.dsp.focus({ workspace = 6 }))

hl.bind("SUPER + 7", hl.dsp.focus({ workspace = 7 }))

hl.bind("SUPER + 8", hl.dsp.focus({ workspace = 8 }))

hl.bind("SUPER + 9", hl.dsp.focus({ workspace = 9 }))

hl.bind("SUPER + 0", hl.dsp.focus({ workspace = "empty" }))

-- hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("special"))
hl.bind("SUPER + S", toggle_special_workspace)

hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))

hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))

hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))

hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))

hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))

hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))

hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))

hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))

hl.bind("SUPER + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))

hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:special" }))

hl.bind("SUPER + ALT + 1", hl.dsp.window.move({ workspace = 1, follow = false }))

hl.bind("SUPER + ALT + 2", hl.dsp.window.move({ workspace = 2, follow = false }))

hl.bind("SUPER + ALT + 3", hl.dsp.window.move({ workspace = 3, follow = false }))

hl.bind("SUPER + ALT + 4", hl.dsp.window.move({ workspace = 4, follow = false }))

hl.bind("SUPER + ALT + 5", hl.dsp.window.move({ workspace = 5, follow = false }))

hl.bind("SUPER + ALT + 6", hl.dsp.window.move({ workspace = 6, follow = false }))

hl.bind("SUPER + ALT + 7", hl.dsp.window.move({ workspace = 7, follow = false }))

hl.bind("SUPER + ALT + 8", hl.dsp.window.move({ workspace = 8, follow = false }))

hl.bind("SUPER + ALT + 9", hl.dsp.window.move({ workspace = 9, follow = false }))

hl.bind("SUPER + ALT + 0", hl.dsp.window.move({ workspace = 10, follow = false }))

hl.bind("SUPER + ALT + S", hl.dsp.window.move({ workspace = "special:special", follow = false }))
