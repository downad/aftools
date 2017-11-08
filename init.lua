--[[

Arena Fighting equipment
	register some wapons an armor for the fight in an arena
	if plyer is leaving the arena the mod will remove the toos / armor of the player inventory
	
Copyright (c) 2017 
	ralf Weinert <downad@freenet.de>
Source Code: 	
	https://github.com/downad/aftools
License: GPLv2.1

]]--


-- ModName
local THISMOD = minetest.get_current_modname()
-- ModPath
local THISMODPATH = minetest.get_modpath(THISMOD)

-- some print_log to print a info on the screen
function print_log(printstring, withIntro)
	if withIntro > 0 then
		print("[MOD]"..THISMOD)
		print("Hello     >"..withIntro.."<")
	end
	print("     "..printstring)
	print("Hello     >"..withIntro.."<")
end


-- are these mods present?
--local mod_mulch = minetest.get_modpath("mymulch")

-- if yes - dofile
--[[
if mod_moreblocks then
	dofile(minetest.get_modpath("mymeshnodes").."/moreblocks.lua")
	
end
]]--

-- register tools
dofile(THISMODPATH.."/default_tools.lua");



-- load weapons
dofile(THISMODPATH.."/weapons.lua");

dofile(THISMODPATH.."/alias.lua");

-- remove item on joinplayer
dofile(THISMODPATH.."/remove_aftools.lua");




-- log 
minetest.log("action", "[MOD]"..THISMOD.." -- loaded from "..THISMODPATH)
