require("CODES/ANIMATION/animation_batch")
require("CODES/ANIMATION/animation_batch2")
require("CODES/HELPERS/SCALE")
require ("CODES/ENEMIES/Enemy")
require("CODES/SHADOWS/characters_shadows")

function create_darksaber(center_x_coordinate,center_y_coordinate,darksaber_idle,darksaber_run,darksaber_attack,darksaber_die,darksaber_thief,darksaber_sounds,var_health,var_speed_x,var_speed_y,var_damage,var_time_move,var_time_attack)--,idle,moving,block,attacks,dodges--[[]])



--local rand_set = love.math.random(1,6)
--rand_set = 2

--ALL IMAGES:
--darksaber1_IDLE (1).png
darksaber_run = darksaber_run

darksaber_idle = darksaber_idle

darksaber_attack = darksaber_attack

--darksaber_hurt = darksaber_hurt

darksaber_die = darksaber_die

--ALL CODES :

local self = Enemy_creation()

self.center_x_coordinate = center_x_coordinate
self.center_y_coordinate = center_y_coordinate
self.respawn_x = nil
self.respawn_y = nil

--just for test die
self.health = 35 + var_health
--self.health = 8 + var_health
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
self.idle.set(darksaber_idle,107,115,5)
self.idle.set_itrator(true)

self.moving = newAnimation2()
self.moving.set(darksaber_run,126,125,5)
self.moving.set_itrator(true)


self.attacks = darksaber_attack
self.attacks_framespeed = 0
self.attacks_frame = 1
self.img_for_attacks = self.attacks[1]
self.time_for_ignore = 40

--self.gothit = newAnimation2()
--self.gothit.set(darksaber_hurt,173,129,5)
--self.gothit.set_itrator(false)


self.die = newAnimation2()
self.die.set(darksaber_die,145,137,6)
self.die.set_itrator(false)


self.pics_for_thief = darksaber_thief

self.isrighty = false
self.islefty = false

self.isidle = false
self.walk = false
self.attacking = false
self.isgothit = false
self.isgothit_time = 1

self.stand_awhile = false
self.stand_awhile_time = 1

self.isdead = false
self.isdead_time = 3


self.random_pattern = 0
self.time_for_patern_movement1 = 0
self.time_for_patern_movement2 = 0
self.time_for_patern_movement3 = 0
self.time_for_movement = 10 + self.var_time_move 

self.time_for_attack = 20 + self.var_time_attack

self.hero_hit_effect = newAnimation()

self.respawn = false

self.c_shadow = make_c_shodow()

main_scaler = NEW_MAIN_SCALER()

--HUD
self.health_bar_HUD.setHealth(self.health) 
self.health_bar_HUD.setMaxHealth(self.maxHealth)
--HUD

--sound effects:
self.sounds = darksaber_sounds--[[1:attack-2:die-3:gethit]]
self.should_play_death_sound = true

self.draw = function()


local x = self.center_x_coordinate - ( (64--[[widthofimages]] + 18 ) * main_scaler.scale_x) 
local y = self.center_y_coordinate - ( ( 64--[[heightofimages]] + 8 ) * main_scaler.scale_y) 

