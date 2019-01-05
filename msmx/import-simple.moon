-- msmx
-- MoonScript macro expansion system
-- By daelvn, zeuêp (pancakeddd)
-- 05.01.2019
import Macro from require "lbuilder.macro"

Macro "msmx/import-simple"
  condition: [[@!import\h+([a-zA-Z0-9_-]+)(.+)(?!\h+from)(?=\h*--|$)]]
  capture:   [[@!import\h+([a-zA-Z0-9_-]+)(.+)(?!\h+from)(?=\h*--|$)]]
  replace:   [[%1 = require "%1%2"]]
