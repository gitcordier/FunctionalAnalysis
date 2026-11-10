-- FunctionalAnalysis
-- FA_mathstyle.lua: math-style=TeX inside the exerciseStatement environment, without reloading the math font; see FA_DM.tex.
--
-- encoding: UTF-8
-- EOL: LF
--
-- The book uses math-style=upright. math-style=TeX differs only by the mathcodes of letters (Latin, Greek, \partial, ...),
-- which unicode-math sets when the math font is loaded. Reloading the font in each statement costs seconds, and the cost
-- grows with the number of reloads. So the font is reloaded once, inside a group: record() is called before the reload,
-- diff() after it (still inside the group), and apply() sets the recorded mathcodes, locally, in each statement.

local FA_mathstyle = {}

-- The math alphanumeric symbols end at U+1D7FF.
local last = 0x1FFFF

local before = nil
local changed = {}

function FA_mathstyle.record()
  before = {}
  for c = 0, last do
    before[c] = tex.getmathcode(c)
  end
end

function FA_mathstyle.diff()
  changed = {}
  for c = 0, last do
    local a, b = before[c], tex.getmathcode(c)
    if a[1] ~= b[1] or a[2] ~= b[2] or a[3] ~= b[3] then
      changed[c] = b
    end
  end
  before = nil
  local n = 0
  for _ in pairs(changed) do n = n + 1 end
  if n == 0 then
    tex.error("FA_DM Error: math-style=TeX changed no mathcode; exerciseStatement would typeset in math-style=upright")
  end
end

-- Local assignments: they end with the group of the environment.
function FA_mathstyle.apply()
  for c, v in pairs(changed) do
    tex.setmathcode(c, v)
  end
end

return FA_mathstyle
