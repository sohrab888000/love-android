require("CODES/PLAYER/level_one_transforms/darksaber") 
require("CODES/PLAYER/level_one_transforms/hopper")
require("CODES/PLAYER/level_one_summons/summon_baron")
require("CODES/PLAYER/level_two_summons/summon_orc")
require("CODES/PLAYER/level_two_transforms/troll") 
require("CODES/PLAYER/level_two_transforms/orc_mb") 
require("CODES/HELPERS/environment_collisions")
require("CODES/ANIMATION/animation_batch2")
require("CODES/HELPERS/SCALE")
require("CODES/SHADOWS/characters_shadows")
require("CODES/GUI/HUD/HUD")
function create_player(center_x_coordinate,center_y_coordinate,speed_slowment,Player_attacks_rage,idle,move,thief,dodge_gothit,die,shadow_transform,player_sounds)--,idle,moving,thief,attacks,dodges--[[]])

--ALL CODES :

local self = {}

self.should_show_lose = false
self.nearest_enemy = nil
self.enemy_has_stolen_ability = nil

--just for test losing
--self.health = 2
self.health = 50
self.maxHealth = self.health
self.getHealth = function() return self.health end
self.getMaxHealth = function() return self.maxHealth end

self.center_x_coordinate = center_x_coordinate
self.center_y_coordinate = center_y_coordinate
self.speed_slowment = speed_slowment 
self.respawn_x = nil
self.respawn_y = nil

self.idle = newAnimation2()
local img = idle
self.idle.set(img,128,128,5)
self.idle.set_itrator(true)

self.moving = newAnimation2()
local img = move
self.moving.set(img,128,128,5)
self.moving.set_itrator(true)

