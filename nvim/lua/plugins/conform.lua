return {
	"stevearc/conform.nvim",

	event = { "BufWritePre" },
	cmd = { "ConformInfo" },

	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = { "n", "x" },
			desc = "Format buffer",
		},
	},

	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			-- No entry for c/cpp: format_on_save below falls back to
			-- clangd's built-in formatter instead (I prefer keeping .clang-format in a c++ repo)
		},

		-- Runs automatically on every :write.
		format_on_save = {
			timeout_ms = 500,

			-- If the filetype has no formatter listed above, ask the
			-- attached LSP client to format instead of doing nothing.
			lsp_format = "fallback",
		},
	},
}
