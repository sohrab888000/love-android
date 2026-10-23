require("CODES/ANIMATION/animation_batch")
require("CODES/ANIMATION/animation_batch2")
require("CODES/HELPERS/SCALE")
require ("CODES/ENEMIES/Enemy")
require("CODES/SHADOWS/characters_shadows")

function create_troll(center_x_coordinate,center_y_coordinate,idle,move,attack,special,thief,gothit,die,knockdown,onground,getup,troll_sounds)--,idle,moving,thief,attacks,dodges--[[]])


--ALL CODES :

local self = Enemy_creation()

self.center_x_coordinate = center_x_coordinate
self.center_y_coordinate = center_y_coordinate
self.speed_slowment = speed_slowment
self.respawn_x = nil
self.respawn_y = nil
--just for test die
self.health = 30
self.maxHealth = self.health
--just to test removing
self.should_remove = false


self.idle = newAnimation2()
local img = idle
self.idle.set(img,104,109,4)
self.idle.set_itrator(true)

self.moving = newAnimation2()
local img = move
self.moving.set(img,140,105,4)
self.moving.set_itrator(true)

self.attacks = attack
self.attacks_framespeed = 0
self.attacks_frame = 1
self.img_for_attacks = self.attacks[1]
self.time_for_ignore = 40

self.special = newAnimation2()
local img = special
self.special.set(img,170,124,3)
self.special.set_itrator(true)

self.gothit = newAnimation2()
local img = gothit
self.gothit.set(img,181,105,4)
self.gothit.set_itrator(false)

self.die = die
self.die_frame = 1
self.die_framespeed = 0
self.img_for_die = self.die[1]


self.knockdown = newAnimation2()
local img = knockdown
self.knockdown.set(img,184,150,3)
self.knockdown.set_itrator(false)

self.onground = newAnimation2()
local img = onground
self.onground.set(img,161,89,1)
self.onground.set_itrator(false)

self.getup = newAnimation2()
local img = getup
self.getup.set(img,135,127,3)
self.getup.set_itrator(false)


self.pics_for_thief = thief



self.isrighty = false
self.islefty = false

self.isidle = false
self.walk = false
self.attacking = false


self.special_attack = false
self.special_attack_to_left = false
self.special_attack_to_right = false
self.target_lefty = 0
self.target_righty = 0
self.should_special_to_left_bool = false
self.should_special_to_right_bool = false
self.stoping_from_more_special_time = 2
self.stoping_from_more_special_bool = false


self.isgothit = false
self.isgothit_time = 1

self.stand_awhile = false
self.stand_awhile_time = 1

self.knockdown_bool = false
self.onground_bool = false
self.getup_bool = false

self.isdead = false
self.isdead_time = 5


self.random_pattern = 0
self.time_for_patern_movement1 = 0
self.time_for_patern_movement2 = 0
self.time_for_patern_movement3 = 0
self.time_for_movement = 20

self.time_for_attack = 30

self.c_shadow = make_c_shodow()
self.hero_hit_effect = newAnimation()

self.respawn = false


main_scaler = NEW_MAIN_SCALER()

--HUD
self.health_bar_HUD.setHealth(self.health) 
self.health_bar_HUD.setMaxHealth(self.maxHealth)
--HUD


--sound effects:
self.sounds = troll_sounds--[[1:attack-2:die-3:gethit]]
self.should_play_death_sound = true

self.draw = function()


local x = self.center_x_coordinate - ((104/2) * main_scaler.scale_x)
local y = self.center_y_coordinate - ((109/2) * main_scaler.scale_y)


