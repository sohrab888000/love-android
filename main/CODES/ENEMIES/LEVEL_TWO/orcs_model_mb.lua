require("CODES/ANIMATION/animation_batch")
require("CODES/ANIMATION/animation_batch2")
require("CODES/HELPERS/SCALE")
require ("CODES/ENEMIES/Enemy")
require("CODES/SHADOWS/characters_shadows")

function create_orc_mb(center_x_coordinate,center_y_coordinate,orc_one_idle,orc_one_run,orc_one_attack,orc_one_dodge,orc_one_hurt,orc_one_die,orc_one_thief,orc_one_sounds,var_health,var_speed_x,var_speed_y,var_damage,var_time_move,var_time_attack)--,idle,moving,block,attacks,dodges--[[]])



--local rand_set = love.math.random(1,6)
--rand_set = 2

--ALL IMAGES:
--ORC1_IDLE (1).png
orc_one_run = orc_one_run

orc_one_idle = orc_one_idle

orc_one_attack = orc_one_attack

orc_one_dodge = orc_one_dodge

orc_one_hurt = orc_one_hurt

orc_one_die = orc_one_die

--ALL CODES :

local self = Enemy_creation()

self.center_x_coordinate = center_x_coordinate
self.center_y_coordinate = center_y_coordinate

self.saved_center_y_coordinate_before_jump_attack_to_show_shadow = nil -- -> in drawing
self.jump_attacking_from_up_to_down = false
self.jump_attacking_from_down_to_up = false

self.respawn_x = nil
self.respawn_y = nil

--just for test die
self.health = 40 + var_health
self.maxHealth = self.health
self.var_speed_x = var_speed_x
self.var_speed_y = var_speed_y
self.var_damage = var_damage                
self.get_var_damage = function() return self.var_damage end
self.var_time_move = var_time_move
self.var_time_attack = var_time_attack

--just to test removing
self.should_remove = false


self.idle = newAnimation2()
self.idle.set(orc_one_idle,151,102,3.5)
self.idle.set_itrator(true)

self.moving = newAnimation2()
self.moving.set(orc_one_run,155,185,3.5)
self.moving.set_itrator(true)

self.attacks = newAnimation2()
self.attacks.set(orc_one_attack,228,189,6)
self.attacks.set_itrator(true)
self.time_for_ignore = 40

self.dodging = newAnimation2()
self.dodging.set(orc_one_dodge,216,177,3)
self.dodging.set_itrator(false)

--[[
self.gothit = newAnimation2()
self.gothit.set(orc_one_hurt,170,134,3.5)
self.gothit.set_itrator(false)
--]]

self.die = newAnimation2()
self.die.set(orc_one_die,169,133,3.5)
self.die.set_itrator(false)


self.pics_for_thief = orc_one_thief



self.isrighty = false
self.islefty = false

self.isidle = false
self.walk = false
self.attacking = false
self.dodge = false
self.isgothit = false
self.isgothit_time = 1

self.jump_attacking = false
self.target_jump_x = nil
self.target_jump_y = nil
self.target_distance = nil
self.preventing_from_double_slam = false
self.preventing_jump_from_bug = false

self.stand_awhile = false
self.stand_awhile_time = 1


self.isdead = false
self.isdead_time = 5



self.random_pattern = 0
self.time_for_patern_movement1 = 0
self.time_for_patern_movement2 = 0
self.time_for_patern_movement3 = 0
self.time_for_movement = 20 + self.var_time_move  
self.time_for_attack = 30 + self.var_time_attack 



self.c_shadow = make_c_shodow()
self.hero_hit_effect = newAnimation()

self.respawn = false


main_scaler = NEW_MAIN_SCALER()


--HUD
self.health_bar_HUD.setHealth(self.health) 
self.health_bar_HUD.setMaxHealth(self.maxHealth)
--HUD

--sound effects:
self.sounds = orc_one_sounds--[[1:attack-2:die-3:gethit-4:attack earth-5:jump]]
self.should_play_death_sound = true


self.draw = function()






if self.respawn == false then

