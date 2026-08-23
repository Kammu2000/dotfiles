return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- Load on startup so `-` works immediately, even before
	-- any file is opened.
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
}
