function contains(table, str)
  for _, value in ipairs(table) do
    if value == str then
      return true
    end
  end
  return false
end

return function(phrase)
  local result = {}
  local vowels = {"a", "e", "i", "o", "u"}
    
  for word in phrase:gmatch("%S+") do
    a = word:sub(1, 1)
    ab = word:sub(1, 2)
    if contains(vowels, a) or ab == "xr" or ab == "yt" then
      table.insert(result, word .. "ay")
    else
      local collected = {}
      
      for i = 1, #word do
        if word:sub(i, i + 1) == "qu" then
          table.insert(
            result,
            word:sub(i + 2, #word) .. table.concat(collected, "") .. "quay"
          )
          break
        end
        
        local chr = word:sub(i, i)

        if chr == "y" and i ~= 1 then
          table.insert(
            result,
            word:sub(i, #word) .. table.concat(collected, "") .. "ay"
          )
          break
        end

        if contains(vowels, chr) then
          table.insert(
            result,
            word:sub(i, #word) .. table.concat(collected, "") .. "ay"
          )
          break
        end
        
        table.insert(collected, chr)
      end
    end
  end

  return table.concat(result, " ")
end