--[[
elseif self.walk == true then
rectangle.width = main_scaler.width * 0.10 * main_scaler.scale_x 
rectangle.height = 0.25 * main_scaler.height * main_scaler.scale_y 
rectangle.y = self.center_y_coordinate + ( 120 * main_scaler.scale_y) 	
if self.isrighty == true then
rectangle.x = self.center_x_coordinate + 60 * main_scaler.scale_x
elseif self.islefty == true then
rectangle.x = self.center_x_coordinate + 135 * main_scaler.scale_x--135 should change in draw collison and draw animation
end
--]]
if self.get_should_show_shadow() then
if self.isrighty == true then
--love.graphics.rectangle("fill",self.respawn_x-(64 - 30 ) * main_scaler.scale_x + main_scaler.width * 0.05 * main_scaler.scale_x,self.respawn_y-(64 )  * main_scaler.scale_y + 0.12 * main_scaler.height * main_scaler.scale_y,main_scaler.width * 0.05 * main_scaler.scale_x,0.12 * main_scaler.height * main_scaler.scale_y)	
self.c_shadow.draw(self.respawn_x+ 60 * main_scaler.scale_x ,self.respawn_y+ 135 * main_scaler.scale_x + 0.35 * main_scaler.height * main_scaler.scale_y+(5 * main_scaler.scale_y),( (0.075 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
elseif self.islefty == true then
self.c_shadow.draw(self.respawn_x+ 135 * main_scaler.scale_x+(main_scaler.width * 0.10 * main_scaler.scale_x)/2 ,self.respawn_y+ 135 * main_scaler.scale_x + 0.35 * main_scaler.height * main_scaler.scale_y+(5 * main_scaler.scale_y),( (0.075 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
end	
end


self.moving.set_position(self.respawn_x,self.respawn_y)		
if self.isrighty == true then	
self.moving.set_scale(2.5*main_scaler.scale_x,2.5*main_scaler.scale_y)	
self.moving.draw(0,0)
elseif self.islefty == true then
self.moving.set_scale(-2.5*main_scaler.scale_x,2.5*main_scaler.scale_y)	
self.moving.draw(155,0)
end

else





if self.isdead == false then

--self.draw_collision_for_attacks()
--HUD
health_bar_x = self.get_rectangle_for_damaged().x 
health_bar_y = (self.get_rectangle_for_damaged().y + self.get_rectangle_for_damaged().height/2) - (self.get_rectangle_for_damaged().height) + 30 * main_scaler.scale_y
self.health_bar_HUD.setX(health_bar_x) 
self.health_bar_HUD.setY(health_bar_y) 
self.health_bar_HUD.setHealth(self.health) 

if self.isidle == true then	
if self.get_should_show_shadow() then
r = self.get_rectangle_for_damaged()
if self.isrighty == true then
self.c_shadow.draw(r.x,r.y+r.height+(5*main_scaler.scale_y),( (0.075 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
elseif self.islefty == true then
self.c_shadow.draw(r.x+r.width/4,r.y+r.height+(5*main_scaler.scale_y),( (0.075 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
end		
end

if self.isrighty == true then
local x = self.center_x_coordinate + 22 * main_scaler.scale_x
local y = self.center_y_coordinate + ( 98 * main_scaler.scale_y) 	
self.idle.set_position(x,y)
self.idle.set_scale(2.5*main_scaler.scale_x,2.5*main_scaler.scale_y)		
self.idle.draw(0,0)
elseif self.islefty == true then
local x = self.center_x_coordinate - 42 * main_scaler.scale_x
local y = self.center_y_coordinate + ( 98 * main_scaler.scale_y) 
self.idle.set_position(x,y)
self.idle.set_scale(-2.5*main_scaler.scale_x,2.5*main_scaler.scale_y)		
self.idle.draw(151,0)
end	
--should show idle anim



elseif self.walk == true then
if self.get_should_show_shadow() then
r = self.get_rectangle_for_damaged()
if self.isrighty == true then
self.c_shadow.draw(r.x-r.width/3,r.y+r.height+(10*main_scaler.scale_y),( (0.075 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
elseif self.islefty == true then
self.c_shadow.draw(r.x+r.width/10,r.y+r.height+(10*main_scaler.scale_y),( (0.075 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
end		
end

local x = self.center_x_coordinate - ( (155/2 ) * main_scaler.scale_x) + 15 * main_scaler.scale_x
local y = self.center_y_coordinate - ( (185/2 ) * main_scaler.scale_y) 		
if self.isrighty == true then
self.moving.set_position(x+10*main_scaler.scale_x,y)	
self.moving.set_scale(2.5*main_scaler.scale_x,2.5*main_scaler.scale_y)	
self.moving.draw(0,0)
elseif self.islefty == true then
self.moving.set_position(x,y)	
self.moving.set_scale(-2.5*main_scaler.scale_x,2.5*main_scaler.scale_y)		
self.moving.draw(155,0)
end
--should show walk anim




elseif self.attacking == true then
if self.get_should_show_shadow() then
r = self.get_rectangle_for_damaged()
if self.isrighty == true then
self.c_shadow.draw(r.x+r.width/10.3,r.y+r.height+(2*main_scaler.scale_y),( (0.075 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
elseif self.islefty == true then
self.c_shadow.draw(r.x+r.width/4,r.y+r.height+(2*main_scaler.scale_y),( (0.075 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
end		
end

local x = self.center_x_coordinate - ( (228/2 ) * main_scaler.scale_x) + 15 * main_scaler.scale_x
local y = self.center_y_coordinate - ( (189/2 ) * main_scaler.scale_y) 		
self.attacks.set_position(x,y)
if self.isrighty == true then
self.attacks.set_scale(2.5*main_scaler.scale_x,2.5*main_scaler.scale_y)		
self.attacks.draw(0,0)	
elseif self.islefty == true then
self.attacks.set_scale(-2.5*main_scaler.scale_x,2.5*main_scaler.scale_y)		
self.attacks.draw(228,0)	
end




elseif self.dodge == true then


r = self.get_rectangle_for_damaged()
--[[
if math.abs(self.saved_center_y_coordinate_before_jump_attack_to_show_shadow - (self.target_jump_y + ( 77 * main_scaler.scale_y) )+r.height ) > 5 * main_scaler.scale_y then	
self.saved_center_y_coordinate_before_jump_attack_to_show_shadow = self.saved_center_y_coordinate_before_jump_attack_to_show_shadow - 8 * main_scaler.scale_y
else
self.saved_center_y_coordinate_before_jump_attack_to_show_shadow = self.saved_center_y_coordinate_before_jump_attack_to_show_shadow 
end
--]]
--love.graphics.rectangle("fill",self.target_jump_x,(self.target_jump_y + ( 115 * main_scaler.scale_y) )+r.height,r.width,r.height)

if self.jump_attacking_from_up_to_down == true and 
self.jump_attacking_from_down_to_up == false then

if math.abs(self.center_x_coordinate - self.target_jump_x) <= self.target_distance/3 then
if self.saved_center_y_coordinate_before_jump_attack_to_show_shadow < (self.target_jump_y + ( 115 * main_scaler.scale_y) )+r.height - 5 * main_scaler.scale_y then
self.saved_center_y_coordinate_before_jump_attack_to_show_shadow = self.saved_center_y_coordinate_before_jump_attack_to_show_shadow + 12.5 * main_scaler.scale_y
else
self.saved_center_y_coordinate_before_jump_attack_to_show_shadow = (self.target_jump_y + ( 115 * main_scaler.scale_y) )+r.height
end
end

elseif self.jump_attacking_from_up_to_down == false and 
self.jump_attacking_from_down_to_up == true then 

if math.abs(self.center_x_coordinate - self.target_jump_x) <= self.target_distance/3 then
if self.saved_center_y_coordinate_before_jump_attack_to_show_shadow > (self.target_jump_y + ( 115 * main_scaler.scale_y) )+r.height + 5 * main_scaler.scale_y then
self.saved_center_y_coordinate_before_jump_attack_to_show_shadow = self.saved_center_y_coordinate_before_jump_attack_to_show_shadow - 12.5 * main_scaler.scale_y
else
self.saved_center_y_coordinate_before_jump_attack_to_show_shadow = (self.target_jump_y + ( 115 * main_scaler.scale_y) )+r.height
end
end

end

if self.get_should_show_shadow() then
if self.isrighty == true then
self.c_shadow.draw(r.x+r.width/5 +20*main_scaler.scale_x,self.saved_center_y_coordinate_before_jump_attack_to_show_shadow,( (0.075 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
elseif self.islefty == true then
self.c_shadow.draw(r.x-25*main_scaler.scale_x,self.saved_center_y_coordinate_before_jump_attack_to_show_shadow,( (0.075 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
end	
end

local y = self.center_y_coordinate - ( (177/2 ) * main_scaler.scale_y) + 20 * main_scaler.scale_y		
if self.isrighty == true then
local x = self.center_x_coordinate - ( (216/2 ) * main_scaler.scale_x) + 40 * main_scaler.scale_x 
self.dodging.set_position(x,y)
self.dodging.set_scale(2.5*main_scaler.scale_x,2.5*main_scaler.scale_y)
self.dodging.draw(0,0)
elseif self.islefty == true then
local x = self.center_x_coordinate - ( (216/2 ) * main_scaler.scale_x) - 40 * main_scaler.scale_x	
self.dodging.set_position(x,y)
self.dodging.set_scale(-2.5*main_scaler.scale_x,2.5*main_scaler.scale_y)
self.dodging.draw(216,0)
end




elseif self.isgothit == true then
if self.get_should_show_shadow() then
r = self.get_rectangle_for_damaged()
if self.isrighty == true then
self.c_shadow.draw(r.x+r.width/9,r.y+r.height+(5*main_scaler.scale_y),( (0.075 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
elseif self.islefty == true then
self.c_shadow.draw(r.x,r.y+r.height+(5*main_scaler.scale_y),( (0.075 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
end	
end
--[[
if self.isrighty == true then
local x = self.center_x_coordinate - 30 * main_scaler.scale_x
local y = self.center_y_coordinate + ( 20 * main_scaler.scale_y) 	
self.gothit.set_position(x,y)
self.gothit.set_scale(2.5*main_scaler.scale_x,2.5*main_scaler.scale_y)
self.gothit.draw(0,0)
elseif self.islefty == true then
local x = self.center_x_coordinate - 50 * main_scaler.scale_x
local y = self.center_y_coordinate + ( 20 * main_scaler.scale_y) 
self.gothit.set_position(x,y)
self.gothit.set_scale(-2.5*main_scaler.scale_x,2.5*main_scaler.scale_y)
self.gothit.draw(170,0)
end
--]]

end

if self.jump_attacking == false then
self.health_bar_HUD.draw()
end--HUD

self.draw_player_hit_effect()

--till here! if self.isdead == false
else--self.isdead == true


	
if self.isrighty == true then
local x = self.center_x_coordinate + 22 * main_scaler.scale_x
local y = self.center_y_coordinate + ( 98 * main_scaler.scale_y) 	
self.die.set_position(x,y)
self.die.set_scale(2.5*main_scaler.scale_x,2.5*main_scaler.scale_y)
self.die.draw(0,0)
elseif self.islefty == true then
local x = self.center_x_coordinate - 62 * main_scaler.scale_x
local y = self.center_y_coordinate + ( 98 * main_scaler.scale_y) 
self.die.set_position(x,y)
self.die.set_scale(-2.5*main_scaler.scale_x,2.5*main_scaler.scale_y)
self.die.draw(169,0)
end

end--self.isdead == true

end--self.respawn == true


end





self.set_time_for_patterns = function()
self.time_for_patern_movement1 = 5
self.time_for_patern_movement2 = 10
self.time_for_patern_movement3 = 5
end


self.movement_pattern_one = function(dt,rectangle_for_collision)


--should change the self.center_x_coordinate = self.center_x_coordinate to self.random_pattern to something
if self.player_is_close(dt,rectangle_for_collision) then

self.attack_when_player_is_closed()

else

if self.attacks.frame > 1 and self.attacks.frame < #self.attacks.quads then

self.attack_when_player_is_closed()

else	

self.attacks.frame = 1
self.walk = true
self.isidle = false
self.dodge = false
self.attacking = false


if self.time_for_patern_movement1 > 0 then

self.time_for_patern_movement1 = self.time_for_patern_movement1 - (10 * dt)
if self.center_x_coordinate < main_scaler.screen_width - 10 * main_scaler.scale_x and
self.center_x_coordinate > 100 * main_scaler.scale_x then
self.center_x_coordinate = self.center_x_coordinate - 4 * main_scaler.scale_x - self.var_speed_x
else
self.random_pattern = 3
self.walk = true
self.isidle = false
self.attacking = false
self.jump_attacking = false
self.dodge = false	
end

else 

if self.time_for_patern_movement2 > 0 then

self.time_for_patern_movement2 = self.time_for_patern_movement2 - (10 * dt)

if self.center_y_coordinate < main_scaler.screen_height - 100 * main_scaler.scale_y and
self.center_y_coordinate > 10 * main_scaler.scale_y then
self.center_y_coordinate = self.center_y_coordinate + 4 * main_scaler.scale_y + self.var_speed_y
else
self.random_pattern = 3
self.walk = true
self.isidle = false
self.attacking = false
self.jump_attacking = false
self.dodge = false	
end	

if self.time_for_patern_movement2 > 5 then
if self.center_x_coordinate < main_scaler.screen_width - 100 * main_scaler.scale_x and
self.center_x_coordinate > 10 * main_scaler.scale_x then
self.center_x_coordinate = self.center_x_coordinate + 4 * main_scaler.scale_x + self.var_speed_x
else
self.center_x_coordinate = self.center_x_coordinate
end
elseif self.time_for_patern_movement2 > 0 and self.time_for_patern_movement2 < 5 then
if self.center_x_coordinate < main_scaler.screen_width - 10 * main_scaler.scale_x and
self.center_x_coordinate > 100 * main_scaler.scale_x then
self.center_x_coordinate = self.center_x_coordinate - 4 * main_scaler.scale_x - self.var_speed_x
else
self.random_pattern = 3
self.walk = true
self.isidle = false
self.attacking = false
self.jump_attacking = false
self.dodge = false	
end	
end

else

if self.time_for_patern_movement3 > 0 then

self.time_for_patern_movement3 = self.time_for_patern_movement3 - (10 * dt)
if self.center_x_coordinate < main_scaler.screen_width - 100 * main_scaler.scale_x and
self.center_x_coordinate > 10 * main_scaler.scale_x then
self.center_x_coordinate = self.center_x_coordinate + 4 * main_scaler.scale_x + self.var_speed_x
else
self.random_pattern = 3
self.walk = true
self.isidle = false
self.attacking = false
self.jump_attacking = false
self.dodge = false	
end	


else

return false

end

end--time_for_patern_movement2


end--time_for_patern_movement1

end--player is close

end--player is close

end--function





self.movement_pattern_two = function(dt,rectangle_for_collision)


if self.player_is_close(dt,rectangle_for_collision) then

self.attack_when_player_is_closed()

else

if self.attacks.frame > 1 and self.attacks.frame < #self.attacks.quads then

self.attack_when_player_is_closed()

else	

self.attacks.frame = 1
self.walk = true
self.isidle = false
self.dodge = false
self.attacking = false



if self.time_for_patern_movement1 > 0 then

self.time_for_patern_movement1 = self.time_for_patern_movement1 - (10 * dt)

if self.center_x_coordinate < main_scaler.screen_width - 100 * main_scaler.scale_x and
self.center_x_coordinate > 10 * main_scaler.scale_x then

self.center_x_coordinate = self.center_x_coordinate + 4 * main_scaler.scale_x + self.var_speed_x
else
self.random_pattern = 3
self.walk = true
self.isidle = false
self.attacking = false
self.jump_attacking = false
self.dodge = false	
end

if self.center_y_coordinate < main_scaler.screen_height - 100 * main_scaler.scale_y and
self.center_y_coordinate > 10 * main_scaler.scale_y then
self.center_y_coordinate = self.center_y_coordinate + 4 * main_scaler.scale_y - self.var_speed_y
else
self.random_pattern = 3
self.walk = true
self.isidle = false
self.attacking = false
self.jump_attacking = false
self.dodge = false	
end


else 

if self.time_for_patern_movement2 > 0 then

self.time_for_patern_movement2 = self.time_for_patern_movement2 - (10 * dt)

if self.center_x_coordinate < main_scaler.screen_width - 10 * main_scaler.scale_x and
self.center_x_coordinate > 100 * main_scaler.scale_x then
self.center_x_coordinate = self.center_x_coordinate - 4 * main_scaler.scale_x - self.var_speed_x
else
self.random_pattern = 3
self.walk = true
self.isidle = false
self.attacking = false
self.jump_attacking = false
self.dodge = false	
end

if self.center_y_coordinate < main_scaler.screen_height - 10 * main_scaler.scale_y and
self.center_y_coordinate > 100 * main_scaler.scale_y then
self.center_y_coordinate = self.center_y_coordinate - 4 * main_scaler.scale_y - self.var_speed_y
else
self.random_pattern = 3	
self.walk = true
self.isidle = false
self.attacking = false
self.jump_attacking = false
self.dodge = false	
end

else

if self.time_for_patern_movement3 > 0 then

self.time_for_patern_movement3 = self.time_for_patern_movement3 - (10 * dt)	

if self.center_x_coordinate < main_scaler.screen_width - 100 * main_scaler.scale_x and
self.center_x_coordinate > 10 * main_scaler.scale_x then
self.center_x_coordinate = self.center_x_coordinate + 4 * main_scaler.scale_x + self.var_speed_x
else
self.random_pattern = 3
self.walk = true
self.isidle = false
self.attacking = false
self.jump_attacking = false
self.dodge = false	
end

if self.center_y_coordinate < main_scaler.screen_height - 10 * main_scaler.scale_y and
self.center_y_coordinate > 100 * main_scaler.scale_y then
self.center_y_coordinate = self.center_y_coordinate - 4 * main_scaler.scale_y - self.var_speed_y
else
self.random_pattern = 3
self.walk = true
self.isidle = false
self.attacking = false
self.jump_attacking = false
self.dodge = false	
end

else

return false

end

end--time_for_patern_movement2


end--time_for_patern_movement1

end--player is close

end--player is close

end--function



self.movement_pattern_three = function(dt,rectangle_for_collision)


if self.player_is_close(dt,rectangle_for_collision) then

self.attack_when_player_is_closed()

else

if self.attacks.frame > 1 and self.attacks.frame < #self.attacks.quads then

self.attack_when_player_is_closed()

else	

self.attacks.frame = 1
self.walk = true
self.isidle = false
self.dodge = false
self.attacking = false


if self.time_for_patern_movement1 > 0 then

self.time_for_patern_movement1 = self.time_for_patern_movement1 - (10 * dt)

if self.center_x_coordinate < main_scaler.screen_width/2 then

self.center_x_coordinate = self.center_x_coordinate + 4 * main_scaler.scale_x + self.var_speed_x
else
self.random_pattern = 6
self.isidle = true
self.walk = false
self.attacking = false
self.dodge = false	
self.jump_attacking = false
end

if self.center_y_coordinate < main_scaler.screen_height/2 then
self.center_y_coordinate = self.center_y_coordinate + 4 * main_scaler.scale_y + self.var_speed_y
else
self.random_pattern = 6
self.isidle = true
self.walk = false
self.attacking = false
self.dodge = false	
self.jump_attacking = false
end


else 

if self.time_for_patern_movement2 > 0 then

self.time_for_patern_movement2 = self.time_for_patern_movement2 - (10 * dt)

if self.center_x_coordinate > main_scaler.screen_width/2 then
self.center_x_coordinate = self.center_x_coordinate - 4 * main_scaler.scale_x - self.var_speed_x
else
self.random_pattern = 6
self.isidle = true
self.walk = false
self.attacking = false
self.dodge = false	
self.jump_attacking = false
end

if self.center_y_coordinate < main_scaler.screen_height/2 then
self.center_y_coordinate = self.center_y_coordinate + 4 * main_scaler.scale_y + self.var_speed_y
else
self.random_pattern = 6
self.isidle = true
self.walk = false
self.attacking = false
self.dodge = false	
self.jump_attacking = false
end

else

if self.time_for_patern_movement3 > 0 then

self.time_for_patern_movement3 = self.time_for_patern_movement3 - (10 * dt)	

if self.center_x_coordinate < main_scaler.screen_width/2 then
self.center_x_coordinate = self.center_x_coordinate + 4 * main_scaler.scale_x + self.var_speed_x
else
self.random_pattern = 6
self.isidle = true
self.walk = false
self.attacking = false
self.dodge = false	
self.jump_attacking = false
end

if self.center_y_coordinate > main_scaler.screen_height/2 then
self.center_y_coordinate = self.center_y_coordinate - 4 * main_scaler.scale_y - self.var_speed_y
else
self.random_pattern = 6
self.isidle = true
self.walk = false
self.attacking = false
self.dodge = false	
self.jump_attacking = false
end

else

return false

end

end--time_for_patern_movement2


end--time_for_patern_movement1

end--player is close

end--player is close

end--function


self.movement_pattern_slams = function(dt,rectangle_for_collision)


if self.time_for_patern_movement1 > 0 then

self.time_for_patern_movement1 = self.time_for_patern_movement1 - (1 * dt)

self.jump_attack(rectangle_for_collision)


else 

if self.time_for_patern_movement2 > 0 then

self.time_for_patern_movement2 = self.time_for_patern_movement2 - (1 * dt)

self.jump_attack(rectangle_for_collision)


else

if self.time_for_patern_movement3 > 0 then

self.time_for_patern_movement3 = self.time_for_patern_movement3 - (1 * dt)	

self.jump_attack(rectangle_for_collision)

else

return false

end

end--time_for_patern_movement2


end--time_for_patern_movement1



end--function




self.movement_wait = function(dt,rectangle_for_collision)


if self.player_is_close(dt,rectangle_for_collision) then

self.attack_when_player_is_closed()

else

if self.attacks.frame > 1 and self.attacks.frame < #self.attacks.quads then

self.attack_when_player_is_closed()

else	

self.attacks.frame = 1
self.walk = false
self.isidle = true
self.dodge = false
self.attacking = false


if self.time_for_patern_movement1 > 0 then

self.time_for_patern_movement1 = self.time_for_patern_movement1 - (10 * dt)

self.center_x_coordinate = self.center_x_coordinate 
self.center_y_coordinate = self.center_y_coordinate

else 

if self.time_for_patern_movement2 > 0 then

self.time_for_patern_movement2 = self.time_for_patern_movement2 - (15 * dt)

self.center_x_coordinate = self.center_x_coordinate 
self.center_y_coordinate = self.center_y_coordinate

else

if self.time_for_patern_movement3 > 0 then

self.time_for_patern_movement3 = self.time_for_patern_movement3 - (10 * dt)	

self.center_x_coordinate = self.center_x_coordinate 
self.center_y_coordinate = self.center_y_coordinate

else

return false

end

end--time_for_patern_movement2


end--time_for_patern_movement1

end--player is close

end--player is close

end--function



self.movement_ai_r_pos = function(dt,rectangle_for_collision)

local target_x_R = rectangle_for_collision.x + rectangle_for_collision.width * 1.5  
local target_y = rectangle_for_collision.y + rectangle_for_collision.height/1.8

local rectangle = self.get_rectangle_for_damaged()
local orc_mb_center_x = rectangle.x + rectangle.width / 2 
local orc_mb_center_y = rectangle.y + rectangle.height / 2 


if orc_mb_center_x > target_x_R + (5 * main_scaler.scale_x) then

self.center_x_coordinate = self.center_x_coordinate - 4 * main_scaler.scale_x 

elseif orc_mb_center_x < target_x_R - (5 * main_scaler.scale_x) then 

self.center_x_coordinate = self.center_x_coordinate + 4 * main_scaler.scale_x 

elseif orc_mb_center_x == target_x_R or math.abs(orc_mb_center_x - target_x_R) < 2 * main_scaler.scale_x then

self.center_x_coordinate = self.center_x_coordinate

end

if orc_mb_center_y > target_y + (5 * main_scaler.scale_y) then

self.center_y_coordinate = self.center_y_coordinate - 4 * main_scaler.scale_y

elseif orc_mb_center_y < target_y - (5 * main_scaler.scale_y) then 

self.center_y_coordinate = self.center_y_coordinate + 4 * main_scaler.scale_y

elseif orc_mb_center_y == target_y or math.abs(orc_mb_center_y - target_y) < 2 * main_scaler.scale_y then

self.center_y_coordinate = self.center_y_coordinate

end


end



self.movement_ai_l_pos = function(dt,rectangle_for_collision)

local target_x_L = rectangle_for_collision.x - rectangle_for_collision.width * 0.5
local target_y = rectangle_for_collision.y + rectangle_for_collision.height/1.8


local rectangle = self.get_rectangle_for_damaged()
local orc_mb_center_x = rectangle.x + rectangle.width / 2 
local orc_mb_center_y = rectangle.y + rectangle.height / 2 


if orc_mb_center_x > target_x_L + (5 * main_scaler.scale_x) then


self.center_x_coordinate = self.center_x_coordinate - 4 * main_scaler.scale_x 

elseif orc_mb_center_x < target_x_L - (5 * main_scaler.scale_x) then 


self.center_x_coordinate = self.center_x_coordinate + 4 * main_scaler.scale_x 

elseif orc_mb_center_x == target_x_L or math.abs(orc_mb_center_x - target_x_L) < 2 * main_scaler.scale_x then

self.center_x_coordinate = self.center_x_coordinate

end

if orc_mb_center_y > target_y + (5 * main_scaler.scale_y) then

self.center_y_coordinate = self.center_y_coordinate - 4 * main_scaler.scale_y

elseif orc_mb_center_y < target_y - (5 * main_scaler.scale_y) then 

self.center_y_coordinate = self.center_y_coordinate + 4 * main_scaler.scale_y

elseif orc_mb_center_y == target_y or math.abs(orc_mb_center_y - target_y) < 2 * main_scaler.scale_y then

self.center_y_coordinate = self.center_y_coordinate

end


end


--postion will be taken from world class and in main
self.movement_ai = function(--[[position_decide , position_fill , ]]dt,rectangle_for_collision)

local player_center_x =  rectangle_for_collision.x + rectangle_for_collision.width / 2 

local rectangle = self.get_rectangle_for_damaged()
local orc_mb_center_x = rectangle.x + rectangle.width / 2 


if orc_mb_center_x > player_center_x then

-- if right position were not filled then 
self.movement_ai_r_pos(dt,rectangle_for_collision)
-- elseif right position were filled and left position were not filled
--self.movement_ai_l_pos()
--elseif right position were filled and left position were filled
--self.wait()

elseif orc_mb_center_x < player_center_x then
-- if left position were not filled then 
self.movement_ai_l_pos(dt,rectangle_for_collision)	
-- elseif left position were filled and right position were not filled
--self.movement_ai_l_pos()
--elseif right position were filled and left position were filled
--self.wait()


end



end


self.update_side = function(rectangle_for_collision)

local rectangle = self.get_rectangle_for_damaged()
local orc_mb_center_x = rectangle.x + rectangle.width / 2 
--local player_center_x = rectangle_for_collision.x + rectangle_for_collision.width / 2 
local player_left_side = rectangle_for_collision.x
local player_right_side = rectangle_for_collision.x + rectangle_for_collision.width   

if orc_mb_center_x  < player_left_side then

self.islefty = false
self.isrighty = true

elseif orc_mb_center_x  > player_right_side then

self.isrighty = false
self.islefty = true


end
end






self.damaged_collision_act = function(rectangle_for_attacks , bool_for_attacks ,damage_to_take)

if
self.check_for_damaged_collision(rectangle_for_attacks.x , rectangle_for_attacks.y , rectangle_for_attacks.width , rectangle_for_attacks.height)
== true and bool_for_attacks == true and self.jump_attacking == false and self.dodge == false then

self.isgothit = true
--[[
self.isidle = false
self.walk = false
self.attacking = false
self.dodge = false
self.stand_awhile = false
self.gothit.frame = 1
self.attacks.frame = 1
self.isgothit_time = 1
--]]
self.hero_hit_effect.start()

--just for test:
if self.health > damage_to_take then
self.health = self.health - damage_to_take
else
self.health = 0
self.isdead = true
self.isgothit = false
end--just for test

end

end







self.update_state = function(dt , rectangle_for_collision , rectangle_for_gothit_except_two_last_hits_and_transforms_attacks , should_check_for_except_two_last_hits_and_transforms_attacks , rectangle_for_gothit_two_last_hits_and_spells , should_check_for_two_last_hits_and_spells , rectangle_for_gothit_summoned , should_check_for_summoned)

--sounds
self.play_sounds()

if self.isdead == true then 


if self.isdead_time > 0  then

self.isdead_time = self.isdead_time - dt

else

self.should_remove = true

end


end--if self.isdead == true




if self.isdead == false then

self.update_player_hit_effect(dt)	

self.update_side(rectangle_for_collision)
self.damaged_collision_act(rectangle_for_gothit_except_two_last_hits_and_transforms_attacks , should_check_for_except_two_last_hits_and_transforms_attacks , rectangle_for_gothit_except_two_last_hits_and_transforms_attacks.damage)
self.damaged_collision_act(rectangle_for_gothit_two_last_hits_and_spells , should_check_for_two_last_hits_and_spells , rectangle_for_gothit_two_last_hits_and_spells.damage)
if rectangle_for_gothit_summoned ~= nil and should_check_for_summoned ~= nil then
self.damaged_collision_act(rectangle_for_gothit_summoned , should_check_for_summoned , rectangle_for_gothit_summoned.damage)
end



if self.isgothit == true then

if self.isgothit_time > 0 then

self.isgothit_time = self.isgothit_time - dt

else

--self.isgothit = false
--self.gothit.frame = 1
--self.isgothit_time = 1

end

end


else--if self.isdead == true 

self.isgothit = false
--self.gothit.frame = 1
--self.isgothit_time = 1

end--if self.isdead == false 


local player_center_x = rectangle_for_collision.x + rectangle_for_collision.width / 2 
local player_center_y = rectangle_for_collision.y + rectangle_for_collision.height / 2 

--collisions and all ai 
local target_x_R = rectangle_for_collision.x + rectangle_for_collision.width * 2 
local target_y = rectangle_for_collision.y + rectangle_for_collision.height/5
local target_x_L = rectangle_for_collision.x - rectangle_for_collision.width * 3 
local target_y = rectangle_for_collision.y + rectangle_for_collision.height/5

local rectangle = self.get_rectangle_for_damaged()
local orc_mb_center_x = rectangle.x + rectangle.width / 2 
local orc_mb_center_y = rectangle.y + rectangle.height / 2 


if self.isdead == false then
--if self.isgothit == false then



if self.time_for_movement > 0  then
--[[
self.walk = false
self.isidle = false
self.attacking = false
self.dodge = false
--]]
if self.time_for_patern_movement3 <= 0 then

self.jump_attacking = false
self.set_time_for_patterns()

if math.abs(orc_mb_center_x - player_center_x) > 300 * main_scaler.scale_x then
self.random_pattern = love.math.random(1,6) -- random moves include jump_attacking
--preventing_from_double_slam!
if self.preventing_from_double_slam == true then
self.random_pattern = love.math.random(1,3) -- random moves without jump_attacking
self.preventing_from_double_slam = false
end

else--if not(math.abs(orc_mb_center_x - player_center_x) > 200 * main_scaler.scale_x)   !!!
self.random_pattern = love.math.random(1,3) -- random moves without jump_attacking
end

else

--if self.isgothit == false then

if self.random_pattern == 1 then 
self.walk = true	
self.isidle = false
--self.attacking = false
self.jump_attacking = false
self.dodge = false	
--if self.isgothit == false then
self.movement_pattern_one(dt,rectangle_for_collision)
--end
elseif self.random_pattern == 2 then	
self.walk = true
self.isidle = false
--self.attacking = false
self.jump_attacking = false
self.dodge = false	
--if self.isgothit == false then
self.movement_pattern_two(dt,rectangle_for_collision)
--end
elseif self.random_pattern == 3 then
self.walk = true
self.isidle = false
--self.attacking = false
self.jump_attacking = false
self.dodge = false	
--if self.isgothit == false then
self.movement_pattern_three(dt,rectangle_for_collision)
--end
elseif self.random_pattern == 4 then
self.walk = false
self.isidle = false
self.attacking = false
self.dodge = true
self.preventing_from_double_slam = true
--if self.isgothit == false then
self.movement_pattern_slams(dt,rectangle_for_collision)
--end
elseif self.random_pattern == 5 then
self.walk = false
self.isidle = false
self.attacking = false
self.dodge = true
self.preventing_from_double_slam = true
--if self.isgothit == false then
self.movement_pattern_slams(dt,rectangle_for_collision)
--end
elseif self.random_pattern == 6 then
self.isidle = true
self.walk = false
--self.attacking = false
self.dodge = false	
self.jump_attacking = false
--if self.isgothit == false then
self.movement_wait(dt,rectangle_for_collision)	
--end
end	


--end--if self.isgothit == false

end


self.time_for_movement = self.time_for_movement - dt


elseif self.time_for_movement <= 0 and self.jump_attacking == true then

self.jump_attack(rectangle_for_collision)
if 
self.time_for_patern_movement1 == -1 and
self.time_for_patern_movement2 == -1 and
self.time_for_patern_movement3 == -1
then

self.jump_attacking = false

end


elseif self.time_for_movement <= 0 then

--for disabling the jump_attacking to continue 
self.jump_attacking = false
self.set_time_for_patterns()

local rectangle = self.get_rectangle_for_damaged()
local orc_mb_center_x = rectangle.x + rectangle.width / 2 
local orc_mb_center_y = rectangle.y + rectangle.height / 2 


if self.time_for_attack > 0 then

--if self.isgothit == false then

if
(	(orc_mb_center_x == target_x_R or math.abs(orc_mb_center_x - player_center_x) < 100 * main_scaler.scale_x) and
(orc_mb_center_y == target_y or math.abs(orc_mb_center_y - player_center_y) < 20 * main_scaler.scale_y)    )  or
(	(orc_mb_center_x == target_x_L or math.abs(orc_mb_center_x - player_center_x) < 100 * main_scaler.scale_x) and
(orc_mb_center_y == target_y or math.abs(orc_mb_center_y - player_center_y) < 20 * main_scaler.scale_y)    )  then  
--(  math.abs(self.center_x_coordinate - target_x_L) < 30 * main_scaler.scale_x and 
--math.abs(self.center_y_coordinate - target_y) < 30 * main_scaler.scale_y  )   then
self.walk = false


if self.stand_awhile == false then
self.attacking = true
self.isidle = false
else

self.attacking = false
self.isidle = true
self.attacks.frame = 1
if self.stand_awhile_time > 0 then
self.stand_awhile_time = self.stand_awhile_time - dt
else
self.stand_awhile_time = 1
self.stand_awhile = false
end

end	


self.dodge = false

if self.attacking == true then

if self.attacks.frame == #self.attacks.quads then
self.attacking = false
self.isidle = true
self.stand_awhile = true
end	
end

else

if self.attacking == true then

if self.attacks.frame == #self.attacks.quads then
self.attacking = false
self.walk = true
end	

else

self.walk = true
self.isidle = false
self.dodge = false
self.attacks.frame = 1
self.movement_ai(--[[position_decide , position_fill , ]]dt,rectangle_for_collision)

end


end

--end--if self.isgothit == false

self.time_for_attack = self.time_for_attack - dt

else

self.time_for_movement = 20 + self.var_time_move 
self.time_for_attack = 30 + self.var_time_attack 

end--time_for_attack	


end--time_for_movement




--end--if self.isgothit == false



end--if self.isdead == false


if self.isdead == false then

self.health_bar_HUD.update(dt)	

if self.isidle == true then 

self.animate_idle(1)

elseif self.walk == true then

self.animate_move(1)

elseif self.attacking == true then

self.animate_attacks(1) 

elseif self.dodge == true then

self.animate_dodging(1)

elseif self.isgothit == true then

--self.animate_gothit(1)

end	


else


self.animate_die(1)

end--if self.isdead == true


end--end of function update state











self.jump_attack = function(rectangle_for_collision)

if self.jump_attacking == false then

self.jump_attacking = true 
self.saved_center_y_coordinate_before_jump_attack_to_show_shadow = self.get_rectangle_for_damaged().y + self.get_rectangle_for_damaged().height
self.jump_attacking_from_up_to_down = false
self.jump_attacking_from_down_to_up = false

if self.isrighty == true then

self.target_jump_x = rectangle_for_collision.x + rectangle_for_collision.width / 2 - 150 * main_scaler.scale_x
self.target_jump_y = rectangle_for_collision.y + rectangle_for_collision.height / 2 - 340 * main_scaler.scale_y
self.target_distance = math.abs(self.center_x_coordinate - self.target_jump_x)

elseif self.islefty == true then

self.target_jump_x = rectangle_for_collision.x + rectangle_for_collision.width / 2 - 210 * main_scaler.scale_x
self.target_jump_y = rectangle_for_collision.y + rectangle_for_collision.height / 2 - 340 * main_scaler.scale_y
self.target_distance = math.abs(self.center_x_coordinate - self.target_jump_x)

end

if (self.target_jump_y + ( 115 * main_scaler.scale_y) )+r.height  >= self.saved_center_y_coordinate_before_jump_attack_to_show_shadow then
self.jump_attacking_from_up_to_down = true
self.jump_attacking_from_down_to_up = false
else
self.jump_attacking_from_up_to_down = false
self.jump_attacking_from_down_to_up = true
end	




else--self.jump_attacking == true


if math.abs(self.center_x_coordinate - self.target_jump_x) < 5 * main_scaler.scale_x and
	math.abs(self.center_y_coordinate - self.target_jump_y) < 5 * main_scaler.scale_y then

self.time_for_patern_movement1 = -1
self.time_for_patern_movement2 = -1
self.time_for_patern_movement3 = -1

return

end


if self.center_x_coordinate > self.target_jump_x + (5 * main_scaler.scale_x) then

if math.abs(self.center_x_coordinate - self.target_jump_x) > self.target_distance/3 then 
self.center_x_coordinate = self.center_x_coordinate - 1.5 * main_scaler.scale_x
else
self.center_x_coordinate = self.center_x_coordinate - 3 * main_scaler.scale_x
end

elseif self.center_x_coordinate < self.target_jump_x - (5 * main_scaler.scale_x) then 

if math.abs(self.center_x_coordinate - self.target_jump_x) > self.target_distance/3 then 
self.center_x_coordinate = self.center_x_coordinate + 1.5 * main_scaler.scale_x
else
self.center_x_coordinate = self.center_x_coordinate + 3 * main_scaler.scale_x
end


end

if math.abs(self.center_x_coordinate - self.target_jump_x) > self.target_distance/3 then 

if self.center_y_coordinate > self.target_jump_y - 300 * main_scaler.scale_y then

self.center_y_coordinate = self.center_y_coordinate - 8 * main_scaler.scale_y 

else

self.center_y_coordinate = self.center_y_coordinate	

end

elseif math.abs(self.center_x_coordinate - self.target_jump_x) <= self.target_distance/3 then

if self.center_y_coordinate < self.target_jump_y - (5 * main_scaler.scale_y) then 

self.center_y_coordinate = self.center_y_coordinate + 8 * main_scaler.scale_y 

else

self.center_y_coordinate = self.center_y_coordinate	

end

end	





end--end of if self.jump_attacking

end--end of function



self.set_spell = function (spell)


self.spell = spell


end



---function for get attack for check and hiting enemys -> -> -> using in check collision
self.is_attacking = function()
if self.isdead == true then
return false
else	
return 
(
 self.attacking == true and 
(self.attacks.frame == #self.attacks.quads or 
self.attacks.frame == #self.attacks.quads-1)
 )


or

(
self.dodge == true 
and
self.jump_attacking == true
and
math.abs(self.center_x_coordinate - self.target_jump_x) < 5 * main_scaler.scale_x and
math.abs(self.center_y_coordinate - self.target_jump_y) < 5 * main_scaler.scale_y
)

end
end

self.get_collision_for_attacks = function()

local rectangle_for_attack = { x = 1 , y = 1 , width = 1 , height = 1}



local rectangle_for_collision = self.get_rectangle_for_damaged()

local width_L = rectangle_for_collision.width 
local height_L = rectangle_for_collision.height 

local target_center_x_R = rectangle_for_collision.x 
local target_center_x_L = rectangle_for_collision.x - (width_L + 20 * main_scaler.scale_x)
local target_center_y = rectangle_for_collision.y 

if self.isrighty == true then
rectangle_for_attack.x = target_center_x_R
rectangle_for_attack.y = target_center_y
rectangle_for_attack.width = (2 * width_L) + 30 * main_scaler.scale_x
rectangle_for_attack.height = height_L
elseif self.islefty == true then
rectangle_for_attack.x = target_center_x_L
rectangle_for_attack.y = target_center_y
rectangle_for_attack.width = (2 * width_L) + 20 * main_scaler.scale_x
rectangle_for_attack.height = height_L
end	

if 
(
 self.attacking == true and 
(self.attacks.frame == #self.attacks.quads or 
self.attacks.frame == #self.attacks.quads-1)
) then

rectangle_for_attack.damage = 2

return rectangle_for_attack



elseif 
(
self.dodge == true 
and
self.jump_attacking == true
and
math.abs(self.center_x_coordinate - self.target_jump_x) < 5 * main_scaler.scale_x and
math.abs(self.center_y_coordinate - self.target_jump_y) < 5 * main_scaler.scale_y
) then
rectangle_for_attack.width = main_scaler.width * 0.20 * main_scaler.scale_x 
rectangle_for_attack.height = 0.25 * main_scaler.height * main_scaler.scale_y 
rectangle_for_attack.y = self.center_y_coordinate + ( 187 * main_scaler.scale_y) 	
if self.isrighty == true then
rectangle_for_attack.x = self.center_x_coordinate - 20 * main_scaler.scale_x
elseif self.islefty == true then
rectangle_for_attack.x = self.center_x_coordinate + 60 * main_scaler.scale_x
end

rectangle_for_attack.damage = 4

return rectangle_for_attack


end

end



self.draw_collision_for_attacks = function()

local rectangle_for_collision = self.get_collision_for_attacks()

if self.is_attacking() == true then

if self.isrighty == true then	
love.graphics.rectangle("fill" , rectangle_for_collision.x , rectangle_for_collision.y , rectangle_for_collision.width , rectangle_for_collision.height)
elseif self.islefty == true then	
love.graphics.rectangle("fill" , rectangle_for_collision.x , rectangle_for_collision.y , rectangle_for_collision.width , rectangle_for_collision.height)
end


end


end








self.check_for_damaged_collision = function(enemy_x , enemy_y , attacks_width , attacks_height)


local function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
 return x1 < x2+w2 and
 x2 < x1+w1 and
 y1 < y2+h2 and
 y2 < y1+h1
end

local rectangle = self.get_rectangle_for_damaged()
if self.isdead == false then
return CheckCollision(rectangle.x , rectangle.y , rectangle.width , rectangle.height , enemy_x , enemy_y , attacks_width , attacks_height)
else
return false
end	

end



self.draw_collision_for_damaged = function()



if self.isidle == true then
local x_R = self.center_x_coordinate + 60 * main_scaler.scale_x
local y = self.center_y_coordinate + ( 120 * main_scaler.scale_y) 	
local x_L = self.center_x_coordinate + 135 * main_scaler.scale_x
if self.isrighty == true then
love.graphics.rectangle("fill" , x_R , y , main_scaler.width * 0.10 * main_scaler.scale_x , 0.25 * main_scaler.height * main_scaler.scale_y)
elseif self.islefty == true then
love.graphics.rectangle("fill" , x_L , y , main_scaler.width * 0.10 * main_scaler.scale_x , 0.25 * main_scaler.height * main_scaler.scale_y)
end
elseif self.walk == true then
local x_R = self.center_x_coordinate + 60 * main_scaler.scale_x
local y = self.center_y_coordinate + ( 120 * main_scaler.scale_y) 	
local x_L = self.center_x_coordinate + 135 * main_scaler.scale_x	
if self.isrighty == true then
love.graphics.rectangle("fill" , x_R , y , main_scaler.width * 0.10 * main_scaler.scale_x , 0.25 * main_scaler.height * main_scaler.scale_y)
elseif self.islefty == true then
love.graphics.rectangle("fill" , x_L , y , main_scaler.width * 0.10 * main_scaler.scale_x , 0.25 * main_scaler.height * main_scaler.scale_y)
end
elseif self.dodge == true then
local x_R = self.center_x_coordinate + 40 * main_scaler.scale_x
local y = self.center_y_coordinate + ( 77 * main_scaler.scale_y) 	
local x_L = self.center_x_coordinate + 140 * main_scaler.scale_x
if self.isrighty == true then
love.graphics.rectangle("fill" , x_R , y , main_scaler.width * 0.10 * main_scaler.scale_x , 0.25 * main_scaler.height * main_scaler.scale_y)
elseif self.islefty == true then
love.graphics.rectangle("fill" , x_L , y , main_scaler.width * 0.10 * main_scaler.scale_x , 0.25 * main_scaler.height * main_scaler.scale_y)
end
else
local x_R = self.center_x_coordinate + 60 * main_scaler.scale_x
local y = self.center_y_coordinate + ( 120 * main_scaler.scale_y) 	
local x_L = self.center_x_coordinate + 120 * main_scaler.scale_x	
if self.isrighty == true then
love.graphics.rectangle("fill" , x_R , y , main_scaler.width * 0.10 * main_scaler.scale_x , 0.25 * main_scaler.height * main_scaler.scale_y)
elseif self.islefty == true then
love.graphics.rectangle("fill" , x_L , y , main_scaler.width * 0.10 * main_scaler.scale_x , 0.25 * main_scaler.height * main_scaler.scale_y)
end
end

end


self.get_rectangle_for_damaged = function()

local rectangle = {x = 1 , y = 1 , width = 1 , height = 1}


if self.isidle == true then
rectangle.width = main_scaler.width * 0.10 * main_scaler.scale_x 
rectangle.height = 0.25 * main_scaler.height * main_scaler.scale_y 
rectangle.y = self.center_y_coordinate + ( 120 * main_scaler.scale_y) 
if self.isrighty == true then
rectangle.x = self.center_x_coordinate + 60 * main_scaler.scale_x
elseif self.islefty == true then
rectangle.x = self.center_x_coordinate + 135 * main_scaler.scale_x
end
elseif self.walk == true then
rectangle.width = main_scaler.width * 0.10 * main_scaler.scale_x 
rectangle.height = 0.25 * main_scaler.height * main_scaler.scale_y 
rectangle.y = self.center_y_coordinate + ( 120 * main_scaler.scale_y) 	
if self.isrighty == true then
rectangle.x = self.center_x_coordinate + 60 * main_scaler.scale_x
elseif self.islefty == true then
rectangle.x = self.center_x_coordinate + 135 * main_scaler.scale_x--135 should change in draw collison and draw animation
end
elseif self.dodge == true then
rectangle.width = main_scaler.width * 0.10 * main_scaler.scale_x 
rectangle.height = 0.25 * main_scaler.height * main_scaler.scale_y 
rectangle.y = self.center_y_coordinate + ( 77 * main_scaler.scale_y) 	
if self.isrighty == true then
rectangle.x = self.center_x_coordinate + 40 * main_scaler.scale_x
elseif self.islefty == true then
rectangle.x = self.center_x_coordinate + 140 * main_scaler.scale_x
end
else
rectangle.width = main_scaler.width * 0.10 * main_scaler.scale_x 
rectangle.height = 0.25 * main_scaler.height * main_scaler.scale_y 
rectangle.y = self.center_y_coordinate + ( 120 * main_scaler.scale_y) 		
if self.isrighty == true then
rectangle.x = self.center_x_coordinate + 60 * main_scaler.scale_x
elseif self.islefty == true then
rectangle.x = self.center_x_coordinate + 135 * main_scaler.scale_x
end
end


return rectangle

end






self.draw_test_collision = function(rectangle_for_collision)

local player_center_x = rectangle_for_collision.x + rectangle_for_collision.width / 2 
local player_center_y = rectangle_for_collision.y + rectangle_for_collision.height / 2 
local rectangle = self.get_rectangle_for_damaged()
local orc_mb_center_x = rectangle.x + rectangle.width / 2 
local orc_mb_center_y = rectangle.y + rectangle.height / 2 
--[[
if self.isrighty == true then
love.graphics.rectangle("fill" , self.center_x_coordinate , self.center_y_coordinate , 20 * main_scaler.scale_x , 20 * main_scaler.scale_y)
elseif self.islefty == true then
love.graphics.rectangle("fill" , self.center_x_coordinate + 12 * main_scaler.scale_x , self.center_y_coordinate , 20 * main_scaler.scale_x , 20 * main_scaler.scale_y)
end
--]]
love.graphics.rectangle("fill" , orc_mb_center_x , orc_mb_center_y , 20 * main_scaler.scale_x , 20 * main_scaler.scale_y)
love.graphics.rectangle("fill" , player_center_x , player_center_y , 20 * main_scaler.scale_x , 20 * main_scaler.scale_y)


end


--function for get block for check and blocking attacks from enemys


self.animate_idle = function()

self.idle.update(1)

end



self.animate_move = function()

self.moving.update(1)

end



self.animate_dodging = function()

if math.abs(self.center_x_coordinate - self.target_jump_x) > self.target_distance/3 then

if self.dodging.frame < #self.dodging.quads/2 then

self.dodging.update(1)

else

self.dodging.frame = #self.dodging.quads/2

end

elseif math.abs(self.center_x_coordinate - self.target_jump_x) <= self.target_distance/3 then

self.dodging.update(1)

end	

end




self.animate_attacks = function()

self.attacks.update(1)

end



--[[
self.animate_gothit = function()

self.gothit.update(1)

end
--]]


self.animate_die = function()

self.die.update(1)

end


self.set_jump_attacking = function(bool)

self.jump_attacking = bool

end





--abstractions from Enemy.lua class


self.get_detection = function()
return "orc_mb"
end

self.respawning = function()
self.respawning_super_class(( (110/2 ) * main_scaler.scale_x) + 15 * main_scaler.scale_x,( (185/2 ) * main_scaler.scale_y)  )
end

self.respawn_position_set = function()
self.respawn_position_set_super_class(( (110/2 ) * main_scaler.scale_x) + 15 * main_scaler.scale_x,( (185/2 ) * main_scaler.scale_y)  )
end



--@override

self.update_player_hit_effect = function(dt)
	
local rect = self.get_rectangle_for_damaged()
local x = rect.x
local y = rect.y
local scale_x = (rect.width)/64--self.hero_hit_effect.quads[0]:getWidth()
local scale_y = (rect.height)/64--self.hero_hit_effect.quads[0]:getHeight()
self.hero_hit_effect.set_position(x,y)
self.hero_hit_effect.set_scale(scale_x,scale_y)
if self.isgothit == true then
self.hero_hit_effect.update(dt)
end
--[[
if self.gothit.frame == 1 then
self.hero_hit_effect.start()
end
--]]
end--function






--news:
self.attack_when_player_is_closed = function()

self.walk = false
self.isidle = false
self.dodge = false
self.attacking = true

end


self.player_is_close = function(dt , rectangle_for_collision)

local function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
 return x1 < x2+w2 and
 x2 < x1+w1 and
 y1 < y2+h2 and
 y2 < y1+h1
end

local rectangle = self.get_collision_for_attacks_range()
rectangle.width = 1/2 * rectangle.width
if CheckCollision(rectangle.x , rectangle.y , rectangle.width , rectangle.height , rectangle_for_collision.x , rectangle_for_collision.y , rectangle_for_collision.width , rectangle_for_collision.height) then
	return true
else
	self.attacks_frame = 1
	return false
end

end

self.get_collision_for_attacks_range = function()

local rectangle_for_attack = { x = 1 , y = 1 , width = 1 , height = 1}

local rectangle_for_collision = self.get_rectangle_for_damaged()

local width_L = rectangle_for_collision.width 
local height_L = rectangle_for_collision.height 

local target_center_x_R = rectangle_for_collision.x 
local target_center_x_L = rectangle_for_collision.x - (width_L + 20 * main_scaler.scale_x)
local target_center_y = rectangle_for_collision.y 

if self.isrighty == true then
rectangle_for_attack.x = target_center_x_R
rectangle_for_attack.y = target_center_y
rectangle_for_attack.width = (2 * width_L) + 30 * main_scaler.scale_x
rectangle_for_attack.height = height_L
elseif self.islefty == true then
rectangle_for_attack.x = target_center_x_L
rectangle_for_attack.y = target_center_y
rectangle_for_attack.width = (2 * width_L) + 20 * main_scaler.scale_x
rectangle_for_attack.height = height_L
end	

return rectangle_for_attack

end


self.draw_range_of_attack_in_randomMode = function()
local rectangle = self.get_collision_for_attacks_range()
rectangle.width = 1/2 * rectangle.width
love.graphics.rectangle("line",rectangle.x , rectangle.y , rectangle.width , rectangle.height)
end



self.play_sounds = function()
if self.attacks.frame == #self.attacks.quads-1 then 
if not self.sounds[1]:isPlaying() then
self.sounds[1]:play()	
else
self.sounds[1]:stop()	
self.sounds[1]:play()		
end
end
if self.isdead and self.should_play_death_sound then
if not self.sounds[2]:isPlaying() then
self.sounds[2]:play()	
self.should_play_death_sound = false
end
end
if self.isgothit and self.hero_hit_effect.frame == 1 and self.isdead == false and self.should_play_death_sound == true then
if not self.sounds[3]:isPlaying() then
self.sounds[3]:play()	
else
self.sounds[3]:stop()	
self.sounds[3]:play()		
end
end
if (
self.dodge == true 
and
self.jump_attacking == true
and
math.abs(self.center_x_coordinate - self.target_jump_x) < 5 * main_scaler.scale_x and
math.abs(self.center_y_coordinate - self.target_jump_y) < 5 * main_scaler.scale_y
)
then
if not self.sounds[4]:isPlaying() then
self.sounds[4]:play()		
self.sounds[5]:stop()
end
end
if self.dodge == true 
and
self.jump_attacking == true
then
if not self.sounds[5]:isPlaying() and not self.sounds[4]:isPlaying() then
self.sounds[5]:play()	
end
end	


end





return self

end

