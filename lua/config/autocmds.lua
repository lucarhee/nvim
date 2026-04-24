-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Turn off the vimwiki spell option.
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "vimwiki" },
  callback = function()
    vim.opt_local.spell = false -- 문서 파일에서만 켜기
  end,
})

-- vimwiki #tag 색상 입히기
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "vimwiki", "markdown" },
  callback = function()
    -- 1. #으로 시작하고 뒤에 문자/숫자가 오는 패턴을 'VimwikiTag' 그룹으로 정의
    -- \v: 매우 유연한(very magic) 정규식 모드
    -- #[a-zA-Z0-9_-]+: # 뒤에 영문, 숫자, _, - 가 오는 단어
    vim.cmd([[syntax match VimwikiTag /\v#[a-zA-Z0-9_-]+/]])

    -- 2. 정의한 그룹에 색상 입히기 (원하는 색으로 변경 가능)
    -- guifg: 글자 색상 (예: #fabd2f는 Gruvbox 노란색)
    -- gui=bold: 굵게 표시
    vim.cmd([[highlight VimwikiTag guifg=#fabd2f gui=bold]])
  end,
})

-- 노멀모드로 나오면 무조건 영문키
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    vim.fn.system("im-select com.apple.keylayout.ABC")
  end,
})
