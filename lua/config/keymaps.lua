-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("v", ".", ":normal . <CR>", { desc = "Repeat operations with visual mode" })

-- mkdnflow backlins
-- 백링크: 현재 파일명을 전체 노트에서 검색
local function backlinks()
  local fname = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t:r")
  require("telescope.builtin").grep_string({
    search = "\\[\\[" .. fname,
    use_regex = true,
    prompt_title = "Backlinks: " .. fname,
    search_dirs = { vim.fn.expand("~/notes") },
  })
end

-- 노트 전체 검색
local function note_search()
  require("telescope.builtin").find_files({
    search_dirs = { vim.fn.expand("~/notes") },
    prompt_title = "Notes",
  })
end

-- 노트 내용 검색
local function note_grep()
  require("telescope.builtin").live_grep({
    search_dirs = { vim.fn.expand("~/notes") },
    prompt_title = "Search Notes",
  })
end

-- 노트 탐색 (<leader>n 네임스페이스)
map("n", "<leader>nb", backlinks, { desc = "백링크 검색" })
map("n", "<leader>nf", note_search, { desc = "노트 파일 검색" })
map("n", "<leader>ng", note_grep, { desc = "노트 내용 검색" })

-- 오늘 일지 열기 (간단한 함수로 구현)
map("n", "<leader>nj", function()
  local date = os.date("%Y-%m-%d")
  local path = vim.fn.expand("~/notes/journal/" .. date .. ".md")
  vim.cmd("edit " .. path)
end, { desc = "오늘 일지" })

-- 인덱스 열기
map("n", "<leader>ni", function()
  vim.cmd("edit ~/notes/index.md")
end, { desc = "노트 인덱스" })
