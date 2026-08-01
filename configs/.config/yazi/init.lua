local old_build = Tab.build
Tab.build = function(self, ...)
	self._chunks = {
		self._chunks[1]:pad(ui.Pad(1, 0, 1, 1)),
		self._chunks[2]:pad(ui.Pad(1, 0, 1, 0)),
		self._chunks[3]:pad(ui.Pad(1, 1, 1, 0)),
	}
	old_build(self, ...)
end

require("toggle-pane"):entry("min-parent")

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

require("git"):setup()

require("yatline"):setup({
	show_background = false,
	section_separator = { open = "", close = "" },
	part_separator = { open = "", close = "" },
	inverse_separator = { open = "", close = "" },
	display_status_line = false,

	style_a = {
		fg = "yellow",
		bg_mode = {},
	},

	header_line = {
		left = {
			section_a = {
				{ type = "string", custom = false, name = "tab_path" },
			},
			section_b = {},
			section_c = {},
		},
		right = {
			section_a = {
				{ type = "line", custom = false, name = "tabs", params = { "left" } },
			},
			section_b = {},
			section_c = {},
		},
	},
})
