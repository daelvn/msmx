-- msmx
-- MoonScript macro expansion system
-- By daelvn, zeuêp (pancakeddd)
-- 03.01.2019
import Macro from require "../lbuilder/macro"

Macro "msmx/loadfile"
  condition: [[@!(.+?)\s<<!\s(.+?)]]
  capture:   [[@!(.+?)\s<<!\s(.+?)]]
  replace:   [[table.insert(%1, %2)]]
