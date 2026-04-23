return {
  "windwp/nvim-ts-autotag",
  opts = {
    enable_close_on_slash = false,
    per_filetype = {
      -- vimwiki를 명시적으로 제외
    },
  },
  -- vimwiki 파일타입에서 비활성화
  config = function(_, opts)
    require("nvim-ts-autotag").setup(opts)
    -- InsertLeave 자동 커맨드를 vimwiki에서 제거
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "vimwiki", "wiki" },
      callback = function()
        vim.b.ts_autotag_enabled = false
      end,
    })
  end,
}
