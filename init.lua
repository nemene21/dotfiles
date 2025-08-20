
require("plugins")
require("remap")
require("colors")

local tabs = 2
vim.opt.tabstop = tabs
vim.opt.softtabstop = tabs
vim.opt.shiftwidth = tabs
vim.opt.expandtab = true

vim.opt.list = true
vim.opt.listchars = "multispace:│ ,trail:ඞ"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.winborder = "single"

vim.opt.scrolloff = 5
