return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
  config = function()
		vim.keymap.set("n", "<leader>t", ":Neotree filesystem reveal left<CR>", {})
		--vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
    require("neo-tree").setup({
      close_if_last_window = true,
      window = {
        --position = "left",
        width = 30,
      },
    })
	end,
}
