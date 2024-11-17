return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			--lspkind.init {}
			--vim.opt.completeopt={"menu", "menuone", "noselect"}
			--vim.opt.shortmess:append "c"

			require("luasnip.loaders.from_vscode").lazy_load()
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-y>"] = cmp.mapping(
						cmp.mapping.confirm({
							behavior = cmp.ConfirmBehavior.Insert,
							select = true,
						}),
						{ "i", "c" }
					),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp", keyword_length = 4 },
					{ name = "luasnip", keyword_length = 4 },
					{ name = "buffer", keyword_length = 4 },
					{ name = "path", keyword_length = 4 },
				}),
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text",
						menu = {
							buffer = "[Buf]",
							nvim_lsp = "[LSP]",
							luasnip = "[LuaS]",
							nvim_lua = "[Lua]",
							path = "[Path]",
						},
					}),
				},
			})
			require("my_snippets")
			local ls = require("luasnip")
			vim.keymap.set({ "i", "s" }, "<C-k>", function()
				ls.jump(1)
			end, { silent = true })
			vim.keymap.set({ "i", "s" }, "<C-j>", function()
				ls.jump(-1)
			end, { silent = true })
			vim.keymap.set({ "i", "s" }, "<C-l>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end)
		end,
	},
}
