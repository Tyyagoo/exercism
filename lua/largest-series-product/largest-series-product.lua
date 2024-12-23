return function(config)
  local digits, span = config.digits, config.span
  assert(span >= 1 and span <= #digits and #digits > 0)

  local currentMax = -1
  for i = 1, #digits - span + 1 do
    local mul = 1
    for j = i, i + span - 1 do
      mul = mul * tonumber(digits:sub(j, j))
    end
    currentMax = math.max(currentMax, mul)
  end

  return currentMax
end
