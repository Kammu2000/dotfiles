local opt = vim.opt

local options = {
	colorcolumn = "100",
	number = true,
	relativenumber = true,
	-- Always reserve space for diagnostics, git signs, etc.
	-- Prevents the text from shifting when a sign appears.
	signcolumn = "yes",

	-- Enable true color support in the terminal.
	termguicolors = true,

	-- Don't show "-- INSERT --", "-- VISUAL --", etc.
	-- We can display this information through our own statusline later.
	showmode = false,

	-- Disable Vim's default ruler.
	ruler = false,

	-- Keep the statusline at the bottom of the entire editor.
	laststatus = 3,

	-- Keep the cursor away from the top/bottom of the screen.
	-- Makes reading and scrolling more comfortable.
	scrolloff = 8,

	-- Same idea horizontally.
	sidescrolloff = 8,

	smoothscroll = true,

	-- Don't wrap long lines.
	-- Especially useful when working with code.
	wrap = false,

	-- If wrapping is enabled later, break at word boundaries.
	linebreak = true,

	-- ============================================================
	-- Indentation
	-- ============================================================

	-- Insert spaces when pressing Tab.
	expandtab = true,

	-- A tab character occupies 4 columns.
	tabstop = 4,

	-- Number of spaces used for indentation commands (`>>`, `<<`).
	shiftwidth = 4,

	-- Number of spaces inserted when pressing Tab in Insert mode.
	softtabstop = 4,

	-- Automatically indent new lines based on the previous line.
	smartindent = true,

	-- Round indentation to the nearest `shiftwidth`.
	shiftround = true,

	-- ============================================================
	-- Search
	-- ============================================================

	-- Ignore case when searching.
	ignorecase = true,

	-- If the search contains an uppercase letter, make it case-sensitive.
	smartcase = true,

	-- Highlight all matches of the current search.
	hlsearch = true,

	-- Start showing matches while typing the search pattern.
	incsearch = true,

	-- ============================================================
	-- Windows
	-- ============================================================

	-- Horizontal splits open below the current window.
	splitbelow = true,

	-- Vertical splits open to the right of the current window.
	splitright = true,

	-- Minimum width of a window.
	winminwidth = 5,

	-- ============================================================
	-- Folding
	-- ============================================================

	-- Start with every fold open. Folding still works (za/zc/zo),
	-- it just doesn't collapse everything the moment a file opens.
	foldlevel = 99,
	foldlevelstart = 99,

	-- ============================================================
	-- Clipboard / Input
	-- ============================================================

	-- Use the system clipboard for yanking and pasting.
	clipboard = "unnamedplus",

	-- Enable mouse support in all modes.
	mouse = "a",

	-- ============================================================
	-- Command Line / Completion
	-- ============================================================

	-- Show completion menu in the command line.
	wildmenu = true,

	-- Complete the longest match first, then show all matches.
	wildmode = "longest:full,full",

	-- Completion behavior for Insert mode completion engines.
	completeopt = {
		"menu",
		"menuone",
		"noselect",
	},

	-- Maximum number of items displayed in a completion popup.
	pumheight = 10,

	-- ============================================================
	-- Files / Persistence
	-- ============================================================

	-- Automatically write the buffer when required by certain commands.
	autowrite = true,

	-- Don't create backup files.
	backup = false,

	-- Don't create swap files.
	swapfile = false,

	-- Don't create an additional backup before writing.
	writebackup = false,

	-- Persist undo history between Neovim sessions.
	undofile = true,

	-- Keep a large undo history.
	undolevels = 10000,

	-- ============================================================
	-- Performance / Timing
	-- ============================================================

	-- Time before CursorHold is triggered.
	-- Also affects how quickly some plugins react to inactivity.
	updatetime = 250,

	-- Time Neovim waits for the rest of a mapped key sequence.
	timeoutlen = 1000,
}

for name, value in pairs(options) do
	opt[name] = value
end

-- ============================================================
-- Options that need special manipulation
-- ============================================================

-- Search for files recursively with `:find`.
--
-- Example:
--     :find parser.cpp
--
-- This allows Vim to search through subdirectories.
opt.path:append("**")

-- Treat hyphenated words as a single word.
--
-- Example:
--     some-long-variable
--
-- Useful when using motions such as `w`, `b`, `e`, etc.
opt.iskeyword:append("-")

-- Don't automatically insert comment leaders when:
--   - pressing Enter
--   - using `o` / `O`
--   - auto-wrapping comments
--
opt.formatoptions:remove({ "c", "r", "o" })

-- Keep messages in the command line concise.
opt.shortmess:append("c")
