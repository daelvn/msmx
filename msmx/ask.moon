-- msmx
-- MoonScript macro expansion system
-- By daelvn, zeuêp (pancakeddd)
-- 05.01.2019
import Macro from require "lbuilder.macro"

Macro "msmx/ask"
  condition: [[@!(?=\h*|^)([a-zA-Z0-9_\.\]\[]+?)\?(?=\h+then|\h+do|\h+--|$)]]
  capture:   [[@!(?=\h*|^)([a-zA-Z0-9_\.\]\[]+?)\?(?=\h+then|\h+do|\h+--|$)]]
  replace:   [[%1!]]