if self.respawn == false then
if self.get_should_show_shadow() then
if self.isrighty == true then
--love.graphics.rectangle("fill",self.respawn_x-(64 - 30 ) * main_scaler.scale_x + main_scaler.width * 0.05 * main_scaler.scale_x,self.respawn_y-(64 )  * main_scaler.scale_y + 0.12 * main_scaler.height * main_scaler.scale_y,main_scaler.width * 0.05 * main_scaler.scale_x,0.12 * main_scaler.height * main_scaler.scale_y)	
self.c_shadow.draw(self.respawn_x-(64 - 145 ) * main_scaler.scale_x + main_scaler.width * 0.05 * main_scaler.scale_x +(main_scaler.width * 0.05 * main_scaler.scale_x)/10 ,self.respawn_y-(64 )  * main_scaler.scale_y + 0.18 * main_scaler.height * main_scaler.scale_y+0.12 * main_scaler.height * main_scaler.scale_y-(3*main_scaler.scale_y),( (0.055 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
elseif self.islefty == true then
self.c_shadow.draw(self.respawn_x- (64 - 60 ) * main_scaler.scale_x + main_scaler.width * 0.05 * main_scaler.scale_x +(main_scaler.width * 0.05 * main_scaler.scale_x)/1.88 ,self.respawn_y-(64 )  * main_scaler.scale_y + 0.18 * main_scaler.height * main_scaler.scale_y+0.12 * main_scaler.height * main_scaler.scale_y-(3*main_scaler.scale_y),( (0.055 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
end	
end


self.moving.set_position(self.respawn_x,self.respawn_y)
if self.isrighty == true then	
self.moving.set_scale(((0.13*main_scaler.width)/64)*main_scaler.scale_x , ((0.13*main_scaler.height)/64)*main_scaler.scale_y)
self.moving.draw(0,0)
elseif self.islefty == true then
self.moving.set_scale((-(0.13*main_scaler.width)/64)*main_scaler.scale_x , ((0.13*main_scaler.height)/64)*main_scaler.scale_y)
self.moving.draw(126,0)		
end

--love.graphics.rectangle("fill",self.respawn_x-(64 - 30 ) * main_scaler.scale_x + main_scaler.width * 0.05 * main_scaler.scale_x,self.respawn_y-(64 )  * main_scaler.scale_y + 0.08 * main_scaler.height * main_scaler.scale_y,main_scaler.width * 0.05 * main_scaler.scale_x,0.12 * main_scaler.height * main_scaler.scale_y)	


else





if self.isdead == false then

health_bar_x = self.get_rectangle_for_damaged().x - self.get_rectangle_for_damaged().width/2 +115 * main_scaler.scale_x
health_bar_y = (self.get_rectangle_for_damaged().y + self.get_rectangle_for_damaged().height/2) - (self.get_rectangle_for_damaged().height * 3/2) + 120 * main_scaler.scale_y
self.health_bar_HUD.setX(health_bar_x) 
self.health_bar_HUD.setY(health_bar_y) 
self.health_bar_HUD.setHealth(self.health) 

if self.isidle == true then
if self.get_should_show_shadow() then
r = self.get_rectangle_for_damaged()
if self.isrighty == true then
self.c_shadow.draw(r.x+r.width/7.5,r.y+r.height-(3*main_scaler.scale_y),( (0.055 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
elseif self.islefty == true then
self.c_shadow.draw(r.x+r.width/3.5 +13*main_scaler.scale_x,r.y+r.height-(3*main_scaler.scale_y),( (0.055 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
end	
end

self.idle.set_position(x,y)	
if self.isrighty == true then	
self.idle.set_scale(((0.14*main_scaler.width)/64)*main_scaler.scale_x , ((0.14*main_scaler.height)/64)*main_scaler.scale_y)
self.idle.draw(0,0)		
elseif self.islefty == true then
self.idle.set_scale((-(0.14*main_scaler.width)/64)*main_scaler.scale_x , ((0.14*main_scaler.height)/64)*main_scaler.scale_y)
self.idle.draw(107,0)			
end	
--should show idle anim



elseif self.walk == true then
if self.get_should_show_shadow() then
r = self.get_rectangle_for_damaged()
if self.isrighty == true then
self.c_shadow.draw(r.x+r.width/2.5 -5*main_scaler.scale_x,r.y+r.height-(3*main_scaler.scale_y),( (0.055 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
elseif self.islefty == true then
self.c_shadow.draw(r.x+r.width/4.5 -7*main_scaler.scale_x,r.y+r.height-(3*main_scaler.scale_y),( (0.055 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
end	
end

self.moving.set_position(x,y)
if self.isrighty == true then	
self.moving.set_scale(((0.13*main_scaler.width)/64)*main_scaler.scale_x , ((0.13*main_scaler.height)/64)*main_scaler.scale_y)
self.moving.draw(0,0)
elseif self.islefty == true then
self.moving.set_scale((-(0.13*main_scaler.width)/64)*main_scaler.scale_x , ((0.13*main_scaler.height)/64)*main_scaler.scale_y)
self.moving.draw(126,0)		
end


elseif self.attacking == true then
if self.get_should_show_shadow() then
r = self.get_rectangle_for_damaged()
if self.isrighty == true then
self.c_shadow.draw(r.x+r.width/2.5 -2*main_scaler.scale_x,r.y+r.height-(3*main_scaler.scale_y),( (0.055 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
elseif self.islefty == true then
self.c_shadow.draw(r.x+r.width/1.9 -2*main_scaler.scale_x,r.y+r.height-(3*main_scaler.scale_y),( (0.055 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
end	
end

if self.isrighty == true then	
love.graphics.draw(self.img_for_attacks , x - 45 * main_scaler.scale_x , y - 15 * main_scaler.scale_y , 0 , ( (0.13 * main_scaler.width)/64 )  * main_scaler.scale_x , ( (0.13 * main_scaler.height)/64 )  * main_scaler.scale_y )
elseif self.islefty == true then 
love.graphics.draw(self.img_for_attacks , x - 35 * main_scaler.scale_x , y - 15 * main_scaler.scale_y , 0 , ( (-0.13 * main_scaler.width)/64 )  * main_scaler.scale_x , ( (0.13 * main_scaler.height)/64 )  * main_scaler.scale_y , 205 )			
end



elseif self.isgothit == true then
if self.get_should_show_shadow() then
r = self.get_rectangle_for_damaged()
if self.isrighty == true then
self.c_shadow.draw(r.x+r.width/4.5 -2*main_scaler.scale_x,r.y+r.height-(3*main_scaler.scale_y),( (0.055 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
elseif self.islefty == true then
self.c_shadow.draw(r.x+r.width/2.3 -6*main_scaler.scale_x,r.y+r.height-(3*main_scaler.scale_y),( (0.055 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
end	
end

--self.gothit.set_position(x,y)		
--[[
if self.isrighty == true then
self.gothit.set_scale((-(0.13*main_scaler.width)/64)*main_scaler.scale_x , ((0.13*main_scaler.height)/64)*main_scaler.scale_y)
self.gothit.draw(173,0)		
elseif self.islefty == true then
self.gothit.set_scale(((0.13*main_scaler.width)/64)*main_scaler.scale_x , ((0.13*main_scaler.height)/64)*main_scaler.scale_y)
self.gothit.draw(0,0)		
end
--]]

end

self.health_bar_HUD.draw()


self.draw_player_hit_effect()

--till here! if self.isdead == false
else--self.isdead == true

	
if self.isrighty == true  then
self.die.set_position(x,y)		
self.die.set_scale(((0.12*main_scaler.width)/64)*main_scaler.scale_x , ((0.12*main_scaler.height)/64)*main_scaler.scale_y)
self.die.draw(0,0)	
elseif self.islefty == true then
self.die.set_position(x-10*main_scaler.scale_y,y)		
self.die.set_scale((-(0.12*main_scaler.width)/64)*main_scaler.scale_x , ((0.12*main_scaler.height)/64)*main_scaler.scale_y)
self.die.draw(145,0)		
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
--should change and be cooperate with the world!


--should change the self.center_x_coordinate = self.center_x_coordinate to self.random_pattern to something
if self.player_is_close(dt,rectangle_for_collision) then

self.attack_when_player_is_closed()

else

if self.attacks_frame > 1 and self.attacks_frame < #self.attacks then

self.attack_when_player_is_closed()

else	

self.attacks.frame = 1
self.walk = true
self.isidle = false
self.attacking = false

if self.time_for_patern_movement1 > 0 then

self.time_for_patern_movement1 = self.time_for_patern_movement1 - (10 * dt)
if self.center_x_coordinate < main_scaler.screen_width - 10 * main_scaler.scale_x and
self.center_x_coordinate > 100 * main_scaler.scale_x then
self.center_x_coordinate = self.center_x_coordinate - 3 * main_scaler.scale_x - self.var_speed_x
else
self.random_pattern = 3
self.walk = true
self.isidle = false
self.attacking = false
end

else 

if self.time_for_patern_movement2 > 0 then

self.time_for_patern_movement2 = self.time_for_patern_movement2 - (10 * dt)

if self.center_y_coordinate < main_scaler.screen_height - 100 * main_scaler.scale_y and
self.center_y_coordinate > 10 * main_scaler.scale_y then
self.center_y_coordinate = self.center_y_coordinate + 3 * main_scaler.scale_y + self.var_speed_y
else
self.random_pattern = 3
self.walk = true
self.isidle = false
self.attacking = false
end	

if self.time_for_patern_movement2 > 5 then
if self.center_x_coordinate < main_scaler.screen_width - 100 * main_scaler.scale_x and
self.center_x_coordinate > 10 * main_scaler.scale_x then
self.center_x_coordinate = self.center_x_coordinate + 3 * main_scaler.scale_x + self.var_speed_x
else
self.center_x_coordinate = self.center_x_coordinate
end
elseif self.time_for_patern_movement2 > 0 and self.time_for_patern_movement2 < 5 then
if self.center_x_coordinate < main_scaler.screen_width - 10 * main_scaler.scale_x and
self.center_x_coordinate > 100 * main_scaler.scale_x then
self.center_x_coordinate = self.center_x_coordinate - 3 * main_scaler.scale_x - self.var_speed_x
else
self.random_pattern = 3
self.walk = true
self.isidle = false
self.attacking = false
end	
end

else

if self.time_for_patern_movement3 > 0 then

self.time_for_patern_movement3 = self.time_for_patern_movement3 - (10 * dt)
if self.center_x_coordinate < main_scaler.screen_width - 100 * main_scaler.scale_x and
self.center_x_coordinate > 10 * main_scaler.scale_x then
self.center_x_coordinate = self.center_x_coordinate + 3 * main_scaler.scale_x + self.var_speed_x	
else
self.random_pattern = 3
self.walk = true
self.isidle = false
self.attacking = false
end	


else

return false

end

end--time_for_patern_movement2


end--time_for_patern_movement1

end --player is close

end--player is closed

end--function





self.movement_pattern_two = function(dt,rectangle_for_collision)
--should change and be cooperate with the world!

if self.player_is_close(dt,rectangle_for_collision) then

self.attack_when_player_is_closed()

else

if self.attacks_frame > 1 and self.attacks_frame < #self.attacks then

self.attack_when_player_is_closed()

else	

self.attacks.frame = 1
self.walk = true
self.isidle = false
self.attacking = false

if self.time_for_patern_movement1 > 0 then

self.time_for_patern_movement1 = self.time_for_patern_movement1 - (10 * dt)

if self.center_x_coordinate < main_scaler.screen_width - 100 * main_scaler.scale_x and
self.center_x_coordinate > 10 * main_scaler.scale_x then

self.center_x_coordinate = self.center_x_coordinate + 3 * main_scaler.scale_x + self.var_speed_x
else
self.random_pattern = 3
self.walk = true
self.isidle = false
self.attacking = false
end

if self.center_y_coordinate < main_scaler.screen_height - 100 * main_scaler.scale_y and
self.center_y_coordinate > 10 * main_scaler.scale_y then
self.center_y_coordinate = self.center_y_coordinate + 3 * main_scaler.scale_y + self.var_speed_y
else
self.random_pattern = 3
self.walk = true
self.isidle = false
self.attacking = false
end


else 

if self.time_for_patern_movement2 > 0 then

self.time_for_patern_movement2 = self.time_for_patern_movement2 - (10 * dt)

if self.center_x_coordinate < main_scaler.screen_width - 10 * main_scaler.scale_x and
self.center_x_coordinate > 100 * main_scaler.scale_x then
self.center_x_coordinate = self.center_x_coordinate - 3 * main_scaler.scale_x - self.var_speed_x
else
self.random_pattern = 3
self.walk = true
self.isidle = false
self.attacking = false
end

if self.center_y_coordinate < main_scaler.screen_height - 10 * main_scaler.scale_y and
self.center_y_coordinate > 100 * main_scaler.scale_y then
self.center_y_coordinate = self.center_y_coordinate - 3 * main_scaler.scale_y - self.var_speed_y
else
self.random_pattern = 3	
self.walk = true
self.isidle = false
self.attacking = false
end

else

if self.time_for_patern_movement3 > 0 then

self.time_for_patern_movement3 = self.time_for_patern_movement3 - (10 * dt)	

if self.center_x_coordinate < main_scaler.screen_width - 100 * main_scaler.scale_x and
self.center_x_coordinate > 10 * main_scaler.scale_x then
self.center_x_coordinate = self.center_x_coordinate + 3 * main_scaler.scale_x + self.var_speed_x
else
self.random_pattern = 3
self.walk = true
self.isidle = false
self.attacking = false
end

if self.center_y_coordinate < main_scaler.screen_height - 10 * main_scaler.scale_y and
self.center_y_coordinate > 100 * main_scaler.scale_y then
self.center_y_coordinate = self.center_y_coordinate - 3 * main_scaler.scale_y - self.var_speed_y
else
self.random_pattern = 3
self.walk = true
self.isidle = false
self.attacking = false
end

else

return false

end

end--time_for_patern_movement2


end--time_for_patern_movement1

end--player is closed

end--player is closed

end--function



self.movement_pattern_three = function(dt,rectangle_for_collision)
--should change and be cooperate with the world!


if self.player_is_close(dt,rectangle_for_collision) then

self.attack_when_player_is_closed()

else

if self.attacks_frame > 1 and self.attacks_frame < #self.attacks then

self.attack_when_player_is_closed()

else	

self.attacks.frame = 1
self.walk = true
self.isidle = false
self.attacking = false


if self.time_for_patern_movement1 > 0 then

self.time_for_patern_movement1 = self.time_for_patern_movement1 - (10 * dt)

if self.center_x_coordinate < main_scaler.screen_width/2 then

self.center_x_coordinate = self.center_x_coordinate + 3 * main_scaler.scale_x + self.var_speed_x
else
self.random_pattern = 6
self.walk = false
self.isidle = true
self.attacking = false	
end

if self.center_y_coordinate < main_scaler.screen_height/2 then
self.center_y_coordinate = self.center_y_coordinate + 3 * main_scaler.scale_y + self.var_speed_y
else
self.random_pattern = 6
self.walk = false
self.isidle = true
self.attacking = false	
end


else 

if self.time_for_patern_movement2 > 0 then

self.time_for_patern_movement2 = self.time_for_patern_movement2 - (10 * dt)

if self.center_x_coordinate > main_scaler.screen_width/2 then
self.center_x_coordinate = self.center_x_coordinate - 3 * main_scaler.scale_x - self.var_speed_x
else
self.random_pattern = 6
self.walk = false
self.isidle = true
self.attacking = false	
end

if self.center_y_coordinate < main_scaler.screen_height/2 then
self.center_y_coordinate = self.center_y_coordinate + 3 * main_scaler.scale_y + self.var_speed_y
else
self.random_pattern = 6
self.walk = false
self.isidle = true
self.attacking = false	
end

else

if self.time_for_patern_movement3 > 0 then

self.time_for_patern_movement3 = self.time_for_patern_movement3 - (10 * dt)	

if self.center_x_coordinate < main_scaler.screen_width/2 then
self.center_x_coordinate = self.center_x_coordinate + 3 * main_scaler.scale_x + self.var_speed_x
else
self.random_pattern = 6
self.walk = false
self.isidle = true
self.attacking = false	
end

if self.center_y_coordinate > main_scaler.screen_height/2 then
self.center_y_coordinate = self.center_y_coordinate - 3 * main_scaler.scale_y - self.var_speed_y
else
self.random_pattern = 6
self.walk = false
self.isidle = true
self.attacking = false	
end

else

return false

end

end--time_for_patern_movement2


end--time_for_patern_movement1

end--player is closed

end--player is closed

end--function


self.movement_pattern_dodge_right = function(dt,rectangle_for_collision)
--should change and be cooperate with the world!

if self.time_for_patern_movement1 > 0 then

self.time_for_patern_movement1 = self.time_for_patern_movement1 - (20 * dt)

if self.center_x_coordinate < main_scaler.screen_width - 200 * main_scaler.scale_x then

self.center_x_coordinate = self.center_x_coordinate + (3 + self.time_for_patern_movement1) * main_scaler.scale_x
else
self.random_pattern = 5
self.walk = true
self.isidle = false
self.attacking = false
end


else 

if self.time_for_patern_movement2 > 0 then

self.time_for_patern_movement2 = self.time_for_patern_movement2 - (20 * dt)

if self.center_x_coordinate < main_scaler.screen_width - 100 * main_scaler.scale_x then

self.center_x_coordinate = self.center_x_coordinate + (3 + self.time_for_patern_movement1) * main_scaler.scale_x
else
self.random_pattern = 5
self.walk = true
self.isidle = false
self.attacking = false
end

else

if self.time_for_patern_movement3 > 0 then

self.time_for_patern_movement3 = self.time_for_patern_movement3 - (20 * dt)	

if self.center_x_coordinate < main_scaler.screen_width - 100 * main_scaler.scale_x then

self.center_x_coordinate = self.center_x_coordinate + (3 + self.time_for_patern_movement1) * main_scaler.scale_x
else
self.random_pattern = 5
self.walk = true
self.isidle = false
self.attacking = false
end

else

return false

end

end--time_for_patern_movement2


end--time_for_patern_movement1

end--function


self.movement_pattern_dodge_left = function(dt,rectangle_for_collision)
--should change and be cooperate with the world!

if self.time_for_patern_movement1 > 0 then

self.time_for_patern_movement1 = self.time_for_patern_movement1 - (20 * dt)

if self.center_x_coordinate > 200 * main_scaler.scale_x then

self.center_x_coordinate = self.center_x_coordinate - (3 + self.time_for_patern_movement1) * main_scaler.scale_x
else
self.random_pattern = 4
self.walk = true
self.isidle = false
self.attacking = false
end


else 

if self.time_for_patern_movement2 > 0 then

self.time_for_patern_movement2 = self.time_for_patern_movement2 - (20 * dt)

if self.center_x_coordinate > 100 * main_scaler.scale_x then

self.center_x_coordinate = self.center_x_coordinate - (3 + self.time_for_patern_movement1) * main_scaler.scale_x
else
self.random_pattern = 4
self.walk = true
self.isidle = false
self.attacking = false
end

else

if self.time_for_patern_movement3 > 0 then

self.time_for_patern_movement3 = self.time_for_patern_movement3 - (20 * dt)	

if self.center_x_coordinate > 100 * main_scaler.scale_x then

self.center_x_coordinate = self.center_x_coordinate - (3 + self.time_for_patern_movement1) * main_scaler.scale_x
else
self.random_pattern = 4
self.walk = true
self.isidle = false
self.attacking = false
end

else

return false

end

end--time_for_patern_movement2


end--time_for_patern_movement1

end--function


self.movement_wait = function(dt,rectangle_for_collision)
--should change and be cooperate with the world!

if self.player_is_close(dt,rectangle_for_collision) then

self.attack_when_player_is_closed()

else

if self.attacks_frame > 1 and self.attacks_frame < #self.attacks then

self.attack_when_player_is_closed()

else	

self.attacks.frame = 1
self.walk = false
self.isidle = true
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

end--player is closed

end--player is closed

end--function



self.movement_ai_r_pos = function(dt,rectangle_for_collision)

local target_x_R = rectangle_for_collision.x + rectangle_for_collision.width * 1.5  
local target_y = rectangle_for_collision.y + rectangle_for_collision.height/1.8

if self.center_x_coordinate > target_x_R + (3 * main_scaler.scale_x) then

self.center_x_coordinate = self.center_x_coordinate - 2.5 * main_scaler.scale_x  

elseif self.center_x_coordinate < target_x_R - (3 * main_scaler.scale_x) then 

self.center_x_coordinate = self.center_x_coordinate + 2.5 * main_scaler.scale_x 

elseif self.center_x_coordinate == target_x_R or math.abs(self.center_x_coordinate - target_x_R) < 2.5 * main_scaler.scale_x then

self.center_x_coordinate = self.center_x_coordinate

end

if self.center_y_coordinate > target_y + (3 * main_scaler.scale_y) then

self.center_y_coordinate = self.center_y_coordinate - 2.5 * main_scaler.scale_y

elseif self.center_y_coordinate < target_y - (3 * main_scaler.scale_y) then 

self.center_y_coordinate = self.center_y_coordinate + 2.5 * main_scaler.scale_y

elseif self.center_y_coordinate == target_y or math.abs(self.center_y_coordinate - target_y) < 2.5 * main_scaler.scale_y then

self.center_y_coordinate = self.center_y_coordinate

end


end



self.movement_ai_l_pos = function(dt,rectangle_for_collision)

local target_x_L = rectangle_for_collision.x - rectangle_for_collision.width * 0.5
local target_y = rectangle_for_collision.y + rectangle_for_collision.height/1.8

if self.center_x_coordinate > target_x_L + (3 * main_scaler.scale_x) then


self.center_x_coordinate = self.center_x_coordinate - 2.5 * main_scaler.scale_x 

elseif self.center_x_coordinate < target_x_L - (3 * main_scaler.scale_x) then 


self.center_x_coordinate = self.center_x_coordinate + 2.5 * main_scaler.scale_x 

elseif self.center_x_coordinate == target_x_L or math.abs(self.center_x_coordinate - target_x_L) < 2.5 * main_scaler.scale_x then

self.center_x_coordinate = self.center_x_coordinate

end

if self.center_y_coordinate > target_y + (3 * main_scaler.scale_y) then

self.center_y_coordinate = self.center_y_coordinate - 2.5 * main_scaler.scale_y

elseif self.center_y_coordinate < target_y - (3 * main_scaler.scale_y) then 

self.center_y_coordinate = self.center_y_coordinate + 2.5 * main_scaler.scale_y

elseif self.center_y_coordinate == target_y or math.abs(self.center_y_coordinate - target_y) < 2.5 * main_scaler.scale_y then

self.center_y_coordinate = self.center_y_coordinate

end


end




self.update_side = function(rectangle_for_collision)

local rectangle = self.get_rectangle_for_damaged()
local darksaber_center_x = rectangle.x + rectangle.width / 2 
--local player_center_x = rectangle_for_collision.x + rectangle_for_collision.width / 2 
local player_left_side = rectangle_for_collision.x
local player_right_side = rectangle_for_collision.x + rectangle_for_collision.width   

if darksaber_center_x  < player_left_side then

self.islefty = false
self.isrighty = true

elseif darksaber_center_x  > player_right_side then

self.isrighty = false
self.islefty = true


end
end





--postion will be taken from world class and in main
self.movement_ai = function(--[[position_decide , position_fill , ]]dt,rectangle_for_collision)

local player_center_x =  rectangle_for_collision.x + rectangle_for_collision.width / 2 

if self.center_x_coordinate > player_center_x then

-- if right position were not filled then 
self.movement_ai_r_pos(dt,rectangle_for_collision)
-- elseif right position were filled and left position were not filled
--self.movement_ai_l_pos()
--elseif right position were filled and left position were filled
--self.wait()

elseif self.center_x_coordinate < player_center_x then
-- if left position were not filled then 
self.movement_ai_l_pos(dt,rectangle_for_collision)	
-- elseif left position were filled and right position were not filled
--self.movement_ai_l_pos()
--elseif right position were filled and left position were filled
--self.wait()
end



end



self.damaged_collision_act = function(rectangle_for_attacks , bool_for_attacks , damage_to_take)

if
self.check_for_damaged_collision(rectangle_for_attacks.x , rectangle_for_attacks.y , rectangle_for_attacks.width , rectangle_for_attacks.height)
== true and bool_for_attacks == true then

self.isgothit = true
--[[
self.isidle = false
self.walk = false
self.attacking = false
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


else--self.isdead == true

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

local player_center_x = rectangle_for_collision.x + rectangle_for_collision.width / 2 
local player_center_y = rectangle_for_collision.y + rectangle_for_collision.height / 2 


if self.isdead == false then
--if self.isgothit == false then



if self.time_for_movement > 0  then


--[[
self.walk = true
self.isidle = false
self.attacking = false
--]]
if self.time_for_patern_movement3 <= 0 then

self.set_time_for_patterns()

self.random_pattern = love.math.random(1,6)

else

--if self.isgothit == false then	
--to make it wait only
--self.random_pattern = 6
if self.random_pattern == 1 then
self.walk = true	
self.isidle = false
--self.attacking = false
--if self.isgothit == false then
self.movement_pattern_one(dt,rectangle_for_collision)
--end
elseif self.random_pattern == 2 then	
self.walk = true
self.isidle = false
--self.attacking = false
--if self.isgothit == false then
self.movement_pattern_two(dt,rectangle_for_collision)
--end
elseif self.random_pattern == 3 then
self.walk = true
self.isidle = false
--self.attacking = false
--if self.isgothit == false then
self.movement_pattern_three(dt,rectangle_for_collision)
--end
elseif self.random_pattern == 4 then
self.walk = true
self.isidle = false
self.attacking = false
--if self.isgothit == false then
self.movement_pattern_dodge_right(dt,rectangle_for_collision)
--end
elseif self.random_pattern == 5 then
self.walk = true
self.isidle = false
self.attacking = false
--if self.isgothit == false then
self.movement_pattern_dodge_left(dt,rectangle_for_collision)
--end
elseif self.random_pattern == 6 then
self.walk = false
self.isidle = true
--self.attacking = false	
--if self.isgothit == false then
self.movement_wait(dt,rectangle_for_collision)	
--end
end	

--end--if self.isgothit == false

end


self.time_for_movement = self.time_for_movement - dt


else--else of  if self.time_for_movement > 0

love.graphics.rectangle("fill" , self.center_x_coordinate , self.center_y_coordinate , 20 * main_scaler.scale_x , 20 * main_scaler.scale_y)
love.graphics.rectangle("fill" , player_center_x , player_center_y , 20 * main_scaler.scale_x , 20 * main_scaler.scale_y)

if self.time_for_attack > 0 then

--if self.isgothit == false then

if 
(	(self.center_x_coordinate == target_x_R or math.abs(self.center_x_coordinate - player_center_x) < 100 * main_scaler.scale_x) and
(self.center_y_coordinate == target_y or math.abs(self.center_y_coordinate - player_center_y) < 20 * main_scaler.scale_y)    )  or
(	(self.center_x_coordinate == target_x_L or math.abs(self.center_x_coordinate - player_center_x) < 100 * main_scaler.scale_x) and
(self.center_y_coordinate == target_y or math.abs(self.center_y_coordinate - player_center_y) < 20 * main_scaler.scale_y)    )  then  
--(  math.abs(self.center_x_coordinate - target_x_L) < 30 * main_scaler.scale_x and 
--math.abs(self.center_y_coordinate - target_y) < 30 * main_scaler.scale_y  )   then
self.walk = false


if self.stand_awhile == false then
self.attacking = true
self.isidle = false
else

self.attacking = false
self.isidle = true
self.attacks_frame = 1
if self.stand_awhile_time > 0 then
self.stand_awhile_time = self.stand_awhile_time - dt
else
self.stand_awhile_time = 1
self.stand_awhile = false
end

end	



if self.attacking == true then

if self.attacks_frame == #self.attacks then
self.attacking = false
self.isidle = true
self.stand_awhile = true
end	
end

else

if self.attacking == true then

if self.attacks_frame == #self.attacks then
self.attacking = false
self.walk = true
end	

else

self.walk = true
self.isidle = false
self.attacks_frame = 1
self.movement_ai(--[[position_decide , position_fill , ]]dt,rectangle_for_collision)

end


end

self.time_for_attack = self.time_for_attack - dt

--end--if self.gothit == false

else

self.time_for_movement = 10  + self.var_time_move
self.time_for_attack = 20 + self.var_time_attack + self.var_time_attack

end--time_for_attack	


end--time_for_movement




--end--if self.isgothit == false


end--if self.isdead == false


if self.isdead == false then

self.health_bar_HUD.update(dt)	

if self.isidle == true then 

self.animate_idle()

elseif self.walk == true then

self.animate_move()

elseif self.attacking == true then

self.animate_attacks(dt) 

end	


else


self.animate_die()

end--if self.isdead == true


end--end of function update state











self.set_spell = function (spell)


self.spell = spell


end



---function for get attack for check and hiting enemys -> -> -> using in check collision
self.is_attacking = function()
if self.isdead == true then
return false
else	
return self.attacking == true and 
(self.attacks_frame == #self.attacks or 
self.attacks_frame == #self.attacks - 1 or
self.attacks_frame == #self.attacks - 2)
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
rectangle_for_attack.x = target_center_x_R + 50 * main_scaler.scale_x
rectangle_for_attack.y = target_center_y
rectangle_for_attack.width = (2 * width_L) + 10 * main_scaler.scale_x
rectangle_for_attack.height = height_L
elseif self.islefty == true then
rectangle_for_attack.x = target_center_x_L
rectangle_for_attack.y = target_center_y
rectangle_for_attack.width = (2 * width_L) + 20 * main_scaler.scale_x
rectangle_for_attack.height = height_L
end	

rectangle_for_attack.damage = 3.5

return rectangle_for_attack

end



self.draw_collision_for_attacks = function()



local rectangle_for_collision = self.get_collision_for_attacks()

local width_L = rectangle_for_collision.width 
local height_L = rectangle_for_collision.height 

local target_center_x_R = rectangle_for_collision.x 
local target_center_x_L = rectangle_for_collision.x - (width_L + 20 * main_scaler.scale_x)
local target_center_y = rectangle_for_collision.y 

if self.is_attacking() == true then

love.graphics.rectangle("fill" , rectangle_for_collision.x , rectangle_for_collision.y , rectangle_for_collision.width , rectangle_for_collision.height)

--if self.isrighty == true then	
--love.graphics.rectangle("fill" , target_center_x_R , target_center_y , (2 * width_L) + 10 * main_scaler.scale_x , height_L)
--elseif self.islefty == true then	
--love.graphics.rectangle("fill" , target_center_x_L , target_center_y , (2 * width_L) + 20 * main_scaler.scale_x , height_L)
--end


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


local x_R = self.center_x_coordinate - (64 - 30 ) * main_scaler.scale_x
local y = self.center_y_coordinate - (64 )  * main_scaler.scale_y
local x_L = self.center_x_coordinate - (64 - 60 ) * main_scaler.scale_x
rect = self.get_rectangle_for_damaged()

love.graphics.rectangle("fill" , rect.x , rect.y , rect.width , rect.height)


end


self.get_rectangle_for_damaged = function()

local rectangle = {x = 1 , y = 1 , width = 1 , height = 1}

local x_R = self.center_x_coordinate + (64 - 50 ) * main_scaler.scale_x
local y = self.center_y_coordinate - (64 )  * main_scaler.scale_y
local x_L = self.center_x_coordinate + (94 - 80) * main_scaler.scale_x


rectangle.y = y
rectangle.width = main_scaler.width * 0.12 * main_scaler.scale_x
rectangle.height = 0.22 * main_scaler.height * main_scaler.scale_y

if self.isrighty == true then
rectangle.x = x_R
elseif self.islefty == true then
rectangle.x = x_L
end


return rectangle

end






self.draw_test_collision = function(rectangle_for_collision)

local target_x_R = rectangle_for_collision.x + rectangle_for_collision.width * 2 
local target_y = rectangle_for_collision.y + rectangle_for_collision.height/5
local target_x_L = rectangle_for_collision.x - rectangle_for_collision.width * 3 
local target_y = rectangle_for_collision.y + rectangle_for_collision.height/5

local player_center_x = rectangle_for_collision.x + rectangle_for_collision.width / 2 
local player_center_y = rectangle_for_collision.y + rectangle_for_collision.height / 2 

if self.isrighty == true then
love.graphics.rectangle("fill" , self.center_x_coordinate , self.center_y_coordinate , 20 * main_scaler.scale_x , 20 * main_scaler.scale_y)
elseif self.islefty == true then
love.graphics.rectangle("fill" , self.center_x_coordinate + 12 * main_scaler.scale_x , self.center_y_coordinate , 20 * main_scaler.scale_x , 20 * main_scaler.scale_y)
end
love.graphics.rectangle("fill" , player_center_x , player_center_y , 20 * main_scaler.scale_x , 20 * main_scaler.scale_y)


end


--function for get block for check and blocking attacks from enemys


self.animate_idle = function()

self.idle.update(1)

end



self.animate_move = function()

self.moving.update(1)

end




self.animate_attacks = function(dt)

if self.attacks_framespeed > 4 * dt then

self.attacks_framespeed = 0

if self.attacks_frame < #self.attacks then

self.attacks_frame = self.attacks_frame + 1	

else

self.attacks_frame = 1

end

else

self.attacks_framespeed = self.attacks_framespeed + dt

end


self.img_for_attacks = self.attacks[self.attacks_frame]

end



self.animate_die = function()

self.die.update(1)

end




--abstractions from Enemy.lua class


self.get_detection = function()
return "darksaber"
end

self.respawning = function()
self.respawning_super_class(( (140/2 ) * main_scaler.scale_x) - 20 * main_scaler.scale_x,( (110/2 ) * main_scaler.scale_y)  )
end

self.respawn_position_set = function()
self.respawn_position_set_super_class(( (140/2 ) * main_scaler.scale_x) - 20 * main_scaler.scale_x,( (110/2 ) * main_scaler.scale_y)  )
end



--news:
self.attack_when_player_is_closed = function()

self.walk = false
self.isidle = false
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
rectangle_for_attack.x = target_center_x_R + 50 * main_scaler.scale_x
rectangle_for_attack.y = target_center_y
rectangle_for_attack.width = (2 * width_L) + 10 * main_scaler.scale_x
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



self.play_sounds = function()
if self.attacks_frame == #self.attacks - 3 then 
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

end





return self

end










