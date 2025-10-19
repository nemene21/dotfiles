-- Lazy bootstrap
vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vim", "python", "c" },
        highlight = { enable = true },
      })
    end,
  },{
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6', -- or branch = '0.1.x'
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup({
        pickers = {
          find_files = {
            hidden = true,
            no_ignore = true,
            find_command = { "rg", "--files", "--hidden", "--no-ignore", "--glob", "!.git/*" },
          },
        },
        defaults = {
          file_ignore_patterns = {
            "node_modules",
            "%.lock",       -- ignore *.lock files
            "%.o",          -- ignore object files
            "build/",       -- ignore build directory
          }}})
        end
      },{
        "mason-org/mason.nvim",
        opts = {}
      },{
        "neovim/nvim-lspconfig",
        opts = {},
        config = function()
          require('lspconfig').lua_ls.setup {
            settings = {
              Lua = {
                runtime = {
                  version = 'LuaJIT',
                },
                diagnostics = {
                  globals = {'vim', "love"},
                },
                workspace = {
                  library = {
                    vim.api.nvim_get_runtime_file("", true),
                    vim.fn.expand("~/.local/share/nvim/love-api")
                  },
                  checkThirdParty = false,
                },
                telemetry = {
                  enable = false,
                },
              },
            },
          }

        end
      }, {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
      }, {
        "feline-nvim/feline.nvim",
        config = function ()
          require('feline').setup()
        end
      }, {
        "nvim-tree/nvim-web-devicons", opts = {}
      }
    }, {})

    vim.lsp.enable({"lua_ls", "clangd"})
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        -- trigger autocomplete on every keystroke
        local chars = {}
        for i = 32, 126 do
          table.insert(chars, string.char(i))
        end
        client.server_capabilities.completionProvider.triggerCharacters = chars

        if client:supports_method('textDocument/completion') then
          vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
        end
      end,
    })
    vim.cmd("set completeopt+=menu,menuone,noinsert")
    vim.diagnostic.config({virtual_text = true})

