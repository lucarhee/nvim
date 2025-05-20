require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("v", ".", ":normal . <CR>", { desc = "Repeat operations with visual mode" }) -- TODO 한 번 실행하고 선택이 풀리는 문제를 해결하자.

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
