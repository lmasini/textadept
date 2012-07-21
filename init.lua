-- Copyright 2007-2012 Mitchell mitchell.att.foicica.com. See LICENSE.

package.path = table.concat({
  _USERHOME..'/?.lua',
  _USERHOME..'/modules/?.lua', _USERHOME..'/modules/?/init.lua',
  _HOME..'/modules/?.lua', _HOME..'/modules/?/init.lua',
  package.path
}, ';');

local user_init, exists = _USERHOME..'/init.lua', lfs.attributes
local ok, err = pcall(dofile, user_init)
if ok or not exists(user_init) then require 'textadept' else gui.print(err) end

if not RESETTING then args.process(arg) end
