return {
	{
		"numToStr/Comment.nvim",
		opts = function()
			local ft = require("Comment.ft")

			ft.set("move", "//%s", "/*%s*/")

			return {
				toggler = {
					line = "gcc",
					block = "gbc",
				},
				opleader = {
					line = "gc",
					block = "gb",
				},
				extra = {
					above = "gcO",
					below = "gco",
					eol = "gcA",
				},
				mappings = {
					basic = true,
					extra = true,
				},
			}
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VimEnter",
		opts = { signs = false },
		--NOTE: note
		--PERF: perf
		--HACK: hack
		--TODO: todo
		--FIX: fix
		--WARNING: warning
		--BUG: bug
		--TEST: test

		vim.keymap.set("n", "<leader>scm", ":TodoTelescope<CR>", {}),
	},
}
