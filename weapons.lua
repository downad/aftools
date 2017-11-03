--
-- Swords
--

-- ironwood
minetest.register_tool("aftools:sword_ironwood", {
	description = "Ironwooden Sword",
	inventory_image = "aftools_woodsword.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	groups = {flammable = 2},
	sound = {breaks = "default_tool_breaks"},
})




