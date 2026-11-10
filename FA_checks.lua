-- FunctionalAnalysis
-- FA_checks.lua: source checks run by LuaLaTeX while FA_DM.tex is built; see FA_DM.tex.
--
-- encoding: UTF-8
-- EOL: LF

local FA_checks = {}

local list_envs = { enumerate = true, itemize = true, description = true }

-- Removes the comment of a line: from the first % that is not escaped as \%.
local function strip_comment(line)
  local i = 1
  while true do
    local p = line:find("%", i, true)
    if not p then return line end
    local backslashes = 0
    local q = p - 1
    while q >= 1 and line:sub(q, q) == "\\" do
      backslashes = backslashes + 1
      q = q - 1
    end
    if backslashes % 2 == 0 then return line:sub(1, p - 1) end
    i = p + 1
  end
end

-- Returns the text between the [ at position open and its matching ], or nil.
local function bracket_group(text, open)
  local depth = 0
  for k = open + 1, #text do
    local c = text:sub(k, k)
    if c == "{" then
      depth = depth + 1
    elseif c == "}" then
      depth = depth - 1
    elseif c == "]" and depth == 0 then
      return text:sub(open + 1, k - 1)
    end
  end
  return nil
end

-- True if the options of a list use enumitem syntax: a label key, or a starred counter such as \alph*.
local function is_enumitem(options)
  local padded = "," .. options
  return padded:find("[,%s{]label%s*=") ~= nil or options:find("\\%a+%*") ~= nil
end

-- Returns the body of the list environment env whose options end at position after, up to its matching \end{env}.
local function list_body(text, env, after)
  local depth = 1
  local pos = after + 1
  local open_tag, close_tag = "\\begin{" .. env .. "}", "\\end{" .. env .. "}"
  while true do
    local b = text:find(open_tag, pos, true)
    local e = text:find(close_tag, pos, true)
    if not e then return text:sub(after + 1) end
    if b and b < e then
      depth = depth + 1
      pos = b + #open_tag
    else
      depth = depth - 1
      if depth == 0 then return text:sub(after + 1, e - 1) end
      pos = e + #close_tag
    end
  end
end

-- Removes displayed math environments, whose \label names an equation, not a list item.
local function strip_math(body)
  for _, env in ipairs({ "equation", "align", "alignat", "gather", "multline", "flalign" }) do
    for _, star in ipairs({ "", "%*" }) do
      local name = env .. star
      body = body:gsub("\\begin{" .. name .. "}.-\\end{" .. name .. "}", "")
    end
  end
  return body
end

-- A \label on an item refers to \theenumi, which item-label=... does not change. A list whose item-label uses a
-- non-arabic counter and holds an item \label must set \theenumi to the same counter format.
local function check_item_ref(path, line, env, options, body)
  local format = options:match("item%-label%s*=.-\\(%a+){enumi}")
  if env ~= "enumerate" or not format or format == "arabic" then return end
  if not strip_math(body):find("\\label", 1, true) then return end
  if body:find("\\renewcommand%s*{?\\theenumi}?%s*{\\" .. format .. "{enumi}}") then return end
  tex.error("FA_DM Error: \\label on a list item at " .. path .. ":" .. line .. " refers to an arabic number", {
    "item-label=... sets the printed label only; \\ref and \\eqref use \\theenumi. Add, before the first \\item:",
    "\\renewcommand{\\theenumi}{\\" .. format .. "{enumi}}%",
  })
end

-- Lists must take the kernel key item-label=..., since enumitem is not loaded; see FA_DM.tex.
function FA_checks.lists(path)
  if not path:match("%.tex$") then return end
  local file = io.open(path, "r")
  if not file then return end
  local lines = {}
  for line in file:lines() do lines[#lines + 1] = strip_comment(line) end
  file:close()
  local text = table.concat(lines, "\n")
  local start = 1
  while true do
    local b, e, env = text:find("\\begin{(%a+)}%[", start)
    if not b then return end
    start = e + 1
    if list_envs[env] then
      local options = bracket_group(text, e)
      local _, newlines = text:sub(1, b):gsub("\n", "")
      if options and not is_enumitem(options) then
        check_item_ref(path, newlines + 1, env, options, list_body(text, env, e + #options + 1))
      end
      if options and is_enumitem(options) then
        tex.error("FA_DM Error: enumitem syntax at " .. path .. ":" .. (newlines + 1)
          .. ": \\begin{" .. env .. "}[" .. options .. "]", {
            "enumitem is not loaded (see FA_DM.tex). Write item-label=... with an",
            "explicit counter, e.g. [item-label=(\\alph{enumi})] or [item-label=(\\roman{enumi})].",
          })
      end
    end
  end
end

return FA_checks
