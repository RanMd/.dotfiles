require("full-border"):setup({
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.PLAIN,
	-- Available values: false, true
	borders = false,
})

-- local toggle = require("toggle-pane")
-- toggle:entry("min-parent")
require("toggle-pane"):entry("min-parent")

-- Hide the preview pane if the width of the window is small
-- local function get_terminal_size()
-- local h = io.popen("tput lines && tput cols", "r")
-- 	local rows = tonumber(h:read("*l"))
-- 	local cols = tonumber(h:read("*l"))
-- 	h:close()
--
-- 	if cols <= 110 then
-- 		toggle:entry("min-preview")
-- 	end
-- end
--
-- get_terminal_size()
-----------------------------------------------

-- Change the default border symbol
th.mgr.border_symbol = " "
-----------------------------------------------

th.git = th.git or {}
th.git.modified_sign = "M"
th.git.deleted_sign = "D"
th.git.added_sign = "A"
th.git.untracked_sign = "U"
th.git.ignored_sign = "I"

th.git.modified = ui.Style():fg("#aa9472")
th.git.deleted = ui.Style():fg("red"):bold()
th.git.untracked = ui.Style():fg("red"):bold()
th.git.added = ui.Style():fg("green"):bold()

require("git"):setup()
require("no-status"):setup()
