-- msmx
-- MoonScript macro expansion system
-- By daelvn, zeuêp (pancakeddd)
-- 03.01.2019
import Macro, expand_many, expand from require "lbuilder.macro"
macrol = {
  require "msmx.loadfile"
  --require "msmx.qstop"
  require "msmx.infix"
  require "msmx.sign"
  require "msmx.apply"
  require "msmx.import-simple"
  require "msmx.import-all"
  require "msmx.import-in"
  require "msmx.compare-type"
  require "msmx.nil-update"
  require "msmx.ask"
  require "msmx.negate"
  require "msmx.block-comment"
}

expand_file = (filename) ->
  f         = assert io.open filename, "r"
  contents  = f\read "*all"
  f\close!
  
  for macro in *macrol
    contents = ((expand macro) {}) contents

  contents

isarg = (args, name) ->
  return args[name] and args[name] != "STANDALONE_FLAG"

get_arguments = (a) ->
  flags = {
    "-o": "Output"
    "-i": "Input"
  }
  out = {}
  for i = 1, #a
    for k, v in pairs(flags)
      if a[i] == k
        out[v] = a[i+1] or "STANDALONE_FLAG"
  return out

parse_arguments = (args) ->
  omacro = nil
  if isarg(args, "Input")
    omacro = expand_file args["Input"]
    unless isarg(args, "Output")
      print omacro


gargs = get_arguments arg
parse_arguments gargs
