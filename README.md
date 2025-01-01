# Lua Function with Implicit Nil Check Unexpected Behavior

This repository demonstrates an uncommon error in Lua related to implicit nil checks within functions and the behavior when a function is called without explicit arguments.

## Problem

A Lua function with an implicit nil check, such as:

```lua
local function foo(a)
  if a == nil then return nil end
  return a + 1
end
```

Behaves unexpectedly when the function is called without arguments (e.g., `foo()`).

## Solution

Instead of relying on implicit nil checks, explicitly handle the case where no arguments are passed. This often involves checking the number of arguments using the `select` function:

```lua
local function foo(...)
  local numArgs = select('#', ...)
  if numArgs == 0 then
    return 0  -- Or handle the case appropriately
  elseif select(1, ...) == nil then
    return nil
  else
    return select(1, ...) + 1
  end
end
```

This solution explicitly checks the number of arguments and then performs the appropriate nil check or returns a default value in the case of no arguments.