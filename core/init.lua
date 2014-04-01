-- Copyright 2007-2014 Mitchell mitchell.att.foicica.com. See LICENSE.

_RELEASE = "Textadept 7.2 beta 3"

package.path = _HOME..'/core/?.lua;'..package.path

_SCINTILLA = require('iface')
events = require('events')
args = require('args')
_L = require('locale')
require('file_io')
require('lfs_ext')
require('ui')
keys = require('keys')

_M = {} -- language modules table
-- LuaJIT compatibility.
if jit then module, package.searchers, bit32 = nil, package.loaders, bit end
-- curses compatibility.
if CURSES then
  function spawn(argv, working_dir, stdout_cb, stderr_cb, exit_cb)
    local current_dir = lfs.currentdir()
    lfs.chdir(working_dir)
    local p = io.popen(argv..' 2>&1')
    stdout_cb(p:read('*all'))
    exit_cb(select(3, p:close()))
    lfs.chdir(current_dir)
  end
end

--[[ This comment is for LuaDoc.
---
-- Extends Lua's _G table to provide extra functions and fields for Textadept.
-- @field _HOME (string)
--   The path to Textadept's home, or installation, directory.
-- @field _RELEASE (string)
--   The Textadept release version string.
-- @field _USERHOME (string)
--   The path to the user's *~/.textadept/* directory, where all preferences and
--   user-data is stored.
--   On Windows machines *~/* is the value of the "USERHOME" environment
--   variable (typically *C:\Users\username\\* or
--   *C:\Documents and Settings\username\\*). On Linux, BSD, and Mac OSX
--   machines *~/* is the value of "$HOME" (typically */home/username/* and
--   */Users/username/* respectively).
-- @field _CHARSET (string)
--   The filesystem's character encoding.
--   This is used when [working with files](io.html).
-- @field WIN32 (bool)
--   Whether or not Textadept is running on Windows.
-- @field OSX (bool)
--   Whether or not Textadept is running on Mac OSX.
-- @field CURSES (bool)
--   Whether or not Textadept is running in the terminal.
--   Curses feature incompatibilities are listed in the [Appendix][].
--
--   [Appendix]: ../14_Appendix.html#Curses.Compatibility
module('_G')]]

--[[ The tables below were defined in C.

---
-- Table of command line parameters passed to Textadept.
-- @class table
-- @see _G.args
-- @name arg
local arg

---
-- Table of all open buffers in Textadept.
-- Numeric keys have buffer values and buffer keys have their associated numeric
-- keys.
-- @class table
-- @usage _BUFFERS[n]      --> buffer at index n
-- @usage _BUFFERS[buffer] --> index of buffer in _BUFFERS
-- @see _G.buffer
-- @name _BUFFERS
local _BUFFERS

---
-- Table of all views in Textadept.
-- Numeric keys have view values and view keys have their associated numeric
-- keys.
-- @class table
-- @usage _VIEWS[n]    --> view at index n
-- @usage _VIEWS[view] --> index of view in _VIEWS
-- @see _G.view
-- @name _VIEWS
local _VIEWS

---
-- The current [buffer](buffer.html) in the current [view](#view).
-- @class table
-- @name buffer
local buffer

---
-- The current [view](view.html).
-- @class table
-- @name view
local view

-- The functions below are Lua C functions.

---
-- Emits a `QUIT` event, and unless any handler returns `false`, quits
-- Textadept.
-- @see events.QUIT
-- @class function
-- @name quit
local quit

---
-- Resets the Lua state by reloading all initialization scripts.
-- Language modules for opened files are NOT reloaded. Re-opening the files that
-- use them will reload those modules instead.
-- This function is useful for modifying user scripts (such as
-- *~/.textadept/init.lua* and *~/.textadept/modules/textadept/keys.lua*) on
-- the fly without having to restart Textadept. `arg` is set to `nil` when
-- reinitializing the Lua State. Any scripts that need to differentiate between
-- startup and reset can test `arg`.
-- @class function
-- @name reset
local reset

---
-- Calls function *f* with the given arguments after *interval* seconds.
-- If *f* returns `true`, calls *f* repeatedly every *interval* seconds as long
-- as *f* returns `true`. A `nil` or `false` return value stops repetition.
-- @param interval The interval in seconds to call *f* after.
-- @param f The function to call.
-- @param ... Additional arguments to pass to *f*.
-- @class function
-- @name timeout
local timeout

-- The function below comes from the lspawn module.

---
-- Spawns an interactive child process *argv* in a separate thread.
-- The terminal version spawns processes in the same thread.
-- @param argv A command line string containing the program's name followed by
--   arguments to pass to it. `PATH` is searched for program names.
-- @param working_dir The child's current working directory (cwd) or `nil` to
--   inherit the parent's.
-- @param stdout_cb A Lua function that accepts a string parameter for a block
--   of standard output read from the child. Stdout is read asynchronously in
--   1KB or 0.5KB blocks (depending on the platform), or however much data is
--   available at the time.
--   The terminal version sends all output, whether it be stdout or stderr, to
--   this callback after the process finishes.
-- @param stderr_cb A Lua function that accepts a string parameter for a block
--   of standard error read from the child. Stderr is read asynchronously in 1KB
--   or 0.5kB blocks (depending on the platform), or however much data is
--   available at the time.
-- @param exit_cb A Lua function that is called when the child process finishes.
--   The child's exit status is passed.
-- @return proc
-- @usage spawn('lua buffer.filename', nil, print)
-- @usage proc = spawn('lua -e "print(io.read())", nil, print)
--        proc:write('foo\\n')
-- @see _G.proc
-- @class function
-- @name spawn
local spawn
]]
