local function foo(...)
  local numArgs = select('#', ...)
  if numArgs == 0 then
    return 0 -- Or handle the absence of arguments appropriately
  elseif select(1, ...) == nil then
    return nil
  else
    return select(1, ...) + 1
  end
end

local b = foo(nil)
print(b)  -- Output: nil

local c = foo(10)
print(c)  -- Output: 11

local d = foo()
print(d) -- Output: 0