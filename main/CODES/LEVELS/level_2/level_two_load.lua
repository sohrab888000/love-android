-- -> what should happens in scene one
-- -> what should happens in scene two
--and so on!
--should control the world_class --> the flow of responding enemies world functions should be here! not in main_code file
--should control the environment_collisions_clss --> still need to be better
--should control the background --> should control when stage has to change and how to change
--here along side the roof and ground and right side and left side will be more environmnt collisions(a list)that the choice will be made(like in world)
require("CODES/LEVELS/level_design_help") --if you using this code it is better you read it all! and all it requires...
require ("CODES/ENEMIES/LEVEL_TWO/orcs_model_one")--enemy1
require ("CODES/ENEMIES/LEVEL_TWO/orcs_model_mb")--enemy2
require ("CODES/ENEMIES/LEVEL_TWO/troll")--enemy3
--require ("boss_for_level_one")--boss
require("CODES/PLAYER/player")
require("CODES/HELPERS/SCALE")
--for test all requirments should change to level two
function level_two()







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
self.make_orc = function(center_x_coordinate,center_y_coordinate,img_get_hit,width_of_batch,height_of_batch,duration,bool_itarator)
local rand_set = love.math.random(1,6)
local orc = nil
if rand_set == 1 or rand_set == 4 then
orc = create_orc(center_x_coordinate,center_y_coordinate,self.orc_one_idle_set1,self.orc_one_run_set1,self.orc_one_attack_set1,self.orc_one_dodge_set1,self.orc_one_hurt_set1,self.orc_one_die_set1,self.orc_pics_for_thief,self.orc_sounds,0,-1*main_scaler.scale_x,-1*main_scaler.scale_x,0,-10,-10)
elseif rand_set == 2 or rand_set == 6 then 
orc = create_orc(center_x_coordinate,center_y_coordinate,self.orc_one_idle_set2,self.orc_one_run_set2,self.orc_one_attack_set2,self.orc_one_dodge_set2,self.orc_one_hurt_set2,self.orc_one_die_set2,self.orc_pics_for_thief,self.orc_sounds,5,1*main_scaler.scale_x,1*main_scaler.scale_y,1,10,-20)
elseif rand_set == 3 or rand_set == 5 then
orc = create_orc(center_x_coordinate,center_y_coordinate,self.orc_one_idle_set3,self.orc_one_run_set3,self.orc_one_attack_set3,self.orc_one_dodge_set3,self.orc_one_hurt_set3,self.orc_one_die_set3,self.orc_pics_for_thief,self.orc_sounds,10,2*main_scaler.scale_x,2*main_scaler.scale_y,1,-15,10)
end
orc.set_hero_hit_effect(img_get_hit,width_of_batch,height_of_batch,duration)
orc.set_hero_hit_effect_itrator(bool_itarator)
return orc
end

self.make_orc_model_one = function(center_x_coordinate,center_y_coordinate,img_get_hit,width_of_batch,height_of_batch,duration,bool_itarator)
local orc = nil
orc = create_orc(center_x_coordinate,center_y_coordinate,self.orc_one_idle_set1,self.orc_one_run_set1,self.orc_one_attack_set1,self.orc_one_dodge_set1,self.orc_one_hurt_set1,self.orc_one_die_set1,self.orc_pics_for_thief,self.orc_sounds,0,-1*main_scaler.scale_x,-1*main_scaler.scale_x,0,-10,-10)
orc.set_hero_hit_effect(img_get_hit,width_of_batch,height_of_batch,duration)
orc.set_hero_hit_effect_itrator(bool_itarator)
return orc
end

self.make_orc_model_two = function(center_x_coordinate,center_y_coordinate,img_get_hit,width_of_batch,height_of_batch,duration,bool_itarator)
local orc = nil
orc = create_orc(center_x_coordinate,center_y_coordinate,self.orc_one_idle_set2,self.orc_one_run_set2,self.orc_one_attack_set2,self.orc_one_dodge_set2,self.orc_one_hurt_set2,self.orc_one_die_set2,self.orc_pics_for_thief,self.orc_sounds,5,1*main_scaler.scale_x,1*main_scaler.scale_y,1,10,-20)
orc.set_hero_hit_effect(img_get_hit,width_of_batch,height_of_batch,duration)
orc.set_hero_hit_effect_itrator(bool_itarator)
return orc
end

