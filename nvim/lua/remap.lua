vim.g.mapleader = " "
vim.keymap.set("n", "<Space>", "<Nop>")
vim.opt.timeoutlen = 300

vim.keymap.set({"n", "o"}, "Y", "\"+y")
vim.keymap.set({"n", "o"}, "P", "\"+p")
vim.keymap.set({"n", "o"}, "D", "\"+d")

-- Epic swap to header/source counterpart by IAmCheeseman, thanks Cheese, you are the man
local exts = {{"c", "h"}, {"cc", "hh"}, {"frag", "vert"}, {"cpp", "hpp"}}
vim.keymap.set("n", "<leader>s", function()
  local bufpath = vim.api.nvim_buf_get_name(0)
  for _, pair in ipairs(exts) do
    for i, ext in ipairs(pair) do
      if bufpath:match("%." .. ext .. "$") then
        local other = pair[i % #pair + 1]
        vim.cmd("e " .. bufpath:gsub("%." .. ext .. "$", "." .. other))
        return
      end
    end
  end
  print("no files to swap to")
end)

-- Fuzzy finder
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files)

vim.keymap.set("n", "<leader>w", ":w<CR>")

vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set({"n", "o", "v"}, "W", "$")
vim.keymap.set({"n", "o", "v"}, "B", "^")

vim.keymap.set("n", "ge", vim.diagnostic.goto_next)
vim.keymap.set("n", "gE", vim.diagnostic.goto_prev)

-- Python : next line
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"python"},
  callback = function()
    vim.keymap.set("i", ":", ":<Esc>o")
  end
})

-- For nice pageup/down scrolling
vim.keymap.set("n", "<C-d>", function()
  local count = math.floor(vim.fn.winheight(0) / 3)
  vim.cmd.normal({ args = { count .. "jzz" }, bang = true })
end)

vim.keymap.set("n", "<C-u>", function()
  local count = math.floor(vim.fn.winheight(0) / 3)
  vim.cmd.normal({ args = { count .. "kzz" }, bang = true })
end)

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", ";", "A;<Esc>")

local function clike_branch(keyword)
  vim.keymap.set("i", keyword.."<Tab>", keyword.." () {<CR>}<Esc>kwa")
end

-- C like branching
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"c", "cpp"},
  callback = function()
    clike_branch("if")
    clike_branch("while")
    clike_branch("for")
  end
})

vim.keymap.set("i", "<Tab>", "a<Esc>==$xa")
