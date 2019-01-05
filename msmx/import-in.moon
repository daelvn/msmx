-- msmx
-- MoonScript macro expansion system
-- By daelvn, zeuêp (pancakeddd)
-- 05.01.2019
import Macro from require "lbuilder.macro"

Macro "msmx/import-in"
  condition: [[@!import\h+(.+)\h+in\h+(.+)(?=\h*--|$)]]
  capture:   [[@!import\h+(.+)\h+in\h+(.+)(?=\h*--|$)]]
  replace:   [[import %1 from require "%2"]]
