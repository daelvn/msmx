-- msmx
-- MoonScript macro expansion
-- 03.01.2019
-- By daelvn, zeuêp (pancakeddd)
import Macro from require "lbuilder.macro"

Macro "msmx/apply"
  condition: [[@!\h*([^$\n]+?)\h*\$\h*([^$\n]+?)(?=\h+if|\h+for|--|$)]]
  capture:   [[@!\h*([^$\n]+?)\h*\$\h*([^$\n]+?)(?=\h+if|\h+for|--|$)]]
  pass:      -1
  replace:   "(%1 %2)"
