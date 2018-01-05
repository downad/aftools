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


-- function print_log to print a info on the screen
function print_log(printstring, withIntro)
	if withIntro > 0 then
		print("[MOD]"..THISMOD)
	end
	print("     "..printstring)
end

-- load the aftools lib
dofile(THISMODPATH.."/aftools_lib.lua");
minetest.log("action", "[MOD]"..THISMOD.." -- loaded aftools_lib")



-- register tools
dofile(THISMODPATH.."/default_tools.lua");
minetest.log("action", "[MOD]"..THISMOD.." -- loaded default-tools")

-- are these mods present?
local mod_3d_armor = minetest.get_modpath("3d_armor")
-- if yes - dofile
if mod_3d_armor then
	dofile(THISMODPATH.."/3d_armor.lua");
	minetest.log("action", "[MOD]"..THISMOD.." -- loaded 3d-Armor")
end
local mod_pvp_areas = minetest.get_modpath("pvp_areas")
-- if yes - dofile
if mod_pvp_areas then
	-- dofile(THISMODPATH.."/3d_armor.lua");
	minetest.log("action", "[MOD]"..THISMOD.." -- pvp-areas is present")
end


-- register armor


-- load mod weapons
dofile(THISMODPATH.."/weapons.lua");

-- load mod armor


-- load remove aftools functions
dofile(THISMODPATH.."/remove_aftools.lua");



-- Globalstep - test if player is in an pvp-Area
-- use AreaStore of pvp_area 
-- every 5 seconds
local timer = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime;
	if timer >= 5 then
			for _, player in ipairs(minetest.get_connected_players()) do
    		if mod_pvp_areas then
    			IsPlayerInTheArena(player, false) 
    		end	
  		end
		timer = 0
	end
end)
--[[
minetest.register_globalstep(function(dtime)
			for _, player in ipairs(minetest.get_connected_players()) do
    		if mod_pvp_areas then
    			IsPlayerInTheArena(player, false) 
    		end	
  		end
end)
]]--


-- remove arenaTools on join
minetest.register_on_joinplayer(function(player)
	IsPlayerInTheArena(player, true) 
end)

-- remove arenaTools on join
minetest.register_on_leaveplayer(function(player)
	IsPlayerInTheArena(player, true) 
end)

-- log that the mod is loades 
minetest.log("action", "[MOD]"..THISMOD.." -- loaded!")


