-- msmx
-- MoonScript macro expansion system
-- By daelvn, zeuêp (pancakeddd)
-- 03.01.2019
import Macro from require "lbuilder.macro"

Macro "msmx/loadfile"
  condition: [[@!\h*(.+?)\h*<=<\h*(.+?)(?=\h+if|\h+for|\h+--|$)]]
  capture:   [[@!\h*(.+?)\h*<=<\h*(.+?)(?=\h+if|\h+for|\h+--|$)]]
  replace:   [[%1 = assert io.open %2, "r" ]]
