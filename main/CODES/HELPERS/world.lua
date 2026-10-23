require("CODES/HELPERS/environment_collisions")
require("CODES/HELPERS/SCALE")
--[[
physics
positions
collisions
--]]
function new_world()

local self = {}


self.beings = {}
self.hero = nil
self.lock_the_page = nil
--should make a function


main_scaler = NEW_MAIN_SCALER()

self.roof = new_environment_collision()
self.right_side = new_environment_collision()
self.left_side = new_environment_collision()
self.ground = new_environment_collision()



self.set_roof = function(x,y,width,height)
self.roof.set_rectangle(x,y,width,height)
end
self.get_roof = function()
return self.roof
end

self.set_right_side = function(x,y,width,height)
self.right_side.set_rectangle(x,y,width,height)
end
self.get_right_side = function()
return self.right_side
end

self.set_left_side = function(x,y,width,height)
self.left_side.set_rectangle(x,y,width,height)
end
self.get_left_side = function()
return self.left_side
end

self.set_ground = function(x,y,width,height)
self.ground.set_rectangle(x,y,width,height)
end
self.get_ground = function()
return self.ground
end



self.set_hero = function(hero)
hero.respawn_position_set()
self.hero = hero
end

self.get_hero = function()
return self.hero
end



self.add_being = function (enemys)
enemys.respawn_position_set()
table.insert(self.beings,enemys)
end--end of function


self.update_beings = function(dt , rectangle_for_collision , rectangle_for_gothit_except_two_last_hits_and_transforms_attacks , should_check_for_except_two_last_hits_and_transforms_attacks , rectangle_for_gothit_two_last_hits_and_spells , should_check_for_two_last_hits_and_spells , rectangle_for_gothit_summoned , should_check_for_summoned)

self.update_existance_of_beings()

for i = 1 , #self.beings do

if self.beings[i].respawn == true then

self.beings[i].update_state(dt , rectangle_for_collision , rectangle_for_gothit_except_two_last_hits_and_transforms_attacks , should_check_for_except_two_last_hits_and_transforms_attacks , rectangle_for_gothit_two_last_hits_and_spells , should_check_for_two_last_hits_and_spells , rectangle_for_gothit_summoned , should_check_for_summoned)

else

self.beings[i].respawning(dt)

end

end


end

self.update_hero = function(dt ,isidle ,thief , release , attacking , center_to_x , center_to_y , dodging , isrighty , islefty , last_move , bool , allenemies , rectangle_for_collision, level_transitioning_in_stages)




if self.hero.respawn == false then

self.hero.respawning(islefty,isrighty)

else


self.hero.update_state(dt ,isidle ,thief , release , attacking , center_to_x , center_to_y , dodging , isrighty , islefty , last_move, allenemies , level_transitioning_in_stages)
self.hero.movement(center_to_x,center_to_y,dt,bool)
self.hero.nearest_enemy = self.get_nearest_being_of_hero()

if self.hero.get_should_thief() == true then
if self.beings ~= nil then	
if self.get_nearest_being_of_hero() ~= nil then	
if self.hero.detect == nil then		
self.hero.detect_special_func(self.get_nearest_being_of_hero().get_detection())--[[this will act like this:::if there are any enemy then take the nearest enemy detection in world class!]]
self.hero.theif_set_special(self.get_nearest_being_of_hero().get_pics(),self.get_nearest_being_of_hero().get_sound_of_attack())
self.get_nearest_being_of_hero().set_should_show_shadow(false)
self.hero.enemy_has_stolen_ability = self.get_nearest_being_of_hero()
self.hero.thief = false
self.hero.thief_time = 2
self.hero.isidle = true
end
end
end
end
--if self.get_nearest_being_of_hero() ~= nil then	
--if self.hero.detect == nil then	
--self.hero.theif_set_special(self.get_nearest_being_of_hero().get_pics())
--end
--end

if self.hero.thief == true then
self.hero.thief_act(dt,last_move)
end

self.hero.summoned_update(dt,self.get_nearest_being_of_hero())

if self.hero.transform_pet ~= nil then
self.hero.transform_pet.transforms_update(dt,self.hero.thief,self.hero.summon_pet,self.hero.thief_pics,self.hero.center_x_coordinate,self.hero.center_y_coordinate,self.get_nearest_being_of_hero())
end



--[[ this is how rectangle for damaged for hero is calculated :
local rect.x = self.center_x_coordinate + ( 220 ) * main_scaler.scale_x
local rect.y = self.center_y_coordinate + ( 157 ) * main_scaler.scale_y
]]

if self.roof.get_to_be() then
if self.roof.detected_collision(self.get_hero().get_rectangle_for_damaged().x,self.get_hero().get_rectangle_for_damaged().y,self.get_hero().get_rectangle_for_damaged().width,self.get_hero().get_rectangle_for_damaged().height) then
self.get_hero().center_y_coordinate = self.roof.get_rectangle().y + self.roof.get_rectangle().height -( 157 * main_scaler.scale_y)
end
end

