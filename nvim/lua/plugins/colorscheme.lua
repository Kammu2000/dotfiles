return {
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    priority = 1000,
    opts = {
      -- style = "moon",
      styles = {
        keywords = { italic = false },
        comments = { italic = true },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
