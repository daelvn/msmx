-- msmx
-- MoonScript macro expansion system
-- By daelvn, zeuêp (pancakeddd)
-- 03.01.2019
import Macro from require "lbuilder.macro"

Macro "msmx/oversign"
  condition: [[@!\h*::>\h*(.+?)(?=\h*--|$)]]
  capture:   [[@!\h*::>\h*(.+?)(?=\h*--|$)]]
  replace:   [[sign "%1"]]
