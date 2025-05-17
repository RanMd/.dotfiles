require("full-border"):setup()
--
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
