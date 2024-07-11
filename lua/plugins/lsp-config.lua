return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls", "clangd", "pyright"}
      })
      require("mason-lspconfig").setup_handlers {
        function (server_name)
            require("lspconfig")[server_name].setup {}
        end,
    }
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    --config = function()
      --local lspconfig = require("lspconfig")
      --lspconfig.clangd.setup({})
      --lspconfig.pyright.setup({})
      --lspconfig.lua_ls.setup({})

      vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, {}),
      vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, {}),
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.declaration, {}),
      vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, {}),
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {}),
      vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {}),
      --vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {}),
    --end,
  },
}
