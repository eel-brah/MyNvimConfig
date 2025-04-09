return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			_G.is_transparent = true

			-- Function to toggle transparency
			_G.toggle_transparency = function()
				_G.is_transparent = not _G.is_transparent

				local C = require("catppuccin.palettes").get_palette("mocha")
				local highlights = {
					"Normal",
					"NormalNC",
					-- "StatusLine",
					-- "TabLine",
					-- "VertSplit",
					-- "SignColumn",
          -- "TabLineSel",
          -- "LineNr",
				}
				for _, group in ipairs(highlights) do
					if _G.is_transparent then
						vim.cmd(string.format("hi %s guibg=NONE", group))
					else
						vim.cmd(string.format("hi %s guibg=#%s", group, C.base:sub(2)))
					end
				end
			end

			vim.api.nvim_set_keymap(
				"n",
				"<leader>ttr",
				":lua _G.toggle_transparency()<CR>",
				{ noremap = true, silent = true }
			)

			-- Catppuccin setup
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				term_colors = true,
				no_italic = true,
				color_overrides = {
					mocha = {
						base = "#000000",
						mantle = "#090909",
						crust = "#000000",
					},
				},
				highlight_overrides = {
					mocha = function(C)
						return {
              TabLineSel = { bg = C.pink },
              CmpBorder = { fg = C.surface2 },
              Pmenu = { bg = C.none },
              TelescopeBorder = { link = "FloatBorder" },

							-- Default non-transparent elements
              Normal = { bg = "None" },
              NormalNC = { bg = "None" },
              -- StatusLine = { bg = "None" },
              -- TabLine = { bg = "None" },
              -- TabLineSel = { bg = "None" },
              -- VertSplit = { bg = "None" },
              -- SignColumn = { bg = "None" },
              -- LineNr = { bg = "None" },

              -- PmenuSel = { bg = C.surface2 },
						}
					end,
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
