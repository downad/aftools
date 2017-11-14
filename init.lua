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
	end
	print("     "..printstring)
end

-- save table to file
function tablesave(playername, ItemTable)
   local file = io.open(minetest.get_worldpath().."/"..playername, "w")
   if file then
			for ii, ItemName in ipairs(ItemTable) do
				-- file:write(minetest.serialize(ItemName))
				file:write("["..ii.."] - "..ItemName.." \n ")
			end
      
      file:close()
   end
end


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


-- load removeaft_ools functions
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
	local playername = player:get_player_name(playername)
	IsPlayerInArena(playername)
end)

minetest.register_on_leaveplayer(function(player)
	--name of the player
	local playername = player:get_player_name()
	IsPlayerInArena(playername)
end)









-- log that the mod is loades 
minetest.log("action", "[MOD]"..THISMOD.." -- loaded!")


