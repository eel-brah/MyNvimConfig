return {
	"stevearc/conform.nvim",
	lazy = false,
	keys = {
		{
			"<leader>fb",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F]ormat [b]uffer",
		},
	},
	opts = {
		notify_on_error = false,
		-- format_on_save = {
		--   lsp_fallback = true,
		--   async = false,
		--   timeout_ms = 500,
		-- },
		-- format_on_save = function(bufnr)
		--   -- Disable "format_on_save lsp_fallback" for languages that don't
		--   -- have a well standardized coding style.
		--   local disable_filetypes = { c = true, cpp = true }
		--   return {
		--     timeout_ms = 500,
		--     lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
		--   }
		-- end,
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			c = { "clang_format" },
			cpp = { "clang_format" },
			move = { "prettier-move" },
			rust = { "rustfmt" },
			xml = { "xmlformatter" },
			javascript = { "prettier" },
			typescript = { "prettier" },
		},
		formatters = {
			cljfmt = {
				command = "cljfmt",
				args = { "fix", "$FILENAME" },
				stdin = false,
			},
			["prettier-move"] = {
				command = "prettier-move",
				args = { "--stdin-filepath", "$FILENAME" },
				range_args = function(_, ctx)
					local util = require("conform.util")
					local lo, hi = util.get_offsets_from_range(ctx.buf, ctx.range)
					return {
						"--stdin-filepath",
						"$FILENAME",
						"--range-start=" .. lo,
						"--range-end=" .. hi,
					}
				end,
			},
		},
	},
}
