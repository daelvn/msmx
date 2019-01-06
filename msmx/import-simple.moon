-- msmx
-- MoonScript macro expansion system
-- By daelvn, zeuêp (pancakeddd)
-- 05.01.2019
import Macro from require "lbuilder.macro"

Macro "msmx/import-simple"
  condition: [[@!import\h+([a-zA-Z0-9_-]+)((?:(?!(?:\bfrom\b|\bas\b| -- )).)+)?(?=\h*--|$)]]
  capture:   [[@!import\h+([a-zA-Z0-9_-]+)((?:(?!(?:\bfrom\b|\bas\b| -- )).)+)?(?=\h*--|$)]]
  replace:   [[%1 = require "%1"]]
