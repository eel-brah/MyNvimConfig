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
        ensure_installed = { "lua_ls", "clangd", "pyright" }
      })
      require("mason-lspconfig").setup_handlers {
        function(server_name)
          require("lspconfig")[server_name].setup({
            -- capabilities = capabilities
          })
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
    config = function()
      local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { --[[ buffer = event.buf,  ]] desc = 'LSP: ' .. desc })
      end

      map('<leader>h', vim.lsp.buf.hover, '[H]over Documentation')
      map('<leader>d', require('telescope.builtin').lsp_definitions, 'Goto [D]efinition')
      map('<leader>gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      map('<leader>gi', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
      map('<leader>gt', require('telescope.builtin').lsp_type_definitions, 'Type Definition')
      map('<leader>gs', require('telescope.builtin').lsp_document_symbols, 'Document [S]ymbols')
      -- map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
      map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
      map('<leader>gd', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require('mason-tool-installer').setup {
        ensure_installed = {
          'lua-language-server',
          'vim-language-server',
          'stylua',
          "isort", "black",
          "clang-format",
          "pylint"
        },
        -- auto_update = false,
        -- run_on_start = true,
      }
    end
  },
}
