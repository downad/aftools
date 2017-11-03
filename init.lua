--[[

Arena Fighting equipment

Copyright (c) 2017 ralf Weinert <ralf.weinert@gmx.de>
Source Code: 
License: GPLv2.1

]]--


-- ModName
local THISMOD = minetest.get_current_modname()
-- ModPath
local THISMODPATH = minetest.get_modpath(THISMOD)





-- register tools
-- load weapons
dofile(THISMODPATH.."/weapons.lua");

dofile(THISMODPATH.."/alias.lua");

-- remove item on joinplayer
dofile(THISMODPATH.."/remove_aftools.lua");


-- some print_log to print a info on the screen
function print_log(printstring)
	print("[MOD]"..THISMOD)
	print("     "..printstring)
end






-- log 
minetest.log("action", "[MOD]"..THISMOD.." -- loaded from "..THISMODPATH)
