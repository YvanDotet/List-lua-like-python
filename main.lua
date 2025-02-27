local List = require("List")

local l1=List.create()
local l2=List({"a","b","c"})

l1:print()
l2:print()

local l3=l1+l2
l3:append(5)

local l4=List.create({"new","list"})
l3:extend(l4)
l3:print()

local l5=l3:copy()
print(l5:pop(5))
print(l5:have("list"))
l5:remove("c")
print(l5:len())
