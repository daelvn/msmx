-- msmx
-- MoonScript macro expansion system
-- By daelvn, zeuêp (pancakeddd)
-- 10.01.2019
import Macro from require "lbuilder.macro"

Macro "msmx/where"
  condition: [[@!\bwhere\b]]
  capture:   [[@!\bwhere\b]]
  replace:   [[, (...) ->]]
