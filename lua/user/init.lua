--TODO: Test

return {
  {
    config = require "user.community",
  },
  plugins = {
    {
      "L3MON4D3/LuaSnip",
      config = function(plugin, opts)
        require "plugins.configs.luasnip"(plugin, opts)
        require("luasnip.loaders.from_vscode").lazy_load {
          paths = { "./lua/user/my-snippets" },
        }
      end,
    },
    {
      "VonHeikemen/fine-cmdline.nvim",
      requires = {
        { "MunifTanjim/nui.nvim" },
      },
    },
    {
      "folke/noice.nvim",
      dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
      },
      opts = {},
      event = "VeryLazy",
      config = function()
        require("noice").setup {
          lsp = {
            override = {
              ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
              ["vim.lsp.util.stylize_markdown"] = true,
              ["cmp.entry.get_documentation"] = true,
            },
            hover = { enabled = false }, -- <-- HERE!
            signature = { enabled = false }, -- <-- HERE!
          },
          presets = {
            bottom_search = false, -- use a classic bottom cmdline for search
            command_palette = false, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = true, -- add a border to hover docs and signature help
          },
        }
        require("noice.lsp").hover()
      end,
    },
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {},
      event = "User AstroFile",
      cmd = { "TodoQuickFix" },
      keys = {
        { "<leader>T", "<cmd>TodoTelescope<cr>", desc = "Open TODOSs in Telescope" },
      },
    },
    -- {
    --   "AstroNvim/astrocommunity",
    --   { import = "astrocommunity.pack.typescript" },
    -- },
  },
  mappings = {
    n = {
      ["<Tab>"] = {
        function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
        desc = "Next buffer",
      },
    },
  },
}
