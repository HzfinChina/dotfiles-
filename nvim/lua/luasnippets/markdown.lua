return
{
    s({trig = "beg ", dscr = "begin an environment", snippetType = "autosnippet"},
        fmta([[ 
                \begin{<>}
                <>
                \end{<>}
            ]],
            {
                i(1,'enviroment'), i(2, 'content'), rep(1)
            }
        )
    ),
-- 数学符号

s({trig = "int"}, fmta(
    [[\int_{<>}^{<>} ]],
    {i(1,"start"), i(2, "end")}
    )
),

s({trig = "iint", snippetType = "autosnippet"}, fmta(
    [[\iint_{<>}^{<>} ]],
    {i(1,"start"), i(2, "end")}
    )
),

s({trig = "iiint", snippetType = "autosnippet"}, fmta(
    [[\iint_{<>}^{<>} ]],
    {i(1,"start"), i(2, "end")}
    )
),
s({trig = "oint", dscr = "环积分", snippetType = "autosnippet"}, t([[\\oint ]])),
s({trig = "ooint", dscr = "二重环积分", snippetType = "autosnippet"}, t([[\ooint ]])),

s({trig = "->", dscr = "rightarrow"}, t([[\rightarrow ]])),
s({trig = "<-", dscr = "leftarrow"}, t([[\leftarrow ]])),
s({trig = " <-> ", snippetType = "autosnippet",}, t([[\leftrightarrow ]])),
s({trig = " <--> ", snippetType = "autosnippet"}, t([[\longleftrightarrow ]])),
s({trig = " <=> ", snippetType = "autosnippet"}, t([[\Leftrightarrow ]])),
s({trig = " <==> ", snippetType = "autosnippet"}, t([[\Longleftrightarrow ]])),
s({trig = " ~= ", snippetType = "autosnippet"}, t([[\approx ]])),

s({trig = "sum ", snippetType = "autosnippet"}, fmta([[\sum_{<>}^{<>} ]],
    {i(1, "下标"), i(2, "上标")})
),
-- 一元函数极限
s({trig = "lim ", snippetType = "autosnippet"}, fmta([[\lim_{<> \to <>}]],{i(1, "自变量"), i(2, "趋近于的点")})
),
-- 二元函数极限
s({trig = "bivarlim"},fmta([[ 
     \lim_{{<>}\atop{<>}}]], {i(1,"第一个自变量"), i(2, "第二个自变量")})),

-- 除法相关
s({trig = "partial", snippetType = "autosnippet"}, fmta([[\frac{\partial<>}{\partial<>}]],{
    i(1,"y"),
    i(2, "x")}
    )
),
s({trig = "di ", snippetType = "autosnippet"}, fmta([[\frac{<>}{<>}]], {i(1,"分子"), i(2, "分母")})),
s({trig = "jj",wordTrig = false, snippetType = "autosnippet"}, fmta([[_{<>}]], {i(1)})),
s({trig = "kk",wordTrig = false, snippetType = "autosnippet"}, fmta([[^{<>}]], {i(1)})),



-- 希腊字母 
s({trig = "lbd"}, t([[\lambda]])),
s({trig = "vep"}, t([[\varepsilon]]))

}
