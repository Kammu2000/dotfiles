return {
	"neovim/nvim-lspconfig",

	-- Having this plugin on the runtimepath is enough for vim.lsp.config()
	-- to find its default server configs (lsp/*.lua inside the plugin).
	event = { "BufReadPre", "BufNewFile" },

	-- Ensures blink.cmp is loaded before our config() runs below,
	-- since we read its capabilities.
	dependencies = { "saghen/blink.cmp" },

	-- Server configs live in `opts` (not hardcoded in `config` below)
	-- specifically so a project-local `.lazy.lua` can merge into this
	-- table before `config()` runs — lazy.nvim auto-loads `.lazy.lua`
	-- from the cwd and deep-merges its spec into the matching plugin.
	--
	-- `setup` mirrors a convention LazyVim invented (it is NOT part of
	-- nvim-lspconfig or core Neovim): a per-server function that gets
	-- a chance to mutate that server's opts (e.g. append `cmd` args)
	-- before we hand them to `vim.lsp.config()`. Returning `true` from
	-- one of these functions means "I fully handled this server
	-- myself, don't also call vim.lsp.config for it".
	opts = {
		servers = {
			lua_ls = {
				settings = {
					Lua = {
						-- Recognize the `vim` global instead of flagging
						-- it as undefined (we're editing Neovim config).
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							checkThirdParty = false,
						},
					},
				},
			},

			clangd = {
				cmd = { "clangd", "--background-index" },
			},

			pyright = {},
			vtsls = {},
			eslint = {},
		},

		-- Empty by default. A project's `.lazy.lua` can populate this,
		-- e.g. `setup = { clangd = function(name, server_opts) ... end }`.
		-- I use this for emscripten
		setup = {},
	},

	config = function(_, opts)
		-- ============================================================
		-- Diagnostics
		-- ============================================================

		-- vim.diagnostic is a separate subsystem from LSP itself — it
		-- just renders whatever diagnostics get set on a buffer, no
		-- matter the source. Without this, you only get bare gutter
		-- signs and no inline message.
		vim.diagnostic.config({
			underline = true,
			severity_sort = true,

			-- Don't recompute diagnostics while still typing in insert mode.
			update_in_insert = false,

			-- The message shown at the end of the offending line.
			virtual_text = {
				spacing = 4,
				-- Only prefix with the source name (e.g. "eslint")
				-- when more than one client reports diagnostics,
				-- to keep single-source lines short.
				source = "if_many",
				prefix = "●",
			},

			-- Icons shown in the gutter next to the line number.
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.INFO] = " ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
			},
		})

		-- ============================================================
		-- Capabilities
		-- ============================================================

		-- Tells every server what the client (Neovim) supports, so
		-- servers can tailor responses. Applied to "*" so it merges
		-- into every server's config below without repeating it.
		--
		-- blink.cmp's capabilities extend the built-in defaults with
		-- things like snippet support, so completions it triggers
		-- can be as rich as the server allows.
		vim.lsp.config("*", {
			capabilities = require("blink.cmp").get_lsp_capabilities(),
		})

		-- ============================================================
		-- Per-server overrides
		-- ============================================================
		-- Each vim.lsp.config() call merges into the default config
		-- nvim-lspconfig already registered for that name. Before
		-- that, give a project-local `setup[name]` function (if any)
		-- a chance to mutate `server_opts` in place.

		for name, server_opts in pairs(opts.servers) do
			local handled = false

			if opts.setup[name] then
				handled = opts.setup[name](name, server_opts) == true
			end

			if not handled then
				vim.lsp.config(name, server_opts)
			end
		end

		-- ============================================================
		-- Enable
		-- ============================================================
		-- Registers a FileType autocommand for each name that starts
		-- the client the first time a matching buffer is opened.

		vim.lsp.enable(vim.tbl_keys(opts.servers))
	end,
}
