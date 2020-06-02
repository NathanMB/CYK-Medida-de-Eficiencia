local CYK = require "CYK"

local l = CYK:new()

l:newRule("S", "XB")
l:newRule("S", "AB")
l:newRule("X", "AS")
l:newRule("A", "a")
l:newRule("B", "b")

print(l:parse("aaabbb"))