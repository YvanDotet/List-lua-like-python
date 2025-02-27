local List = require("List")

local l1=List.create()
local l2=List({"a","b","c"})

l1:print() --table: 0D575108: []
l2:print() --table: 0D575180: [a,b,c]

local l3=l1+l2
l3:append(5)

local l4=List.create({"new","list"})
l3:extend(l4)
l3:print() --table: 0D575310: [a,b,c,5,new,list]

local l5=l3:copy()
print(l5:pop(5)) --new
print(l5:have("list")) --true
l5:remove("c")
print(l5:len()) --4
