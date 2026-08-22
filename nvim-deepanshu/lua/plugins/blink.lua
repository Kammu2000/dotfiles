return {
	"saghen/blink.cmp",

	version = "1.*",

	dependencies = {
		-- A large collection of ready-made snippets (for, if, class, ...)
		-- per language, used by the "snippets" source below.
		"rafamadriz/friendly-snippets",
	},

	opts = {
		-- "enter" preset: <CR> accepts the selection when the menu
		-- is visible (otherwise behaves as a normal newline),
		-- <C-n>/<C-p> or arrows to move, <C-e> to dismiss.
		keymap = { preset = "enter" },

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = { auto_show = true },
		},

		-- Where suggestions come from, merged into one menu.
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		signature = { enabled = true },
	},

	-- Lets other plugin specs append to `sources.default` later
	opts_extend = { "sources.default" },
}
