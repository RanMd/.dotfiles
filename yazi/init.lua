require("full-border"):setup()
require("hide-preview"):entry()

THEME.git                = THEME.git or {}
THEME.git.modified_sign  = "M"
THEME.git.deleted_sign   = "D"
THEME.git.added_sign     = "A"
THEME.git.untracked_sign = "U"
THEME.git.ignored_sign   = "I"

THEME.git.modified       = ui.Style():fg("#aa9472")
THEME.git.deleted        = ui.Style():fg("red"):bold()
THEME.git.untracked      = ui.Style():fg("red"):bold()
THEME.git.added          = ui.Style():fg("green"):bold()

require("git"):setup()

local home = os.getenv("HOME")
require("bunny"):setup({
  hops = {
    { tag = "home",      path = home,                 key = "h" },
    { tag = "config",    path = home .. "/.config",   key = "C" },
    { tag = "downloads", path = home .. "/downloads", key = "d" },
  },
})
