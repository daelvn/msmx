-- msmx
-- MoonScript macro expansion system
-- By daelvn, zeuêp (pancakeddd)
-- 05.01.2019
import Macro from require "lbuilder.macro"

Macro "msmx/negate"
  condition: [[@!(?=\h*|^)not=\h*([a-zA-Z0-9_\.\]\[]+?)(?=\h+if|\h+for|\h+--|$)]]
  capture:   [[@!(?=\h*|^)not=\h*([a-zA-Z0-9_\.\]\[]+?)(?=\h+if|\h+for|\h+--|$)]]
  replace:   [[%1 = not %1]]
