--[[

Skyblock for Minetest

Copyright (c) 2015 cornernote, Brett O'Donnell <cornernote@gmail.com>
Source Code: https://github.com/cornernote/minetest-skyblock
License: GPLv3

]]--


-- flora spawns on dirt_with_grass
minetest.register_abm({
	nodenames = {'default:dirt_with_grass'},
	interval = 300,
	chance = 100,
	action = function(pos, node)
		--skyblock.log('consider spawn flora at '..skyblock.dump_pos(pos)..' on '..minetest.env:get_node(pos).name)
		pos.y = pos.y+1

		local light = minetest.get_node_light(pos)
		if not light or light < 13 then
			return
		end

		-- check for nearby
		if minetest.env:find_node_near(pos, 2, {'group:flora'}) ~= nil then
			return
		end

		if minetest.env:get_node(pos).name == 'air' then
			local rand = math.random(1,8);
			local node
			if rand==1 then
				node = 'default:junglegrass'
			elseif rand==2 then
				node = 'default:grass_1'
			elseif rand==3 then
				node = 'flowers:dandelion_white'
			elseif rand==4 then
				node = 'flowers:dandelion_yellow'
			elseif rand==5 then
				node = 'flowers:geranium'
			elseif rand==6 then
				node = 'flowers:rose'
			elseif rand==7 then
				node = 'flowers:tulip'
			elseif rand==8 then
				node = 'flowers:viola'
			end
			--skyblock.log('spawn '..node..' at '..skyblock.dump_pos(pos)..' on '..minetest.env:get_node(pos).name)
			minetest.env:set_node(pos, {name=node})
		end
	end
})

-- dirt turns to dirt_with_grass if light
minetest.register_abm({
	nodenames = {'default:dirt'},
	neighbors = {'air'},
	interval = 50,
	chance = 100,
	action = function(pos)
		--skyblock.log('consider grow dirt_with_grass at '..skyblock.dump_pos(pos)..' on '..minetest.env:get_node(pos).name)
		local light = minetest.get_node_light(pos)
		if light >= 13 then
			return
		end
		--skyblock.log('grow dirt_with_grass at '..skyblock.dump_pos(pos)..' on '..minetest.env:get_node(pos).name)
		minetest.env:add_node(pos, {name='default:dirt_with_grass'})
	end
})

-- dirt_with_grass turns to dirt if no light
minetest.register_abm({
	nodenames = {'default:dirt_with_grass'},
	interval = 50,
	chance = 300,
	action = function(pos)
		--skyblock.log('consider kill dirt_with_grass at '..skyblock.dump_pos(pos)..' on '..minetest.env:get_node(pos).name)
		local light = minetest.get_node_light(pos)
		if not light or light < 13 then
			return
		end
		--skyblock.log('kill dirt_with_grass at '..skyblock.dump_pos(pos)..' on '..minetest.env:get_node(pos).name)
		minetest.env:add_node(pos, {name='default:dirt'})
	end
})

-- dirt_with_grass_footsteps turns to dirt_with_grass
minetest.register_abm({
	nodenames = {'default:dirt_with_grass_footsteps'},
	interval = 5,
	chance = 10,
	action = function(pos)
		--skyblock.log('consider grow dirt or dirt_with_grass at '..skyblock.dump_pos(pos)..' on '..minetest.env:get_node(pos).name)
   		if minetest.env:get_node({x = pos.x, y = pos.y + 1, z = pos.z}).name == 'air' then
			--skyblock.log('grow dirt_with_grass at '..skyblock.dump_pos(pos)..' on '..minetest.env:get_node(pos).name)
			minetest.env:add_node(pos, {name='default:dirt_with_grass'})
		else
			--skyblock.log('grow dirt at '..skyblock.dump_pos(pos)..' on '..minetest.env:get_node(pos).name)
			minetest.env:add_node(pos, {name='default:dirt'})
   		end
	end
})

-- remove bones
minetest.register_abm({
	nodenames = {'bones:bones'},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		minetest.env:remove_node(pos)
	end,
})

-- remove low flowing
minetest.register_abm({
	nodenames = {'default:lava_flowing','default:water_flowing','default:stone'},
	interval = 5,
	chance = 1,
	action = function(pos, node)
		if pos.y < skyblock.world_bottom then
			minetest.env:remove_node(pos)
		end
	end,
})