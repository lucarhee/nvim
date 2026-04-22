-- vimwiki 진입 시 Treesitter와 관련 에러 유발 플러그인 차단
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "vimwiki", "markdown" },
  callback = function()
    -- 1. Treesitter 중지 (내장 syntax 강조로 전환)
    pcall(vim.treesitter.stop)
    -- 2. 에러를 뿜던 autotag 변수 차단
    vim.b.nvim_ts_autotag_enabled = false
  end,
})
