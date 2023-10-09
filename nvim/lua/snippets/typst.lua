-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
  s({ trig = "gr", regTrig = true, snippetType="autosnippet" }, { t([["grad"]]), }),

  s(
    { trig = "ff", dscr = "auto divide",snippetType="autosnippet" },
    fmt( [[({})/({})]], { i(1), i(2) })
  ),
  s(
    { trig = "ovl", dscr = "overline",snippetType="autosnippet" },
    fmt( [[overline({})]], {i(1)})
  ),
  s(
    { trig = "itg", dscr = "integral",snippetType="autosnippet" },
    fmt( [[integral_({})^({})]], {i(1),i(2)})
  ),
  s(
    { trig = "oint", dscr = "integral.cont",snippetType="autosnippet" },
    fmt( [[integral.cont]], {})
  ),

  s( { trig="rot",snippetType="autosnippet" },t([["rot"]])),
  s( { trig="bo",snippetType="autosnippet" },fmt([[bold({})]],{i(1)})),
  s({trig="inf",snippetType="autosnippet"},{t("infinity")}),
  s({trig="xx",snippetType="autosnippet"},{t("times")}),
  s({trig="@l",snippetType="autosnippet"},{t("lambda")}),
  s({trig="@D",snippetType="autosnippet"},{t("Delta")}),
  s({trig="@s",snippetType="autosnippet"},{t("sigma")})
}
