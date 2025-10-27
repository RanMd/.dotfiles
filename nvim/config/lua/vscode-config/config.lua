-- Vscode Neovim extension configs

local map = vim.keymap
local vscode = require("vscode")

vim.g.mapleader = " "

map.set({ "n", "v" }, "<leader>", function()
  vscode.call("whichkey.show")
end, { desc = "Open whichkey" })

map.set("n", "u", "<Cmd>call VSCodeNotify('undo')<CR>")
map.set("n", "<C-r>", "<Cmd>call VSCodeNotify('redo')<CR>")

map.set("n", "<esc>", ":nohlsearch<cr>")

-- Options
local opt = vim.opt

opt.autowrite = true -- Enable auto write
-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically. Requires Neovim >= 0.10.0
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 0
opt.grepformat = "%f:%l:%c:%m"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 3 -- global statusline
opt.linebreak = true -- Wrap lines at convenient points
opt.list = false -- Show some invisible characters (tabs...
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.ruler = false -- Disable the default ruler
opt.scrolloff = 4 -- Lines of context
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelloptions:append("noplainbuffer")
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]
opt.tabstop = 2 -- Number of spaces tabs count for
opt.timeoutlen = 1000 -- Lower than default (1000) to quickly trigger which-key
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap

vim.g.markdown_recommended_style = 0 -- Fix markdown indentation settings

opt.foldlevel = 99 -- Folding

-- Autocommands

local ac = vim.api.nvim_create_autocmd

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#ff9e3b", fg = "#223249" })

--- Disable next line comments
ac("BufEnter", {
  callback = function()
    vim.cmd("set formatoptions-=cro")
    vim.cmd("setlocal formatoptions-=cro")
  end,
})

-- Highlight on yank
ac("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 150 })
  end,
})

-- Highlight config

local hls = {
  FlashBackdrop = { fg = "#737c73", italic = false },
  FlashCurrent = { bg = "#ff966c", fg = "#1b1d2b" },
  FlashLabel = { bg = "#C34043", fg = "#C5C9C5" },
  FlashMatch = { bg = "#2D4F67", fg = "#C5C9C5" },
  FlashCursor = { reverse = true },
}
for hl_group, hl in pairs(hls) do
  hl.default = true
  vim.api.nvim_set_hl(0, hl_group, hl)
end
