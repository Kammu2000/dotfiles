local map = vim.keymap.set

-- ============================================================
-- General
-- ============================================================

-- Save file
map({ "n", "i", "x" }, "<C-s>", "<cmd>write<cr><esc>", {
	desc = "Save file",
})

-- Clear search highlighting
map("n", "<Esc>", "<cmd>nohlsearch<cr>", {
	desc = "Clear search highlight",
})

-- ============================================================
-- Navigation
-- ============================================================

-- Move through wrapped lines using the visual line.
-- `j` / `k` normally move by physical lines.
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", {
	expr = true,
	silent = true,
	desc = "Down",
})

map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", {
	expr = true,
	silent = true,
	desc = "Up",
})

-- Keep cursor centered when scrolling.
map("n", "<C-d>", "<C-d>zz", {
	desc = "Scroll down",
})

map("n", "<C-u>", "<C-u>zz", {
	desc = "Scroll up",
})

-- Keep search results centered.
map("n", "n", "nzzzv", {
	desc = "Next search result",
})

map("n", "N", "Nzzzv", {
	desc = "Previous search result",
})

-- ============================================================
-- Windows
-- ============================================================

-- Move between windows using Ctrl + h/j/k/l.
map("n", "<C-h>", "<C-w>h", {
	desc = "Go to left window",
})

map("n", "<C-j>", "<C-w>j", {
	desc = "Go to lower window",
})

map("n", "<C-k>", "<C-w>k", {
	desc = "Go to upper window",
})

map("n", "<C-l>", "<C-w>l", {
	desc = "Go to right window",
})

-- Create horizontal split below.
map("n", "<leader>-", "<cmd>split<cr>", {
	desc = "Split below",
})

-- Create vertical split to the right.
map("n", "<leader>|", "<cmd>vsplit<cr>", {
	desc = "Split right",
})

-- Close current window.
map("n", "<leader>wq", "<cmd>close<cr>", {
	desc = "Close window",
})

-- ============================================================
-- Buffers
-- ============================================================

-- Close current buffer.
map("n", "<leader>bd", "<cmd>bdelete<cr>", {
	desc = "Delete buffer",
})

-- ============================================================
-- Files
-- ============================================================

-- Open built-in file explorer (netrw).
map("n", "<leader>e", "<cmd>Explore<cr>", {
	desc = "File explorer",
})

-- Open a new empty buffer.
map("n", "<leader>fn", "<cmd>enew<cr>", {
	desc = "New file",
})

-- ============================================================
-- Editing
-- ============================================================

-- Keep selection after indenting.
map("x", "<", "<gv", {
	desc = "Indent left",
})

map("x", ">", ">gv", {
	desc = "Indent right",
})

-- Move selected lines down/up.
map("x", "J", ":move '>+1<CR>gv=gv", {
	desc = "Move selection down",
})

map("x", "K", ":move '<-2<CR>gv=gv", {
	desc = "Move selection up",
})

-- ============================================================
-- Quickfix
-- ============================================================

-- Open / close quickfix list.
map("n", "<leader>xq", "<cmd>copen<cr>", {
	desc = "Open quickfix",
})

map("n", "]q", "<cmd>cnext<cr>", {
	desc = "Next quickfix item",
})

map("n", "[q", "<cmd>cprev<cr>", {
	desc = "Previous quickfix item",
})

-- ============================================================
-- Diagnostics
-- ============================================================

-- Show diagnostic under cursor.
map("n", "<leader>d", vim.diagnostic.open_float, {
	desc = "Show diagnostic",
})

-- Move between diagnostics.
map("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, {
	desc = "Next diagnostic",
})

map("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, {
	desc = "Previous diagnostic",
})

-- ============================================================
-- Terminal
-- ============================================================

-- Open a terminal in the current window.
map("n", "<leader>tt", "<cmd>terminal<cr>", {
	desc = "Open terminal",
})
