--[[

Skyblock for Minetest

Copyright (c) 2015 cornernote, Brett O'Donnell <cornernote@gmail.com>
Source Code: https://github.com/cornernote/minetest-skyblock
License: GPLv3

]]--

local modpath = minetest.get_modpath('skyblock_home')

dofile(modpath..'/skyblock.home.lua')

-- log that we started
minetest.log('action', '[MOD]'..minetest.get_current_modname()..' -- loaded from '..minetest.get_modpath(minetest.get_current_modname()))