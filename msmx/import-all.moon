-- msmx
-- MoonScript macro expansion system
-- By daelvn, zeuêp (pancakeddd)
-- 05.01.2019
import Macro from require "lbuilder.macro"

Macro "msmx/import-all"
  condition: [[@!import\h+\*\h+from\h+(.+)\h+as\h+(.+)(?=\h*--|$)]]
  capture:   [[@!import\h+\*\h+from\h+(.+)\h+as\h+(.+)(?=\h*--|$)]]
  replace:   [[%2 = %1]]
