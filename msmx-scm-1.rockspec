package = "msmx"
version = "dev-1"
source = {
   url = "git+ssh://git@github.com/daelvn/msmx.git"
}
description = {
   summary  = "Macro processor for MoonScript",
   homepage = "https://github.com/daelvn/msmx",
   license  = "MIT"
}
dependencies = {
  "lbuilder3"
}
build = {
  type = "builtin",
  modules = {
    ["msmx.negate"]        = "msmx/negate.lua",
    ["msmx.nil-update"]    = "msmx/nil-update.lua",
    ["msmx.loadfile"]      = "msmx/loadfile.lua",
    ["msmx.import-simple"] = "msmx/import-simple.lua",
    ["msmx.import-all"]    = "msmx/import-all.lua",
    ["msmx.import-in"]     = "msmx/import-in.lua",
    ["msmx.symbols"]       = "msmx/symbols.lua",
    ["msmx.apply"]         = "msmx/apply.lua",
    ["msmx.compare-type"]  = "msmx/compare-type.lua",
    ["msmx.sign"]          = "msmx/sign.lua",
    ["msmx.infix"]         = "msmx/infix.lua",
    ["msmx.ask"]           = "msmx/ask.lua",
  },
  install = {
    bin = {
     msmx = "bin/msmx.lua"
    }
  }
}
