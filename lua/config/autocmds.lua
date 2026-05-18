local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- 노트 폴더의 markdown 파일에만 적용
autocmd({ "BufEnter" }, {
  group = augroup("mkdnflow_notes", { clear = true }),
  pattern = vim.fn.expand("~/notes") .. "/*.md",
  callback = function()
    -- 줄바꿈 설정 (노트 작성에 편함)
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.spell = false
    -- vim.opt_local.spelllang = "en,cjk" -- 한글 spell 무시
    -- 상대 줄번호 끄기 (긴 글 작성 시 편함)
    vim.opt_local.relativenumber = false
  end,
})

-- 일지 파일 자동으로 템플릿 적용 (신규 파일일 때)
autocmd({ "BufNewFile" }, {
  group = augroup("journal_template", { clear = true }),
  pattern = vim.fn.expand("~/notes/journal") .. "/*.md",
  callback = function()
    local date = os.date("%Y-%m-%d")
    local lines = {
      "---",
      "date: " .. date,
      "tags: [journal]",
      "---",
      "",
      "# " .. date .. " 일지",
      "",
      "## 오늘의 목표",
      "- [ ] ",
      "",
      "## 작업 로그",
      "",
      "## 메모",
      "",
      "## 내일 할 일",
      "- [ ] ",
    }
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    -- 커서를 첫 번째 할 일로 이동
    vim.api.nvim_win_set_cursor(0, { 9, 6 })
  end,
})
