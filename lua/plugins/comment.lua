return {
  {
    'numToStr/Comment.nvim',
    opts = {
      toggler = {
        line = 'gcc',
        block = 'gbc',
      },
      opleader = {
        line = 'gc',
        block = 'gb',
      },
      extra = {
        ---Add comment on the line above
        above = 'gcO',
        ---Add comment on the line below
        below = 'gco',
        ---Add comment at the end of line
        eol = 'gcA',
      },
      ---Enable keybindings
      mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
      },
    }
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = 'VimEnter',
    opts = { signs = false },
    --NOTE: note
    --PERF: perf
    --HACK: hack
    --TODO: todo
    --FIX: fix
    --WARNING: warning
    --BUG: bug
    --TEST: test

    vim.keymap.set("n", "<leader>scm", ":TodoTelescope<CR>", {})

  }
}
