
vim.g.mapleader = " "

-- Copying/pasting to "+
vim.keymap.set("n", "Y", "\"+y")
vim.keymap.set("n", "P", "\"+p")
vim.keymap.set("n", "D", "\"+d")

local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>f", builtin.find_files)

vim.keymap.set("n", "<leader>w", ":w<CR>")

vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("n", "W", "$")
vim.keymap.set("n", "B", "^")

-- For nice pageup/down scrolling
vim.keymap.set("n", "<C-d>", function()
  local count = math.floor(vim.fn.winheight(0) / 3)
  vim.cmd.normal({ args = { count .. "jzz" }, bang = true })
end)

vim.keymap.set("n", "<C-u>", function()
  local count = math.floor(vim.fn.winheight(0) / 3)
  vim.cmd.normal({ args = { count .. "kzz" }, bang = true })
end)
-- Based arrow removal
for _, mode in ipairs({ "n", "i", "v" }) do
  for _, key in ipairs({ "<Up>", "<Down>", "<Left>", "<Right>" }) do
    vim.keymap.set(mode, key, "<Nop>")
  end
end

vim.keymap.set("n", ";", "A;<Esc>")

local function clike_branch(keyword)
  vim.keymap.set("i", keyword.."<Tab>", keyword.." () {<CR>}<Esc>kwa")
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"c", "cpp"},
  callback = function()
    clike_branch("if")
    clike_branch("while")
    clike_branch("for")
  end
})
