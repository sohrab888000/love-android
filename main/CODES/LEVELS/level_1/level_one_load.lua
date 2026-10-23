-- -> what should happens in scene one
-- -> what should happens in scene two
--and so on!
--should control the world_class --> the flow of responding enemies world functions should be here! not in main_code file
--should control the environment_collisions_clss --> still need to be better
--should control the background --> should control when stage has to change and how to change
--here along side the roof and ground and right side and left side will be more environmnt collisions(a list)that the choice will be made(like in world)
require("CODES/LEVELS/level_design_help") --if you using this code it is better you read it all! and all it requires...
require ("CODES/ENEMIES/LEVEL_ONE/baron")--enemy1
require ("CODES/ENEMIES/LEVEL_ONE/darksaber")--enemy2
require ("CODES/ENEMIES/LEVEL_ONE/hopper")--enemy3
--require ("boss_for_level_one")--boss
require("CODES/PLAYER/player")
require("CODES/HELPERS/SCALE")

function level_one()







local self = new_level_design()

self.initial = false

self.loading_player = false

self.loading_orc = true

self.loading_orc_mb = true

self.loading_troll = true

self.loading_background_and_animations = true

self.loading_and_setting = true



main_scaler = NEW_MAIN_SCALER()



--loading level(new function)
--abstract
self.loading = function()
end


--initial:(new function)
--abstract
self.init = function()
end--end of function





--set enemies for each stage:(new functions)
self.make_baron = function(center_x_coordinate,center_y_coordinate,img_get_hit,width_of_batch,height_of_batch,duration,bool_itarator)
local baron = nil
baron = create_baron(center_x_coordinate,center_y_coordinate,self.baron_idle,self.baron_run,self.baron_attack,self.baron_hurt,self.baron_die,self.baron_pics_for_thief,self.baron_sounds,0,0,0,0,0,0)
baron.set_hero_hit_effect(img_get_hit,width_of_batch,height_of_batch,duration)
baron.set_hero_hit_effect_itrator(bool_itarator)
return baron
end

self.make_darksaber = function(center_x_coordinate,center_y_coordinate,img_get_hit,width_of_batch,height_of_batch,duration,bool_itarator)
local darksaber = nil
darksaber = create_darksaber(center_x_coordinate,center_y_coordinate,self.darksaber_idle,self.darksaber_run,self.darksaber_attack,self.darksaber_die,self.darksaber_pics_for_thief,self.darksaber_sounds,0,0,0,0,0,0)
darksaber.set_hero_hit_effect(img_get_hit,width_of_batch,height_of_batch,duration)
darksaber.set_hero_hit_effect_itrator(bool_itarator)
return darksaber
end

self.make_hopper = function(center_x_coordinate,center_y_coordinate,img_get_hit,width_of_batch,height_of_batch,duration,bool_itarator)
local hopper = nil
hopper = create_hopper(center_x_coordinate,center_y_coordinate,self.hopper_idle,self.hopper_run,self.hopper_attack,self.hopper_hurt,self.hopper_die,self.hopper_pics_for_thief,self.hopper_sounds,0,0,0,0,0,0)
hopper.set_hero_hit_effect(img_get_hit,width_of_batch,height_of_batch,duration)
hopper.set_hero_hit_effect_itrator(bool_itarator)
return hopper
end


--override
self.spawn_stage_enemys_and_boss = function()

for i = 1, #self.get_current_stage().list_of_enemy1 do

if self.get_current_stage().list_of_enemy1[i].bool == true then
local enemy = self.get_current_stage().list_of_enemy1[i].enemy

if enemy.name == "baron" then
self.get_world().add_being(self.make_baron(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy1,i)

elseif enemy.name == "darksaber" then
self.get_world().add_being(self.make_darksaber(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy1,i)

elseif enemy.name == "hopper" then
self.get_world().add_being(self.make_hopper(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy1,i)

end

end

end


for i = 1, #self.get_current_stage().list_of_enemy2 do

if self.get_current_stage().list_of_enemy2[i].bool == true then
local enemy = self.get_current_stage().list_of_enemy2[i].enemy

if enemy.name == "baron" then
self.get_world().add_being(self.make_baron(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy2,i)

elseif enemy.name == "darksaber" then
self.get_world().add_being(self.make_darksaber(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy2,i)

elseif enemy.name == "hopper" then
self.get_world().add_being(self.make_hopper(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy2,i)

end

end

end

for i = 1, #self.get_current_stage().list_of_enemy3 do

if self.get_current_stage().list_of_enemy3[i].bool == true then
local enemy = self.get_current_stage().list_of_enemy3[i].enemy

if enemy.name == "baron" then
self.get_world().add_being(self.make_baron(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy3,i)

elseif enemy.name == "darksaber" then
self.get_world().add_being(self.make_darksaber(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy3,i)

elseif enemy.name == "hopper" then
self.get_world().add_being(self.make_hopper(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy3,i)

end

end

end

for i = 1, #self.get_current_stage().list_of_boss do

if self.get_current_stage().list_of_boss[i].bool == true then

self.get_world().add_being(self.get_current_stage().list_of_boss[i].enemy)
table.remove(self.get_current_stage().list_of_boss,i)

end

end


end


--[[
self.set_for_shake = function()

for i = 1 , #self.get_world().beings do

if self.get_world().beings[i].get_detection() == "orc_mb" then
if 
self.get_world().beings[i].time_for_patern_movement1 == -1 and
self.get_world().beings[i].time_for_patern_movement2 == -1 and
self.get_world().beings[i].time_for_patern_movement3 == -1 
then

--vaghti orc_mb -> jump attack mikonad va zaman kolle attack ha tamam shode bashad zamin hamchenan milarzad!     
self.get_background().set_shake(true)
self.get_background().set_time_to_shake(1)

end -- inner if

end--if

end--for

if self.get_world().get_hero().detect == "orc_mb" then

if self.get_world().get_hero().thief == true and self.get_world().get_hero().thief_pics.frame == #self.get_world().get_hero().thief_pics.quads -1 then
self.get_background().set_shake(true)
self.get_background().set_time_to_shake(1)
end-- inner if

end-- if

end-- end of function


--]]

return self

end