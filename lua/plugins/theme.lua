return {
  -- 1. 원하는 테마 플러그인을 추가
  { "rebelot/kanagawa.nvim" }, -- 예: Kanagawa 테마
  { "ellisonleao/gruvbox.nvim" }, -- 예: Gruvbox 테마

  -- 2. LazyVim이 시작될 때 사용할 테마를 지정
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox", -- 여기에 사용할 테마 이름을 적으세요
    },
  },
}
