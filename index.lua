local seed = os.time() * math.random(100)
math.randomseed(seed)

local file_name = "main.lua"

local lines = {}
for line in io.lines(file_name) do table.insert(lines, line) end

local file_data = "q={" .. tostring(seed) .. ",{"

for line_id = 1, #lines do
  local line = lines[line_id] .. "\n"

  for char_id = 1, #line do
    local char = line:sub(char_id, char_id)

    local f = tostring(math.random(100))
    local z = tostring(math.random(50))

    local temp = tostring(f) .. string.byte(char) .. tostring(z)
    file_data = file_data .. "'" .. temp .. "',"
  end
end

file_data = file_data .. "}}l={[-3]=string.char,[-2]=string.len,[-1]=string.sub,[0]=tonumber,[1]=table.concat,[2]=load,[3]=string.dump,[4]=math.random,[5]=math.randomseed,[6]=tostring,[7]=assert,[8]=loadstring,[9]=print,[10]=function(j)l[5](q[1])ga=''for n,s in pairs(j) do local f=l[6](l[4](100))local z=l[6](l[4](50))ga=ga..l[-3](l[0](l[-1](s,l[-2](f)+1,l[-2](s)-l[-2](z))))end;l[2](ga)()end}l[10](q[2])"

local file = io.open(file_name, "w+")
file:write(file_data)
file:close()