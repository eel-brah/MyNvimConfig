return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"cpp",
				"python",
				"asm",
				"gitignore",
				"dockerfile",
				"rust",
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
		local parsers = require("nvim-treesitter.parsers").get_parser_configs()
		parsers["move"] = {
			filetype = "move",
			maintainers = {},
			install_info = {
				url = "~/.config/move-tree-sitter",
				files = { "src/parser.c" },
				generate_requires_npm = false, -- if stand-alone parser without npm dependencies
				requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
			},
		}
	end,
}
