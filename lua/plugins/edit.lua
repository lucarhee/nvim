return {
  {
    "keaising/im-select.nvim",
    opts = {
      default_command = "/opt/homebrew/bin/im-select",
      default_im_select = "com.apple.keylayout.ABC",
      set_previous_events = { "InsertEnter" },
      keep_state_on_normal_mode = true,
    },
    config = function(_, opts)
      require("im_select").setup(opts)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "vimwiki",
        callback = function()
          vim.keymap.set("i", "<CR>", function()
            local cmd = opts.default_command
            -- 현재 IM 저장
            local cur_im = vim.fn.system(cmd):gsub("%s+", "")

            -- im-select 이벤트 트리거 차단
            local saved_ei = vim.o.eventignore
            vim.o.eventignore = (saved_ei ~= "" and saved_ei .. "," or "") .. "InsertLeave,InsertEnter"

            -- VimWiki 원래 CR 함수 직접 호출 (expr 매핑 우회)
            local ok, vw_keys = pcall(vim.fn["vimwiki#lst#kbd_cr"])
            local keys = ok and vw_keys or "\r"
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, true, true), "n", false)

            -- 이벤트 복원 + IM 복원
            vim.defer_fn(function()
              vim.o.eventignore = saved_ei
              if vim.fn.mode() == "i" then
                vim.fn.system(cmd .. " " .. cur_im)
              end
            end, 50)
          end, { buffer = true, desc = "VimWiki <CR>: IM 유지" })
        end,
      })
    end,
  },
}

-- return {
--   {
--     "keaising/im-select.nvim",
--     opts = {
--       default_command = "/opt/homebrew/bin/im-select",
--       default_im_select = "com.apple.keylayout.ABC",
--       set_previous_events = { "InsertEnter" },
--       keep_state_on_normal_mode = true,
--     },
--     -- config = function()
--     --   require("im_select").setup({
--     --     -- im-select나 macism 둘 다 보통 아래 이름을 기본으로 사용합니다.
--     --     -- 포커스를 얻거나 입력 모드에서 나갈 때 실행
--     --     set_default_events = { "InsertLeave" }, -- "FocusGained", "CmdlineLeave", "VimEnter"
--     --   })
--     -- end,
--   },
-- }
