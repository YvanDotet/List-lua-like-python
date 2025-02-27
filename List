local function onlyIndex(tab)
    for ind,value in pairs(tab) do
        if type(ind)=="number" then

        else
            tab[ind]=nil
        end
    end
    return tab
end

local function listToLuaTable(list)
    local tab={}
    for k=1,list:len() do
        tab[1+#tab]=list[k]
    end
    return tab
end

local function sortNumber(a,b)
    if type(a)=="number" and type(b)=="number" then
        return a<b
    elseif type(b)=="number" then
        return true
    else
        return false
    end
end

local List = {}

List.isList=true

local create
create=function(init)
    return setmetatable( onlyIndex(init or {}), {
    __index=List,
    __newindex=function(list,i,o)

    end,
    __add=function(a,b)
        local list = create()
        list:extend(a)
        list:extend(b)
        return list
    end,
    __mul=function(a,n)
        local list = create()
        for k=1,n do
            list=list+a
        end
        return list
    end
    })
end

function List:reverse()
    local tab=listToLuaTable(self)

    self:empty()
    for k=#tab,1,-1 do
        self:append(tab[k])
    end
end

function List:insert(i,o)
    local len=self:len()

    if i<1 then
        i=1
    elseif len<i then
        i=len+1
    end

    local after={o}
    for k=i,len do
        after[1+#after]=self[k]
        self[k]=nil
    end

    for k=1,#after do
        self:append(after[k])
    end
end

function List:have(o)
    for k=1,self:len() do
        if o==self[k] then
          return true
        end
    end
    return false
end

function List:sort(f)
    f=f or sortNumber

    local tab=listToLuaTable(self)
    table.sort( tab,f )

    self:empty()
    for k=1,#tab do
        self:append(tab[k])
    end
end

function List:append(o)
    rawset(self,1+self:len(),o)
end

function List:count(o)
    local n=0
    for k=1,self:len() do
        if o==self[k] then
            n=n+1
        end
    end
    return n
end

function List:len()
    return #self
end

function List:min(f)
    f=f or sortNumber

    local tab=listToLuaTable(self)
    table.sort(tab,f)

    if next(tab) then
        return tab[1]
    end
end

function List:max(f)
    f=f or sortNumber

    local tab=listToLuaTable(self)
    table.sort(tab,f)

    if next(tab) then
        return tab[#tab]
    end
end

function List:indexesOf(o)
    local indexes={}
    for i=1,self:len() do
        if o==self[i] then
          indexes[1+#indexes]=i
        end
    end
    return indexes
end

function List:remove(o)
    for k=1,self:len() do
        if o==self[k] then
          self:pop(k)
          break
        end
    end
end

function List:extend(list)
    for k=1,list:len() do
        self:append(list[k])
    end
end

function List:empty()
    for k=1,self:len() do
        self[k]=nil
    end
end

function List:copy()
    local list = create()
    for k=1,self:len() do
        list:append(self[k])
    end
    return list
end

function List:print()
    local str="["
    for k=1,self:len() do
        str=str..((1<k) and "," or "")..tostring(self[k])
    end
    str=str.."]"

    print(tostring(self)..": "..str)
end

function List:pop(i)
    local len=self:len()

    i=i or len
    if (0<i) and (i<(len+1)) then
        local o=self[i] 

        local after = {}
        for k=(i+1),len do
            after[1+#after]=self[k]
            self[k]=nil
        end

        self[i]=nil
        for k=1,#after do
            self:append(after[k])
        end

        return o
    end
end

return setmetatable({},{
    __index={create=create},
    __newindex=function(List,ind,value)

    end,
    __call=function(_,tab)
        return _.create(tab)
    end
})
