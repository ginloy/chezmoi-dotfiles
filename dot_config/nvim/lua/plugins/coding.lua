return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "enter",
        ["<Tab>"] = {
          "select_next",
          "snippet_forward",
          "fallback",
        },
        ["<S-Tab>"] = {
          "select_prev",
          "snippet_backward",
          "fallback",
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        qmlls = {
          cmd = { "qmlls", "-E" },
        },
        metals = {},
        -- vtsls = {
        --   root_dir = function()
        --     return not vim.fs.root(0, { "deno.json", "deno.jsonc" })
        --       and vim.fs.root(0, {
        --         "tsconfig.json",
        --         "jsconfig.json",
        --         "package.json",
        --         ".git",
        --       })
        --   end,
        -- },
        -- clangd = {
        --   autostart = false,
        -- },
        -- ccls = {
        --   init_options = {
        --     diagnostics = {
        --       onChange = 100,
        --     },
        --   },
        -- },
      },
    },
  },
  {
    "nmac427/guess-indent.nvim",
    config = function()
      require("guess-indent").setup({})
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        typst = { "typstyle" },
        clojure = { "cljfmt" },
      },
    },
  },
}
