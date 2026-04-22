return {
  {
    "vimwiki/vimwiki",
    lazy = false,
    init = function()
      vim.g.vimwiki_list = {
        {
          path = "~/Workspaces/notes/",
          diary_rel_path = "diary/",
          syntax = "markdown",
          ext = ".md",
          auto_spell = 0,
        },
      }
    end,
  },
}
-- TODO vimwiki 키맵이 동작하지 않는다.
