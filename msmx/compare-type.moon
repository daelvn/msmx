-- msmx
-- MoonScript macro expansion system
-- By daelvn, zeuêp (pancakeddd)
-- 03.01.2019
import Macro from require "lbuilder.macro"

Macro "msmx/compare-type"
  condition: [[@!(?=\h*|^)([a-zA-Z0-9_\.\]\[]+?)\h*[!=]==\h*(.+?)(?=\h+then|\h+do|\h+--|$)]]
  capture:   {
    [[@!(?=\h*|^)([a-zA-Z0-9_\.\]\[]+?)\h*===\h*(.+?)(?=\h+then|\h+do|\h+--|$)]]
    [[@!(?=\h*|^)([a-zA-Z0-9_\.\]\[]+?)\h*!==\h*(.+?)(?=\h+then|\h+do|\h+--|$)]]
  }
  replace:   {
    [[(typeof %1) == "%2"]]
    [[(typeof %1) != "%2"]]
  }
