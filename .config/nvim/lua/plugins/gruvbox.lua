return {
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    config = function()
      require("gruvbox").setup({
        transparent_mode = true,
        terminal_colors = true,
        dim_inactive = false,
        bold = false,
        italic = {
          comments = true,
          operators = true,
          strings = true,
          folds = true,
          emphasis = true,
        },
      })
    end,
  },
}
