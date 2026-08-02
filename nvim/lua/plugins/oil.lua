return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    opts = {
      keymaps = {
        ["q"] = { "actions.close", mode = "n" },
      },
      view_options = {
        show_hidden = true,
      },
    },
    keys = {
      {
        "-",
        "<cmd>Oil<cr>",
        desc = "Open parent directory",
      },
    },
  },
}
