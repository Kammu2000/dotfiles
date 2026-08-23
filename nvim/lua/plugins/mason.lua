return {
	"mason-org/mason.nvim",

	-- Load it immediately on startup, not lazily, since lsp.lua
	-- needs the binaries it installs to already be on $PATH.
	lazy = false,

	opts = {
		ensure_installed = {
			-- LSP servers
			"clangd",
			"pyright",
			"vtsls",
			"lua-language-server",
			"eslint-lsp",

			-- Formatters (used in conform.lua)
			"stylua",
			"black",
			"prettier",
		},
	},

	config = function(_, opts)
		require("mason").setup()

		-- mason.nvim doesn't install `ensure_installed` itself,
		-- so do it manually on startup if missing.
		local registry = require("mason-registry")

		registry.refresh(function()
			for _, name in ipairs(opts.ensure_installed) do
				local ok, pkg = pcall(registry.get_package, name)

				if ok and not pkg:is_installed() then
					pkg:install()
				end
			end
		end)
	end,
}
