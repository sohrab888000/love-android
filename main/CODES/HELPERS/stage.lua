require("CODES/HELPERS/environment_collisions")
require("CODES/ANIMATION/animation_batch")
function new_stage(start_x,start_y,end_x,end_y)

local self = {}

self.start_x = start_x
self.start_y = start_y
self.end_x = end_x
self.end_y = end_y
local w_of_s = math.abs(start_x - end_x)
local h_of_s = math.abs(start_y - end_y)
self.center_x_of_stage = self.start_x + (w_of_s/2)
self.center_y_of_stage = self.start_y + (h_of_s/2)

self.roof = {x = 1 , y = 1 , width = 1 , height = 1}
self.right_side = {x = 1 , y = 1 , width = 1 , height = 1}
self.left_side = {x = 1 , y = 1 , width = 1 , height = 1}
self.ground = {x = 1 , y = 1 , width = 1 , height = 1}

self.environmnt_collisions = {} -- should fill with environment collisions
self.animations = {} -- should fill with animation batch 

--in each level should require the needed enemy and add it to list:
self.list_of_enemy1 = {}
self.list_of_enemy2 = {}
self.list_of_enemy3 = {}
self.list_of_boss = {}

self.list_of_enemy1_timer_limit = nil
self.list_of_enemy1_timer = 0

self.list_of_enemy2_timer_limit = nil
self.list_of_enemy2_timer = 0

self.list_of_enemy3_timer_limit = nil
self.list_of_enemy3_timer = 0

self.list_of_boss_timer_limit = nil
self.list_of_boss_timer = 0

self.end_of_stage = false
self.start_of_stage = false




--add functions
self.add_animation = function(name,bool,x,y)
local animation = newAnimation2()
animation.set_itrator(bool)
animation.set_position(x,y)
local to_add = {name = name , animation = animation}
table.insert(self.animations,to_add)
end

self.add_environment_collision = function(be,x,y,width,height)
local collision = new_environment_collision()
collision.set_to_be(be)
collision.set_rectangle(x,y,width,height)
collision.set_first(x,y)
table.insert(self.environmnt_collisions,collision)
end

self.add_enemy_to_list_of_enemy1 = function(enemy)
local to_add = {enemy = enemy , bool = false}
table.insert(self.list_of_enemy1,to_add)
end

self.add_enemy_to_list_of_enemy2 = function(enemy)
local to_add = {enemy = enemy , bool = false}
table.insert(self.list_of_enemy2,to_add)
end

self.add_enemy_to_list_of_enemy3 = function(enemy)
local to_add = {enemy = enemy , bool = false}
table.insert(self.list_of_enemy3,to_add)
end

self.add_enemy_to_list_of_boss = function(enemy)
local to_add = {enemy = enemy , bool = false}
table.insert(self.list_of_boss,to_add)
end


self.get_should_end = function()

return 
(
self.get_list_of_enemy1_is_finished() == true and 
self.get_list_of_enemy2_is_finished() == true and 
self.get_list_of_enemy3_is_finished() == true and 
self.get_list_of_boss_is_finished() == true
)

end

self.get_list_of_enemy1_is_finished = function()
return #self.list_of_enemy1 == 0
end

self.get_list_of_enemy2_is_finished = function()
return #self.list_of_enemy2 == 0
end

self.get_list_of_enemy3_is_finished = function()
return #self.list_of_enemy3 == 0
end

self.get_list_of_boss_is_finished = function()
return #self.list_of_boss == 0
end


--set and get functions
self.set_end_of_stage = function(end_of_stage)
self.end_of_stage = end_of_stage
end

self.get_end_of_stage = function()
return self.end_of_stage
end

self.set_start_of_stage = function(end_of_stage)
self.start_of_stage = end_of_stage
end

self.get_start_of_stage = function()
return self.start_of_stage
end

self.get_start_x = function()
return self.start_x
end

