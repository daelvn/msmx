-- msmx
-- MoonScript macro expansion system
-- By daelvn, zeuêp (pancakeddd)
-- 05.01.2019
import Macro from require "lbuilder.macro"

Macro "msmx/nil-update"
  condition: [[@!(?=\h*|^)([a-zA-Z0-9_\.\]\[]+?)\h*\?=\h*(.+?)(?=\h+if|\h+for|\h+--|$)]]
  capture:   [[@!(?=\h*|^)([a-zA-Z0-9_\.\]\[]+?)\h*\?=\h*(.+?)(?=\h+if|\h+for|\h+--|$)]]
  replace:   [[%1 = (%1 == nil) and %2 or %1]]
