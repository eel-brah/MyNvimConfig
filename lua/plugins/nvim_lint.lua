return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      python = { "pylint" },
      -- c = { "clangtidy", "cppcheck" },
      -- cpp = { "clangtidy", "cppcheck" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>ln", function()
      lint.try_lint()
    end, { desc = "Trigger linting" })


    local function hide_diagnostics()
      vim.diagnostic.config({
        virtual_text = false,
        signs = false,
        underline = false,
      })
    end
    local function show_diagnostics()
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
      })
    end
    vim.api.nvim_create_autocmd({ "BufEnter" }, {
      group = lint_augroup,
      callback = function()
        show_diagnostics()
      end,
    })
    vim.keymap.set("n", "<leader>dh", hide_diagnostics)
    vim.keymap.set("n", "<leader>ds", show_diagnostics)
  end,
}
