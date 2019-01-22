-- msmx
-- MoonScript macro expansion system
-- By daelvn, zeuêp (pancakeddd)
-- 03.01.2019
import Macro, expand from require "lbuilder.macro"
argparse                = require "argparse"

macrol = {
  require "msmx.pragma"
  require "msmx.loadfile"
  --require "msmx.qstop"
  require "msmx.infix"
  require "msmx.oversign"
  require "msmx.sign"
  require "msmx.apply"
  require "msmx.import-std"
  require "msmx.import-simple-all"
  require "msmx.import-simple"
  require "msmx.import-all"
  require "msmx.import-in"
  require "msmx.compare-type"
  require "msmx.nil-update"
  require "msmx.ask"
  require "msmx.negate"
  require "msmx.where"
  require "msmx.which"
}

get_path  = (s) -> s\match "(.+/).+"
get_name  = (s) -> s\match ".+/(.+)"
get_ext   = (s) -> s\match ".+/%.(.+)"
get_noext = (s) -> s\match ".+/(.+)%..+"

expand_file = (filename, disablel) ->
  f         = assert io.open filename, "r"
  contents  = f\read "*all"
  f\close!
  for macro in *macrol
    docont = false
    for mn in *disablel
      if macro.name == mn then
        docont = true
    if docont then continue
    contents = ((expand macro) {}) contents
  contents

local argl
with argparse!
  \name "msmx"
  \description "MoonScript Macro Expansion"
  \epilog "https://github.com/daelvn/msmx"

  \help_usage_margin 2
  \help_description_margin 30
  \help_vertical_space 1

  with \flag "-p --print --stdout"
    \description "Writes to stdout"
    \target "print"

  with \option "-d --dir --directory --path"
    \description "Directory to place compiled files"
    \args 1
    \target "path"

  with \option "-o --out --output"
    \description "Write output to file"
    \args 1
    \target "output"

  with \option "-x --disable"
    \description "Disables a macro"
    \args "*"
    \default {}

  with \argument "file"
    \description "A .msmx file"
    \args "+"

  argl = \parse!

for file in *argl.file
  cont = expand_file file, argl.disable
  if argl.print
    io.write cont
  elseif argl.path
    with io.open "#{argl.path}/#{get_noext file}.moon", "w"
      \write cont
      \close!
    print "Built file #{argl.path}/#{get_noext file}.moon"
  else
    with io.open (argl.output or "#{get_path file}#{get_noext file}.moon"), "w"
      \write cont
      \close!
    print "Built file #{argl.output or "#{get_path file}#{get_noext file}.moon"}"
