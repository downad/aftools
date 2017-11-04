--
-- Armor
--

minetest.register_tool("aftools:helmet_coralie", {
	description = "Muskegirls Helm",
	inventory_image = "coralie_helm.png",
	groups = {armor_head=1, armor_heal=0, armor_use=2000, flammable=1},
	armor_groups = {fleshy=5},
	damage_groups = {cracky=3, snappy=2, choppy=3, crumbly=2, level=1},
})

minetest.register_tool("aftools:chestplate_coralie", {
	description = "Muskegirls Shirt",
	inventory_image = "coralie_shirt.png",
	groups = {armor_torso=1, armor_heal=0, armor_use=2000, flammable=1},
	armor_groups = {fleshy=10},
	damage_groups = {cracky=3, snappy=2, choppy=3, crumbly=2, level=1},
})
minetest.register_tool("aftools:leggings_coralie", {
	description = "Muskegirls Rock",
	inventory_image = "coralie_rock.png",
	groups = {armor_legs=1, armor_heal=0, armor_use=2000, flammable=1},
	armor_groups = {fleshy=10},
	damage_groups = {cracky=3, snappy=2, choppy=3, crumbly=2, level=1},
})
minetest.register_tool("aftools:boots_muskegirl", {
	description = "Muskegirls Stiefel",
	inventory_image = "coralie_stiefel.png",
	armor_groups = {fleshy=5},
	damage_groups = {cracky=3, snappy=2, choppy=3, crumbly=2, level=1},
	groups = {armor_feet=1, armor_heal=0, armor_use=2000, flammable=1},
})
--[[
minetest.register_tool("aftools:shield_coralie", {
	description = "Muskegirls Schild",
	inventory_image = "coralie_schild.png",
	groups = {armor_shield=1, armor_heal=12, armor_use=100, armor_fire=1},
	armor_groups = {fleshy=15},
	damage_groups = {cracky=2, snappy=1, level=3},
	reciprocate_damage = true,
	on_damage = function(player, index, stack)
		play_sound_effect(player, "default_glass_footstep")
	end,
	on_destroy = function(player, index, stack)
		play_sound_effect(player, "default_break_glass")
	end,
})
]]--
