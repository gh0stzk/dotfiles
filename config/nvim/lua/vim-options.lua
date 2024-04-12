local opt = vim.opt -- for conciseness

-- Line numbering
opt.relativenumber = true
opt.number = true
opt.showtabline = 2

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Line wrapping
opt.wrap = true

-- Search setting
opt.ignorecase = true
opt.smartcase = true

-- Cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Splitt Windows
opt.splitright = true
opt.splitbelow = truelocal opt = vim.opt -- for conciseness

opt.iskeyword:append("-")