self.get_start_y = function()
return self.start_y
end

self.get_end_x = function()
return self.end_x
end

self.get_end_y = function()
return self.end_y
end

self.get_center_x_of_stage = function()
return self.center_x_of_stage
end

self.get_center_y_of_stage = function()
return self.center_y_of_stage
end


self.get_roof = function()
return self.roof
end


self.get_right_side = function()
return self.right_side
end


self.get_left_side = function()
return self.left_side
end

self.get_ground = function()
return self.ground
end


self.set_roof = function(x , y , width , height)
self.roof.x = x
self.roof.y = y
self.roof.width = width
self.roof.height = height
end


self.set_right_side = function(x , y , width , height)
self.right_side.x = x
self.right_side.y = y
self.right_side.width = width
self.right_side.height = height
end


self.set_left_side = function(x , y , width , height)
self.left_side.x = x
self.left_side.y = y
self.left_side.width = width
self.left_side.height = height
end

self.set_ground = function(x , y , width , height)
self.ground.x = x
self.ground.y = y
self.ground.width = width
self.ground.height = height
end


self.set_list_of_enemy1_timer_limit = function(timer_limit)
self.list_of_enemy1_timer_limit = timer_limit
end


self.set_list_of_enemy2_timer_limit = function(timer_limit)
self.list_of_enemy2_timer_limit = timer_limit
end


self.set_list_of_enemy3_timer_limit = function(timer_limit)
self.list_of_enemy3_timer_limit = timer_limit
end


self.set_list_of_boss_timer_limit = function(timer_limit)
self.list_of_boss_timer_limit = timer_limit
end


self.spawn_enemy_from_list_of_enemy1 = function()
if #self.list_of_enemy1 ~= 0 then
self.list_of_enemy1[#self.list_of_enemy1].bool = true
end
end

self.spawn_enemy_from_list_of_enemy2 = function()
if #self.list_of_enemy2 ~= 0 then
self.list_of_enemy2[#self.list_of_enemy2].bool = true
end
end

self.spawn_enemy_from_list_of_enemy3 = function()
if #self.list_of_enemy3 ~= 0 then
self.list_of_enemy3[#self.list_of_enemy3].bool = true
end
end

self.spawn_enemy_from_list_of_boss = function()
if #self.list_of_boss ~= 0 then
self.list_of_boss[#self.list_of_boss].bool = true
end
end

self.spawn_time_update = function(dt)--it is used in level_design_help class

if self.get_list_of_enemy1_is_finished() == false then
self.list_of_enemy1_timer = self.list_of_enemy1_timer + dt
if self.list_of_enemy1_timer >= self.list_of_enemy1_timer_limit then
self.spawn_enemy_from_list_of_enemy1()
self.list_of_enemy1_timer = 0
end
end

if self.get_list_of_enemy2_is_finished() == false then
self.list_of_enemy2_timer = self.list_of_enemy2_timer + dt
if self.list_of_enemy2_timer >= self.list_of_enemy2_timer_limit then
self.spawn_enemy_from_list_of_enemy2()
self.list_of_enemy2_timer = 0
end
end

if self.get_list_of_enemy3_is_finished() == false then
self.list_of_enemy3_timer = self.list_of_enemy3_timer + dt
if self.list_of_enemy3_timer >= self.list_of_enemy3_timer_limit then
self.spawn_enemy_from_list_of_enemy3()
self.list_of_enemy3_timer = 0
end
end

if self.get_list_of_boss_is_finished() == false then
self.list_of_boss_timer = self.list_of_boss_timer + dt
if self.list_of_boss_timer >= self.list_of_boss_timer_limit then
self.spawn_enemy_from_list_of_boss()
self.list_of_boss_timer = 0
end
end

end


self.there_is_environment_collision = function()
return #self.environmnt_collisions ~= 0
end

self.there_is_animation = function()
return #self.animations ~= 0
end



return self

end