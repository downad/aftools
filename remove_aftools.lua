--[[

Arena Fighting equipment

Copyright (c) 2017 ralf Weinert <ralf.weinert@gmx.de>
Source Code: 
License: GPLv2.1

]]--

-- search in this inverory to destroy aftools 
local searchInventory = {"main", "craft"}

local removeItem = {} -- lege eine Tabelle removeItem an


-- Inventory Manipulation
-- Is the player joining the game?
minetest.register_on_joinplayer(function(player)
	--name of the player
	local playername = player:get_player_name()
	print_log("Hello "..playername.."! - the Mod is looking for the arenafightingtools (aftools) and removing it from your inventory!")
	
	-- send player what is going on
	minetest.chat_send_player( playername, "Hello "..playername.."! - the Mod is looking for the arenafightingtools (aftools) and removing them from your inventory!");
	
	--Use a player’s name to get their inventory:
	-- local playerInventory = minetest.get_inventory({type="player", name="downad"})
	local playerInventory = minetest.get_inventory({type="player", name=playername})

	--search the aftool-equipment
	--local arenaItem = ItemStack("aftools:sword_ironwood")
	local arenaItem = ItemStack("aftools:stone_with_coal")
	print_log("count arenaItem in stack: "..arenaItem:get_count())
	
	--loop playerInventory to show item in the inventory
	local lists = playerInventory:get_lists("main")
	for i = 1, playerInventory:get_size("main") , 1 do
		local StackItem = playerInventory:get_stack("main", i):get_name()
		--print_log("Inventory["..i.."] "..StackItem:get_name())
		print_log("Inventory["..i.."] "..StackItem)
		
		-- is this a aftools item?
		if not nil string.find(StackItem, "aftools:" then
			-- fill the table with the name of aftools that must be removed
			table.insert(removeItem, StackItem)
		end

	end
	
	--get Inventory as list
	--You can convert an inventory to a Lua table:
	--local lists = playerInventory:get_lists()
	
	--check if list is empty
	--You can use list_is_empty to check if a list is empty:
	--if playerInventory:is_empty("main") then
	--	  print_log("The list is empty!")
	--end
	
	--	is the arenaItem in playerInventory?
	--	loop for the different inventories (main and craft).
	for i = 1, 2, 1 do
	
		-- counter
		local countArenaItems = 0
		-- ptint_log
		print_log("searching ArenaItem in "..searchInventory[i])
		
		--	do this as often as the arenaItem is in Inventory
		while playerInventory:contains_item(searchInventory[i], arenaItem) do
		
			print_log("ArenaItem "..arenaItem:get_name().."is in the inventory!")
			
			--take aftools - equipment
			-- local taken = playerInventory:remove_item(searchInventory[i], arenaItem)
			playerInventory:remove_item(searchInventory[i], arenaItem) -- geht das auch?
			countArenaItems = countArenaItems + 1
			print_log("Took " .. countArenaItems .. " "..arenaItem:get_name())

		end
	end
		
end)
	











-- log 
minetest.log("action", "[MOD]"..minetest.get_current_modname().." -- loaded from "..minetest.get_modpath(minetest.get_current_modname()))
