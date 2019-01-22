-- msmx
-- MoonScript macro expansion
-- 03.01.2019
-- By daelvn, zeuêp (pancakeddd)
import Macro from require "lbuilder.macro"

Macro "msmx/pragma"
  condition: [[@!{-#\h+([A-Z]+)\h+([A-Za-z]+)\h+#-}]]
  capture:   {
    [[@!{-#\h+LANGUAGE Types\h+#-}]]
    [[@!{-#\h+LANGUAGE NoTypes\h+#-}]]
    [[@!{-#\h+LANGUAGE DataTypes\h+#-}]]
    [[@!{-#\h+LANGUAGE NoDataTypes\h+#-}]]
    [[@!{-#\h+LANGUAGE Signatures\h+#-}]]
    [[@!{-#\h+LANGUAGE NoSignatures\h+#-}]]
    [[@!{-#\h+LANGUAGE IndexableStrings\h+#-}]]
    [[@!{-#\h+LANGUAGE Substrings#-}]]
  }
  replace:   {
    [[import typeof from require "ltypekit.type"]]
    [[typeof = nil]]
    [[import typeE, data, metatype from require "ltypekit.type"]]
    [[typeE, data, metatype = nil, nil, nil]]
    [[typeof = nil]]
    [[import sign from require "ltypekit"]]
    [[sign = nil]]
    [[getmetatable''.__index = (str, i) -> string.sub str, i, i]]
    [[getmetatable''.__call = string.sub]]
  }
