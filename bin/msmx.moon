-- msmx
-- MoonScript macro expansion system
-- By daelvn, zeuêp (pancakeddd)
-- 03.01.2019
import Macro, expand_many, expand from require "lbuilder.macro"

macrol = {
  require "msmx.loadfile"
  require "msmx.sign"
}

expand_file = (filename) ->
  f         = assert io.open filename, "r"
  contents  = f\read "*all"
  f\close!

  for macro in *macrol
    contents = ((expand macro) {}) contents

  contents

print expand_file "tests/test.moon"
