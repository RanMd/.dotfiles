-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local create_cmd = vim.api.nvim_create_autocmd

---- Disable next line comments
create_cmd("BufEnter", {
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- Restore the cursor style (not needed for kitty)
-- hor100 	horizontal bar
-- ver100 	vertical bar
-- block 	 block cursor
create_cmd("ExitPre", {
  command = "set guicursor=a:ver100",
  desc = "Set cursor back to beam when leaving Neovim.",
})

-- Adds or Deletes padding in Alacritty when entering or leaving Neovim.
local padding_group = vim.api.nvim_create_augroup("ChangeAlacrittyPadding", { clear = true })

vim.notify("Me abri")

create_cmd("UIEnter", {
  group = padding_group,
  once = true,
  callback = function()
    vim.notify("Me ejecute")
    vim.fn.system("alacritty msg config 'window.padding = {x = 15, y = 10}'")
    vim.fn.system("alacritty msg config 'colors.primary.background = \"#181616\"'")
  end,
})

create_cmd("VimLeavePre", {
  group = padding_group,
  callback = function()
    vim.fn.system("alacritty msg config --reset")
  end,
})
