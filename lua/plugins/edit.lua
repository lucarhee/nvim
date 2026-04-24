if true then
  return {}
end

return {
  {
    "keaising/im-select.nvim",
    config = function()
      require("im_select").setup({
        -- im-select나 macism 둘 다 보통 아래 이름을 기본으로 사용합니다.
        default_command = "/opt/homebrew/bin/im-select",
        default_im_select = "com.apple.keylayout.ABC",
        -- 포커스를 얻거나 입력 모드에서 나갈 때 실행
        set_default_events = { "VimEnter", "FocusGained", "InsertLeave", "CmdlineLeave" },
      })
    end,
  },
}
