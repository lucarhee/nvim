-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("v", ".", ":normal . <CR>", { desc = "Repeat operations with visual mode" }) -- TODO 한 번 실행하고 선택이 풀리는 문제를 해결하자.
