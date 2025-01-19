-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("FileType", {
  -- vimwiki 플러그인의 내부 설정으로 인해 spell이 계속 활성화된다.
  -- 이를 방지하기 위해 autocmd를 만들어 해결했다.
  -- vim.o.spell = false는 동작하지 않는다. 이는 플러그인 설정이 최종적으로 적용되기 때문인 것 같다.
  -- autocmd는 플러그인 활성화후 동작해서 문제가 해결된 것 같다.
  pattern = { "markdown", "vimwiki" },
  callback = function()
    vim.opt_local.spell = false
  end,
})
