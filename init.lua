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
minetest.log("action", "[MOD]"..THISMOD.." -- loaded default-tools")



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



-- register armor


-- load mod weapons
dofile(THISMODPATH.."/weapons.lua");

-- load mod armor


-- load remove aftools functions
dofile(THISMODPATH.."/remove_aftools.lua");

-- init a globalstep
-- performance ?
--[[
minetest.register_globalstep(function(dtime)
	timer = timer + dtime;
	if timer >= 1 then
		timer=0
			-- loop all player
			-- check if player is in arena 
			-- if yes - ok
			-- if no ->remove aftools
			--for _, plr in pairs(privilegeareas.userdata) do
			--	privilegeareas.calculate_current_areas(plr)
					IsPlayerInArena()
			--end

	end
end)
]]--

minetest.register_on_joinplayer(function(player)
	--name of the player
	local playername = player:get_player_name() --playername)
	-- is there a File RemoveItemFile.aftools with Items to remove?
	IsThereSomethingToRemove(playername)
	
	-- if player is leaving the arena - remove the arena tools
	IsPlayerInArena(playername)
		
end)

minetest.register_on_leaveplayer(function(player)
	--name of the player
	local playername = player:get_player_name()
	IsPlayerInArena(playername)
end)









-- log that the mod is loades 
minetest.log("action", "[MOD]"..THISMOD.." -- loaded!")


