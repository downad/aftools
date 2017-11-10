--[[

Arena Fighting equipment

Copyright (c) 2017 ralf Weinert <ralf.weinert@gmx.de>
Source Code: 
License: GPLv2.1

]]--



-- Inventory Manipulation
-- Is the player joining the game?
--minetest.register_on_joinplayer(function(player)
function IsPlayerInArena(playername)
	--name of the player
	-- local playername = player:get_player_name()
	
	--some variables
	-- search in this inverory to destroy aftools 
	local searchInventory = {"main", "craft"}

	 -- create a table for removeItem
	local removeItem = {}
	local withInto = 1
	local withoutIntro = 0
	local debugThis = 1
	
	--Use a player’s name to get their inventory:
	-- local playerInventory = minetest.get_inventory({type="player", name="downad"})
	local playerInventory = minetest.get_inventory({type="player", name=playername})

	--search the aftool-equipment
	--local arenaItem = ItemStack("aftools:sword_ironwood")
	local arenaItem = ItemStack("aftools:stone_with_coal")

	if debugThis == 1 then
		-- print on terminal 
		print_log("Hello "..playername.."! - the Mod is looking for the arenafightingtools (aftools) and removing it from your inventory!", withInto)
	
		-- send player what is going on
		minetest.chat_send_player( playername, "Hello "..playername.."! - the Mod is looking for the arenafightingtools (aftools) and removing them from your inventory!");

		print_log("count arenaItem in stack: "..arenaItem:get_count(),withoutIntro)
	end


	
	--	loop for the different inventories (main and craft).
	for invertoryPlace = 1, 2, 1 do
		--loop playerInventory "main" to show item in the inventory
		--for i = 1, playerInventory:get_size("main") , 1 do
		for i = 1, playerInventory:get_size(searchInventory[invertoryPlace]) , 1 do
			--local StackItem = playerInventory:get_stack("main", i):get_name()
			local StackItem = playerInventory:get_stack(searchInventory[invertoryPlace], i):get_name()
			--print_log("Inventory["..i.."] "..StackItem:get_name())
			print_log("Inventory["..i.."] "..StackItem,withoutIntro)
				
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
	
-- end minetest.register_on_joinplayer(function(player)
--end)

-- end function
end
	




