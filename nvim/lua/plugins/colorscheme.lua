return {
	"folke/tokyonight.nvim",

	lazy = false,
	priority = 1000,

	opts = {
		transparent = true,

		styles = {
			keywords = { italic = false },
			comments = { italic = true },
		},
	},

	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd.colorscheme("tokyonight")
	end,
}
