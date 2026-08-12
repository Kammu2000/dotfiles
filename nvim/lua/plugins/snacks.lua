-- Code to enable terminal on right side
return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[

███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

          ]],

        keys = {},
      },
    },
    -- terminal = {
    --   win = {
    --     position = "right",
    --     style = "terminal",
    --     width = 0.5,
    --   },
    --   auto_insert = true, -- key: always enter insert on focus
    -- },

    terminal = {
      win = {
        style = "float",
        border = "rounded",
        backdrop = 90,
        width = 0.95,
        height = 0.95,
      },
    },
  },
}