if self.right_side.get_to_be() then
if self.right_side.detected_collision(self.get_hero().get_rectangle_for_damaged().x,self.get_hero().get_rectangle_for_damaged().y,self.get_hero().get_rectangle_for_damaged().width,self.get_hero().get_rectangle_for_damaged().height) then
self.get_hero().center_x_coordinate = self.right_side.get_rectangle().x - (220 * main_scaler.scale_x  +   self.get_hero().get_rectangle_for_damaged().width) 
end
end

if self.left_side.get_to_be() then
if self.left_side.detected_collision(self.get_hero().get_rectangle_for_damaged().x,self.get_hero().get_rectangle_for_damaged().y,self.get_hero().get_rectangle_for_damaged().width,self.get_hero().get_rectangle_for_damaged().height) then
self.get_hero().center_x_coordinate = self.left_side.get_rectangle().x - ( 220 * main_scaler.scale_x)
end
end

if self.ground.get_to_be() then
if self.ground.detected_collision(self.get_hero().get_rectangle_for_damaged().x,self.get_hero().get_rectangle_for_damaged().y,self.get_hero().get_rectangle_for_damaged().width,self.get_hero().get_rectangle_for_damaged().height) then
self.get_hero().center_y_coordinate = self.ground.get_rectangle().y - (157 * main_scaler.scale_y  +   self.get_hero().get_rectangle_for_damaged().height) 
end
end




end--else of if self.beings[i].respawn == false then




end


self.draw_beings = function()

for i = 1 , #self.beings do

self.beings[i].draw()
--self.beings[i].draw_collision_for_damaged()
--self.beings[i].draw_range_of_attack_in_randomMode()
--self.beings[i].draw_collision_for_attacks()
--if self.get_hero().summon_pet ~= nil then
--self.get_hero().summon_pet.draw_collision_for_attacks()
--end

end


end


self.draw_hero = function(isrighty , islefty , last_move)

self.hero.draw(isrighty , islefty , last_move)
self.hero.summoned_draw() 
if self.hero.transform_pet ~= nil and self.hero.thief == true and self.hero.isgothit == false then
self.hero.transform_pet.transforms_draw(self.hero.thief_pics,last_move,self.hero.center_x_coordinate,self.hero.center_y_coordinate,self.get_nearest_being_of_hero())
end

--draw colisions:
--self.hero.draw_collision_for_except_two_last_hits_and_transforms_attacks()
--local x = self.get_hero().get_center_x_of_rectangle_for_damaged()
--local y = self.get_hero().get_center_y_of_rectangle_for_damaged()
--love.graphics.rectangle("fill",x,y,40,40)
--local ww  = love.graphics.getWidth()
--local hh = love.graphics.getHeight()
--love.graphics.rectangle("fill",ww/2,0,10,hh)
end








--helper functions :::
self.update_existance_of_beings = function()

for i = 1 , #self.beings do
if self.beings[i] ~= nil then
if self.beings[i].should_remove == true then
table.remove(self.beings,i)
end	
end
end

end--end of function


self.get_nearest_being_of_hero = function()


local nearest_dis = 99999999999999
local nearest = nil

for i = 1 , #self.beings do

if self.beings[i].isdead == false then

local rect1 = self.beings[i].get_rectangle_for_damaged()
local x1 = rect1.x + rect1.width / 2 
local y1 = rect1.y + rect1.height / 2
local rect2 = self.hero.get_rectangle_for_damaged()
local x2 = rect2.x + rect2.width / 2 
local y2 = rect2.y + rect2.height / 2  

if (math.abs(x2 - x1) +
    math.abs(y2 - y1) ) < nearest_dis then

nearest_dis = (math.abs(x2 - x1) +
    math.abs(y2 - y1) )

nearest = self.beings[i]

end

end

end

return nearest

end


self.get_nearest_being_of_hero_rectangle = function()
if self.get_nearest_being_of_hero() ~= nil then
return self.get_nearest_being_of_hero().get_rectangle_for_damaged()
end
end


self.get_all_beings = function()

return self.beings

end




self.get_hero_is_touching_the_roof = function()
return self.roof.get_to_be() and self.roof.detected_collision(self.get_hero().get_rectangle_for_damaged().x,self.get_hero().get_rectangle_for_damaged().y,self.get_hero().get_rectangle_for_damaged().width,self.get_hero().get_rectangle_for_damaged().height) 
end

self.get_hero_is_touching_the_right_side = function()
return self.right_side.get_to_be() and self.right_side.detected_collision(self.get_hero().get_rectangle_for_damaged().x,self.get_hero().get_rectangle_for_damaged().y,self.get_hero().get_rectangle_for_damaged().width,self.get_hero().get_rectangle_for_damaged().height) 
end


self.get_hero_is_touching_the_left_side = function()
return self.left_side.get_to_be() and self.left_side.detected_collision(self.get_hero().get_rectangle_for_damaged().x,self.get_hero().get_rectangle_for_damaged().y,self.get_hero().get_rectangle_for_damaged().width,self.get_hero().get_rectangle_for_damaged().height) 
end

self.get_hero_is_touching_the_ground = function()
return self.ground.get_to_be() and self.ground.detected_collision(self.get_hero().get_rectangle_for_damaged().x,self.get_hero().get_rectangle_for_damaged().y,self.get_hero().get_rectangle_for_damaged().width,self.get_hero().get_rectangle_for_damaged().height) 
end



--






return self

end	