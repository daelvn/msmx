-- msmx
-- MoonScript macro expansion
-- 03.01.2019
-- By daelvn, zeuêp (pancakeddd)
import Macro from require "lbuilder.macro"

Macro "msmx/infix"
  condition: [[@!(.+=\h*|\h*do\h*|\h*then\h*|^)([^\n]+?)\h*[`<](.+)[`>]\h*([^\n]+?)(?=\h*if|\h*for|\h*--|$)]]
  capture:   {
    [[@!(.+=\h*|\h*do\h*|\h*then\h*|^)([^\n]+?)\h*[`<](\$)[`>]\h*([^\n]+?)(?=\h*if|\h*for|\h*--|$)]]
    [[@!(.+=\h*|\h*do\h*|\h*then\h*|^)([^\n]+?)\h*[`<](\.)[`>]\h*([^\n]+?)(?=\h*if|\h*for|\h*--|$)]]
    [[@!(.+=\h*|\h*do\h*|\h*then\h*|^)([^\n]+?)\h*[`<](\$!)[`>]\h*([^\n]+?)(?=\h*if|\h*for|\h*--|$)]]
    [[@!(.+=\h*|\h*do\h*|\h*then\h*|^)([^\n]+?)\h*[`<](\|)[`>]\h*([^\n]+?)(?=\h*if|\h*for|\h*--|$)]]
    [[@!(.+=\h*|\h*do\h*|\h*then\h*|^)([^\n]+?)\h*[`<](.+)[`>]\h*([^\n]+?)(?=\h*if|\h*for|\h*--|$)]]
  }
  replace:   {
    "%1__apply %2, %4"
    "%1__compose %2, %4"
    "%1__apply_excl %2, %4"
    "%1__alternative %2, %4"
    "%1%3 %2, %4"
  }

