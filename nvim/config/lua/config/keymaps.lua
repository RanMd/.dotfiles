-- This file contains custom key mappings for Neovim.

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap

-- Position cursor at the middle of the screen after scrolling half page
map.set("n", "<C-d>", "<C-d>zz") -- Scroll down half a page and center the cursor
map.set("n", "<C-u>", "<C-u>zz") -- Scroll up half a page and center the cursor

-- Map Ctrl+b in insert mode to delete to the end of the word without leaving insert mode
map.set("i", "<C-b>", "<C-o>de")

-- Select all text
map.set("n", "<C-e>", "gg<S-V>G", { desc = "Select all Text", silent = true, noremap = true })

-- Search inside visually highlighted text
map.set("x", "g/", "<esc>/\\%V", { silent = false, desc = "Search Inside Visual Selection" })

----- OIL -----
map.set("n", "<leader>;", "<CMD>Oil --float<CR>", { desc = "(Oil) Open parent directory" })

-- Delete all buffers but the current one
map.set(
  "n",
  "<leader>bq",
  '<Esc>:%bdelete|edit #|normal`"<Return>',
  { desc = "Delete other buffers but the current one" }
)

-- Unbind space + *
map.del("n", "<Space><Space>l>")
map.del("n", "<Space><Space>k>")
map.del("n", "<Space><Space>j>")
map.del("n", "<Space><Space>h>")

-- Unbind keymaps
map.del("n", "<Space>S")
map.del("n", "<Space>|")
map.del("n", "<Space>`")
map.del("n", "<Space>.")
map.del("n", "<Space>-")
map.del("n", "<Space>L")
map.del("n", "<Space>K")
