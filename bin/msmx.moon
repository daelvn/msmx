import Macro, expand_many from require "../lbuilder/macro"

macrol = {
  require "msmx.loadfile"
  require "msmx.qstop"
}

expand_file = (filename) ->
  f         = assert io.open filename, "r"
  contents  = f\read "*all"
  f\close!

  ((expand_many macrol) {}) contents

print expand_file "tests/test.moon"
