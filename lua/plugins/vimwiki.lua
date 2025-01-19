return {
  {
    "vimwiki/vimwiki",
    lazy = false, -- vimwiki는 즉시 로드되어야 합니다
    init = function()
      vim.g.vimwiki_list = {
        {
          path = "~/wiki",
          syntax = "markdown",
          ext = ".md",
          auto_spell = 0,
        },
      }
    end,
  },
}
