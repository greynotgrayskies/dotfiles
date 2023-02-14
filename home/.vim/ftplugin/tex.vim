"""LaTeX"""

"No auto-indentation
"TODO: Doesn't seem to be working here, but works in .vimrc. Specifically the
"autoindent and indentexpr options seem to be overriden at some point by Vim's
"TeX options, but can be then overriden by .vimrc.
setlocal noautoindent       "set to autoindent
setlocal nocindent
setlocal nosmartindent
setlocal indentexpr=        "set to indentexpr=GetTeXIndent()

"Wrap lines over 80 characters long
"setlocal textwidth=80

