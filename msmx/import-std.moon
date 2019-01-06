-- msmx
-- MoonScript macro expansion system
-- By daelvn, zeuêp (pancakeddd)
-- 06.01.2019
import Macro from require "lbuilder.macro"

Macro "msmx/import-std"
  condition: [[@!import std\/(.+?)(?=\h*--|$)]]
  capture:   {
    "import std/[Cc]oroutine"
    "import std/[Dd]ebug"
    "import std/[Ii][Oo]"
    "import std/[Mm]ath"
    "import std/[Oo][Ss]"
    "import std/[Pp]ackage"
    "import std/[Ss]tring"
    "import std/[Tt]able"
    "import std/[Uu]tf8"
  }
  replace:   {
    "{wrap: cowrap, :yield, create: Coroutine, :resume, status: costatus," ..
    " running: corunning, isyieldable: isYieldable} "                      ..
    "= coroutine"

    "{:gethook, :getinfo, :getlocal, getmetatable: _getmetatable, :getregistry,"    ..
    " :getupvalue, :getuservalue, :sethook, :setlocal, :setmetatable, :setupvalue," ..
    " :setuservalue, :traceback, :upvalueid, :upvaluejoin} "                        ..
    "= debug"

    "{close: closeIO, flush: flushIO, input: inputIO, lines: linesIO, open: openIO,"      ..
    " output: outputIO, popen: popenIO, read: readIO, tmpfile: tempfileIO, type: typeIO," ..
    " write: writeIO} "                                                                   ..
    "= io"

    "{:abs, :acos, :asin, :atan, :ceil, :cos, :deg, :exp, :floor, :fmod, :huge, :log," ..
    " :max, :maxinteger, :min, :mininteger, :modf, :pi, :rad, :random, :randomseed,"   ..
    " :sin, :sqrt, :tan, :tointeger, :type, :ult} "                                    ..
    "= math"

    "{:clock, :date, :difftime, :execute, :exit, :getenv, remove: fremove, rename: frename," ..
    " :setlocale, :time, tmpname: tempname} "                                                ..
    "= os"

    "{config: pkgConfig, :cpath, :path, loaded: pkgLoaded, loadlib: pkgLoad,"    ..
    " preload: pkgPreload, searchers: pkgSearchers, searchpath: pkgSearchpath} " ..
    "= package"

    "{:byte, :char, :dump, :find, :format, :gmatch, :gsub, :len, :lower, :match," ..
    " pack: packString, :packsize, :rep, :reverse, :sub, unpack: unpackString,"   ..
    " :upper} "                                                                   ..
    "= string"

    "{:concat, :insert, :move, :pack, :remove, :sort, :unpack} = table"

    "{char: utf8char, charpattern: utf8charpattern, codepoint: utf8codepoint," ..
    " codes: utf8codes, len: utf8len, offset: utf8offset} "                    ..
    "= utf8"
  }
