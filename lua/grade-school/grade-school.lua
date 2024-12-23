local School = {}
School.__index = School

function School:new()
  local instance = setmetatable({}, School)
  return instance
end

function School:add(name, grade)
  if self[grade] == nil then
    self[grade] = {}
  end

  table.insert(self[grade], name)
  table.sort(self[grade])
end

function School:grade(grade)
  return self[grade] or {}
end

function School:roster()
  return self
end

return School
