--[[

Arena Fighting equipment

Copyright (c) 2017 ralf Weinert <ralf.weinert@gmx.de>
Source Code: 
License: GPLv2.1

]]--

-- Inventory Manipulation
function removeArenaItemsFromPlayer(playername)
		minetest.chat_send_player( playername, "Now I am in the function removeArenaItemsFromPlayer ");

	--some variables
	-- search in this inverory to destroy aftools 
	local searchInventory = {"main", "craft"}

	 -- create a table for removeItem
	local removeItem = {}
	local InventoryItem = {}
	local withInto = 1
	local withoutIntro = 0
	
	-- print more Informations
	local debugThis = 1 -- 1 = yes
	
	--Use a player’s name to get their inventory:
	local playerInventory = minetest.get_inventory({type="player", name=playername})

	--search the aftool-equipment
	--local arenaItem = ItemStack("aftools:sword_ironwood")
	--local arenaItem = ItemStack("aftools:stone_with_coal")

	if debugThis == 1 then
		-- print on terminal 
		print_log("Hello "..playername.."! - the Mod is looking for the arenafightingtools (aftools) and removing it from your inventory!", withInto)
	
		-- send player what is going on
		minetest.chat_send_player( playername, "Hello "..playername.."! - the Mod is looking for the arenafightingtools (aftools) and removing them from your inventory!");

		--print_log("count arenaItem in stack: "..arenaItem:get_count(),withoutIntro)
	end
	
--[[
	if not minetest.global_exists("unified_inventory") then
		minetest.log("warning", S("3d_armor_ui: Mod loaded but unused."))
		return
	end
]]--
	
	--	loop for the different inventories (main and craft).
	for invertoryPlace = 1, 2, 1 do
		--loop playerInventory "main" to show item in the inventory
		--for i = 1, playerInventory:get_size("main") , 1 do
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
	
		-- print the aftool: - table
		print_log("Removed playeritems with tag <aftools:> ",withoutIntro)
		for ii, ItemName in ipairs(removeItem) do
			print_log("["..ii.."] - "..ItemName,withoutIntro)
		end
	end	
	
	-- Armor inventory
	local inv =  minetest.get_inventory({type="detached"})
	print ("vor der Loop")
	for i,v in ipairs(inv) do
		print("inv"..i,v) 
	end
	
	--[[
	local armorInventory = minetest.get_inventory({type="detached", name="armor"})
	for i = 1, armorInventory:get_size(searchInventory[invertoryPlace]) , 1 do
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
	
	]]--
	-- save this to an file
	tablesave(playername, InventoryItem)

end
	
-- the Globalstep calls this function
-- if the player is in the Arena everysthing is ok
-- if the player is out of the Arena remove all ArenaItems
function IsPlayerInTheArena(player) --name, playerCoordiantes)
	
	local playername = player:get_player_name()

	-- prüfe auf adminPlayerName
	if playername == minetest.setting_get("name") then
		minetest.chat_send_player( playername, "Hello "..playername.."! - adminPlayer!")
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
			minetest.chat_send_player( playername, "Hello  You, hello "..playername.."! - you are in the Arena! ".. playerCoordiantes);
			inArena = true
		end
		--minetest.chat_send_player( playername, "Hello "..playername.."! - inArena =  "..inArena);

	end
	
	if inArena == false then
		minetest.chat_send_player( playername, "Hello "..playername.."! - This is not the Arena! ");
		removeArenaItemsFromPlayer(playername)
	end
	

end