if self.respawn == false then
if self.get_should_show_shadow() then
if self.isrighty == true then
--love.graphics.rectangle("fill",self.respawn_x-(64 - 30 ) * main_scaler.scale_x + main_scaler.width * 0.05 * main_scaler.scale_x,self.respawn_y-(64 )  * main_scaler.scale_y + 0.12 * main_scaler.height * main_scaler.scale_y,main_scaler.width * 0.05 * main_scaler.scale_x,0.12 * main_scaler.height * main_scaler.scale_y)	
self.c_shadow.draw(self.respawn_x- (104 - 160 ) * main_scaler.scale_x+main_scaler.width * 0.02 * main_scaler.scale_x,self.respawn_y- (109 - 110 )  * main_scaler.scale_y+0.05 * main_scaler.height * main_scaler.scale_y+0.13 * main_scaler.height * main_scaler.scale_y+(5 * main_scaler.scale_y),( (0.055 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
elseif self.islefty == true then
self.c_shadow.draw(self.respawn_x- (104 - 160 ) * main_scaler.scale_x+main_scaler.width * 0.02 * main_scaler.scale_x+(main_scaler.width * 0.08 * main_scaler.scale_x)/4.5,self.respawn_y- (109 - 110 )  * main_scaler.scale_y+0.05 * main_scaler.height * main_scaler.scale_y+0.13 * main_scaler.height * main_scaler.scale_y+(5 * main_scaler.scale_y),( (0.055 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
end	
end

self.moving.set_position(self.respawn_x,self.respawn_y)
if self.isrighty == true then	
self.moving.set_scale(((0.2*main_scaler.width)/140)*main_scaler.scale_x,((0.2*main_scaler.height)/105)*main_scaler.scale_y)	
self.moving.draw(0,0)
elseif self.islefty == true then
self.moving.set_scale(((-0.2*main_scaler.width)/140)*main_scaler.scale_x,((0.2*main_scaler.height)/105)*main_scaler.scale_y)	
self.moving.draw(140,0)
end


--love.graphics.rectangle("fill",self.respawn_x- (104 - 160 ) * main_scaler.scale_x+main_scaler.width * 0.02 * main_scaler.scale_x,self.respawn_y- (109 - 110 )  * main_scaler.scale_y+0.05 * main_scaler.height * main_scaler.scale_y,main_scaler.width * 0.08 * main_scaler.scale_x,0.13 * main_scaler.height * main_scaler.scale_y)	


else



if self.isdead == false then

if self.isrighty == true then
health_bar_x = self.get_rectangle_for_damaged().x - self.get_rectangle_for_damaged().width/2 + 5 * main_scaler.scale_x
health_bar_y = (self.get_rectangle_for_damaged().y + self.get_rectangle_for_damaged().height/2) - (self.get_rectangle_for_damaged().height * 3/2) + 15 * main_scaler.scale_y
else
health_bar_x = self.get_rectangle_for_damaged().x - self.get_rectangle_for_damaged().width/2 + 50 * main_scaler.scale_x
health_bar_y = (self.get_rectangle_for_damaged().y + self.get_rectangle_for_damaged().height/2) - (self.get_rectangle_for_damaged().height * 3/2) + 15 * main_scaler.scale_y
end	
self.health_bar_HUD.setX(health_bar_x) 
self.health_bar_HUD.setY(health_bar_y) 
self.health_bar_HUD.setHealth(self.health) 

if self.isidle == true then
if self.get_should_show_shadow() then
r = self.get_rectangle_for_damaged()
if self.isrighty == true then
self.c_shadow.draw(r.x-r.width/10,r.y+r.height-(3*main_scaler.scale_y),( (0.055 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
elseif self.islefty == true then
self.c_shadow.draw(r.x+r.width/4.3 + 20*main_scaler.scale_x,r.y+r.height-(3*main_scaler.scale_y),( (0.055 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
end	
end

self.idle.set_position(x,y)	
if self.isrighty == true then
self.idle.set_scale(((0.2*main_scaler.width)/104)*main_scaler.scale_x,((0.2*main_scaler.height)/109)*main_scaler.scale_y)		
self.idle.draw(0,0)
elseif self.islefty == true then
self.idle.set_scale(((-0.2*main_scaler.width)/104)*main_scaler.scale_x,((0.2*main_scaler.height)/109)*main_scaler.scale_y)		
self.idle.draw(104,0)	
end	




elseif self.walk == true then
if self.get_should_show_shadow() then
r = self.get_rectangle_for_damaged()
if self.isrighty == true then
self.c_shadow.draw(r.x-r.width/10,r.y+r.height-(3*main_scaler.scale_y),( (0.055 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
elseif self.islefty == true then
self.c_shadow.draw(r.x+r.width/4.3,r.y+r.height-(3*main_scaler.scale_y),( (0.055 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
end	
end

self.moving.set_position(x,y)	
if self.isrighty == true then	
self.moving.set_scale(((0.2*main_scaler.width)/140)*main_scaler.scale_x,((0.2*main_scaler.height)/105)*main_scaler.scale_y)	
self.moving.draw(0,0)
elseif self.islefty == true then
self.moving.set_scale(((-0.2*main_scaler.width)/140)*main_scaler.scale_x,((0.2*main_scaler.height)/105)*main_scaler.scale_y)	
self.moving.draw(140,0)
end




elseif self.attacking == true then
if self.get_should_show_shadow() then
r = self.get_rectangle_for_damaged()
if self.isrighty == true then
self.c_shadow.draw(r.x-r.width/10 + 15*main_scaler.scale_x,r.y+r.height-(3*main_scaler.scale_y),( (0.055 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
elseif self.islefty == true then
self.c_shadow.draw(r.x+r.width/4.3 + 15*main_scaler.scale_x,r.y+r.height-(3*main_scaler.scale_y),( (0.055 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
end	
end

if self.isrighty == true then	
love.graphics.draw(self.img_for_attacks , x - 100 * main_scaler.scale_x , y - 75 * main_scaler.scale_y , 0 , ( (0.3 * main_scaler.width)/258 )  * main_scaler.scale_x , ( (0.3 * main_scaler.height)/111 )  * main_scaler.scale_y )
elseif self.islefty == true then 
love.graphics.draw(self.img_for_attacks , x - 35 * main_scaler.scale_x , y - 75 * main_scaler.scale_y , 0 , ( (-0.3 * main_scaler.width)/258 )  * main_scaler.scale_x , ( (0.3 * main_scaler.height)/111 )  * main_scaler.scale_y , 258 )			
end



elseif self.special_attack == true then
if self.get_should_show_shadow() then
r = self.get_rectangle_for_damaged()
if self.isrighty == true then
self.c_shadow.draw(r.x-r.width/10,r.y+r.height-(3*main_scaler.scale_y),( (0.055 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
elseif self.islefty == true then
self.c_shadow.draw(r.x+r.width/4.3,r.y+r.height-(3*main_scaler.scale_y),( (0.055 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
end	
end

if self.isrighty == true then	
self.special.set_position(x+20*main_scaler.scale_x,y-10*main_scaler.scale_y)
self.special.set_scale(((0.2*main_scaler.width)/170)*main_scaler.scale_x,((0.225*main_scaler.height)/124)*main_scaler.scale_y)		
self.special.draw(0,0)	
elseif self.islefty == true then
self.special.set_position(x-10*main_scaler.scale_x,y-10*main_scaler.scale_y)
self.special.set_scale(((-0.2*main_scaler.width)/170)*main_scaler.scale_x,((0.225*main_scaler.height)/124)*main_scaler.scale_y)		
self.special.draw(170,0)		
end




elseif self.isgothit == true then
if self.get_should_show_shadow() then
r = self.get_rectangle_for_damaged()
if self.isrighty == true then
self.c_shadow.draw(r.x-r.width/10,r.y+r.height-(3*main_scaler.scale_y),( (0.055 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
elseif self.islefty == true then
self.c_shadow.draw(r.x+r.width/4.3 + 5*main_scaler.scale_x,r.y+r.height-(3*main_scaler.scale_y),( (0.055 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
end	
end

if self.isrighty == true then	
self.gothit.set_position(x-90*main_scaler.scale_x,y-40*main_scaler.scale_y)
self.gothit.set_scale(((0.25*main_scaler.width)/181)*main_scaler.scale_x,((0.25*main_scaler.height)/105)*main_scaler.scale_y)		
self.gothit.draw(0,0)	
elseif self.islefty == true then
self.gothit.set_position(x+10*main_scaler.scale_x,y-40*main_scaler.scale_y)
self.gothit.set_scale(((-0.25*main_scaler.width)/181)*main_scaler.scale_x,((0.25*main_scaler.height)/105)*main_scaler.scale_y)		
self.gothit.draw(181,0)
end




elseif self.knockdown_bool == true then
if self.get_should_show_shadow() then
r = self.get_rectangle_for_damaged()
if self.isrighty == true then
self.c_shadow.draw(r.x-r.width/10,r.y+r.height-(3*main_scaler.scale_y),( (0.055 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
elseif self.islefty == true then
self.c_shadow.draw(r.x+r.width/4.3,r.y+r.height-(3*main_scaler.scale_y),( (0.055 * main_scaler.width)/self.c_shadow.img:getWidth() )  * main_scaler.scale_x , ( (0.015 * main_scaler.height)/self.c_shadow.img:getHeight() )  * main_scaler.scale_y )
end	
end

if self.isrighty == true then	
self.knockdown.set_position(x-50*main_scaler.scale_x,y-40*main_scaler.scale_y)
self.knockdown.set_scale(((0.25*main_scaler.width)/184)*main_scaler.scale_x,((0.25*main_scaler.height)/150)*main_scaler.scale_y)		
self.knockdown.draw(0,0)	
elseif self.islefty == true then
self.knockdown.set_position(x-10*main_scaler.scale_x,y-40*main_scaler.scale_y)
self.knockdown.set_scale(((-0.25*main_scaler.width)/184)*main_scaler.scale_x,((0.25*main_scaler.height)/150)*main_scaler.scale_y)		
self.knockdown.draw(184,0)		
end




elseif self.onground_bool == true then
if self.isrighty == true then	
self.onground.set_position(x-50*main_scaler.scale_x,y+10*main_scaler.scale_y)
self.onground.set_scale(((0.225*main_scaler.width)/161)*main_scaler.scale_x,((0.225*main_scaler.height)/89)*main_scaler.scale_y)		
self.onground.draw(0,0)		
elseif self.islefty == true then
self.onground.set_position(x-10*main_scaler.scale_x,y+10*main_scaler.scale_y)
self.onground.set_scale(((-0.225*main_scaler.width)/161)*main_scaler.scale_x,((0.225*main_scaler.height)/89)*main_scaler.scale_y)		
self.onground.draw(161,0)		
end



elseif self.getup_bool == true then

if self.isrighty == true then	
self.getup.set_position(x+20*main_scaler.scale_x,y-10*main_scaler.scale_y)
self.getup.set_scale(((0.2*main_scaler.width)/135)*main_scaler.scale_x,((0.225*main_scaler.height)/127)*main_scaler.scale_y)		
self.getup.draw(0,0)		
elseif self.islefty == true then
self.getup.set_position(x-10*main_scaler.scale_x,y+10*main_scaler.scale_y)
self.getup.set_scale(((-0.2*main_scaler.width)/135)*main_scaler.scale_x,((0.225*main_scaler.height)/127)*main_scaler.scale_y)		
self.getup.draw(161,0)		
end


end

self.health_bar_HUD.draw()

self.draw_player_hit_effect()

--till here! if self.isdead == false
else--self.isdead == true

if self.isrighty == true then		
love.graphics.draw(self.img_for_die , x - 170 * main_scaler.scale_x , y - 100 * main_scaler.scale_y , 0 , ( (0.35 * main_scaler.width)/327 )  * main_scaler.scale_x , ( (0.35 * main_scaler.height)/135 )  * main_scaler.scale_y )
elseif self.islefty == true then
love.graphics.draw(self.img_for_die , x - 70 * main_scaler.scale_x , y - 80 * main_scaler.scale_y , 0 , ( (-0.35 * main_scaler.width)/327 )  * main_scaler.scale_x , ( (0.35 * main_scaler.height)/135 )  * main_scaler.scale_y , 327 )			
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

if self.player_is_close(dt,rectangle_for_collision) then

self.attack_when_player_is_closed()

else

if self.attacks_frame > 1 and self.attacks_frame < #self.attacks then

self.attack_when_player_is_closed()

else	


self.attacks_frame = 1

self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false

--should change the self.center_x_coordinate = self.center_x_coordinate to self.random_pattern to something


if self.time_for_patern_movement1 > 0 then

self.time_for_patern_movement1 = self.time_for_patern_movement1 - (10 * dt)
if self.center_x_coordinate < main_scaler.screen_width - 10 * main_scaler.scale_x and
self.center_x_coordinate > 100 * main_scaler.scale_x then
self.center_x_coordinate = self.center_x_coordinate - 3 * main_scaler.scale_x
else
self.random_pattern = 3
self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false
end

else 

if self.time_for_patern_movement2 > 0 then

self.time_for_patern_movement2 = self.time_for_patern_movement2 - (10 * dt)

if self.center_y_coordinate < main_scaler.screen_height - 100 * main_scaler.scale_y and
self.center_y_coordinate > 10 * main_scaler.scale_y then
self.center_y_coordinate = self.center_y_coordinate + 3 * main_scaler.scale_y
else
self.random_pattern = 3
self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false
end	

if self.time_for_patern_movement2 > 5 then
if self.center_x_coordinate < main_scaler.screen_width - 100 * main_scaler.scale_x and
self.center_x_coordinate > 10 * main_scaler.scale_x then
self.center_x_coordinate = self.center_x_coordinate + 3 * main_scaler.scale_x
else
self.center_x_coordinate = self.center_x_coordinate
end
elseif self.time_for_patern_movement2 > 0 and self.time_for_patern_movement2 < 5 then
if self.center_x_coordinate < main_scaler.screen_width - 10 * main_scaler.scale_x and
self.center_x_coordinate > 100 * main_scaler.scale_x then
self.center_x_coordinate = self.center_x_coordinate - 3 * main_scaler.scale_x
else
self.random_pattern = 3
self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false
end	
end

else

if self.time_for_patern_movement3 > 0 then

self.time_for_patern_movement3 = self.time_for_patern_movement3 - (10 * dt)
if self.center_x_coordinate < main_scaler.screen_width - 100 * main_scaler.scale_x and
self.center_x_coordinate > 10 * main_scaler.scale_x then
self.center_x_coordinate = self.center_x_coordinate + 3 * main_scaler.scale_x	
else
self.random_pattern = 3
self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false
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
--should change and be cooperate with the world!

if self.player_is_close(dt,rectangle_for_collision) then

self.attack_when_player_is_closed()

else

if self.attacks_frame > 1 and self.attacks_frame < #self.attacks then

self.attack_when_player_is_closed()

else	

self.attacks_frame = 1	

self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false



if self.time_for_patern_movement1 > 0 then

self.time_for_patern_movement1 = self.time_for_patern_movement1 - (10 * dt)

if self.center_x_coordinate < main_scaler.screen_width - 100 * main_scaler.scale_x and
self.center_x_coordinate > 10 * main_scaler.scale_x then

self.center_x_coordinate = self.center_x_coordinate + 3 * main_scaler.scale_x
else
self.random_pattern = 3
self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false
end

if self.center_y_coordinate < main_scaler.screen_height - 100 * main_scaler.scale_y and
self.center_y_coordinate > 10 * main_scaler.scale_y then
self.center_y_coordinate = self.center_y_coordinate + 3 * main_scaler.scale_y
else
self.random_pattern = 3
self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false
end


else 

if self.time_for_patern_movement2 > 0 then

self.time_for_patern_movement2 = self.time_for_patern_movement2 - (10 * dt)

if self.center_x_coordinate < main_scaler.screen_width - 10 * main_scaler.scale_x and
self.center_x_coordinate > 100 * main_scaler.scale_x then
self.center_x_coordinate = self.center_x_coordinate - 3 * main_scaler.scale_x
else
self.random_pattern = 3
self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false
end

if self.center_y_coordinate < main_scaler.screen_height - 10 * main_scaler.scale_y and
self.center_y_coordinate > 100 * main_scaler.scale_y then
self.center_y_coordinate = self.center_y_coordinate - 3 * main_scaler.scale_y
else
self.random_pattern = 3	
self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false
end

else

if self.time_for_patern_movement3 > 0 then

self.time_for_patern_movement3 = self.time_for_patern_movement3 - (10 * dt)	

if self.center_x_coordinate < main_scaler.screen_width - 100 * main_scaler.scale_x and
self.center_x_coordinate > 10 * main_scaler.scale_x then
self.center_x_coordinate = self.center_x_coordinate + 3 * main_scaler.scale_x
else
self.random_pattern = 3
self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false
end

if self.center_y_coordinate < main_scaler.screen_height - 10 * main_scaler.scale_y and
self.center_y_coordinate > 100 * main_scaler.scale_y then
self.center_y_coordinate = self.center_y_coordinate - 3 * main_scaler.scale_y
else
self.random_pattern = 3
self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false
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
--should change and be cooperate with the world!

if self.player_is_close(dt,rectangle_for_collision) then

self.attack_when_player_is_closed()

else

if self.attacks_frame > 1 and self.attacks_frame < #self.attacks then

self.attack_when_player_is_closed()

else	


self.attacks_frame = 1

self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false


if self.time_for_patern_movement1 > 0 then

self.time_for_patern_movement1 = self.time_for_patern_movement1 - (10 * dt)

if self.center_x_coordinate < main_scaler.screen_width/2 then

self.center_x_coordinate = self.center_x_coordinate + 3 * main_scaler.scale_x
else
self.random_pattern = 6
self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false
end

if self.center_y_coordinate < main_scaler.screen_height/2 then
self.center_y_coordinate = self.center_y_coordinate + 3 * main_scaler.scale_y
else
self.random_pattern = 6
self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false
end


else 

if self.time_for_patern_movement2 > 0 then

self.time_for_patern_movement2 = self.time_for_patern_movement2 - (10 * dt)

if self.center_x_coordinate > main_scaler.screen_width/2 then
self.center_x_coordinate = self.center_x_coordinate - 3 * main_scaler.scale_x
else
self.random_pattern = 6
self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false
end

if self.center_y_coordinate < main_scaler.screen_height/2 then
self.center_y_coordinate = self.center_y_coordinate + 3 * main_scaler.scale_y
else
self.random_pattern = 6
self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false
end

else

if self.time_for_patern_movement3 > 0 then

self.time_for_patern_movement3 = self.time_for_patern_movement3 - (10 * dt)	

if self.center_x_coordinate < main_scaler.screen_width/2 then
self.center_x_coordinate = self.center_x_coordinate + 3 * main_scaler.scale_x
else
self.random_pattern = 6
self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false
end

if self.center_y_coordinate > main_scaler.screen_height/2 then
self.center_y_coordinate = self.center_y_coordinate - 3 * main_scaler.scale_y
else
self.random_pattern = 6
self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false
end

else

return false

end

end--time_for_patern_movement2


end--time_for_patern_movement1

end--player is close

end--player is close

end--function


self.movement_pattern_special_attack_right = function(dt , rectangle_for_collision)
--should change and be cooperate with the world!

self.targetizing_righty(dt,rectangle_for_collision)



if self.time_for_patern_movement1 > 0 then

self.time_for_patern_movement1 = self.time_for_patern_movement1 - (20 * dt)

if self.center_x_coordinate < main_scaler.screen_width - 200 * main_scaler.scale_x then

self.center_x_coordinate = self.center_x_coordinate + (3 + self.time_for_patern_movement1) * main_scaler.scale_x
else
self.random_pattern = 5
self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false
end


else 

if self.time_for_patern_movement2 > 0 then

self.time_for_patern_movement2 = self.time_for_patern_movement2 - (20 * dt)

if self.center_x_coordinate < main_scaler.screen_width - 100 * main_scaler.scale_x then

self.center_x_coordinate = self.center_x_coordinate + (3 + self.time_for_patern_movement2) * main_scaler.scale_x
else
self.random_pattern = 5
self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false
end

else

if self.time_for_patern_movement3 > 0 then

self.time_for_patern_movement3 = self.time_for_patern_movement3 - (20 * dt)	

if self.center_x_coordinate < main_scaler.screen_width - 100 * main_scaler.scale_x then

self.center_x_coordinate = self.center_x_coordinate + (3 + self.time_for_patern_movement3) * main_scaler.scale_x
else
self.random_pattern = 5
self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false
end

else

return false

end

end--time_for_patern_movement2


end--time_for_patern_movement1

end--function


self.movement_pattern_special_attack_left = function(dt , rectangle_for_collision)
--should change and be cooperate with the world!

self.targetizing_lefty(dt,rectangle_for_collision)

if self.time_for_patern_movement1 > 0 then

self.time_for_patern_movement1 = self.time_for_patern_movement1 - (20 * dt)

if self.center_x_coordinate > 200 * main_scaler.scale_x then

self.center_x_coordinate = self.center_x_coordinate - (3 + self.time_for_patern_movement1) * main_scaler.scale_x
else
self.random_pattern = 4
self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false
end


else 

if self.time_for_patern_movement2 > 0 then

self.time_for_patern_movement2 = self.time_for_patern_movement2 - (20 * dt)

if self.center_x_coordinate > 100 * main_scaler.scale_x then

self.center_x_coordinate = self.center_x_coordinate - (3 + self.time_for_patern_movement2) * main_scaler.scale_x
else
self.random_pattern = 4
self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false
end

else

if self.time_for_patern_movement3 > 0 then

self.time_for_patern_movement3 = self.time_for_patern_movement3 - (20 * dt)	

if self.center_x_coordinate > 100 * main_scaler.scale_x then

self.center_x_coordinate = self.center_x_coordinate - (3 + self.time_for_patern_movement3) * main_scaler.scale_x
else
self.random_pattern = 4
self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false
end

else

return false

end

end--time_for_patern_movement2


end--time_for_patern_movement1

end--function



self.movement_ai_r_pos = function(dt,rectangle_for_collision)

local target_x_R = rectangle_for_collision.x + rectangle_for_collision.width / 2 
local target_y = rectangle_for_collision.y + rectangle_for_collision.height / 2 

local rectangle = self.get_rectangle_for_damaged()
local troll_center_x = rectangle.x + rectangle.width / 2 
local troll_center_y = rectangle.y + rectangle.height / 2 


if troll_center_x > target_x_R + (5 * main_scaler.scale_x) then

self.center_x_coordinate = self.center_x_coordinate - 4 * main_scaler.scale_x 

elseif troll_center_x < target_x_R - (5 * main_scaler.scale_x) then 

self.center_x_coordinate = self.center_x_coordinate + 4 * main_scaler.scale_x 

elseif troll_center_x == target_x_R or math.abs(troll_center_x - target_x_R) < 2 * main_scaler.scale_x then

self.center_x_coordinate = self.center_x_coordinate

end

if troll_center_y > target_y + (5 * main_scaler.scale_y) then

self.center_y_coordinate = self.center_y_coordinate - 4 * main_scaler.scale_y

elseif troll_center_y < target_y - (5 * main_scaler.scale_y) then 

self.center_y_coordinate = self.center_y_coordinate + 4 * main_scaler.scale_y

elseif troll_center_y == target_y or math.abs(troll_center_y - target_y) < 2 * main_scaler.scale_y then

self.center_y_coordinate = self.center_y_coordinate

end


end



self.movement_ai_l_pos = function(dt,rectangle_for_collision)

local target_x_L = rectangle_for_collision.x + rectangle_for_collision.width / 2 
local target_y = rectangle_for_collision.y + rectangle_for_collision.height / 2 


local rectangle = self.get_rectangle_for_damaged()
local troll_center_x = rectangle.x + rectangle.width / 2 
local troll_center_y = rectangle.y + rectangle.height / 2 


if troll_center_x > target_x_L + (5 * main_scaler.scale_x) then


self.center_x_coordinate = self.center_x_coordinate - 4 * main_scaler.scale_x 

elseif troll_center_x < target_x_L - (5 * main_scaler.scale_x) then 


self.center_x_coordinate = self.center_x_coordinate + 4 * main_scaler.scale_x 

elseif troll_center_x == target_x_L or math.abs(troll_center_x - target_x_L) < 2 * main_scaler.scale_x then

self.center_x_coordinate = self.center_x_coordinate

end

if troll_center_y > target_y + (5 * main_scaler.scale_y) then

self.center_y_coordinate = self.center_y_coordinate - 4 * main_scaler.scale_y

elseif troll_center_y < target_y - (5 * main_scaler.scale_y) then 

self.center_y_coordinate = self.center_y_coordinate + 4 * main_scaler.scale_y

elseif troll_center_y == target_y or math.abs(troll_center_y - target_y) < 2 * main_scaler.scale_y then

self.center_y_coordinate = self.center_y_coordinate

end


end


--postion will be taken from world class and in main
self.movement_ai = function(--[[position_decide , position_fill , ]]dt,rectangle_for_collision)

local player_center_x =  rectangle_for_collision.x + rectangle_for_collision.width / 2 

local rectangle = self.get_rectangle_for_damaged()
local troll_center_x = rectangle.x + rectangle.width / 2 


if troll_center_x > player_center_x then

-- if right position were not filled then 
self.movement_ai_r_pos(dt,rectangle_for_collision)
-- elseif right position were filled and left position were not filled
--self.movement_ai_l_pos()
--elseif right position were filled and left position were filled
--self.wait()

elseif troll_center_x < player_center_x then
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
local troll_center_x = rectangle.x + rectangle.width / 2 
--local player_center_x = rectangle_for_collision.x + rectangle_for_collision.width / 2 
local player_left_side = rectangle_for_collision.x
local player_right_side = rectangle_for_collision.x + rectangle_for_collision.width   

if troll_center_x  < player_left_side then

self.islefty = false
self.isrighty = true

elseif troll_center_x  > player_right_side then

self.isrighty = false
self.islefty = true


end
end


self.damaged_collision_act = function(rectangle_for_attacks , bool_for_attacks , damage_to_take)

if
self.check_for_damaged_collision(rectangle_for_attacks.x , rectangle_for_attacks.y , rectangle_for_attacks.width , rectangle_for_attacks.height)
== true and bool_for_attacks == true
and self.knockdown_bool == false
and self.onground_bool == false
and self.getup_bool == false
then

--just for test:
if self.health > damage_to_take then

self.health = self.health - damage_to_take

self.isgothit = true
self.isidle = false
self.walk = false
self.attacking = false
self.special_attack = false
self.stand_awhile = false
self.gothit.frame = 1
self.isgothit_time = 1
self.attacks_frame = 1
self.knockdown.frame = 1
self.onground.frame = 1
self.getup.frame = 1
self.hero_hit_effect.start()

else

self.health = 0
self.isdead = true
self.isgothit = false
self.isidle = false
self.walk = false
self.attacking = false
self.special_attack = false
self.stand_awhile = false
self.knockdown_bool = false
self.onground_bool = false
self.getup_bool = false
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
self.damaged_collision_act(rectangle_for_gothit_except_two_last_hits_and_transforms_attacks , should_check_for_except_two_last_hits_and_transforms_attacks,rectangle_for_gothit_except_two_last_hits_and_transforms_attacks.damage)
if
self.check_for_damaged_collision(rectangle_for_gothit_two_last_hits_and_spells.x , rectangle_for_gothit_two_last_hits_and_spells.y , rectangle_for_gothit_two_last_hits_and_spells.width , rectangle_for_gothit_two_last_hits_and_spells.height)
== true and should_check_for_two_last_hits_and_spells == true 
and self.knockdown_bool == false
and self.onground_bool == false
and self.getup_bool == false
then

--just for test:
if self.health > rectangle_for_gothit_two_last_hits_and_spells.damage then

self.health = self.health - rectangle_for_gothit_two_last_hits_and_spells.damage

self.isgothit = false
self.isidle = false
self.walk = false
self.attacking = false
self.special_attack = false
self.stand_awhile = false
self.gothit.frame = 1
self.attacks_frame = 1
self.knockdown.frame = 1
self.onground.frame = 1
self.getup.frame = 1
self.knockdown_bool = true

else

self.health = 0
self.isdead = true
self.isgothit = false
self.isidle = false
self.walk = false
self.attacking = false
self.special_attack = false
self.stand_awhile = false
self.knockdown_bool = false
self.onground_bool = false
self.getup_bool = false
end--just for test

end


if rectangle_for_gothit_summoned ~= nil and should_check_for_summoned ~= nil then
self.damaged_collision_act(rectangle_for_gothit_summoned , should_check_for_summoned , rectangle_for_gothit_summoned.damage)
end




if self.isgothit == true then

if self.isgothit_time > 0 then

self.isgothit_time = self.isgothit_time - dt

else

self.isgothit = false
self.gothit.frame = 1
self.isgothit_time = 1

end

end


else--self.isdead == true

self.isgothit = false
self.gothit.frame = 1
self.isgothit_time = 1

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
if self.isgothit == false then



if self.time_for_movement > 0 
and self.knockdown_bool == false
and self.onground_bool == false
and self.getup_bool == false  then
--[[
self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false
--]]
if self.time_for_patern_movement3 <= 0 then

self.set_time_for_patterns()

self.random_pattern = love.math.random(1,6)

else

if self.isgothit == false then

if self.random_pattern == 1 then
self.walk = true	
self.isidle = false
self.attacking = false
self.special_attack = false
if self.isgothit == false then
self.movement_pattern_one(dt,rectangle_for_collision)
end
elseif self.random_pattern == 2 then	
self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false
if self.isgothit == false then
self.movement_pattern_two(dt,rectangle_for_collision)
end
elseif self.random_pattern == 3 then
self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false
if self.isgothit == false then
self.movement_pattern_three(dt,rectangle_for_collision)
end
elseif self.random_pattern == 4 then
self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false
if self.isgothit == false then
self.movement_pattern_special_attack_right(dt , rectangle_for_collision)
end
elseif self.random_pattern == 5 then
self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false
if self.isgothit == false then
self.movement_pattern_special_attack_left(dt , rectangle_for_collision)
end
elseif self.random_pattern == 6 then
self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false
if self.isgothit == false then
self.movement_pattern_special_attack_right(dt , rectangle_for_collision)
end
end	

end--if self.isgothit == false

end


self.time_for_movement = self.time_for_movement - dt


else--else of  if self.time_for_movement > 0

local rectangle = self.get_rectangle_for_damaged()
local troll_center_x = rectangle.x + rectangle.width / 2 
local troll_center_y = rectangle.y + rectangle.height / 2 

if self.time_for_attack > 0 
and self.knockdown_bool == false
and self.onground_bool == false
and self.getup_bool == false then


if self.isgothit == false then

self.knockdown.frame = 1
self.onground.frame = 1
self.getup.frame = 1


if
(	(troll_center_x == target_x_R or math.abs(troll_center_x - player_center_x) < 130 * main_scaler.scale_x) and
(troll_center_y == target_y or math.abs(troll_center_y - player_center_y) < 20 * main_scaler.scale_y)    )  or
(	(troll_center_x == target_x_L or math.abs(troll_center_x - player_center_x) < 130 * main_scaler.scale_x) and
(troll_center_y == target_y or math.abs(troll_center_y - player_center_y) < 20 * main_scaler.scale_y)    )  then  
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


self.special_attack = false

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
self.special_attack = false
self.attacks_frame = 1
self.movement_ai(--[[position_decide , position_fill , ]]dt,rectangle_for_collision)

end


end

self.time_for_attack = self.time_for_attack - dt

end--if self.isgothit == false

else

self.time_for_movement = 20
self.time_for_attack = 30

end--time_for_attack	


end--time_for_movement




end--if self.isgothit == false

end--if self.isdead == false


if self.isdead == false then

self.health_bar_HUD.update(dt)	

if self.isidle == true then 

self.animate_idle(1)

elseif self.walk == true then

self.animate_move(1)

elseif self.attacking == true then

self.animate_attacks(dt) 

elseif self.special_attack == true then

self.animate_special(1)

elseif self.isgothit == true then

self.animate_gothit(1)

elseif self.knockdown_bool == true then

self.animate_knockdown(1)

elseif self.onground_bool == true then	

self.animate_onground(1)

elseif self.getup_bool == true then

self.animate_getup(1)

end	


else


self.animate_die(dt)

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
return 
(
self.attacking == true and 
(self.attacks_frame == #self.attacks - 4 or 
self.attacks_frame == #self.attacks - 3 or
self.attacks_frame == #self.attacks - 2)
)

or

self.special_attack == true 

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


if (
self.attacking == true and 
(self.attacks_frame == #self.attacks - 4 or 
self.attacks_frame == #self.attacks - 3 or
self.attacks_frame == #self.attacks - 2)
)then

if self.isrighty == true then
rectangle_for_attack.x = target_center_x_R
rectangle_for_attack.y = target_center_y
rectangle_for_attack.width = (2 * width_L) + 10 * main_scaler.scale_x
rectangle_for_attack.height = height_L
elseif self.islefty == true then
rectangle_for_attack.x = target_center_x_L
rectangle_for_attack.y = target_center_y
rectangle_for_attack.width = (2 * width_L) + 20 * main_scaler.scale_x
rectangle_for_attack.height = height_L
end	

--for normal attack
rectangle_for_attack.damage = 2

elseif self.special_attack == true then

rectangle_for_attack = rectangle_for_collision
rectangle_for_attack.damage = 3

end

return rectangle_for_attack

end



self.draw_collision_for_attacks = function()



local rectangle_for_collision = self.get_rectangle_for_damaged()

local width_L = rectangle_for_collision.width 
local height_L = rectangle_for_collision.height 

local target_center_x_R = rectangle_for_collision.x 
local target_center_x_L = rectangle_for_collision.x - (width_L + 20 * main_scaler.scale_x)
local target_center_y = rectangle_for_collision.y 

if (
self.attacking == true and 
(self.attacks == #self.attacks - 4 or 
self.attacks == #self.attacks - 3 or
self.attacks == #self.attacks - 2)
)then

if self.isrighty == true then	
love.graphics.rectangle("fill" , target_center_x_R , target_center_y , (2 * width_L) + 10 * main_scaler.scale_x , height_L)
elseif self.islefty == true then	
love.graphics.rectangle("fill" , target_center_x_L , target_center_y , (2 * width_L) + 20 * main_scaler.scale_x , height_L)
end


elseif self.special_attack == true then

return rectangle_for_collision

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

if self.special_attack == false then
return CheckCollision(rectangle.x , rectangle.y , rectangle.width , rectangle.height , enemy_x , enemy_y , attacks_width , attacks_height)
end

else 

return false

end


end



self.draw_collision_for_damaged = function()

local rectangle = self.get_rectangle_for_damaged()

love.graphics.rectangle("fill" , rectangle.x , rectangle.y , rectangle.width , rectangle.height)

end


self.get_rectangle_for_damaged = function()

local rectangle = {x = 1 , y = 1 , width = 1 , height = 1}

local x_R = self.center_x_coordinate - (104 - 160 ) * main_scaler.scale_x
local y = self.center_y_coordinate - (109 - 110 )  * main_scaler.scale_y
local x_L = self.center_x_coordinate - (104 - 150 ) * main_scaler.scale_x


rectangle.y = y
rectangle.width = main_scaler.width * 0.08 * main_scaler.scale_x
rectangle.height = 0.13 * main_scaler.height * main_scaler.scale_y

if self.isrighty == true then
rectangle.x = x_R
elseif self.islefty == true then
rectangle.x = x_L
end


return rectangle

end






self.draw_test_collision = function(rectangle_for_collision)

local player_center_x = rectangle_for_collision.x + rectangle_for_collision.width / 2 
local player_center_y = rectangle_for_collision.y + rectangle_for_collision.height / 2 

local rectangle = self.get_rectangle_for_damaged()


love.graphics.rectangle("fill" , rectangle.x , rectangle.y , 20 * main_scaler.scale_x , 20 * main_scaler.scale_y)
love.graphics.rectangle("fill" , player_center_x , player_center_y , 20 * main_scaler.scale_x , 20 * main_scaler.scale_y)


end


--function for get block for check and blocking attacks from enemys


self.animate_idle = function()

self.idle.update(1)

end



self.animate_move = function()

self.moving.update(1)

end


self.animate_special = function()

self.special.update(1)

end




self.animate_attacks = function(dt)

if self.attacks_framespeed > 2 * dt then

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




self.animate_gothit = function()

self.gothit.update(1)

end


self.animate_knockdown = function()

if self.knockdown.frame < #self.knockdown.quads then

self.knockdown.update(1)

else

self.knockdown.frame = #self.knockdown.quads
self.knockdown_bool = false
self.onground_bool = true

end

end



self.animate_onground = function()

if self.onground.frame < #self.onground.quads then

self.onground.update(1)

else

self.onground.frame = #self.onground.quads
self.onground_bool = false
self.getup_bool = true

end

end



self.animate_getup = function()

if self.getup.frame < #self.getup.quads then

self.getup.update(1)

else

self.getup.frame = #self.getup.quads
self.getup_bool = false

end

end






self.animate_die = function(dt)

if self.die_framespeed > 1 * dt then

self.die_framespeed = 0

if self.die_frame < #self.die then

self.die_frame = self.die_frame + 1	

else

self.die_frame = #self.die

end

else

self.die_framespeed = self.die_framespeed + dt

end


self.img_for_die = self.die[self.die_frame]

end


--abstractions from Enemy.lua class


self.get_detection = function()
return "troll"
end

self.respawning = function()
self.respawning_super_class(((104/2) * main_scaler.scale_x),((109/2) * main_scaler.scale_y))
end

self.respawn_position_set = function()
self.respawn_position_set_super_class(((104/2) * main_scaler.scale_x),((109/2) * main_scaler.scale_y))
end



--news:
self.attack_when_player_is_closed = function()

if self.isgothit == false then

self.walk = false
self.isidle = false
self.attacking = true

end

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



self.attack_special_to_right  = function()

if self.isgothit == false then

self.walk = false
self.isidle = false
self.attacking = false
self.special_attack = true

center_of_troll = self.get_rectangle_for_damaged().x + self.get_rectangle_for_damaged().width/2

if center_of_troll + 8 * main_scaler.scale_x   < self.target_righty  then

self.center_x_coordinate = self.center_x_coordinate + 8 * main_scaler.scale_x

else

self.stoping_from_more_special_bool = true 
self.should_special_to_right_bool = false


self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false

end	


end

end

self.attack_special_to_left  = function()

if self.isgothit == false then

self.walk = false
self.isidle = false
self.attacking = false
self.special_attack = true

center_of_troll = self.get_rectangle_for_damaged().x + self.get_rectangle_for_damaged().width/2

if center_of_troll - 8 * main_scaler.scale_x  > self.target_lefty  then

self.center_x_coordinate = self.center_x_coordinate - 8 * main_scaler.scale_x

else

self.stoping_from_more_special_bool = true 
self.should_special_to_left_bool = false

self.walk = true
self.isidle = false
self.attacking = false
self.special_attack = false

end	


end

end


self.should_special_to_left = function(dt , rectangle_for_collision)

local player_center_x = rectangle_for_collision.x + rectangle_for_collision.width / 2 
local player_center_y = rectangle_for_collision.y + rectangle_for_collision.height / 2 

--collisions and all ai 
local target_x_R = rectangle_for_collision.x + rectangle_for_collision.width * 2 
local target_y = rectangle_for_collision.y + rectangle_for_collision.height/5
local target_x_L = rectangle_for_collision.x - rectangle_for_collision.width * 3 
local target_y = rectangle_for_collision.y + rectangle_for_collision.height/5

local player_center_x = rectangle_for_collision.x + rectangle_for_collision.width / 2 
local player_center_y = rectangle_for_collision.y + rectangle_for_collision.height / 2 


local rectangle = self.get_rectangle_for_damaged()
local troll_center_x = rectangle.x + rectangle.width / 2 
local troll_center_y = rectangle.y + rectangle.height / 2 

if
(	(troll_center_x - player_center_x > 0    and math.abs(troll_center_x - player_center_x) < main_scaler.width/2 * main_scaler.scale_x) and
(math.abs(troll_center_y - player_center_y) < 50 * main_scaler.scale_y)    )  then  
--(  math.abs(self.center_x_coordinate - target_x_L) < 30 * main_scaler.scale_x and 
--math.abs(self.center_y_coordinate - target_y) < 30 * main_scaler.scale_y  )   then

--self.special_attack_to_left = true
return true

else


return false

end	


end



self.should_special_to_right = function(dt , rectangle_for_collision)

local player_center_x = rectangle_for_collision.x + rectangle_for_collision.width / 2 
local player_center_y = rectangle_for_collision.y + rectangle_for_collision.height / 2 

--collisions and all ai 
local target_x_R = rectangle_for_collision.x + rectangle_for_collision.width * 2 
local target_y = rectangle_for_collision.y + rectangle_for_collision.height/5
local target_x_L = rectangle_for_collision.x - rectangle_for_collision.width * 3 
local target_y = rectangle_for_collision.y + rectangle_for_collision.height/5

local player_center_x = rectangle_for_collision.x + rectangle_for_collision.width / 2 
local player_center_y = rectangle_for_collision.y + rectangle_for_collision.height / 2 


local rectangle = self.get_rectangle_for_damaged()
local troll_center_x = rectangle.x + rectangle.width / 2 
local troll_center_y = rectangle.y + rectangle.height / 2 

if
(	(troll_center_x - player_center_x < 0  and math.abs(troll_center_x - player_center_x) < main_scaler.width/2 * main_scaler.scale_x)  and
(math.abs(troll_center_y - player_center_y) < 50 * main_scaler.scale_y)    )  then  
--(  math.abs(self.center_x_coordinate - target_x_L) < 30 * main_scaler.scale_x and 
--math.abs(self.center_y_coordinate - target_y) < 30 * main_scaler.scale_y  )   then

--self.special_attack_to_right = true

return true

else

return false	

end	


end


self.targetizing_lefty = function(dt , rectangle_for_collision)

if self.stoping_from_more_special_bool == false then


if self.should_special_to_left(dt , rectangle_for_collision) then

local player_center_x = rectangle_for_collision.x + rectangle_for_collision.width / 2  

self.target_lefty = player_center_x
self.should_special_to_left_bool = true

end	

if self.should_special_to_left_bool == true then


self.attack_special_to_left()


end

else

if self.stoping_from_more_special_time <= 0 then

self.stoping_from_more_special_bool = false
self.stoping_from_more_special_time = 2

else

self.stoping_from_more_special_time = self.stoping_from_more_special_time - dt

end



end	


end

self.targetizing_righty = function(dt , rectangle_for_collision)

if self.stoping_from_more_special_bool == false then


if self.should_special_to_right(dt , rectangle_for_collision) then

local player_center_x = rectangle_for_collision.x + rectangle_for_collision.width / 2  

self.target_righty = player_center_x
self.should_special_to_right_bool = true

end	

if self.should_special_to_right_bool == true then


self.attack_special_to_right()


end

else

if self.stoping_from_more_special_time <= 0 then

self.stoping_from_more_special_bool = false
self.stoping_from_more_special_time = 2

else

self.stoping_from_more_special_time = self.stoping_from_more_special_time - dt

end



end	


end




self.play_sounds = function()
if self.attacks_frame == #self.attacks - 4 then 
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
if self.isgothit and self.gothit.frame == 1 and self.isdead == false and self.should_play_death_sound == true then
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
