return {
    -----------------
    -- auto snippet
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
    ---------------
    -- normal snippet
    s({trig = "mkt", dscr = "maketitle"}, t([[\maketitle]])),
    s({trig = "docls", dscr = "documentclass"}, fmta([[\documentclass{<>}]],
        {i(1, "documentclass")}
    )),
    s({trig = "uspa", dscr = "usepackage"}, {t([[\usepackage{]]),i(1, "package"), t("}")}),
    s({trig = "sec", dscr = "section"}, {t([[\section{]]), i(1, "section name"), t("}")}),
    s({trig = "ssec", dscr = "subsection"}, {t([[\subsection{]]), i(1, "section name"), t("}")}),
    s({trig = "sssec", dscr = "subsubsection"}, {t([[\subsubsection{]]), i(1, "section name"), t("}")}),
    s({trig = "\\para", dscr = "paragraph"},{t([[\paragraph{]]),i(1), t([[}]])}),
    s({trig = "\\verb", dscr = "line code"}, {t([[\verb|]]),i(1), t([[|]])})
}
