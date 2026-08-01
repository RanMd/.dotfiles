local var = {}

-- Paths

var.path = {}

var.path.bin = "$HOME/.local/bin"

var.path.script = "$HOME/.local/lib/hypr"

-- # Apps

var.app = {}

var.app.terminal = "alacritty"

var.app.browser = "brave-origin-nightly --password-store=basic"

var.app.editor = "nvim"

var.app.file_explorer = var.path.bin .. "/explorer"

-- # Misc

var.misc = {}

var.misc.volume_step = 10

var.misc.cursor_theme = "sweet-cursors"

var.misc.cursor_size = 24

return var
