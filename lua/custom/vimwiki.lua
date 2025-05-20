-- ~/.config/nvim/lua/custom/init.lua

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- 자동완성 비활성화
    vim.b.cmp_enabled = false
    local cmp_ok, cmp = pcall(require, "cmp")
    if cmp_ok then
      cmp.setup.buffer { enabled = false }
    end

    -- 토글 함수 정의 (옵션)
    _G.toggle_cmp = function()
      vim.b.cmp_enabled = not vim.b.cmp_enabled
      cmp.setup.buffer { enabled = vim.b.cmp_enabled }
      print("CMP enabled:", vim.b.cmp_enabled)
    end
  end,
})
