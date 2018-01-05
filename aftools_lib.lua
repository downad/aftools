--[[

Arena Fighting equipment

Copyright (c) 2017 ralf Weinert <ralf.weinert@gmx.de>
Source Code: 
License: GPLv2.1

]]--

-- some function for the aftools


-- save  a table to file
function tablesave(fileName, ItemTable)
   local file = io.open(minetest.get_worldpath().."/players/"..fileName, "w")
   if file then
			for ii, ItemName in ipairs(ItemTable) do
				-- file:write(minetest.serialize(ItemName))
				file:write("["..ii.."] - "..ItemName.." \n ")
			end
      
      file:close()
   end
end


-- load remove item file
function loadRemoveItemFile()
   local file = io.open(minetest.get_worldpath().."/RemoveItemFile.aftools", "r")
   local returnTable = {}
   if file then
      local tableItem = file -- minetest.deserialize(file:read()) --"*all"))
      --if tableItem then
	    --  table.insert(table, tableItem)
	    --end
			repeat
				local tableItem = file:read("*line")
				if tableItem == nil then
					break
				end
				if string.len(tableItem) > 1 then
					table.insert(returnTable, tableItem)
				end
			until file:read(0) == nil
			io.close(file)
   end
   return returnTable -- {}
end

function IsThereSomethingToRemove(playername)
  local ItemTable = {}
	ItemTable = loadRemoveItemFile()
  local withIntro = 1
  local withoutIntro = 0
  print_log("List of Items in File",withIntro)
	-- print ItemTable on Screen
	for ii, ItemName in ipairs(ItemTable) do
		print_log("["..ii.."] - "..ItemName,withoutIntro)
	end
end



