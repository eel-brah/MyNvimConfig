return {
	-- {
	-- 	"rust-lang/rust.vim",
	-- },
	{
		"mrcjkb/rustaceanvim",
		version = "^6", -- Recommended
		lazy = false, -- This plugin is already lazy
		settings = {
			["rust-analyzer"] = {
				cargo = {
					allFeatures = true,
				},
			},
		},
		-- config = function()
		-- 	local mason_registry = require("mason-registry")
		-- 	local codelldb = mason_registry.get_package("codelldb")
		-- 	local extension_path = codelldb:get_install_path() .. "/extension/"
		-- 	local codelldb_path = extension_path .. "adapter/codelldb"
		-- 	local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
		-- 	local cfg = require("rustaceanvim.config")
		--
		-- 	vim.g.rustaceanvim = {
		-- 		dap = {
		-- 			adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
		-- 		},
		-- 	}
		-- end,
	},
	{
		"saecki/crates.nvim",
		tag = "stable",
		event = { "BufRead Cargo.toml" },
		config = function()
			require("crates").setup({
				completion = {
					cmp = {
						enabled = true,
					},
					crates = {
						enabled = true,
						max_results = 8,
						min_chars = 3,
					},
				},
				lsp = {
					enabled = true,
					actions = true,
					completion = true,
					hover = true,
				},
			})

			local cmp = require("cmp")
			local cfg = cmp.get_config()
			table.insert(cfg, { name = "crates" })
			cmp.setup(cfg)
		end,
	},
}
