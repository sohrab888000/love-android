require ("CODES/HELPERS/thebackgrounds")
require ("CODES/HELPERS/world")
require("CODES/HELPERS/stage")
require("CODES/HELPERS/transition_move_background")
require("CODES/HELPERS/SCALE")
-- -> what should happens in scene one
-- -> what should happens in scene two
--and so on!
--should control the world_class --> the flow of responding enemies world functions should be here! not in main_code file
--should control the environment_collisions_clss --> still need to be better
--should control the background --> should control when stage has to change and how to change
--here along side the roof and ground and right side and left side will be more environmnt collisions(a list)that the choice will be made(like in world)

function new_level_design()

local self = {}

--variables:
self.world = new_world()--should use world functions in 
self.background = newBackground()--should use background functions in
self.stages = {}
self.current_stage = nil
self.next_stage = nil
self.transitions_to_move_background = {}
self.end_of_level = false
self.transitioning = false
self.main_music = nil -- this should change

main_scaler = NEW_MAIN_SCALER()



--draw





--update
--updates are:
-- update_flow
-- update_world
-- update_environment collisions
-- update_animations for background

self.update_flow = function(dt,center_to_x,center_to_y,hero_speed_slowment)


self.collision_act_for_environment_current_and_next_stage(center_to_x,center_to_y)
self.animation_update_current_and_next_stage(dt)

--[[
print("1:",self.get_background().x_coordinate)
print("2:",self.get_current_stage().get_start_x())
print("3:",self.get_next_stage().get_start_x())
--]]

if 
self.get_current_stage().get_start_of_stage() == false and
self.get_current_stage().get_end_of_stage() == true and
self.get_next_stage().get_start_of_stage() == false and
self.get_next_stage().get_end_of_stage() == false and
self.get_the_tarnsition() ~= 0 then

--new
self.transitioning = true
--new

if self.get_the_tarnsition().get_to_up() == true then

if self.should_take_hero_and_background_to_up() then
self.get_world().get_hero().set_should_freez_in_x(true)
self.get_world().get_hero().set_should_freez_in_y(true)
self.take_hero_and_background_to_down()
else
self.get_world().get_hero().set_should_freez_in_x(false)
self.get_world().get_hero().set_should_freez_in_y(false)
end



if self.hero_can_go_to_up_stage(self.get_next_stage().get_start_y()) then --else change current_stage and next_stage
if self.get_hero_can_move_vertical() then
if (center_to_y < 0)
and
self.get_world().get_hero().isdead == false and
self.get_world().get_hero().isgothit == false and 
--self.dodge == false and  because in dodge mode background should move
self.get_world().get_hero().isidle == false and
self.get_world().get_hero().thief == false and
self.get_world().get_hero().attacking == false
then
self.get_world().get_hero().set_should_freez_in_y(true)
self.get_world().get_hero().set_should_freez_in_x(false)

local limit = self.get_next_stage().get_start_y()
self.get_background().moving_down(true,-center_to_y/hero_speed_slowment,limit)
self.move_current_and_next_stage_environment_to_down(true,-center_to_y/hero_speed_slowment)
self.move_current_and_next_stage_animation_to_down(true,-center_to_y/hero_speed_slowment)
else
self.get_world().get_hero().set_should_freez_in_y(false)	
end    
end--if self.get_hero_can_move_vertical() then

else


self.health_up_at_stage()
self.go_to_next_stage_if_there_is_one()
self.ready_two_stages_environment_to_use(self.get_current_stage_index(),self.get_next_stage_index())
self.ready_two_stages_animations_to_use(self.get_current_stage_index(),self.get_next_stage_index())--have to change and overwrite 

end


--end of if self.get_the_tarnsition().get_to_up() == true

elseif self.get_the_tarnsition().get_to_right() == true then

if self.should_take_hero_and_background_to_right() then
self.get_world().get_hero().set_should_freez_in_x(true)
self.get_world().get_hero().set_should_freez_in_y(true)
self.take_hero_and_background_to_left()
else
self.get_world().get_hero().set_should_freez_in_x(false)
self.get_world().get_hero().set_should_freez_in_y(false)
end

if self.hero_can_go_to_right_stage(self.get_next_stage().get_start_x()) then --else change current_stage and next_stage	
if self.get_hero_can_move_horizontal() then
if self.get_world().get_hero().dodge == true then
self.get_world().get_hero().set_should_freez_in_x(true)	

local limit = self.get_next_stage().get_start_x()
self.get_background().moving_left(true,self.get_world().get_hero().dodge_time * main_scaler.scale_x * 1.5,limit)
self.move_current_and_next_stage_environment_to_left(true,self.get_world().get_hero().dodge_time * main_scaler.scale_x * 1.5)
self.move_current_and_next_stage_animation_to_left(true,self.get_world().get_hero().dodge_time * main_scaler.scale_x * 1.5)
else
if (center_to_x > 0)
and
self.get_world().get_hero().isdead == false and
self.get_world().get_hero().isgothit == false and 
--self.dodge == false and  because in dodge mode background should move
self.get_world().get_hero().isidle == false and
self.get_world().get_hero().thief == false and
self.get_world().get_hero().attacking == false
then	
self.get_world().get_hero().set_should_freez_in_x(true)	
self.get_world().get_hero().set_should_freez_in_y(false)

