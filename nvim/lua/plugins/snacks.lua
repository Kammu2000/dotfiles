return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>tt",
      function()
        Snacks.terminal("zsh", { win = { border = "rounded" } })
      end,
      desc = "Toggle Floating Terminal",
    },
  },
}
