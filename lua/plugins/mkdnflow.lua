return {
  "jakewvincent/mkdnflow.nvim",
  config = function()
    require("blink.cmp").setup({
      sources = {
        default = { "lsp", "mkdnflow" },
        providers = {
          mkdnflow = {
            name = "Mkdnflow",
            module = "mkdnflow.completion.blink",
          },
        },
      },
    })

    require("mkdnflow").setup({
      modules = {
        bib = true,
        buffers = true,
        completion = true,
        conceal = true,
        cursor = true,
        folds = true,
        foldtext = true,
        links = true,
        lists = true,
        maps = true,
        paths = true,
        tables = true,
        to_do = true,
        yaml = false,
        notebook = true,
        templates = true,
      },
      create_dirs = true,
      path_resolution = {
        primary = "first",
        fallback = "current",
        root_marker = false,
        sync_cwd = false,
        update_on_navigate = false,
      },
      filetypes = {
        markdown = true,
        rmd = true,
      },
      wrap = false,
      bib = {
        default_path = nil,
        find_in_root = true,
      },
      silent = false,
      cursor = {
        jump_patterns = nil,
      },
      links = {
        style = "markdown",
        compact = false,
        conceal = false,
        search_range = 0,
        implicit_extension = nil,
        transform_on_follow = false,
        transform_on_create = function(text)
          text = text:gsub(" ", "-")
          text = text:lower()
          text = os.date("%Y-%m-%d_") .. text
          return text
        end,
        auto_create = true,
        on_create_new = false,
      },
      new_file_template = {
        enabled = false,
        placeholders = {
          title = "link_title",
          date = "os_date",
        },
        template = [[
---
title: {{ title }}
date: {{ date }}
tags: []
---

# {{ title }}

]],
      },
      to_do = {
        highlight = false,
        statuses = {
          not_started = { marker = " " },
          in_progress = { marker = "-" },
          complete = { marker = { "X", "x" } },
        },
        status_order = { "not_started", "in_progress", "complete" },
        status_propagation = { up = true, down = true },
        sort = {
          on_status_change = false,
          recursive = false,
          cursor_behavior = { track = true },
        },
      },
      foldtext = {
        object_count = true,
        object_count_icon_set = "emoji",
        object_count_opts = function()
          return require("mkdnflow").foldtext.default_count_opts()
        end,
        line_count = true,
        line_percentage = true,
        word_count = false,
        title_transformer = function()
          return require("mkdnflow").foldtext.default_title_transformer
        end,
        fill_chars = {
          left_edge = "⢾⣿⣿",
          right_edge = "⣿⣿⡷",
          item_separator = " · ",
          section_separator = " ⣹⣿⣏ ",
          left_inside = " ⣹",
          right_inside = "⣏ ",
          middle = "⣿",
        },
      },
      tables = {
        type = "pipe",
        trim_whitespace = true,
        format_on_move = true,
        auto_extend_rows = false,
        auto_extend_cols = false,
        style = {
          cell_padding = 1,
          separator_padding = 1,
          outer_pipes = true,
          apply_alignment = true,
        },
      },
      yaml = {
        bib = { override = false },
      },
      mappings = {
        MkdnEnter = { { "n", "v" }, "<CR>" },
        MkdnGoBack = { "n", "<BS>" },
        MkdnGoForward = { "n", "<Del>" },
        MkdnMoveSource = { "n", "<F2>" },
        MkdnNextLink = { "n", "<Tab>" },
        MkdnPrevLink = { "n", "<S-Tab>" },
        MkdnFollowLink = false,
        MkdnDestroyLink = { "n", "<M-CR>" },
        MkdnTagSpan = { "v", "<M-CR>" },
        MkdnYankAnchorLink = { "n", "yaa" },
        MkdnYankFileAnchorLink = { "n", "yfa" },
        MkdnNextHeading = { "n", "]]" },
        MkdnPrevHeading = { "n", "[[" },
        MkdnNextHeadingSame = { "n", "][" },
        MkdnPrevHeadingSame = { "n", "[]" },
        MkdnIncreaseHeading = { { "n", "v" }, "+" },
        MkdnDecreaseHeading = { { "n", "v" }, "-" },
        MkdnIncreaseHeadingOp = { { "n", "v" }, "g+" },
        MkdnDecreaseHeadingOp = { { "n", "v" }, "g-" },
        MkdnToggleToDo = { { "n", "v" }, "<C-Space>" },
        MkdnNewListItem = false,
        MkdnNewListItemBelowInsert = { "n", "o" },
        MkdnNewListItemAboveInsert = { "n", "O" },
        MkdnExtendList = false,
        MkdnUpdateNumbering = { "n", "<leader>nn" },
        MkdnTableNextCell = { "i", "<Tab>" },
        MkdnTablePrevCell = { "i", "<S-Tab>" },
        MkdnTableNextRow = false,
        MkdnTablePrevRow = { "i", "<M-CR>" },
        MkdnTableNewRowBelow = { "n", "<leader>ir" },
        MkdnTableNewRowAbove = { "n", "<leader>iR" },
        MkdnTableNewColAfter = { "n", "<leader>ic" },
        MkdnTableNewColBefore = { "n", "<leader>iC" },
        MkdnTableDeleteRow = { "n", "<leader>dr" },
        MkdnTableDeleteCol = { "n", "<leader>dc" },
        MkdnTableAlignLeft = { "n", "<leader>al" },
        MkdnTableAlignRight = { "n", "<leader>ar" },
        MkdnTableAlignCenter = { "n", "<leader>ac" },
        MkdnTableAlignDefault = { "n", "<leader>ax" },
        MkdnFoldSection = { "n", "<leader>f" },
        MkdnUnfoldSection = { "n", "<leader>F" },
        MkdnTab = false,
        MkdnSTab = false,
        MkdnIndentListItem = { "i", "<C-t>" },
        MkdnDedentListItem = { "i", "<C-d>" },
        MkdnCreateLink = false,
        MkdnCreateLinkFromClipboard = { { "n", "v" }, "<leader>p" },
      },
    })
  end,
}
