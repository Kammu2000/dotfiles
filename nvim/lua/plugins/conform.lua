-- Use prettier only if the repo has a prettier config; otherwise fall back to eslint_d.
local function js_formatter(bufnr)
	local bufname = vim.api.nvim_buf_get_name(bufnr)
	local has_prettier_config = vim.fs.find({
		".prettierrc",
		".prettierrc.json",
		".prettierrc.yml",
		".prettierrc.yaml",
		".prettierrc.js",
		".prettierrc.cjs",
		".prettierrc.mjs",
		"prettier.config.js",
		"prettier.config.cjs",
		"prettier.config.mjs",
	}, { upward = true, path = bufname })[1]

	if not has_prettier_config then
		local package_json = vim.fs.find("package.json", { upward = true, path = bufname })[1]
		if package_json then
			local ok, decoded = pcall(vim.fn.json_decode, table.concat(vim.fn.readfile(package_json), "\n"))
			has_prettier_config = ok and decoded.prettier ~= nil
		end
	end

	return has_prettier_config and { "prettier" } or { "eslint_d" }
end

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
			javascript = js_formatter,
			typescript = js_formatter,
			javascriptreact = js_formatter,
			typescriptreact = js_formatter,
			-- No entry for c/cpp: format_on_save below falls back to
			-- clangd's built-in formatter instead (I prefer keeping .clang-format in a c++ repo)
		},

		-- Runs automatically on every :write.
		format_on_save = {
			timeout_ms = 2000,

			-- If the filetype has no formatter listed above, ask the
			-- attached LSP client to format instead of doing nothing.
			lsp_format = "fallback",
		},
	},
}
