local string_value = "some value"
global_string_value = string_value .. " | it`s global"

local num = 4126.356
num2 = num ^ 2

for i = 0, 5 do
   num2 = num2 - num
end

print(global_string_value, "\n", num2)