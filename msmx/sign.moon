-- msmx
-- MoonScript macro expansion system
-- By daelvn, zeuêp (pancakeddd)
-- 03.01.2019
import Macro from require "lbuilder.macro"

Macro "msmx/sign"
  condition: [[@!\h*(.+?)\h*::\h*(.+?)(?=\h*--|$)]]
  capture:   [[@!\h*(.+?)\h*::\h*(.+?)(?=\h*--|$)]]
  replace:   [[%1 = sign "%2"]]
