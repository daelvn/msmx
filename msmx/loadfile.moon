require "msmx.symbols"

import Macro from require "../lbuilder/macro"

Macro "msmx/loadfile"
  condition: "@!#{id} <=< ?.+"
  capture:   "@!(#{id}) <=< ?(.+)"
  replace:   [[%1 = assert io.open %2, "r" ]]