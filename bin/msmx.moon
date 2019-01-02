import Macro, expand from require "../lbuilder/macro"

MacroLoadFile = require "../msmx/loadfile"

class MSMX
  new: =>
    @macros = {}

  addMacro: (macro) =>
    table.insert @macros, macro

  expandFile: (filename) =>
    f = assert io.open filename, "r"
    file_contents = f\read "*all"
    f\close!

    for M in *@macros
      file_contents = ((expand M) {}) file_contents

    return file_contents

msmx = MSMX!

msmx\addMacro MacroLoadFile

print msmx\expandFile "tests/test.moon"