import id    from require "msmx.symbols"
import Macro from require "lbuilder.macro"

Macro "msmx/qstop"
  condition: "@!#{id}::#{id}"
  capture:   "@!(#{id})::(#{id})"
  replace:   [[%1\%2!]]
