---@diagnostic disable: undefined-global

vim.cmd("hi clear")

vim.g.colors_name = "mine"
vim.g.background = "dark"

local colors = {
  ["Terminal"]                     = {link="Normal"},
  ["TermCursor"]                   = {link="Cursor"},
  ["TermCursorNC"]                 = {link="Cursor"},
  ["CurSearch"]                    = {link="Search"},
  ["CursorLineFold"]               = {link="CursorLine"},
  ["CursorLineSign"]               = {link="CursorLine"},
  ["MessageWindow"]                = {link="Pmenu"},
  ["PopupNotification"]            = {link="Todo"},
  ["Character"]                    = {link="String"},
  ["FloatBorder"]                  = {link="NormalFloat"},
  ["NormalFloat"]                  = {link="Normal"},

  ["ModeMsg"]                      = {fg="#FF88CC", bold=true},
  ["StatusLine"]                   = {fg="#000000", bg="#AA66DD"},
  ["StatusLineNC"]                 = {fg="#FFFFFF"},
  ["ColorColumn"]                  = {bg="#333333"},
  ["WinSeparator"]                 = {fg="#222222"},
  ["CursorLine"]                   = {bg="#222222"},
  ["EndOfBuffer"]                  = {fg="#222222"},
  ["LineNr"]                       = {fg="#CCCCCC"},
  ["LineNrAbove"]                  = {fg="#888888"},
  ["LineNrBelow"]                  = {fg="#888888"},
  ["MatchParen"]                   = {fg="#EE66AA", bold=true},
  ["Normal"]                       = {fg="#AAAAAA", bg="#1A191C"},
  ["Pmenu"]                        = {fg="#FFFFFF", bg="#333333"},
  ["PmenuSel"]                     = {fg="#333333", bg="#FFFFFF", bold=true},
  ["Search"]                       = {fg="#333333", bg="#FFFF88", bold=true},
  ["Visual"]                       = {bg="#333333"},

  ["Comment"]                      = {fg="#777777", italic=true},

  ["Constant"]                     = {fg="#44FF99"},
  ["Number"]                       = {fg="#44FF99"},
  ["String"]                       = {fg="#FFFF00"},
  ["Boolean"]                      = {fg="#44FF99"},

  ["Identifier"]                   = {fg="#FFFFFF"},
  ["Function"]                     = {fg="#5599EE"},
  ["Statement"]                    = {fg="#FF4499"},
  ["Label"]                        = {fg="#FF9944"},

  ["Operator"]                     = {fg="#AAAABB"},

  ["PreProc"]                      = {fg="#FF4499"},
  ["Typedef"]                      = {fg="#AA7FFF"},
  ["Type"]                         = {fg="#AA7FFF"},

  ["StorageClass"]                 = {fg="#4499FF"},
  ["Structure"]                    = {fg="#4499FF"},

  ["Special"]                      = {fg="#CCCCDD"},
  ["SpecialChar"]                  = {fg="#FFFFFF", bold=true},

  ["Error"]                        = {fg="#FF4444", bold=true, undercurl=true},
  ["Todo"]                         = {fg="#FFFFFF", bold=true, undercurl=true},
  ["Added"]                        = {fg="#44FF44"},
  ["Changed"]                      = {fg="#FFFF44"},
  ["Removed"]                      = {fg="#FF4444"},

  ["@constant.builtin"]            = {link="Constant"},
  ["@type.builtin"]                = {link="Type"},
  ["@function.builtin"]            = {link="Function"},
  ["@attribute.builtin"]           = {link="@attribute"},

  ["@keyword.repeat"]              = {fg="#DD66FF"},
  ["@keyword.conditional"]         = {fg="#FF66DD"},

  ["@variable"]                    = {fg="#CCCCCC"},
  ["@variable.parameter.builtin"]  = {link="@variable.builtin"},
  ["@variable.parameter"]          = {fg="#CCCCCC", italic=true},
  ["@variable.builtin"]            = {fg="#DD66FF", italic=true},
  ["@variable.member"]             = {fg="#9999FF"},

  ["@lsp.type.variable"]           = {fg="none"},
  ["@lsp.type.parameter"]          = {link="@variable.parameter"},
  ["@lsp.type.enumMember"]         = {link="Constant"},
  ["@lsp.typemod.variable.static"] = {link="@lsp.typemod.variable.global"},
  ["@lsp.typemod.variable.global"] = {fg="#FFDD66"},
}

for k, v in pairs(colors) do
  vim.api.nvim_set_hl(0, k, v)
end
