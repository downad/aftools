--[[

Arena Fighting equipment

Copyright (c) 2017 ralf Weinert <ralf.weinert@gmx.de>
Source Code: 
License: GPLv2.1

]]--

-- Inventory Manipulation
function removeArenaItemsFromPlayer(player, saveInvDataToFile)

	--some variables
	local playername = player:get_player_name()

	-- search in this inverory to destroy aftools 
	local searchInventory = {"main", "craft", "armor"}

	 -- create a table for removeItem
	local removeItem = {}
	local InventoryItem = {}
	local withInto = 1
	local withoutIntro = 0
	
	-- print more Informations
	local debugThis = 0 -- 1 = yes
	
	--Use playername to get his inventory:
	local playerInventory = minetest.get_inventory({type="player", name=playername})

	-- print more Informations
	if debugThis == 1 then
		-- print on terminal 
		print_log("Hello "..playername.."! - the Mod is looking for the arenafightingtools (aftools) and removing it from your inventory!", withInto)
		-- send player what is going on
		minetest.chat_send_player( playername, "Hello "..playername.."! - the Mod is looking for the arenafightingtools (aftools) and removing them from your inventory!");
	end
	

	--	loop for the different inventories (main, craft ! armor is in an second loop ).
	for invertoryPlace = 1, 2, 1 do
		--loop playerInventory "main, craft, armor" to show item in the inventory
		for i = 1, playerInventory:get_size(searchInventory[invertoryPlace]) , 1 do
			--local StackItem = playerInventory:get_stack("main", i):get_name()
			local StackItem = playerInventory:get_stack(searchInventory[invertoryPlace], i):get_name()
			local StackItemCount = playerInventory:get_stack(searchInventory[invertoryPlace], i):get_count()
			
			--print_log("Inventory["..i.."] "..StackItem:get_name())
			print_log("Inventory["..i.."] "..StackItem,withoutIntro)
				
			-- add to the InventoryList	
			table.insert(	InventoryItem, StackItem.." [ "..StackItemCount.." ] ")
			
			-- is this a aftools item?
			if string.find(StackItem, "aftools:") then
				-- fill the table with the name of aftools that must be removed
				table.insert(removeItem, StackItem)
				--remove this aftools:
				playerInventory:remove_item(searchInventory[invertoryPlace], StackItem) 
			end
		end
		
		-- loop armor
		local inv = player:get_inventory()
		for i = 1, 6 do
			 local stack = inv:get_stack("armor", i)
			 if stack and string.find(stack:get_name(), "aftools:") then
				  armor:set_inventory_stack(player, i, nil)
			 end
		end
		-- set restarmor
		armor:set_player_armor(player)
	
	
		-- print the aftool: - table
		print_log("Removed playeritems with tag <aftools:> ",withoutIntro)
		for ii, ItemName in ipairs(removeItem) do
			print_log("["..ii.."] - "..ItemName,withoutIntro)
		end
	end	
	
	if saveInvDataToFile then
		local saveFile = "inv_"..playername
		-- save this to an file
		--tablesave(playername, InventoryItem)
		tablesave(saveFile, InventoryItem)
	end

end
	
-- the Globalstep calls this function
-- if the player is in the Arena everysthing is ok
-- if the player is out of the Arena remove all ArenaItems
function IsPlayerInTheArena(player, saveInvDataToFile) --name, playerCoordiantes)
	
	local playername = player:get_player_name()

	-- prüfe auf adminPlayerName
	if playername == minetest.setting_get("name") then
		--minetest.chat_send_player( playername, "Hello "..playername.."! - adminPlayer!")
		return
	end
	
	local playerCoordiantes = minetest.pos_to_string(player:getpos())
	-- hole die PVP Store Data
	local pvp_areas_store = AreaStore()
	pvp_areas_store:from_file(minetest.get_worldpath() .. "/pvp_areas_store.dat")
	
	local inArena = false
	
	for k, v in pairs(pvp_areas_store:get_areas_for_pos(player:getpos())) do
		inArena = false
		if k then
			--minetest.chat_send_player( playername, "Hello  You, hello "..playername.."! - you are in the Arena! ".. playerCoordiantes);
			inArena = true
		end
		--minetest.chat_send_player( playername, "Hello "..playername.."! - inArena =  "..inArena);

	end
	
	if inArena == false then
		--minetest.chat_send_player( playername, "Hello "..playername.."! - This is not the Arena! ");
		--[[
		for i = 1, 6 do
  		armor:set_inventory_stack(player, i, nil)
		end
		armor:set_player_armor(player)
    ]]--
		removeArenaItemsFromPlayer(player, saveInvDataToFile)
	end
	

end



