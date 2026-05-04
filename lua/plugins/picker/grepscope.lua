return {
  { "drop-stones/grepscope.nvim" },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          grep = {
            config = function(opts)
              return require("grepscope").config(opts)
            end,
            win = { input = { keys = { ["<C-e>"] = { "edit_filter", mode = { "i", "n" } } } } },
          },
          grep_word = {
            config = function(opts)
              return require("grepscope").config(opts)
            end,
            win = { input = { keys = { ["<C-e>"] = { "edit_filter", mode = { "i", "n" } } } } },
          },
        },
      },
    },
  },
}