self.thief_pics = newAnimation2()
local img = thief
self.thief_pics.set(img,128,128,4)
self.thief_pics_org = thief
self.identifier_for_thief = self.thief_pics.quads[#self.thief_pics.quads]

self.attacks = Player_attacks_rage
self.attacks_frame = 1
self.attacks_framespeed = 10

self.img_for_attacks = self.attacks[1]
self.time_for_ignore = 40

self.dodging = newAnimation2()
local img = dodge_gothit
self.dodging.set(img,128,128,3)
self.dodging.set_itrator(true)

self.gothit = newAnimation2()
local img = dodge_gothit
self.gothit.set(img,128,128,5)
self.gothit.set_itrator(false)

self.die = newAnimation2()
local img = die
self.die.set(img,128,128,5)
self.die.set_itrator(false)

self.shadow_transform = newAnimation2()
local img = shadow_transform
self.shadow_transform.set(img,130,130,5)
self.shadow_transform.set_itrator(false)

self.shadow_transform2 = newAnimation2()
local img = shadow_transform
self.shadow_transform2.set(img,130,130,5)
self.shadow_transform2.set_itrator(false)

self.shadow_transform_bool = false
self.shadow_transform2_bool = false


self.isidle = false
self.walk = false
self.thief = false
self.detect = nil
self.summon_pet = nil
self.transform_pet = nil

self.attacking = false
self.dodge = false
self.dodge_time = 2
self.preventing_from_double_dodge_bool = false
self.preventing_from_double_dodge_time = 30

self.isgothit = false
self.isgothit_time = 1

self.isdead = false
self.isdead_time = 3
self.respawn = false

self.thief_time = 2

self.c_shadow = make_c_shodow()
self.rect_environment = new_environment_collision()  
--self.rect_environment.set_rectangle(self.get_rectangle_for_damaged().x,self.get_rectangle_for_damaged().y,self.get_rectangle_for_damaged().width,self.get_rectangle_for_damaged().height)
self.get_rect_environment = function()   return   self.rect_environment   end 

self.should_freez_in_x = false self.set_should_freez_in_x = function (freez) self.should_freez_in_x = freez end   self.get_should_freez_in_x = function() return self.should_freez_in_x end
self.should_freez_in_y = false self.set_should_freez_in_y = function (freez) self.should_freez_in_y = freez end   self.get_should_freez_in_y = function() return self.should_freez_in_y end


main_scaler = NEW_MAIN_SCALER()
--HUD
health_bar_x = nil--self.get_rectangle_for_damaged().x
health_bar_y = nil--self.get_center_y_of_rectangle_for_damaged() - self.get_rectangle_for_damaged().height 
health_bar_bar_img = love.graphics.newImage("ART/GUI/HUD/bar.png")
health_bar_inbar_imgs = {}
health_bar_inbar_imgs[1] = love.graphics.newImage("ART/GUI/HUD/hero_inbar1.png")
health_bar_inbar_imgs[2] = love.graphics.newImage("ART/GUI/HUD/hero_inbar2.png")
self.health_bar_HUD = make_hud(health_bar_x,health_bar_y,health_bar_bar_img,health_bar_inbar_imgs)
self.health_bar_HUD.setHealth(self.health) 
self.health_bar_HUD.setMaxHealth(self.maxHealth)
--HUD

--sounds
self.sounds = player_sounds--[[1:attack-2:die-3:gothit-4:summon-5,6:transform-7:dodge-8:soundOf summon/transfrom from enemy]]
self.should_play_death_sound = true
self.should_play_death_summon_sound = false

self.draw = function(isrighty , islefty , last_move)


local x = self.center_x_coordinate - ((128--[[width_of_quads]]/2) * main_scaler.scale_x)
local y = self.center_y_coordinate - ((128--[[height_of_quads]]/2) * main_scaler.scale_y)



if self.respawn == false then
if not(self.thief == true and self.transform_pet ~= nil) then--
self.c_shadow.draw(self.respawn_x+( 220 ) * main_scaler.scale_x + main_scaler.width * 0.0397 * main_scaler.scale_x +(main_scaler.width * 0.04 * main_scaler.scale_x)/4,self.respawn_y+ ( 157 ) * main_scaler.scale_y + 0.07 * main_scaler.height * main_scaler.scale_y+ (0.1 * main_scaler.height * main_scaler.scale_y), ( (0.025 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.01 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
end--
self.moving.set_position(self.respawn_x,self.respawn_y)	
if isrighty == true then	
self.moving.set_scale(((0.4*main_scaler.width)/128--[[width_of_quads]])*main_scaler.scale_x,((0.4*main_scaler.height)/128)*main_scaler.scale_y)
self.moving.draw(0,0)
elseif islefty == true then
self.moving.set_scale((-(0.4*main_scaler.width)/128--[[width_of_quads]])*main_scaler.scale_x,((0.4*main_scaler.height)/128)*main_scaler.scale_y)
self.moving.draw(128,0)	
end





else

if not(self.thief == true and self.detect ~= nil) then
health_bar_x = self.get_rectangle_for_damaged().x - self.get_rectangle_for_damaged().width/2 -10 * main_scaler.scale_x
health_bar_y = self.get_center_y_of_rectangle_for_damaged() - (self.get_rectangle_for_damaged().height * 3/2) + 10 * main_scaler.scale_y
self.health_bar_HUD.setX(health_bar_x) 
self.health_bar_HUD.setY(health_bar_y) 
self.health_bar_HUD.setHealth(self.health) 
self.health_bar_HUD.draw()
end	


r = self.get_rectangle_for_damaged()
if not(self.thief == true and self.transform_pet ~= nil) then--
self.c_shadow.draw(r.x+r.width/4,r.y+r.height, ( (0.025 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.01 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
end--



if self.transform_pet ~= nil and self.thief == true and self.shadow_transform_bool == true then
self.shadow_transform.set_position(x - 25 * main_scaler.scale_x,y - 3 * main_scaler.scale_y)	
--if last_move == true then	
self.shadow_transform.set_scale(((0.4*main_scaler.width)/128--[[width_of_quads]])*main_scaler.scale_x,((0.4*main_scaler.height)/128)*main_scaler.scale_y)
self.shadow_transform.draw(0,0)
--else
--self.shadow_transform.set_scale((-(0.4*main_scaler.width)/130--[[width_of_quads]])*main_scaler.scale_x,((0.4*main_scaler.height)/130)*main_scaler.scale_y)
--self.shadow_transform.draw(130,0)	
--end	
end
if self.shadow_transform2_bool == true then
self.shadow_transform2.set_position(x - 25 * main_scaler.scale_x,y - 3 * main_scaler.scale_y)	
--if last_move == true then	
self.shadow_transform2.set_scale(((0.4*main_scaler.width)/128--[[width_of_quads]])*main_scaler.scale_x,((0.4*main_scaler.height)/128)*main_scaler.scale_y)
self.shadow_transform2.draw(0,0)
--else
--self.shadow_transform2.set_scale((-(0.4*main_scaler.width)/130--[[width_of_quads]])*main_scaler.scale_x,((0.4*main_scaler.height)/130)*main_scaler.scale_y)
--self.shadow_transform2.draw(130,0)	
--end	
end

if self.isdead == false then 


if self.isgothit == false then

if self.isidle == true then	
self.idle.set_position(x,y)	
if self.get_should_freez_in_y() and self.get_should_freez_in_x() and self.dodge == false then

if last_move == true or isrighty == true then	
self.idle.set_scale(((0.4*main_scaler.width)/128--[[width_of_quads]])*main_scaler.scale_x,((0.4*main_scaler.height)/128)*main_scaler.scale_y)
self.idle.draw(0,0)
elseif last_move == false or islefty == true then
self.idle.set_scale((-(0.4*main_scaler.width)/128--[[width_of_quads]])*main_scaler.scale_x,((0.4*main_scaler.height)/128)*main_scaler.scale_y)
self.idle.draw(128,0)	
end	


else

if last_move == true then	
self.idle.set_scale(((0.4*main_scaler.width)/128--[[width_of_quads]])*main_scaler.scale_x,((0.4*main_scaler.height)/128)*main_scaler.scale_y)
self.idle.draw(0,0)
else
self.idle.set_scale((-(0.4*main_scaler.width)/128--[[width_of_quads]])*main_scaler.scale_x,((0.4*main_scaler.height)/128)*main_scaler.scale_y)
self.idle.draw(128,0)	
end	

end


elseif self.walk == true then
self.moving.set_position(x,y)			
if isrighty == true then	
self.moving.set_scale(((0.4*main_scaler.width)/128--[[width_of_quads]])*main_scaler.scale_x,((0.4*main_scaler.height)/128)*main_scaler.scale_y)
self.moving.draw(0,0)
elseif islefty == true then
self.moving.set_scale((-(0.4*main_scaler.width)/128--[[width_of_quads]])*main_scaler.scale_x,((0.4*main_scaler.height)/128)*main_scaler.scale_y)
self.moving.draw(128,0)	
end



elseif self.thief == true then
self.thief_pics.set_position(x,y)	
if self.transform_pet == nil then	
if last_move == true then	
self.thief_pics.set_scale(((0.4*main_scaler.width)/128--[[width_of_quads]])*main_scaler.scale_x,((0.4*main_scaler.height)/128)*main_scaler.scale_y)
self.thief_pics.draw(0,0)
else
self.thief_pics.set_scale((-(0.4*main_scaler.width)/128--[[width_of_quads]])*main_scaler.scale_x,((0.4*main_scaler.height)/128)*main_scaler.scale_y)
self.thief_pics.draw(128,0)	
end
end



elseif self.attacking == true then
if last_move == true then	
love.graphics.draw(self.img_for_attacks , x , y , 0 , ( (0.4 * main_scaler.width)/self.img_for_attacks:getWidth() )  * main_scaler.scale_x , ( (0.4 * main_scaler.height)/self.img_for_attacks:getHeight() )  * main_scaler.scale_y )
--should show run anim
else
love.graphics.draw(self.img_for_attacks , x , y , 0 , ( -(0.4 * main_scaler.width)/self.img_for_attacks:getWidth() )  * main_scaler.scale_x , ( (0.4 * main_scaler.height)/self.img_for_attacks:getHeight() )  * main_scaler.scale_y , self.img_for_attacks:getWidth() , 0)
end




elseif self.dodge == true then
self.dodging.set_position(x,y)	
if last_move == true then
self.dodging.set_scale(((0.4*main_scaler.width)/128--[[width_of_quads]])*main_scaler.scale_x,((0.4*main_scaler.height)/128)*main_scaler.scale_y)
self.dodging.draw(0,0)	
else
self.dodging.set_scale((-(0.4*main_scaler.width)/128--[[width_of_quads]])*main_scaler.scale_x,((0.4*main_scaler.height)/128)*main_scaler.scale_y)
self.dodging.draw(128,0)
end



end






else--if self.isgothit == true

self.gothit.set_position(x,y)	
if last_move == true then
self.gothit.set_scale(((0.4*main_scaler.width)/128--[[width_of_quads]])*main_scaler.scale_x,((0.4*main_scaler.height)/128)*main_scaler.scale_y)
self.gothit.draw(0,0)	
else
self.gothit.set_scale((-(0.4*main_scaler.width)/128--[[width_of_quads]])*main_scaler.scale_x,((0.4*main_scaler.height)/128)*main_scaler.scale_y)
self.gothit.draw(128,0)
end




end-- if self.isgothit == true



--till here for self.isdead == false
else--if self.isdead == true

self.die.set_position(x,y)	
if last_move == true  then
self.die.set_scale(((0.4*main_scaler.width)/128--[[width_of_quads]])*main_scaler.scale_x,((0.4*main_scaler.height)/128)*main_scaler.scale_y)
self.die.draw(0,0)
else
self.die.set_scale((-(0.4*main_scaler.width)/128--[[width_of_quads]])*main_scaler.scale_x,((0.4*main_scaler.height)/128)*main_scaler.scale_y)
self.die.draw(128,0)
end

end--if self.isdead == true

end--if self.respawn == true



end-- end of function



self.detect_special_func = function(detect)--[[this will act like this:::if there are any enemy then take the nearest enemy detection in world class!]]

self.detect = detect

end


self.give_out_special = function()

self.detect = nil
self.transform_pet = nil
self.thief_pics.set(self.thief_pics_org,128,128,4)
if self.enemy_has_stolen_ability ~= nil then
self.enemy_has_stolen_ability.set_should_show_shadow(true)
end
end



--[[for taking]]
self.theif_set_special = function(pics,sound_off_attack)--[[take imgs from enemies]]

self.thief_pics.frame = 1
--should create a class just for choosing transform
if self.detect == "darksaber" then

self.thief_pics.set(pics,137,70,4)
self.transform_pet = darksaber_transform(self.detect,self.center_x_coordinate,self.center_y_coordinate)
self.shadow_transform.set_duration(3)
self.shadow_transform2.set_duration(5)

elseif self.detect == "hopper" then

self.thief_pics.set(pics,232,166,3)
self.transform_pet = hopper_transform(self.detect,self.center_x_coordinate,self.center_y_coordinate,self.nearest_enemy)
self.shadow_transform.set_duration(5)
self.shadow_transform2.set_duration(5)

elseif self.detect == "baron" then

self.thief_pics.set(pics,128,128,4)
self.should_play_death_summon_sound = true

elseif self.detect == "orc_mb" then

self.thief_pics.set(pics,216,177,4)
self.transform_pet = orc_mb_transform(self.detect,self.center_x_coordinate,self.center_y_coordinate)
self.shadow_transform.set_duration(1)
self.shadow_transform2.set_duration(5)

elseif self.detect == "troll" then

self.thief_pics.set(pics,170,124,4)
self.transform_pet = troll_transform(self.detect,self.center_x_coordinate,self.center_y_coordinate)
self.shadow_transform.set_duration(2)
self.shadow_transform2.set_duration(5)

elseif self.detect == "orc" then

self.thief_pics.set(pics,128,128,4)
self.should_play_death_summon_sound = true

end

self.sounds[8] = sound_off_attack

end


--[[for doing]]
self.thief_act = function(dt,last_move)

--level one
if self.detect == "baron" then

if self.summon_pet == nil and self.thief_pics.frame == #self.thief_pics.quads - 1 then
local rect = self.get_rectangle_for_damaged()
if last_move == true then
self.summon_pet = summon_one_baron(rect.x+(rect.width * 2.5),rect.y + rect.height/2)
self.summon_pet.isrighty = true
self.summon_pet.islefty = false
else
self.summon_pet = summon_one_baron(rect.x-(rect.width * 2),rect.y + rect.height/2)
self.summon_pet.isrighty = false
self.summon_pet.islefty = true
end	
end	

--level two	
elseif self.detect == "orc" then

if self.summon_pet == nil and self.thief_pics.frame == #self.thief_pics.quads - 1 then
local rect = self.get_rectangle_for_damaged()
if last_move == true then
self.summon_pet = summon_one_orc(rect.x+(rect.width * 2.5),rect.y + rect.height/2)
self.summon_pet.isrighty = true
self.summon_pet.islefty = false
else
self.summon_pet = summon_one_orc(rect.x-(rect.width * 2),rect.y + rect.height/2)
self.summon_pet.isrighty = false
self.summon_pet.islefty = true
end	
end

elseif self.detect == "orc_mb" then

--transform to orc and do the jump_attacking

elseif self.detect == "troll" then

if self.transform_pet.troll_time > 0 then
self.transform_pet.troll_act(last_move,self.get_rectangle_for_damaged())
self.center_x_coordinate = self.transform_pet.get_x()
self.center_y_coordinate = self.transform_pet.get_y()
end

end
--level two
end



self.get_summoned_is_attacking = function()--should create a class for it
--should change if have to summon more!
if self.summon_pet ~= nil then
return (self.detect == "orc" or self.detect == "baron") and
self.summon_pet.is_attacking() 
end



end


self.get_summoned_get_rectangle_collision_for_attack = function()

if self.summon_pet ~= nil then
return self.summon_pet.get_collision_for_attacks()
end

end

self.summoned_update = function(dt , target)

if self.summon_pet ~= nil then

if target == nil then
self.summon_pet.isdead = true
end

self.summon_pet.update_state(dt,target)

if self.summon_pet.should_remove == true then
self.summon_pet = nil
end

end


end

self.summoned_draw = function()

if self.summon_pet ~= nil then
self.summon_pet.draw()
end

end


self.movement = function(center_to_x,center_to_y,dt,bool)


if self.isdead == false and
self.isgothit == false and 
self.dodge == false and 
self.isidle == false and
self.thief == false and
self.attacking == false
and bool == false
then

if self.get_should_freez_in_x() == false then

self.center_x_coordinate = self.center_x_coordinate + (center_to_x / self.speed_slowment)

self.walk = true

end

if self.get_should_freez_in_y() == false then

self.center_y_coordinate = self.center_y_coordinate + (center_to_y / self.speed_slowment)

self.walk = true

end


else 

self.walk = false

end


end


self.update_state = function(dt , isidle ,thief , release , attacking , center_to_x , center_to_y , dodging , isrighty , islefty , last_move, allenemies , bool_transmiting_in_stages)

--sounds
self.play_sounds()


if self.get_should_freez_in_y() and self.get_should_freez_in_x() and self.dodge == false then


self.isidle = true
self.walk = false
self.thief = false
self.attacking = false
self.isgothit = false
self.isdead = false

--give_out_special when freez mode is on
self.give_out_special()
if self.summon_pet ~= nil then
self.summon_pet.isdead = true
end	
--


--this will be control in world class
self.rect_environment.set_rectangle(self.get_rectangle_for_damaged().x,self.get_rectangle_for_damaged().y,self.get_rectangle_for_damaged().width,self.get_rectangle_for_damaged().height)
--this is for rect_environment that allways should be active


else

self.rect_environment.set_rectangle(self.get_rectangle_for_damaged().x,self.get_rectangle_for_damaged().y,self.get_rectangle_for_damaged().width,self.get_rectangle_for_damaged().height)


if self.isdead == true then 


if self.isdead_time > 0  then

self.isdead_time = self.isdead_time - dt

else

self.should_show_lose = true

end


end--if self.isdead == true





if self.isdead == false then

--new
if self.thief == true and self.transform_pet ~= nil and self.thief_pics.frame == 1 then
self.shadow_transform_bool = true
self.shadow_transform2_bool = false
self.shadow_transform2.frame = 1
end	
if self.thief == true and self.transform_pet ~= nil and (self.shadow_transform.frame == #self.shadow_transform.quads) then
self.shadow_transform_bool = false
self.shadow_transform2_bool = true
self.shadow_transform.frame = 1
end	
if self.shadow_transform2.frame == #self.shadow_transform2.quads then
self.shadow_transform2_bool = false
self.shadow_transform_bool = false
end	
if self.thief == true and self.transform_pet ~= nil then
local boolean = false
if allenemies ~= nil then
for i = 1 , #allenemies do
if allenemies[i].isdead == false then
boolean = true 
end	
end
end	
if boolean == false then
self.shadow_transform_bool = false
self.shadow_transform2_bool = true
self.shadow_transform.frame = 1
end
end
--new

if allenemies ~= nil then

for i = 1 , #allenemies do

if allenemies[i].is_attacking() == true and
self.isgothit == false and
self.check_for_damaged_collision(allenemies[i].get_collision_for_attacks().x , allenemies[i].get_collision_for_attacks().y , allenemies[i].get_collision_for_attacks().width , allenemies[i].get_collision_for_attacks().height)
== true and self.dodge == false and self.thief == false and not(self.thief == true and self.summon_pet ~= nil) then

self.isgothit = true


--just for test:
if self.health > allenemies[i].get_collision_for_attacks().damage then
self.health = self.health - allenemies[i].get_collision_for_attacks().damage
else
self.health = 0
self.isdead = true
end--just for test


end

end

end




--if self.isgothit == true 
if self.isgothit == true then

if self.isgothit_time > 0 then

self.isgothit_time = self.isgothit_time - dt

else

self.isgothit = false
self.gothit.frame = 1
self.isgothit_time = 1

end

end
--if self.isgothit == true




if self.isgothit == false then

if self.thief_time >= 2 then
if self.thief_pics.frame ~= #self.thief_pics.quads then
if self.thief == false then 
self.thief = thief
end	
else
self.thief = false	
self.thief_time = 0
end
if (self.detect ~= nil and self.summon_pet ~= nil) or (#allenemies == 0 and (self.detect == "orc" or self.detect == "baron") --[[should make a function to get all possibilities of summoninig]]) or (#allenemies == 0) then
self.thief = false
end
end
if self.thief == true then
local boolean = false
if allenemies ~= nil then
for i = 1 , #allenemies do
if allenemies[i].isdead == false then
boolean = true 
end	
end
end	
if boolean == false then
self.thief = false
end
end

self.isidle = isidle

self.attacking = attacking

if release == true or bool_transmiting_in_stages then

self.give_out_special()
if self.summon_pet ~= nil then
self.summon_pet.isdead = true
end	
--should make an animation for it
end


if self.preventing_from_double_dodge_bool == false then

if dodging == true and self.thief == false then
self.dodge = true
end

else

if self.preventing_from_double_dodge_time >= 0 then

self.preventing_from_double_dodge_time = self.preventing_from_double_dodge_time - 1

else

self.preventing_from_double_dodge_bool = false
self.preventing_from_double_dodge_time = 30

end	


end	



if self.thief == false then

self.thief_pics.frame = 1

else

self.isidle = false

self.attacking = false

end

if self.attacking == true then

self.isidle = false

else

if self.time_for_ignore < 0 then

self.attacks_frame = 1

self.time_for_ignore = 40 

else

self.time_for_ignore = self.time_for_ignore - 1

end

end


if self.dodge == false then

self.dodge_time = 30
self.dodging.frame = 1

else

self.isidle = false

self.attacking = false

if self.dodge_time <= 0 then

self.dodge = false
self.preventing_from_double_dodge_bool = true
self.isidle = true

if self.thief_time >= 2 then
if self.thief_pics.frame ~= #self.thief_pics.quads then
if self.thief == false then 
self.thief = thief
end	
else
self.thief = false	
self.thief_time = 0
end
if (self.detect ~= nil and self.summon_pet ~= nil) or (#allenemies == 0 and (self.detect == "orc" or self.detect == "baron") --[[should make a function to get all possibilities of summoninig]]) or (#allenemies == 0)  then
self.thief = false
end
end
if self.thief == true then
local boolean = false
if allenemies ~= nil then
for i = 1 , #allenemies do
if allenemies[i].isdead == false then
boolean = true 
end	
end
end	
if boolean == false then
self.thief = false
end
end

self.attacking = attacking


else

--code for doge
if last_move == false then	
if self.get_should_freez_in_x() == false then
self.center_x_coordinate = self.center_x_coordinate -  self.dodge_time * main_scaler.scale_x
end
else
if self.get_should_freez_in_x() == false then	
self.center_x_coordinate = self.center_x_coordinate +  self.dodge_time * main_scaler.scale_x
end
end
self.dodge_time = self.dodge_time - 1

end



end


if self.thief_time < 2 then
self.thief_time = self.thief_time + dt
end

end--if self.isgothit == false



end-- if self.isdead == false



end--freezing hero

--code for animations
if self.isdead == false then

if self.shadow_transform2_bool then
self.animate_shadow_transform2()
end

self.health_bar_HUD.update(dt)	
if self.isgothit == false then
if self.isidle == true then 

self.animate_idle()

elseif self.walk == true then

self.animate_move()

elseif self.thief == true then
self.animate_thief()

--shadow transform
if self.shadow_transform_bool then	
self.animate_shadow_transform()
end

--shadow transform
elseif self.attacking == true then

self.animate_attacks(dt) 

elseif self.dodge == true then

self.animate_dodging()


end-- if self.isgothit == false
else--if self.isgothit == true

self.animate_gothit()

end	--if self.isgothit == true



--till here for self.isdead == false
else

self.animate_die()

end--if self.isdead == true
--code for animations



end--end of function 











self.set_spell = function (spell)


self.spell = spell


end



---function for get attack for check and hiting enemys -> -> -> using in check collision  
self.get_attacks_except_two_last_hits_and_transforms_attacks = function()--and transform_pet
if self.transform_pet == nil then
return (self.attacking == true and (
self.attacks_frame == 9 or
self.attacks_frame == 23 or
self.attacks_frame == 34
)) 
else
return self.transform_pet.transforms_attacking() or
(self.attacking == true and (
self.attacks_frame == 9 or
self.attacks_frame == 23 or
self.attacks_frame == 34
)) 
end
end

self.get_attacks_two_last_hits_and_spells = function()
return (self.attacking == true and (self.attacks_frame == 55 or self.attacks_frame == 89)) 
end


--function for taking special bool returning
self.get_should_thief = function()

return self.thief == true and #self.thief_pics.quads == 9 and self.thief_pics.frame == 9

end


self.get_collision_for_except_two_last_hits_and_transforms_attacks = function(last_move)

local rectangle_for_attack = { x = nil , y = nil , width = nil , height = nil}


local x_R = self.center_x_coordinate + ( 220 ) * main_scaler.scale_x
local y_R = self.center_y_coordinate + ( 110 ) * main_scaler.scale_y

--attacks_except_two_last_hits
if last_move == true then
rectangle_for_attack.x = x_R
rectangle_for_attack.y = y_R
rectangle_for_attack.width = main_scaler.width * 0.2 * main_scaler.scale_x
rectangle_for_attack.height = 0.17 * main_scaler.height * main_scaler.scale_y
else
--[[ the normal way!
rectangle_for_attack.x = x_R + main_scaler.width * 0.04 * main_scaler.scale_x
rectangle_for_attack.y = y_R
rectangle_for_attack.width = - main_scaler.width * 0.2 * main_scaler.scale_x 
rectangle_for_attack.height = 0.17 * main_scaler.height * main_scaler.scale_y
--]]
rectangle_for_attack.x = (x_R + main_scaler.width * 0.04 * main_scaler.scale_x) - (main_scaler.width * 0.2 * main_scaler.scale_x )
rectangle_for_attack.y = y_R
rectangle_for_attack.width = main_scaler.width * 0.2 * main_scaler.scale_x 
rectangle_for_attack.height = 0.17 * main_scaler.height * main_scaler.scale_y
end	

rectangle_for_attack.damage = 1
--attacks_except_two_last_hits


--transforms
--[[1]] --: orc mb::::
if self.detect == "orc_mb"
and self.transform_pet ~= nil 
and self.transform_pet.transforms_attacking()  
then
rectangle_for_attack.x = 0
rectangle_for_attack.y = 0
rectangle_for_attack.width = main_scaler.width * main_scaler.scale_x 
rectangle_for_attack.height = main_scaler.height * main_scaler.scale_y
rectangle_for_attack.damage = 4
end


if self.detect == "troll"
and self.transform_pet ~= nil 
and self.transform_pet.transforms_attacking()  
then
rectangle_for_attack = self.get_rectangle_for_damaged()
rectangle_for_attack.damage = 3
end

if self.detect == "darksaber"
and self.transform_pet ~= nil 
and self.transform_pet.transforms_attacking()  
then
r = self.get_rectangle_for_damaged()	
rectangle_for_attack.x = r.x - (r.width * 2)
rectangle_for_attack.y = r.y
rectangle_for_attack.width = r.width * 5.5
rectangle_for_attack.height = r.height + 50 * main_scaler.scale_y
rectangle_for_attack.damage = 5
end

if self.detect == "hopper"
and self.transform_pet ~= nil 
and self.transform_pet.transforms_attacking() and self.transform_pet.target ~= nil 
then
r = self.transform_pet.target.get_rectangle_for_damaged()
rectangle_for_attack.x = r.x 
rectangle_for_attack.y = r.y
rectangle_for_attack.width = r.width
rectangle_for_attack.height = r.height 
rectangle_for_attack.damage = 4
end

return rectangle_for_attack

end

self.draw_collision_for_except_two_last_hits_and_transforms_attacks = function ()
rect = self.get_collision_for_except_two_last_hits_and_transforms_attacks()
if self.detect == "darksaber"
and self.transform_pet ~= nil 
and self.transform_pet.transforms_attacking()  
then
love.graphics.rectangle("fill",rect.x,rect.y,rect.width,rect.height)
end
end

self.draw_collision_for_attacks_except_two_last_hits_and_spells = function(last_move)


local x_R = self.center_x_coordinate + ( 220 ) * main_scaler.scale_x
local y_R = self.center_y_coordinate + ( 110 ) * main_scaler.scale_y


if 
self.attacking == true and (
self.attacks_frame == 9 or
self.attacks_frame == 23 or
self.attacks_frame == 34 ) then

if last_move == true then
love.graphics.rectangle("fill" , x_R , y_R , main_scaler.width * 0.2 * main_scaler.scale_x , 0.17 * main_scaler.height * main_scaler.scale_y)
else
love.graphics.rectangle("fill" , x_R + main_scaler.width * 0.04 * main_scaler.scale_x , y_R , - main_scaler.width * 0.2 * main_scaler.scale_x , 0.17 * main_scaler.height * main_scaler.scale_y)
end

end



end




self.get_collision_for_attacks_two_last_hits_and_spells = function()

local rectangle_for_attack = { x = 1 , y = 1 , width = 1 , height = 1 }


local x = self.center_x_coordinate + ( 10 ) * main_scaler.scale_x
local y = self.center_y_coordinate + ( 125 ) * main_scaler.scale_y

rectangle_for_attack.x = x
rectangle_for_attack.y = y
rectangle_for_attack.width = main_scaler.width * 0.3 * main_scaler.scale_x
rectangle_for_attack.height = 0.13 * main_scaler.height * main_scaler.scale_y
rectangle_for_attack.damage = 2
return rectangle_for_attack

end



self.draw_collision_for_attacks_two_last_hits_and_spells = function()


local x = self.center_x_coordinate + ( 10 ) * main_scaler.scale_x
local y = self.center_y_coordinate + ( 125 ) * main_scaler.scale_y

if 
self.attacking == true and (
self.img_for_attacks == self.attacks[55] or
self.img_for_attacks == self.attacks[89] 
)then
love.graphics.rectangle("fill" , x , y , main_scaler.width * 0.3 * main_scaler.scale_x , 0.13 * main_scaler.height * main_scaler.scale_y)
end

end








self.check_for_damaged_collision = function(enemy_x , enemy_y , attacks_width , attacks_height )


local function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
 return x1 < x2+w2 and
 x2 < x1+w1 and
 y1 < y2+h2 and
 y2 < y1+h1
end



local x = self.center_x_coordinate + ( 220 ) * main_scaler.scale_x
local y = self.center_y_coordinate + ( 157 ) * main_scaler.scale_y

return CheckCollision(x , y , main_scaler.width * 0.04 * main_scaler.scale_x ,  0.1 * main_scaler.height * main_scaler.scale_y , enemy_x , enemy_y , attacks_width , attacks_height)




end



self.draw_collision_for_damaged = function()


local x = self.center_x_coordinate + ( 220 ) * main_scaler.scale_x
local y = self.center_y_coordinate + ( 157 ) * main_scaler.scale_y

love.graphics.rectangle("fill" , x , y , main_scaler.width * 0.04 * main_scaler.scale_x , 0.1 * main_scaler.height * main_scaler.scale_y)

end



self.get_rectangle_for_damaged = function()

local rectangle = {x = 1 , y = 1 , width = 1 , height = 1}

local x = self.center_x_coordinate + ( 220 ) * main_scaler.scale_x
local y = self.center_y_coordinate + ( 157 ) * main_scaler.scale_y

rectangle.x = x
rectangle.y = y
rectangle.width = main_scaler.width * 0.04 * main_scaler.scale_x
rectangle.height = 0.1 * main_scaler.height * main_scaler.scale_y

return rectangle

end

self.get_center_x_of_rectangle_for_damaged = function()
local rect = self.get_rectangle_for_damaged()
local to_return = (rect.x + (rect.width/2)) 
return to_return
end


self.get_center_y_of_rectangle_for_damaged = function()
local rect = self.get_rectangle_for_damaged()
local to_return = (rect.y + (rect.height/2)) 
return to_return
end

--function for get thief for check and thiefing attacks from enemys


self.animate_idle = function()

self.idle.update(1)

end



self.animate_move = function()

self.moving.update(1)

end


self.animate_thief = function()
self.thief_pics.update(1)
if self.transform_pet ~= nil and self.transform_pet.get_dont_stop_on_last_frame() == true then
self.thief_pics.set_itrator(true)
else
self.thief_pics.set_itrator(false)
end
end




self.animate_dodging = function()

self.dodging.update(1)

end




self.animate_attacks = function(dt)

if self.attacks_framespeed > 1 * dt then

if self.attacks_frame < #self.attacks then

self.attacks_frame = self.attacks_frame + 1	

else

self.attacks_frame = 1

end

end


self.img_for_attacks = self.attacks[self.attacks_frame]



end





self.animate_gothit = function()

self.gothit.update(1)


end





self.animate_die = function()

self.die.update(1)

end



self.animate_shadow_transform = function()

self.shadow_transform.update(1)

end

self.animate_shadow_transform2 = function()

self.shadow_transform2.update(1)

end



self.should_show_losed = function()

return self.should_show_lose

end


self.draw_collision_environment_test = function()

local main_rect = self.get_rect_environment() 
local u_r = main_rect.get_U_rect()
local r_r = main_rect.get_R_rect()
local l_r = main_rect.get_L_rect()
local d_r = main_rect.get_D_rect()

love.graphics.rectangle("fill",u_r.x,u_r.y,u_r.width,u_r.height)
love.graphics.rectangle("fill",r_r.x,r_r.y,r_r.width,r_r.height)
love.graphics.rectangle("fill",l_r.x,l_r.y,l_r.width,l_r.height)
love.graphics.rectangle("fill",d_r.x,d_r.y,d_r.width,d_r.height)

end


--get functions

self.get_center_x = function()

return self.center_x_coordinate

end








self.respawning = function(islefty,isrighty)

self.walk = true


local x = self.center_x_coordinate - ((128--[[width_of_quads]]/2) * main_scaler.scale_x)
local y = self.center_y_coordinate - ((128--[[height_of_quads]]/2) * main_scaler.scale_y)

if x <= main_scaler.screen_width/2 then

if math.abs(self.respawn_x - x) > 3 * main_scaler.scale_x then
self.respawn_x = self.respawn_x + 3 * main_scaler.scale_x
else
self.respawn_x = x	
end

else

if math.abs(self.respawn_x - x) > 3 * main_scaler.scale_x then
self.respawn_x = self.respawn_x - 3 * main_scaler.scale_x
else
self.respawn_x = x	
end	

end


if y <= main_scaler.screen_height/2 then

if math.abs(self.respawn_y - y) > 3 * main_scaler.scale_y then
self.respawn_y = self.respawn_y + 3 * main_scaler.scale_y
else
self.respawn_y = y	
end

else

if math.abs(self.respawn_y - y) > 3 * main_scaler.scale_y then
self.respawn_y = self.respawn_y - 3 * main_scaler.scale_y
else
self.respawn_y = y	
end	

end

self.animate_move(1)

--print(self.respawn_x)
--print(self.center_x_coordinate)
--print(self.respawn_y)
--print(self.center_y_coordinate)

if self.respawn_x == x and self.respawn_y == y then

self.respawn = true
--self.walk = false

end


end--end of function


self.respawn_position_set = function()

local x = self.center_x_coordinate - ((128--[[width_of_quads]]/2) * main_scaler.scale_x)
local y = self.center_y_coordinate - ((128--[[height_of_quads]]/2) * main_scaler.scale_y)

if x <= main_scaler.screen_width/2 then

self.respawn_x = - 400 * main_scaler.scale_x

if y <= main_scaler.screen_height/2 then

self.respawn_y = - 50 * main_scaler.scale_y

else

self.respawn_y = main_scaler.screen_height + 50 * main_scaler.scale_y

end

else

self.respawn_x = main_scaler.screen_width + 400 * main_scaler.scale_x

if y <= main_scaler.screen_height/2 then

self.respawn_y = - 50 * main_scaler.scale_y

else

self.respawn_y = main_scaler.screen_height + 50 * main_scaler.scale_y

end

end


end


self.get_isDead = function()
return self.isdead
end


--function for controling sounds:
--this method should get call in update of player
self.play_sounds = function()

if (self.attacking == true and (
self.attacks_frame == 9 or
self.attacks_frame == 23 or
self.attacks_frame == 34 or
self.attacks_frame == 55 or
self.attacks_frame == 89
)) then 
if not self.sounds[1]:isPlaying() then
self.sounds[1]:play()	
else
self.sounds[1]:stop()	
self.sounds[1]:play()		
end
end
if self.get_isDead() and self.should_play_death_sound then
if not self.sounds[2]:isPlaying() then
self.sounds[2]:play()	
self.should_play_death_sound = false
end
end
if self.isgothit then
if not self.sounds[3]:isPlaying() then
self.sounds[3]:play()	
end
end
if self.thief == true and self.summon_pet ~= nil then
if not self.sounds[4]:isPlaying() then
self.sounds[4]:play()	
end
end
if self.summon_pet ~= nil and self.summon_pet.isdead == true and self.should_play_death_summon_sound then
if not self.sounds[4]:isPlaying() then
self.sounds[4]:play()	
self.should_play_death_summon_sound = false
end
end
if self.shadow_transform.frame == 2 then
if not self.sounds[5]:isPlaying() then
self.sounds[5]:play()	
else 
self.sounds[5]:stop()	
self.sounds[5]:play()	
end
end
if self.shadow_transform2.frame == 2 then
if not self.sounds[6]:isPlaying() then
self.sounds[6]:play()	
else 
self.sounds[6]:stop()	
self.sounds[6]:play()	
end
end	
if self.dodge == true then
if not self.sounds[7]:isPlaying() then
self.sounds[7]:play()	
end
end
if self.summon_pet ~= nil and self.summon_pet.is_attacking() then
if not self.sounds[8]:isPlaying() then
self.sounds[8]:play()	
else
self.sounds[8]:stop()	
self.sounds[8]:play()		
end
end
if self.transform_pet ~= nil and self.thief == true and self.thief_pics.frame == #self.thief_pics.quads - 2
and self.detect ~= "troll" then
if not self.sounds[8]:isPlaying() then
self.sounds[8]:play()	
else
self.sounds[8]:stop()	
self.sounds[8]:play()		
end
end

end


return self

end










