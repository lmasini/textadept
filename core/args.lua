-- Copyright 2007-2011 Mitchell mitchell<att>caladbolg.net. See LICENSE.

--- Processes command line arguments for Textadept.
module('args', package.seeall)

-- Markdown:
-- ## Arg Events
--
-- + `'arg_none'`: Called when no command line arguments are passed to Textadept
--   on init.

local arg = arg

-- Contains registered command line switches.
-- @class table
-- @name switches
local switches = {}

---
-- Registers a command line switch.
-- @param switch1 String switch (short version).
-- @param switch2 String switch (long version).
-- @param narg The number of expected parameters for the switch.
-- @param f The Lua function to run when the switch is tripped.
-- @param description Description of the switch.
function register(switch1, switch2, narg, f, description)
  local t = { f, narg, description }
  switches[switch1], switches[switch2] = t, t
end

---
-- Processes command line arguments.
-- Add command line switches with args.register(). Any unrecognized arguments
-- are treated as filepaths and opened.
-- Generates an 'arg_none' event when no args are present.
-- @see register
function process()
  local no_args = true
  local i = 1
  while i <= #arg do
    local switch = switches[arg[i]]
    if switch then
      local f, n = unpack(switch)
      local args = {}
      for j = i + 1, i + n do args[#args + 1] = arg[j] end
      f(unpack(args))
      i = i + n
    else
      io.open_file(arg[i])
      no_args = false
    end
    i = i + 1
  end
  if no_args then events.emit('arg_none') end
end

-- Shows all registered command line switches in a help dialog.
local function show_help()
  print('Usage: textadept [args] [filenames]')
  local line = "  %s [%d args]: %s"
  for k, v in pairs(switches) do print(line:format(k, unpack(v, 2))) end
  os.exit()
end
register('-h', '--help', 0, show_help, 'Displays this')

-- For Windows, create arg table from single command line string (arg[0]).
if WIN32 and #arg[0] > 0 then
  local P, C = lpeg.P, lpeg.C
  local param = P('"') * C((1 - P('"'))^0) * '"' + C((1 - P(' '))^1)
  local params = lpeg.match(lpeg.Ct(param * (P(' ')^1 * param)^0), arg[0])
  for i = 1, #params do arg[#arg + 1] = params[i] end
end

-- Set _G._USERHOME.
local userhome = os.getenv(not WIN32 and 'HOME' or 'USERPROFILE')..'/.textadept'
for i = 1, #arg do
  if (arg[i] == '-u' or arg[i] == '--userhome') and arg[i + 1] then
    userhome = arg[i + 1]
    break
  end
end
if not lfs.attributes(userhome) then lfs.mkdir(userhome) end
if not lfs.attributes(userhome..'/init.lua') then
  local f = io.open(userhome..'/init.lua', 'w')
  if f then
    f:write("require 'textadept'\n")
    f:close()
  end
end
_G._USERHOME = userhome

register('-u', '--userhome', 1, function() end, 'Sets alternate _USERHOME')
