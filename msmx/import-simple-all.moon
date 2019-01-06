-- msmx
-- MoonScript macro expansion system
-- By daelvn, zeuêp (pancakeddd)
-- 05.01.2019
import Macro from require "lbuilder.macro"

Macro "msmx/import-simple-all"
  condition: [[@!import\h+([a-zA-Z0-9_\.-]+)\h+as\h+(.+)(?=\h*--|$)]]
  capture:   [[@!import\h+([a-zA-Z0-9_\.-]+)\h+as\h+(.+)(?=\h*--|$)]]
  replace:   [[%2 = require "%1"]]
