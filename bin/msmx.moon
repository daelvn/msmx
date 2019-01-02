import Macro, expand from require "../lbuilder/macro"

MacroLoadFile = require "../msmx/loadfile"

code_forsign  = [[f <=< "test.txt"]]

x1 = ((expand MacroLoadFile) {}) code_forsign

print x1