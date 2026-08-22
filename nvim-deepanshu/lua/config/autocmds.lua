-- Create a namespace for our autocmd groups.
-- Groups make it easy to clear/redefine our autocmds.
local function augroup(name)
	return vim.api.nvim_create_augroup("user_" .. name, {
		clear = true,
	})
end

-- Reload files changed outside Neovim
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = augroup("checktime"),

	callback = function()
		-- Don't run checktime for special buffers.
		if vim.o.buftype ~= "nofile" then
			vim.cmd("checktime")
		end
	end,
})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),

	callback = function()
		vim.hl.on_yank()
	end,
})

-- Resize splits when the terminal/window changes size
vim.api.nvim_create_autocmd("VimResized", {
	group = augroup("resize_splits"),

	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- ============================================================
-- Restore cursor position
-- ============================================================

-- When reopening a file, put the cursor where it was
-- when the file was last closed.
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup("last_location"),

	callback = function(event)
		local buf = event.buf

		-- Don't restore position in commit messages.
		if vim.bo[buf].filetype == "gitcommit" then
			return
		end

		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local line_count = vim.api.nvim_buf_line_count(buf)

		-- Make sure the saved position is still valid.
		if mark[1] > 0 and mark[1] <= line_count then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- ============================================================
-- LSP keymaps
-- ============================================================

-- Fires once per buffer, each time a language server attaches to it.
-- We set keymaps here (not globally) so they only exist on buffers
-- that actually have an LSP client, e.g. not in a plain text file.
vim.api.nvim_create_autocmd("LspAttach", {
	group = augroup("lsp_attach"),

	callback = function(event)
		local buf = event.buf

		local function map(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, {
				buffer = buf,
				desc = desc,
			})
		end

		-- Navigation (list results through snacks.picker so multiple
		-- matches show a picker instead of silently jumping to one).
		map("n", "gd", function()
			Snacks.picker.lsp_definitions()
		end, "Goto definition")

		map("n", "gD", vim.lsp.buf.declaration, "Goto declaration")

		map("n", "gr", function()
			Snacks.picker.lsp_references()
		end, "Goto references")

		map("n", "gI", function()
			Snacks.picker.lsp_implementations()
		end, "Goto implementation")

		map("n", "gy", function()
			Snacks.picker.lsp_type_definitions()
		end, "Goto type definition")

		-- Documentation
		map("n", "K", vim.lsp.buf.hover, "Hover")
		map("n", "gK", vim.lsp.buf.signature_help, "Signature help")

		-- Editing
		map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
		map("n", "<leader>cr", vim.lsp.buf.rename, "Rename symbol")
	end,
})

-- Text / Markdown files
-- Enable wrapping and spell checking for prose.
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("text_settings"),

	pattern = {
		"text",
		"markdown",
		"gitcommit",
		"typst",
		"plaintex",
	},

	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})