self.make_orc_model_three = function(center_x_coordinate,center_y_coordinate,img_get_hit,width_of_batch,height_of_batch,duration,bool_itarator)
local orc = nil
orc = create_orc(center_x_coordinate,center_y_coordinate,self.orc_one_idle_set3,self.orc_one_run_set3,self.orc_one_attack_set3,self.orc_one_dodge_set3,self.orc_one_hurt_set3,self.orc_one_die_set3,self.orc_pics_for_thief,self.orc_sounds,10,2*main_scaler.scale_x,2*main_scaler.scale_y,1,-15,10)
orc.set_hero_hit_effect(img_get_hit,width_of_batch,height_of_batch,duration)
orc.set_hero_hit_effect_itrator(bool_itarator)
return orc
end




self.make_troll = function(center_x_coordinate,center_y_coordinate,img_get_hit,width_of_batch,height_of_batch,duration,bool_itarator)
local troll = create_troll(center_x_coordinate,center_y_coordinate,self.troll_idle,self.troll_move,self.troll_attack,self.troll_hittwirl,self.troll_pics_for_thief,self.troll_gothit,self.troll_dead,self.troll_knockdown,self.troll_onground,self.troll_getup,self.troll_sounds)
troll.set_hero_hit_effect(img_get_hit,width_of_batch,height_of_batch,duration)
troll.set_hero_hit_effect_itrator(bool_itarator)
return troll
end



self.make_orc_mb = function(center_x_coordinate,center_y_coordinate,img_get_hit,width_of_batch,height_of_batch,duration,bool_itarator)
local rand_set = love.math.random(1,6)
local orc = nil
if rand_set == 1 or rand_set == 4 then 
orc = create_orc_mb(center_x_coordinate,center_y_coordinate,self.orc_mb_one_idle_set1,self.orc_mb_one_run_set1,self.orc_mb_one_attack_set1,self.orc_mb_one_jump_set1,self.orc_mb_one_hurt_set1,self.orc_mb_one_die_set1,self.orc_mb_pics_for_thief,self.orc_mb_sounds,0,0,0,1,10,-15)
elseif rand_set == 2 or rand_set == 6 then 
orc = create_orc_mb(center_x_coordinate,center_y_coordinate,self.orc_mb_one_idle_set2,self.orc_mb_one_run_set2,self.orc_mb_one_attack_set2,self.orc_mb_one_jump_set2,self.orc_mb_one_hurt_set2,self.orc_mb_one_die_set2,self.orc_mb_pics_for_thief,self.orc_mb_sounds,5,1*main_scaler.scale_x,1*main_scaler.scale_y,2,-10,0)
elseif rand_set == 3 or rand_set == 5 then
orc = create_orc_mb(center_x_coordinate,center_y_coordinate,self.orc_mb_one_idle_set3,self.orc_mb_one_run_set3,self.orc_mb_one_attack_set3,self.orc_mb_one_jump_set3,self.orc_mb_one_hurt_set3,self.orc_mb_one_die_set3,self.orc_mb_pics_for_thief,self.orc_mb_sounds,10,2*main_scaler.scale_x,2*main_scaler.scale_y,2,10,0)
end
orc.set_hero_hit_effect(img_get_hit,width_of_batch,height_of_batch,duration)
orc.set_hero_hit_effect_itrator(bool_itarator)
return orc
end

self.make_orc_mb_model_one = function(center_x_coordinate,center_y_coordinate,img_get_hit,width_of_batch,height_of_batch,duration,bool_itarator)
local orc = nil
orc = create_orc_mb(center_x_coordinate,center_y_coordinate,self.orc_mb_one_idle_set1,self.orc_mb_one_run_set1,self.orc_mb_one_attack_set1,self.orc_mb_one_jump_set1,self.orc_mb_one_hurt_set1,self.orc_mb_one_die_set1,self.orc_mb_pics_for_thief,self.orc_mb_sounds,0,0,0,1,10,-15)
orc.set_hero_hit_effect(img_get_hit,width_of_batch,height_of_batch,duration)
orc.set_hero_hit_effect_itrator(bool_itarator)
return orc
end

self.make_orc_mb_model_two = function(center_x_coordinate,center_y_coordinate,img_get_hit,width_of_batch,height_of_batch,duration,bool_itarator)
local orc = nil
orc = create_orc_mb(center_x_coordinate,center_y_coordinate,self.orc_mb_one_idle_set2,self.orc_mb_one_run_set2,self.orc_mb_one_attack_set2,self.orc_mb_one_jump_set2,self.orc_mb_one_hurt_set2,self.orc_mb_one_die_set2,self.orc_mb_pics_for_thief,self.orc_mb_sounds,5,1*main_scaler.scale_x,1*main_scaler.scale_y,2,-10,0)
orc.set_hero_hit_effect(img_get_hit,width_of_batch,height_of_batch,duration)
orc.set_hero_hit_effect_itrator(bool_itarator)
return orc
end