local limit = self.get_next_stage().get_start_x()
self.get_background().moving_left(true,center_to_x/hero_speed_slowment,limit)
self.move_current_and_next_stage_environment_to_left(true,center_to_x/hero_speed_slowment)
self.move_current_and_next_stage_animation_to_left(true,center_to_x/hero_speed_slowment)
else
self.get_world().get_hero().set_should_freez_in_x(false)	
end
end

end--if self.get_hero_can_move_horizontal() then

else


self.health_up_at_stage()
self.go_to_next_stage_if_there_is_one() 
self.ready_two_stages_environment_to_use(self.get_current_stage_index(),self.get_next_stage_index())
self.ready_two_stages_animations_to_use(self.get_current_stage_index(),self.get_next_stage_index())--have to change and overwrite

end


--end of elseif self.get_the_tarnsition().get_to_right() == true

elseif self.get_the_tarnsition().get_to_left() == true then 

if self.should_take_hero_and_background_to_left() then
self.get_world().get_hero().set_should_freez_in_x(true)
self.get_world().get_hero().set_should_freez_in_y(true)
self.take_hero_and_background_to_right()
else
self.get_world().get_hero().set_should_freez_in_x(false)
self.get_world().get_hero().set_should_freez_in_y(false)
end

if self.hero_can_go_to_left_stage(self.get_next_stage().get_start_x()) then --else change current_stage and next_stage	
if self.get_hero_can_move_horizontal() then
if self.get_world().get_hero().dodge == true then
self.get_world().get_hero().set_should_freez_in_x(true)	

local limit = self.get_next_stage().get_start_x()
self.get_background().moving_right(true,self.get_world().get_hero().dodge_time * main_scaler.scale_x * 1.5,limit)
self.move_current_and_next_stage_environment_to_right(true,self.get_world().get_hero().dodge_time * main_scaler.scale_x * 1.5)
self.move_current_and_next_stage_animation_to_right(true,self.get_world().get_hero().dodge_time * main_scaler.scale_x * 1.5)
else
if (center_to_x < 0) 
and
self.get_world().get_hero().isdead == false and
self.get_world().get_hero().isgothit == false and 
--self.dodge == false and  because in dodge mode background should move
self.get_world().get_hero().isidle == false and
self.get_world().get_hero().thief == false and
self.get_world().get_hero().attacking == false
then	
self.get_world().get_hero().set_should_freez_in_x(true)	
self.get_world().get_hero().set_should_freez_in_y(false)

local limit = self.get_next_stage().get_start_x()
self.get_background().moving_right(true,-center_to_x/hero_speed_slowment,limit)
self.move_current_and_next_stage_environment_to_right(true,-center_to_x/hero_speed_slowment)
self.move_current_and_next_stage_animation_to_right(true,-center_to_x/hero_speed_slowment)
else
self.get_world().get_hero().set_should_freez_in_x(false)	
end
end

end--if self.get_hero_can_move_horizontal() then

else

self.health_up_at_stage()
self.go_to_next_stage_if_there_is_one() 	
self.ready_two_stages_environment_to_use(self.get_current_stage_index(),self.get_next_stage_index())
self.ready_two_stages_animations_to_use(self.get_current_stage_index(),self.get_next_stage_index())--have to change and overwrite

end


--end of elseif self.get_the_tarnsition().get_to_left() == true 

elseif self.get_the_tarnsition().get_to_down() == true then 

if self.should_take_hero_and_background_to_down() then
self.get_world().get_hero().set_should_freez_in_x(true)
self.get_world().get_hero().set_should_freez_in_y(true)
self.take_hero_and_background_to_up()
else
self.get_world().get_hero().set_should_freez_in_x(false)
self.get_world().get_hero().set_should_freez_in_y(false)
end

if self.hero_can_go_to_down_stage(self.get_next_stage().get_start_y()) then --else change current_stage and next_stage
if self.get_hero_can_move_vertical() then
if (center_to_y > 0) 
and
self.get_world().get_hero().isdead == false and
self.get_world().get_hero().isgothit == false and 
--self.dodge == false and  because in dodge mode background should move
self.get_world().get_hero().isidle == false and
self.get_world().get_hero().thief == false and
self.get_world().get_hero().attacking == false
then
self.get_world().get_hero().set_should_freez_in_y(true)
self.get_world().get_hero().set_should_freez_in_x(false)

local limit = self.get_next_stage().get_start_y()
self.get_background().moving_up(true,center_to_y/hero_speed_slowment,limit)
self.move_current_and_next_stage_environment_to_up(true,center_to_y/hero_speed_slowment)
self.move_current_and_next_stage_animation_to_up(true,center_to_y/hero_speed_slowment)
else
self.get_world().get_hero().set_should_freez_in_y(false)	
end
end--if self.get_hero_can_move_vertical() then

else

self.health_up_at_stage()
self.go_to_next_stage_if_there_is_one() 	
self.ready_two_stages_environment_to_use(self.get_current_stage_index(),self.get_next_stage_index())
self.ready_two_stages_animations_to_use(self.get_current_stage_index(),self.get_next_stage_index())--have to change and overwrite

