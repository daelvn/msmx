# msmx - MoonScript Macro Expansion
This is a macro expansion system that uses lbuilder3.macro to do the replacements.
## Features
### apply
```moon
a $ b $ 1 + 1
```
turns into
```
(a (b 1 + 1))
```
### ask
You can use `?` instead of `!` to call functions.
### compare-type
> Uses ltypekit6 

```moon
x === string
```
turns into
```moon
((typeof x) == "string")
```
### import-all
```moon
import * from require "msmx" as msmx
```
turns into
```moon
msmx = require "msmx"
```
### import-in
```moon
import a, b in msmx
```
turns into
```
import a, b from require "msmx"
```
### import-std
Brings `std/<library>` into the local scope, where `<library>` is any of:
#### coroutine
- `wrap` -> `cowrap`
- `yield`
- `create` -> `Coroutine`
- `resume`
- `status` -> `costatus`
- `running` -> `corunning`
- `isyieldable` -> `isYieldable`
#### debug
- `gethook`
- `getinfo`
- `getlocal`
- `getmetatable` -> `_getmetatable`
- `getregistry`
- `getupvalue`
- `getuservalue`
- `sethook`
- `setlocal`
- `setmetatable` -> `_setmetatable`
- `setupvalue`
- `setuservalue`
- `traceback`
- `upvalueid`
- `upvaluejoin`
#### io
- `close` -> `closeIO`
- `flush` -> `flushIO`
- `input` -> `inputIO`
- `lines` -> `linesIO`
- `open` -> `openIO`
- `output` -> `outputIO`
- `popen` -> `popenIO`
- `read` -> `readIO`
- `tmpfile` -> `tempfileIO`
- `type` -> `typeIO`
- `write` -> `writeIO`
#### math
All values are the same
#### os
- `clock`
- `date`
- `difftime`
- `execute`
- `exit`
- `getenv`
- `remove` -> `fremove`
- `rename` -> `frename`
- `setlocale`
- `time`
- `tmpname` -> `tempname`
#### package
- `config` -> `pkgConfig`
- `cpath`
- `path`
- `loaded` -> `pkgLoaded`
- `loadlib` -> `pkgLoad`
- `preload` -> `pkgPreload`
- `searchers` -> `pkgSearchers`
- `searchpath` -> `pkgSearchpath`
#### string
- `byte`
- `char`
- `dump`
- `find`
- `format`
- `gmatch`
- `gsub`
- `len`
- `lower`
- `match`
- `pack` -> `packString`
- `packsize`
- `rep`
- `reverse`
- `sub`
- `unpack` -> `unpackString`
- `upper`
#### table
All values are the same
#### utf8
All values prefixed with `utf8`
### import-simple
```moon
import msmx
```
turns into
```moon
msmx = require "msmx"
```
### import-simple-all
```moon
import xmsmx as msmx
```
turns into
```moon
msmx = require "xmsmx"
```
### infix
```moon
a `fn` b
a <fn> b
```
turns into
```moon
fn a, b
fn a, b
```
#### Special cases
- `<$>` -> `__apply`
- `<.>` -> `__compose`
- `<$!>` -> `__apply_excl`
- `<|>` -> `__alternative`
### loadfile
```moon
a <=< "file"
```
turns into
```moon
a = assert io.open "file", "r"
```
### negate
```moon
not= a
```
turns into
```
a = not a
```
### nil-update
```moon
a ?= b
```
turns into
```moon
a = (a == nil) and b or a
```
### oversign
> Uses ltypekit6

```moon
f = ::> string -> string
```
turns into
```moon
f = sign "string -> string"
```
### pragma
Activates language features.
Syntax: `{-# KEYWORD Argument #-}`
#### LANGUAGE
##### Types
> Uses ltypekit6

`import typeof from require "ltypekit.type"`
##### NoTypes
`typeof = nil`
##### Signatures
> Uses ltypekit6

`import sign from require "ltypekit"`
##### NoSignatures
`sign = nil`
##### IndexableStrings
`getmetatable''.__index = (str, i) -> string.sub str, i, i`
##### Substrings
`getmetatable''.__call = string.sub`
### sign
> Uses ltypekit6
> Requires LANGUAGE Signatures pragma

```moon
f :: string -> string
```
turns into
```moon
f = sign "string -> string"
```
### where
```moon
fncall x where
  return y
```
turns into
```moon
fncall x, (...) ->
  return y
```
