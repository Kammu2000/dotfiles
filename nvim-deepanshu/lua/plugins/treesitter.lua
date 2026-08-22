return {
	"nvim-treesitter/nvim-treesitter",

	-- The default branch ("main") is a full rewrite: it now only
	-- manages parser installation. Highlighting/folding/indent are
	-- enabled by calling core `vim.treesitter.*` functions ourselves,
	-- not by a `.setup({ highlight = ... })` table like the old
	-- `master` branch used.
	branch = "main",

	-- This plugin explicitly doesn't support lazy-loading.
	lazy = false,

	-- Compiles/updates the installed parsers whenever the plugin updates.
	build = ":TSUpdate",

	config = function()
		require("nvim-treesitter").install({
			-- Needed to correctly parse your own Neovim config files.
			"lua",
			"vim",
			"vimdoc",
			"query",

			-- Matches the languages you have LSP servers for.
			"c",
			"cpp",
			"python",
			"javascript",
			"typescript",
			"tsx",

			-- Commonly useful everywhere else.
			"bash",
			"json",
			"yaml",
			"markdown",
			"markdown_inline",
		})

		-- Enable Treesitter-based highlighting, folding, and indent
		-- for every buffer that has an installed parser. pcall guards
		-- filetypes with no parser (e.g. plain text) from erroring.
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				local ok = pcall(vim.treesitter.start)

				if ok then
					vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
					vim.wo[0][0].foldmethod = "expr"
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}