end

end--end of elseif self.get_the_tarnsition().get_to_down() == true


--[[ end of if 
self.get_current_stage().get_start_of_stage() == false and
self.get_current_stage().get_end_of_stage() == true and
self.get_next_stage().get_start_of_stage() == false and
self.get_next_stage().get_end_of_stage() == false then
]]

elseif 
--first -> if player is not in last stage
(self.get_current_stage().get_start_of_stage() == true and
self.get_current_stage().get_end_of_stage() == false and
self.get_next_stage().get_start_of_stage() == false and
self.get_next_stage().get_end_of_stage() == false and
self.get_current_stage_index() ~= #self.stages) then

--new
self.transitioning = false
--new

self.get_current_stage().spawn_time_update(dt)
self.spawn_stage_enemys_and_boss()
self.set_for_shake()--abstract
self.get_background().shake_func(dt,self.get_current_stage().get_start_y())


if self.get_current_stage().get_should_end() == true and #self.get_world().get_all_beings() == 0 then
self.get_current_stage().set_start_of_stage(false) 
self.get_current_stage().set_end_of_stage(true)
end

--end of 
--[[ 
elseif 
--first -> if player is not in last stage
(self.get_current_stage().get_start_of_stage() == true and
self.get_current_stage().get_end_of_stage() == false and
self.get_next_stage().get_start_of_stage() == false and
self.get_next_stage().get_end_of_stage() == false and
self.get_current_stage_index() ~= #self.stages) then
]]

elseif
--second -> if player is in last stage
(self.get_current_stage().get_start_of_stage() == true and
self.get_current_stage().get_end_of_stage() == false and 
self.get_current_stage_index() == #self.stages and
self.get_next_stage_index() == #self.stages) then

--new
self.transitioning = false
--new

self.get_current_stage().spawn_time_update(dt)
self.spawn_stage_enemys_and_boss()
self.set_for_shake()--abstract
self.get_background().shake_func(dt,self.get_current_stage().get_start_y())


if self.get_current_stage().get_should_end() == true and #self.get_world().get_all_beings() == 0 then
self.get_current_stage().set_start_of_stage(false)
self.get_current_stage().set_end_of_stage(true)
self.set_end_of_level(true)
end


end--end of 
--[[ 
elseif
--second -> if player is in last stage
(self.get_current_stage().get_start_of_stage() == true and
self.get_current_stage().get_end_of_stage() == false and 
self.get_current_stage_index() == #self.stages and
self.get_next_stage_index() == #self.stages) then
]]




end--end of function








--add functions to lists
self.add_stage = function(start_x,start_y,end_x,end_y)
local stage = new_stage(start_x,start_y,end_x,end_y)
table.insert(self.stages,stage)
end

self.add_transition = function(current_stage_index,next_stage_index,to_up,to_right,to_left,to_down)
local transition = new_transition_move_background(current_stage_index,next_stage_index,to_up,to_right,to_left,to_down)
table.insert(self.transitions_to_move_background,transition)
end







--get functions:
self.get_world = function()
return self.world
end

self.get_background = function()
return self.background
end

self.get_current_stage_index = function()
return self.current_stage
end

self.get_next_stage_index = function()
return self.next_stage 
end

self.get_current_stage = function()
return self.stages[self.get_current_stage_index()]
end
self.get_next_stage = function()
return self.stages[self.get_next_stage_index()] 
end

self.set_current_stage_index = function(index)
if index <= #self.stages then
self.current_stage = index
end
end

self.set_next_stage_index = function(index)
if index <= #self.stages then
self.next_stage = index
end
end

self.set_end_of_level = function(bool)
self.end_of_level = bool
end

self.get_end_of_level = function()
return self.end_of_level
end




--helper functions:
self.is_in_stage = function(index_of_stage_to_check)

local bool_one = nil
local bool_two = nil
local bool_three = nil

if index_of_stage_to_check ~= 1 then
for i = 1 , index_of_stage_to_check-1 do
if( self.stages[i].get_start_of_stage() == false and self.stages[i].get_end_of_stage() == true ) then
bool_one = true
else
return false	
end	
end	

else
bool_one = true
end

if self.stages[index_of_stage_to_check].get_start_of_stage() == true and self.stages[index_of_stage_to_check].get_end_of_stage() == false then
bool_two = true
else 
return false	
end

for i = index_of_stage_to_check+1 , #self.stages do
if( self.stages[i].get_start_of_stage() == false and self.stages[i].get_end_of_stage() == false ) then
bool_three = true
else
return false	
end	
end	

return (bool_one == true and bool_two == true and bool_three == true)

end


self.be_in_stage = function(index_of_stage_to_check)

if index_of_stage_to_check ~= 1 then
for i = 1 , index_of_stage_to_check-1 do
self.stages[i].set_start_of_stage(false) 
self.stages[i].set_end_of_stage(true)
end	
end


self.stages[index_of_stage_to_check].set_start_of_stage(true) 
self.stages[index_of_stage_to_check].set_end_of_stage(false) 

for i = index_of_stage_to_check+1 , #self.stages do
self.stages[i].set_start_of_stage(false)
self.stages[i].set_end_of_stage(false)
end	

end



self.is_in_stage_width_and_height = function(index_of_stage_to_check)

local check_x = self.get_background().x_coordinate
local check_y = self.get_background().y_coordinate

local limitition_start_x = self.stages[index_of_stage_to_check].get_start_x()
local limitition_end_x = self.stages[index_of_stage_to_check].get_end_x() 
local limitition_start_y = self.stages[index_of_stage_to_check].get_start_y()
local limitition_end_y = self.stages[index_of_stage_to_check].get_end_y()

return check_x >= start_x and check_x <= end_x and check_y <= start_y and check_y >= end_y

end



self.spawn_stage_enemys_and_boss = function() -- abstract
--return--it is overwrited in each level for better speed and execution
end

self.set_for_shake = function() -- abstract
--return--it is overwrited in each level for better speed and execution
end


self.hero_can_go_to_up_stage = function(limitition_y)
local background_y = self.get_background().y_coordinate
return 
(
background_y < limitition_y 
)
end

self.hero_can_go_to_right_stage = function(limitition_x)
local background_x = self.get_background().x_coordinate
return 
(
background_x > limitition_x  
)
end

self.hero_can_go_to_left_stage = function(limitition_x)
local background_x = self.get_background().x_coordinate
return 
(
background_x < limitition_x
)
end

self.hero_can_go_to_down_stage = function(limitition_y)
local background_y = self.get_background().y_coordinate
return 
(
background_y > limitition_y
)
end


self.set_side_limits_for_current_stage = function()

local roof = self.get_current_stage().get_roof()
local right_side = self.get_current_stage().get_right_side()
local left_side = self.get_current_stage().get_left_side()
local ground = self.get_current_stage().get_ground()

self.get_world().set_roof(roof.x , roof.y , roof.width , roof.height)
self.get_world().set_right_side(right_side.x , right_side.y , right_side.width , right_side.height)
self.get_world().set_left_side(left_side.x , left_side.y , left_side.width , left_side.height)
self.get_world().set_ground(ground.x , ground.y , ground.width , ground.height)
end

self.should_take_hero_and_background_to_up = function()

local center_y_of_hero =  self.get_world().get_hero().get_center_y_of_rectangle_for_damaged()
local h_of_s = self.get_background().get_height_of_stage()
local center_y_of_scene = h_of_s/2

return center_y_of_hero < center_y_of_scene

end

self.should_take_hero_and_background_to_right = function()

local center_x_of_hero = self.get_world().get_hero().get_center_x_of_rectangle_for_damaged()
local w_of_s = self.get_background().get_width_of_stage()
local center_x_of_scene = w_of_s/2

return center_x_of_hero > center_x_of_scene

end

self.should_take_hero_and_background_to_left = function()

local center_x_of_hero = self.get_world().get_hero().get_center_x_of_rectangle_for_damaged()
local w_of_s = self.get_background().get_width_of_stage()
local center_x_of_scene = w_of_s/2

return center_x_of_hero < center_x_of_scene

end

self.should_take_hero_and_background_to_down = function()

local center_y_of_hero =  self.get_world().get_hero().get_center_y_of_rectangle_for_damaged()
local h_of_s = self.get_background().get_height_of_stage()
local center_y_of_scene = h_of_s/2

return center_y_of_hero > center_y_of_scene


end


self.take_hero_and_background_to_up = function()

--if self.should_take_hero_and_background_to_up() then -> in main code is beettteeer
--[[ this is how rectangle for damaged for hero is calculated :
local rect.x = self.center_x_coordinate + ( 220 ) * main_scaler.scale_x
local rect.y = self.center_y_coordinate + ( 157 ) * main_scaler.scale_y
]]	

local w_of_s = self.get_background().get_width_of_stage()
local h_of_s = self.get_background().get_height_of_stage()
local center_y_of_hero =  self.get_world().get_hero().get_center_y_of_rectangle_for_damaged()
local center_y_of_stage = h_of_s/2
local distant = math.abs(center_y_of_hero - center_y_of_stage)
if distant >= 0 and distant <= 10 * main_scaler.scale_y then
self.get_world().get_hero().center_y_coordinate = h_of_s/2 - (157 * main_scaler.scale_y  +   self.get_world().get_hero().get_rectangle_for_damaged().height/2)

self.get_background().y_coordinate = self.get_background().y_coordinate - distant
self.move_current_and_next_stage_environment_to_up(true,distant)
self.move_current_and_next_stage_animation_to_up(true,distant)
elseif  distant > 10 * main_scaler.scale_y then
self.get_world().get_hero().center_y_coordinate = self.get_world().get_hero().center_y_coordinate - (10 * main_scaler.scale_y)

local limit = self.get_next_stage().get_start_y()

self.get_background().moving_up(true,(10*main_scaler.scale_y),limit)
self.move_current_and_next_stage_environment_to_up(true,(10*main_scaler.scale_y))
self.move_current_and_next_stage_animation_to_up(true,(10*main_scaler.scale_y))
end

end

self.take_hero_and_background_to_right = function()

--if self.should_take_hero_and_background_to_left() then -> in main code is beettteeer
--[[ this is how rectangle for damaged for hero is calculated :
local rect.x = self.center_x_coordinate + ( 220 ) * main_scaler.scale_x
local rect.y = self.center_y_coordinate + ( 157 ) * main_scaler.scale_y
]]	

local w_of_s = self.get_background().get_width_of_stage()
local h_of_s = self.get_background().get_height_of_stage()
local center_x_of_hero =  self.get_world().get_hero().get_center_x_of_rectangle_for_damaged()
local center_x_of_stage = w_of_s/2
local distant = math.abs(center_x_of_hero - center_x_of_stage)
if distant >= 0 and distant <= 10 * main_scaler.scale_x then
self.get_world().get_hero().center_x_coordinate = (w_of_s/2) - (220 * main_scaler.scale_x  +   self.get_world().get_hero().get_rectangle_for_damaged().width/2) 

self.get_background().x_coordinate = self.get_background().x_coordinate - distant
self.move_current_and_next_stage_environment_to_right(true,-distant)
self.move_current_and_next_stage_animation_to_right(true,-distant)

elseif  distant > 10 * main_scaler.scale_x then
self.get_world().get_hero().center_x_coordinate = self.get_world().get_hero().center_x_coordinate + (10 * main_scaler.scale_x) 

local limit = self.get_next_stage().get_start_x()

self.get_background().moving_right(true,(10*main_scaler.scale_x),limit)
self.move_current_and_next_stage_environment_to_right(true,(10*main_scaler.scale_x))
self.move_current_and_next_stage_animation_to_right(true,(10*main_scaler.scale_x))
end

end


self.take_hero_and_background_to_left = function()

--if self.should_take_hero_and_background_to_left() then -> in main code is beettteeer
--[[ this is how rectangle for damaged for hero is calculated :
local rect.x = self.center_x_coordinate + ( 220 ) * main_scaler.scale_x
local rect.y = self.center_y_coordinate + ( 157 ) * main_scaler.scale_y
]]	

local w_of_s = self.get_background().get_width_of_stage()
local h_of_s = self.get_background().get_height_of_stage()
local center_x_of_hero =  self.get_world().get_hero().get_center_x_of_rectangle_for_damaged()
local center_x_of_stage = w_of_s/2
local distant = math.abs(center_x_of_hero - center_x_of_stage)
if distant >= 0 and distant <= 10 * main_scaler.scale_x then
self.get_world().get_hero().center_x_coordinate = (w_of_s/2) - (220 * main_scaler.scale_x  +   self.get_world().get_hero().get_rectangle_for_damaged().width/2) 
self.get_background().x_coordinate = self.get_background().x_coordinate - distant

self.move_current_and_next_stage_environment_to_left(true,distant)
self.move_current_and_next_stage_animation_to_left(true,distant)
elseif  distant > 10 * main_scaler.scale_x then
self.get_world().get_hero().center_x_coordinate = self.get_world().get_hero().center_x_coordinate - (10 * main_scaler.scale_x)

local limit = self.get_next_stage().get_start_x()

self.get_background().moving_left(true,(10*main_scaler.scale_x),limit)
self.move_current_and_next_stage_environment_to_left(true,(10*main_scaler.scale_x))
self.move_current_and_next_stage_animation_to_left(true,(10*main_scaler.scale_x))
end

end


self.take_hero_and_background_to_down = function()

--if self.should_take_hero_and_background_to_left() then -> in main code is beettteeer
--[[ this is how rectangle for damaged for hero is calculated :
local rect.x = self.center_x_coordinate + ( 220 ) * main_scaler.scale_x
local rect.y = self.center_y_coordinate + ( 157 ) * main_scaler.scale_y
]]	

local w_of_s = self.get_background().get_width_of_stage()
local h_of_s = self.get_background().get_height_of_stage()
local center_y_of_hero =  self.get_world().get_hero().get_center_y_of_rectangle_for_damaged()
local center_y_of_stage = h_of_s/2
local distant = math.abs(center_y_of_hero - center_y_of_stage)
if distant >= 0 and distant <= 10 * main_scaler.scale_y then	
self.get_world().get_hero().center_y_coordinate = h_of_s/2 - (157 * main_scaler.scale_y  +   self.get_world().get_hero().get_rectangle_for_damaged().height/2)

self.get_background().y_coordinate = self.get_background().y_coordinate - distant
self.move_current_and_next_stage_environment_to_down(true,-distant)
self.move_current_and_next_stage_animation_to_down(true,-distant)
elseif  distant > 10 * main_scaler.scale_y then
self.get_world().get_hero().center_y_coordinate = self.get_world().get_hero().center_y_coordinate + (10 * main_scaler.scale_y)

local limit = self.get_next_stage().get_start_y()

self.get_background().moving_down(true,(10*main_scaler.scale_y),limit)
self.move_current_and_next_stage_environment_to_down(true,(10*main_scaler.scale_y))
self.move_current_and_next_stage_animation_to_down(true,(10*main_scaler.scale_y))
--should move animations too
end

end





self.get_the_tarnsition = function()

for i = 1 , #self.transitions_to_move_background do

if self.transitions_to_move_background[i].get_current_stage_index() == self.get_current_stage_index() and
self.transitions_to_move_background[i].get_next_stage_index() == self.get_next_stage_index() then

return self.transitions_to_move_background[i]

end


end

return 0

end

self.get_hero_can_move_vertical = function(hero_center_y_pos)

local h_of_s = self.get_background().get_height_of_stage()
local center_y_of_hero =  self.get_world().get_hero().get_center_y_of_rectangle_for_damaged()
local center_y_of_scene = h_of_s/2

return center_y_of_scene == center_y_of_hero

end

self.get_hero_can_move_horizontal = function(hero_center_x_pos)

local w_of_s = self.get_background().get_width_of_stage()
local center_x_of_hero =  self.get_world().get_hero().get_center_x_of_rectangle_for_damaged()
local center_x_of_scene = w_of_s/2

return center_x_of_scene == center_x_of_hero

end


self.go_to_next_stage_if_there_is_one = function()

self.set_current_stage_index(self.get_next_stage_index())	
self.set_next_stage_index(self.get_next_stage_index() + 1)

if self.get_current_stage_index() == #self.stages then
self.get_current_stage().set_start_of_stage(true)
self.get_current_stage().set_end_of_stage(false) 
else
self.get_current_stage().set_start_of_stage(true) 
self.get_current_stage().set_end_of_stage(false) 
self.get_next_stage().set_start_of_stage(false) 
self.get_next_stage().set_end_of_stage(false) 
end
--should change add down functions
self.set_side_limits_for_current_stage()


end



self.move_current_and_next_stage_environment_to_up = function(bool_to_move,speed)

if self.get_current_stage().there_is_environment_collision() == true then
for i = 1 , #self.get_current_stage().environmnt_collisions do
self.get_current_stage().environmnt_collisions[i].moving_up(bool_to_move,speed)
end
end

if self.get_next_stage().there_is_environment_collision() == true then
for i = 1 , #self.get_next_stage().environmnt_collisions do
self.get_next_stage().environmnt_collisions[i].moving_up(bool_to_move,speed)
end
end

end

self.move_current_and_next_stage_environment_to_right = function(bool_to_move,speed)

if self.get_current_stage().there_is_environment_collision() == true then
for i = 1 , #self.get_current_stage().environmnt_collisions do
self.get_current_stage().environmnt_collisions[i].moving_right(bool_to_move,speed)
end
end

if self.get_next_stage().there_is_environment_collision() == true then
for i = 1 , #self.get_next_stage().environmnt_collisions do
self.get_next_stage().environmnt_collisions[i].moving_right(bool_to_move,speed)
end
end

end

self.move_current_and_next_stage_environment_to_left = function(bool_to_move,speed)

if self.get_current_stage().there_is_environment_collision() == true then
for i = 1 , #self.get_current_stage().environmnt_collisions do
self.get_current_stage().environmnt_collisions[i].moving_left(bool_to_move,speed)
end
end

if self.get_next_stage().there_is_environment_collision() == true then
for i = 1 , #self.get_next_stage().environmnt_collisions do
self.get_next_stage().environmnt_collisions[i].moving_left(bool_to_move,speed)
end
end

end

self.move_current_and_next_stage_environment_to_down = function(bool_to_move,speed)

if self.get_current_stage().there_is_environment_collision() == true then
for i = 1 , #self.get_current_stage().environmnt_collisions do
self.get_current_stage().environmnt_collisions[i].moving_down(bool_to_move,speed)
end
end

if self.get_next_stage().there_is_environment_collision() == true then
for i = 1 , #self.get_next_stage().environmnt_collisions do
self.get_next_stage().environmnt_collisions[i].moving_down(bool_to_move,speed)
end
end

end


self.collision_act_for_environment_current_and_next_stage = function(center_to_x,center_to_y)

--current should move when back move and when hero and back move
--current should move when back move and when hero and back move
--make four functions for moving current and next together

local hero_rect_environment = self.get_world().get_hero().get_rect_environment()
local hero_U_rect = hero_rect_environment.get_U_rect()
local hero_R_rect = hero_rect_environment.get_R_rect()
local hero_L_rect = hero_rect_environment.get_L_rect()
local hero_D_rect = hero_rect_environment.get_D_rect()

if self.get_current_stage().there_is_environment_collision() == true then

for i = 1 , #self.get_current_stage().environmnt_collisions do

if self.get_current_stage().environmnt_collisions[i].U_rect_detected_collision(hero_D_rect.x,hero_D_rect.y,hero_D_rect.width,hero_D_rect.height) and center_to_y > 0 then
self.get_world().get_hero().center_y_coordinate = self.get_current_stage().environmnt_collisions[i].get_U_rect().y - (157 * main_scaler.scale_y  +   self.get_world().get_hero().get_rectangle_for_damaged().height) 

end

if self.get_current_stage().environmnt_collisions[i].R_rect_detected_collision(hero_L_rect.x,hero_L_rect.y,hero_L_rect.width,hero_L_rect.height) and center_to_x < 0 then
self.get_world().get_hero().center_x_coordinate = self.get_current_stage().environmnt_collisions[i].get_R_rect().x + self.get_current_stage().environmnt_collisions[i].get_R_rect().width - ( 221 * main_scaler.scale_x)
end

if self.get_current_stage().environmnt_collisions[i].L_rect_detected_collision(hero_R_rect.x,hero_R_rect.y,hero_R_rect.width,hero_R_rect.height) and center_to_x > 0 then
self.get_world().get_hero().center_x_coordinate = self.get_current_stage().environmnt_collisions[i].get_L_rect().x - (220 * main_scaler.scale_x  +   self.get_world().get_hero().get_rectangle_for_damaged().width) 
end

if self.get_current_stage().environmnt_collisions[i].D_rect_detected_collision(hero_U_rect.x,hero_U_rect.y,hero_U_rect.width,hero_U_rect.height) and center_to_y < 0 then
self.get_world().get_hero().center_y_coordinate = self.get_current_stage().environmnt_collisions[i].get_D_rect().y + self.get_current_stage().environmnt_collisions[i].get_D_rect().height  - ( 158 * main_scaler.scale_y)
end

end

end


if self.get_next_stage().there_is_environment_collision() == true then

for i = 1 , #self.get_next_stage().environmnt_collisions do

if self.get_next_stage().environmnt_collisions[i].U_rect_detected_collision(hero_D_rect.x,hero_D_rect.y,hero_D_rect.width,hero_D_rect.height) and center_to_y > 0 then
self.get_world().get_hero().center_y_coordinate = self.get_next_stage().environmnt_collisions[i].get_U_rect().y - (157 * main_scaler.scale_y  +   self.get_world().get_hero().get_rectangle_for_damaged().height) 
end

if self.get_next_stage().environmnt_collisions[i].R_rect_detected_collision(hero_L_rect.x,hero_L_rect.y,hero_L_rect.width,hero_L_rect.height) and center_to_x < 0 then
self.get_world().get_hero().center_x_coordinate = self.get_next_stage().environmnt_collisions[i].get_R_rect().x + self.get_next_stage().environmnt_collisions[i].get_R_rect().width - ( 221 * main_scaler.scale_x)
end

if self.get_next_stage().environmnt_collisions[i].L_rect_detected_collision(hero_R_rect.x,hero_R_rect.y,hero_R_rect.width,hero_R_rect.height) and center_to_x > 0 then
self.get_world().get_hero().center_x_coordinate = self.get_next_stage().environmnt_collisions[i].get_L_rect().x - (220 * main_scaler.scale_x  +   self.get_world().get_hero().get_rectangle_for_damaged().width) 
end

if self.get_next_stage().environmnt_collisions[i].D_rect_detected_collision(hero_U_rect.x,hero_U_rect.y,hero_U_rect.width,hero_U_rect.height) and center_to_y < 0 then
self.get_world().get_hero().center_y_coordinate = self.get_next_stage().environmnt_collisions[i].get_D_rect().y + self.get_next_stage().environmnt_collisions[i].get_D_rect().height  - ( 158 * main_scaler.scale_y)
end

end

end

end


self.ready_all_stages_environment_to_use = function()--should be used in level after seting environmnt_collisions and transitions

for i = 1 , #self.stages do

self.ready_two_stages_environment_to_use(i,i+1)

end	

end



self.ready_two_stages_environment_to_use = function(stage_index_1 , stage_index_2)

local transition = 0

for i = 1 , #self.transitions_to_move_background do

if self.transitions_to_move_background[i].get_current_stage_index() == stage_index_1 and
self.transitions_to_move_background[i].get_next_stage_index() == stage_index_2 then

transition = self.transitions_to_move_background[i]


end

end


if transition == 0 then return transition end


local w_of_s = self.get_background().get_width_of_stage()
local h_of_s = self.get_background().get_height_of_stage()


if transition.get_to_up() == true then

for i = 1 , #self.stages[transition.get_next_stage_index()].environmnt_collisions do
local rect = self.stages[transition.get_next_stage_index()].environmnt_collisions[i].get_get_rectangle() 
local x = rect.x
local y = rect.y
local width = rect.width
local height = rect.height
y = y - h_of_s 
self.stages[transition.get_next_stage_index()].environmnt_collisions[i].set_rectangle(x,y,width,height)

end

elseif transition.get_to_right() == true then

for i = 1 , #self.stages[transition.get_next_stage_index()].environmnt_collisions do
local rect = self.stages[transition.get_next_stage_index()].environmnt_collisions[i].get_rectangle() 
local x = rect.x
local y = rect.y
local width = rect.width
local height = rect.height
x = x + w_of_s 
self.stages[transition.get_next_stage_index()].environmnt_collisions[i].set_rectangle(x,y,width,height)

end

elseif transition.get_to_left() == true then

for i = 1 , #self.stages[transition.get_next_stage_index()].environmnt_collisions do
local rect = self.stages[transition.get_next_stage_index()].environmnt_collisions[i].get_get_rectangle() 
local x = rect.x
local y = rect.y
local width = rect.width
local height = rect.height
x = x - w_of_s 
self.stages[transition.get_next_stage_index()].environmnt_collisions[i].set_rectangle(x,y,width,height)

end

elseif transition.get_to_down() == true then

for i = 1 , #self.stages[transition.get_next_stage_index()].environmnt_collisions do
local rect = self.stages[transition.get_next_stage_index()].environmnt_collisions[i].get_rectangle() 
local x = rect.x
local y = rect.y
local width = rect.width
local height = rect.height
y = y + h_of_s 
self.stages[transition.get_next_stage_index()].environmnt_collisions[i].set_rectangle(x,y,width,height)

end

end



end--end of function


self.draw_test_for_environment_collisions = function()

if self.get_next_stage().there_is_environment_collision() == true then
for i = 1 , #self.get_next_stage().environmnt_collisions do
self.get_next_stage().environmnt_collisions[i].draw_collision_test()
end
end

if self.get_current_stage().there_is_environment_collision() == true then
for i = 1 , #self.get_current_stage().environmnt_collisions do
self.get_current_stage().environmnt_collisions[i].draw_collision_test()
end
end


end




self.move_current_and_next_stage_animation_to_up = function(bool_to_move,speed)

if self.get_current_stage().there_is_animation() == true then
for i = 1 , #self.get_current_stage().animations do
self.get_current_stage().animations[i].animation.moving_up(bool_to_move,speed)
end
end

if self.get_next_stage().there_is_animation() == true then
for i = 1 , #self.get_next_stage().animations do
self.get_next_stage().animations[i].animation.moving_up(bool_to_move,speed)
end
end

end

self.move_current_and_next_stage_animation_to_right = function(bool_to_move,speed)

if self.get_current_stage().there_is_animation() == true then
for i = 1 , #self.get_current_stage().animations do
self.get_current_stage().animations[i].animation.moving_right(bool_to_move,speed)
end
end

if self.get_next_stage().there_is_animation() == true then
for i = 1 , #self.get_next_stage().animations do
self.get_next_stage().animations[i].animation.moving_right(bool_to_move,speed)
end
end

end

self.move_current_and_next_stage_animation_to_left = function(bool_to_move,speed)

if self.get_current_stage().there_is_animation() == true then
for i = 1 , #self.get_current_stage().animations do
self.get_current_stage().animations[i].animation.moving_left(bool_to_move,speed)
end
end

if self.get_next_stage().there_is_animation() == true then
for i = 1 , #self.get_next_stage().animations do
self.get_next_stage().animations[i].animation.moving_left(bool_to_move,speed)
end
end

end

self.move_current_and_next_stage_animation_to_down = function(bool_to_move,speed)

if self.get_current_stage().there_is_animation() == true then
for i = 1 , #self.get_current_stage().animations do
self.get_current_stage().animations[i].animation.moving_down(bool_to_move,speed)
end
end

if self.get_next_stage().there_is_animation() == true then
for i = 1 , #self.get_next_stage().animations do
self.get_next_stage().animations[i].animation.moving_down(bool_to_move,speed)
end
end

end



self.ready_all_stages_animations_to_use = function()--should be used in level after seting environmnt_collisions and transitions

for i = 1 , #self.stages do

self.ready_two_stages_animations_to_use(i,i+1)

end	

end



self.ready_two_stages_animations_to_use = function(stage_index_1 , stage_index_2)--abstract should be written in each level
end--end of function



self.animation_draw_current_and_next_stage = function()--should be use for const animations in stage(itrators == true)

--current should move when back move and when hero and back move
--current should move when back move and when hero and back move
--make four functions for moving current and next together

if self.get_current_stage().there_is_animation() == true then

for i = 1 , #self.get_current_stage().animations do

self.get_current_stage().animations[i].animation.draw()

end

end


if self.get_next_stage().there_is_animation() == true then

for i = 1 , #self.get_next_stage().animations do

self.get_next_stage().animations[i].animation.draw()

end

end


end--end of function




self.animation_update_current_and_next_stage = function(dt)--should be use for const animations in stage(itrators == true)

--current should move when back move and when hero and back move
--current should move when back move and when hero and back move
--make four functions for moving current and next together

if self.get_current_stage().there_is_animation() == true then

for i = 1 , #self.get_current_stage().animations do

self.get_current_stage().animations[i].animation.update(dt)

end

end


if self.get_next_stage().there_is_animation() == true  and self.get_next_stage() ~= self.get_current_stage() then

for i = 1 , #self.get_next_stage().animations do

self.get_next_stage().animations[i].animation.update(dt)

end

end


end--end of function

--make hero gain health at certain stages -> its better to get point instead if hero is at full health
self.health_up_at_stage =  function()
--print("hihiiihihihihihihihihihihih")
--print(stages_should_gain_health_at[1])
--print(self.get_current_stage_index())
for i = 1 , #self.stages_should_gain_health_at do
if self.get_current_stage_index() == self.stages_should_gain_health_at[i]-1 then
--print("hihiiihihihihihihihihihihih")	
if self.get_world().get_hero().getHealth() + self.health_that_should_pass_at_stages[i] >= self.get_world().get_hero().getMaxHealth() then
self.get_world().get_hero().health = self.get_world().get_hero().getMaxHealth()
else
self.get_world().get_hero().health = self.get_world().get_hero().health + self.health_that_should_pass_at_stages[i]	
end
end
end
end

self.set_stages_should_gain_health_at = function(stages_should_gain_health_at)
self.stages_should_gain_health_at = stages_should_gain_health_at
end
self.set_health_that_should_pass_at_stages = function(health_that_should_pass_at_stages)
self.health_that_should_pass_at_stages = health_that_should_pass_at_stages
end



return self

end