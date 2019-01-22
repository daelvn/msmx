-- msmx
-- MoonScript macro expansion system
-- By daelvn, zeuêp (pancakeddd)
-- 22.01.2019
import Macro from require "lbuilder.macro"

Macro "msmx/which"
  condition: [[@!\bwhich\b]]
  capture:   [[@!\bwhich\b]]
  replace:   [[,]]