self.make_orc_mb_model_three = function(center_x_coordinate,center_y_coordinate,img_get_hit,width_of_batch,height_of_batch,duration,bool_itarator)
local orc = nil
orc = create_orc_mb(center_x_coordinate,center_y_coordinate,self.orc_mb_one_idle_set3,self.orc_mb_one_run_set3,self.orc_mb_one_attack_set3,self.orc_mb_one_jump_set3,self.orc_mb_one_hurt_set3,self.orc_mb_one_die_set3,self.orc_mb_pics_for_thief,self.orc_mb_sounds,10,2*main_scaler.scale_x,2*main_scaler.scale_y,2,10,0)
orc.set_hero_hit_effect(img_get_hit,width_of_batch,height_of_batch,duration)
orc.set_hero_hit_effect_itrator(bool_itarator)
return orc
end


--override
self.spawn_stage_enemys_and_boss = function()

for i = 1, #self.get_current_stage().list_of_enemy1 do

if self.get_current_stage().list_of_enemy1[i].bool == true then
local enemy = self.get_current_stage().list_of_enemy1[i].enemy

if enemy.name == "orc" then
self.get_world().add_being(self.make_orc(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy1,i)

elseif enemy.name == "orc_model_one" then
self.get_world().add_being(self.make_orc_model_one(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy1,i)	

elseif enemy.name == "orc_model_two" then
self.get_world().add_being(self.make_orc_model_two(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy1,i)	

elseif enemy.name == "orc_model_three" then
self.get_world().add_being(self.make_orc_model_three(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy1,i)	

elseif enemy.name == "orc_mb" then
self.get_world().add_being(self.make_orc_mb(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy1,i)

elseif enemy.name == "orc_mb_model_one" then
self.get_world().add_being(self.make_orc_mb_model_one(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy1,i)

elseif enemy.name == "orc_mb_model_two" then
self.get_world().add_being(self.make_orc_mb_model_two(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy1,i)

elseif enemy.name == "orc_mb_model_three" then
self.get_world().add_being(self.make_orc_mb_model_three(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy1,i)

elseif enemy.name == "troll" then
self.get_world().add_being(self.make_troll(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy1,i)

end

end

end


for i = 1, #self.get_current_stage().list_of_enemy2 do

if self.get_current_stage().list_of_enemy2[i].bool == true then
local enemy = self.get_current_stage().list_of_enemy2[i].enemy

if enemy.name == "orc" then
self.get_world().add_being(self.make_orc(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy2,i)

elseif enemy.name == "orc_model_one" then
self.get_world().add_being(self.make_orc_model_one(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy2,i)	

elseif enemy.name == "orc_model_two" then
self.get_world().add_being(self.make_orc_model_two(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy2,i)	

elseif enemy.name == "orc_model_three" then
self.get_world().add_being(self.make_orc_model_three(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy2,i)	

elseif enemy.name == "orc_mb" then
self.get_world().add_being(self.make_orc_mb(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy2,i)

elseif enemy.name == "orc_mb_model_one" then
self.get_world().add_being(self.make_orc_mb_model_one(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy2,i)

elseif enemy.name == "orc_mb_model_two" then
self.get_world().add_being(self.make_orc_mb_model_two(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy2,i)

elseif enemy.name == "orc_mb_model_three" then
self.get_world().add_being(self.make_orc_mb_model_three(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy2,i)


elseif enemy.name == "troll" then
self.get_world().add_being(self.make_troll(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy2,i)

end

end

end

for i = 1, #self.get_current_stage().list_of_enemy3 do

if self.get_current_stage().list_of_enemy3[i].bool == true then
local enemy = self.get_current_stage().list_of_enemy3[i].enemy

if enemy.name == "orc" then
self.get_world().add_being(self.make_orc(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy3,i)

elseif enemy.name == "orc_model_one" then
self.get_world().add_being(self.make_orc_model_one(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy3,i)	

elseif enemy.name == "orc_model_two" then
self.get_world().add_being(self.make_orc_model_two(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy3,i)	

elseif enemy.name == "orc_model_three" then
self.get_world().add_being(self.make_orc_model_three(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy3,i)	

elseif enemy.name == "orc_mb" then
self.get_world().add_being(self.make_orc_mb(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy3,i)

elseif enemy.name == "orc_mb_model_one" then
self.get_world().add_being(self.make_orc_mb_model_one(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy3,i)

elseif enemy.name == "orc_mb_model_two" then
self.get_world().add_being(self.make_orc_mb_model_two(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy3,i)

elseif enemy.name == "orc_mb_model_three" then
self.get_world().add_being(self.make_orc_mb_model_three(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
table.remove(self.get_current_stage().list_of_enemy3,i)

elseif enemy.name == "troll" then
self.get_world().add_being(self.make_troll(enemy.x,enemy.y,self.effect_hit_player,64,64,0.032,false))
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




return self

end