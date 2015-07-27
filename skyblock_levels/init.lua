--[[

Skyblock for MineTest

Copyright (c) 2015 cornernote, Brett O'Donnell <cornernote@gmail.com>
Source Code: https://github.com/cornernote/minetest-skyblock
License: GPLv3

LEVEL LOADER

]]--

local modpath = minetest.get_modpath('skyblock_levels')

dofile(modpath..'/skyblock.levels.lua')
dofile(modpath..'/skyblock.levels.1.lua')
dofile(modpath..'/skyblock.levels.2.lua')
dofile(modpath..'/skyblock.levels.3.lua')
dofile(modpath..'/skyblock.levels.4.lua')

dofile(modpath..'/register_abm.lua')
dofile(modpath..'/register_craft.lua')
dofile(modpath..'/register_node.lua')
dofile(modpath..'/register_misc.lua')

-- log that we started
minetest.log('action', '[MOD]'..minetest.get_current_modname()..' -- loaded from '..minetest.get_modpath(minetest.get_current_modname()))