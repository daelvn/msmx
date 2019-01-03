package = "lbuilder3"
version = "dev-1"
source = {
   url = "git+ssh://git@github.com/daelvn/lbuilder3.git"
}
description = {
   homepage = "https://github.com/daelvn/lbuilder3",
   license = "MIT"
}
build = {
   type = "builtin",
   modules = {
      ["lbuilder.builder"] = "lbuilder/builder.lua",
      ["lbuilder.macro"]   = "lbuilder/macro.lua",
      ["lbuilder.util"]    = "lbuilder/util.lua",

      ["lbuilder.parsec.init"] = "lbuilder/parsec/init.lua",
      ["lbuilder.parsec.Char"] = "lbuilder/parsec/Char.lua"
   }
}
