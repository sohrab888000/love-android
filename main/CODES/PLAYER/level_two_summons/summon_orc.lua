require("CODES/ANIMATION/animation_batch")
require("CODES/ANIMATION/animation_batch2")
require("CODES/HELPERS/SCALE")


function summon_one_orc(center_x_coordinate,center_y_coordinate)--,idle,moving,block,attacks,dodges--[[]])



--ALL CODES :

local self = {}

self.center_x_coordinate = center_x_coordinate
self.center_y_coordinate = center_y_coordinate
self.respawn_x = center_x_coordinate
self.respawn_y = center_y_coordinate


--just to test removing
self.should_remove = false

self.idle = newAnimation2()
local img = love.graphics.newImage("ART/SUMMON/SUMMONED_ORC/idle_spritesheet.png")
self.idle.set(img,64,64,5)
self.idle.set_itrator(true)

self.moving = newAnimation2()
local img = love.graphics.newImage("ART/SUMMON/SUMMONED_ORC/walk_spritesheet.png")
self.moving.set(img,64,64,5)
self.moving.set_itrator(true)

--29
self.attacks = newAnimation2()
local img = love.graphics.newImage("ART/SUMMON/SUMMONED_ORC/attack_spritesheet.png")
self.attacks.set(img,64,64,6)
self.attacks.set_itrator(true)
self.time_for_ignore = 40


self.dodging = newAnimation2()
local img = love.graphics.newImage("ART/SUMMON/SUMMONED_ORC/dodge_spritesheet.png")
self.dodging.set(img,64,64,6)
self.dodging.set_itrator(true)


self.gothit = newAnimation2()
local img = love.graphics.newImage("ART/SUMMON/SUMMONED_ORC/gothit_spritesheet.png")
self.gothit.set(img,64,64,5)
self.gothit.set_itrator(false)



self.die = newAnimation2()
local img = love.graphics.newImage("ART/SUMMON/SUMMONED_ORC/die_spritesheet.png")
self.die.set(img,64,64,5)
self.die.set_itrator(false)



self.respawn_anim = newAnimation2()
local img = love.graphics.newImage("ART/SUMMON/SUMMONED_ORC/respawn_spritesheet.png")
self.respawn_anim.set(img,64,64,5)
self.die.set_itrator(false)


self.isrighty = false
self.islefty = false

self.isidle = false
self.walk = false
self.attacking = false
self.dodge = false
self.isgothit = false
self.isgothit_time = 1

self.stand_awhile = false
self.stand_awhile_time = 1

self.isdead = false
self.isdead_time = 1
self.life_time = 1118
--self.life_time = 50

self.random_pattern = 0
self.time_for_patern_movement1 = 0
self.time_for_patern_movement2 = 0
self.time_for_patern_movement3 = 0
self.time_for_movement = 20

self.time_for_attack = 30

self.target = nil
self.respawn = false



main_scaler = NEW_MAIN_SCALER()


self.draw = function()




local x = self.center_x_coordinate - ( (64--[[widthofimages]] + 18 ) * main_scaler.scale_x) 
local y = self.center_y_coordinate - ( ( 64--[[heightofimages]] + 8 ) * main_scaler.scale_y) 



if self.respawn == false then
self.respawn_anim.set_position(x,y)
if self.isrighty == true then	
self.respawn_anim.set_scale(((0.13*main_scaler.width)/64)*main_scaler.scale_x , ((0.13*main_scaler.height)/64)*main_scaler.scale_y)
self.respawn_anim.draw(0,0)	
elseif self.islefty == true then
self.respawn_anim.set_scale((-(0.13*main_scaler.width)/64)*main_scaler.scale_x , ((0.13*main_scaler.height)/64)*main_scaler.scale_y)
self.respawn_anim.draw(64,0)		
end

else


if self.isdead == false then


if self.isidle == true then
self.idle.set_position(x,y)	
if self.isrighty == true then	
self.idle.set_scale(((0.13*main_scaler.width)/64)*main_scaler.scale_x , ((0.13*main_scaler.height)/64)*main_scaler.scale_y)
self.idle.draw(0,0)		
elseif self.islefty == true then
self.idle.set_scale((-(0.13*main_scaler.width)/64)*main_scaler.scale_x , ((0.13*main_scaler.height)/64)*main_scaler.scale_y)
self.idle.draw(64,0)			
end	
--should show idle anim



elseif self.walk == true then
self.moving.set_position(x,y)
if self.isrighty == true then	
self.moving.set_scale(((0.13*main_scaler.width)/64)*main_scaler.scale_x , ((0.13*main_scaler.height)/64)*main_scaler.scale_y)
self.moving.draw(0,0)
elseif self.islefty == true then
self.moving.set_scale((-(0.13*main_scaler.width)/64)*main_scaler.scale_x , ((0.13*main_scaler.height)/64)*main_scaler.scale_y)
self.moving.draw(64,0)		
end


elseif self.attacking == true then
self.attacks.set_position(x,y)	
if self.isrighty == true then
self.attacks.set_scale(((0.13*main_scaler.width)/64)*main_scaler.scale_x , ((0.13*main_scaler.height)/64)*main_scaler.scale_y)
self.attacks.draw(0,0)
elseif self.islefty == true then
self.attacks.set_scale((-(0.13*main_scaler.width)/64)*main_scaler.scale_x , ((0.13*main_scaler.height)/64)*main_scaler.scale_y)
self.attacks.draw(64,0)		
end




elseif self.dodge == true then
self.dodging.set_position(x,y)		
if self.isrighty == true then
self.dodging.set_scale(((0.13*main_scaler.width)/64)*main_scaler.scale_x , ((0.13*main_scaler.height)/64)*main_scaler.scale_y)
self.dodging.draw(0,0)	
elseif self.islefty == true then
self.dodging.set_scale((-(0.13*main_scaler.width)/64)*main_scaler.scale_x , ((0.13*main_scaler.height)/64)*main_scaler.scale_y)
self.dodging.draw(64,0)			
end




elseif self.isgothit == true then
self.gothit.set_position(x,y)		
if self.isrighty == true then
self.gothit.set_scale(((0.13*main_scaler.width)/64)*main_scaler.scale_x , ((0.13*main_scaler.height)/64)*main_scaler.scale_y)
self.gothit.draw(0,0)		
elseif self.islefty == true then
self.gothit.set_scale((-(0.13*main_scaler.width)/64)*main_scaler.scale_x , ((0.13*main_scaler.height)/64)*main_scaler.scale_y)
self.gothit.draw(64,0)		
end

end


--till here! if self.isdead == false
else--self.isdead == true

self.die.set_position(x,y)		
if self.isrighty == true  then
self.die.set_scale(((0.13*main_scaler.width)/64)*main_scaler.scale_x , ((0.13*main_scaler.height)/64)*main_scaler.scale_y)
self.die.draw(0,0)	
elseif self.islefty == true then
self.die.set_scale((-(0.13*main_scaler.width)/64)*main_scaler.scale_x , ((0.13*main_scaler.height)/64)*main_scaler.scale_y)
self.die.draw(64,0)		
end

end--self.isdead == true

end--self.respawn == true

end






self.movement_wait = function(dt)
--should change and be cooperate with the world!


if self.isdead == true then 


if self.isdead_time > 0  then

self.isdead_time = self.isdead_time - dt

else

self.should_remove = true

end


end--if self.isdead == true



if self.isdead == false then


if self.life_time < 0 then

self.isdead = true

else

self.life_time = self.life_time - dt

end	

end



self.isidle = true

self.walk = false
self.attacking = false
self.dodge = false
self.isgothit = false

self.center_x_coordinate = self.center_x_coordinate 
self.center_y_coordinate = self.center_y_coordinate

if self.isdead == false then

if self.isidle == true then 

self.animate_idle()

elseif self.walk == true then

self.animate_move()

elseif self.attacking == true then

self.animate_attacks() 

elseif self.dodge == true then

self.animate_dodging()

elseif self.isgothit == true then

self.animate_gothit()

end	


else


self.animate_die()

end--if self.isdead == true

end--function



self.movement_ai_r_pos = function(dt,rectangle_for_collision)

local target_x_R = rectangle_for_collision.x + rectangle_for_collision.width / 2 
local target_y = rectangle_for_collision.y + rectangle_for_collision.height / 2 

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

local target_x_L = rectangle_for_collision.x + rectangle_for_collision.width / 2 
local target_y = rectangle_for_collision.y + rectangle_for_collision.height / 2 


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


self.update_state = function(dt , nearest_enemy)

--rectangle for collision should be choose from the nearst enemys

if self.isdead == true then 


if self.isdead_time > 0  then

self.isdead_time = self.isdead_time - dt

else

self.should_remove = true

end


end--if self.isdead == true

if (self.target == nil or self.target.isdead == true) or (self.target.get_detection() == "orc_mb" and self.target.dodge == true) then 
if nearest_enemy ~= nil then
self.target = nearest_enemy
end
end	


local player_center_x = self.target.get_rectangle_for_damaged().x + self.target.get_rectangle_for_damaged().width / 2 
local player_center_y = self.target.get_rectangle_for_damaged().y + self.target.get_rectangle_for_damaged().height / 2 

--collisions and all ai 
local target_x_R = self.target.get_rectangle_for_damaged().x + self.target.get_rectangle_for_damaged().width * 2 
local target_y = self.target.get_rectangle_for_damaged().y + self.target.get_rectangle_for_damaged().height/5
local target_x_L = self.target.get_rectangle_for_damaged().x - self.target.get_rectangle_for_damaged().width * 3 
local target_y = self.target.get_rectangle_for_damaged().y + self.target.get_rectangle_for_damaged().height/5

local player_center_x = self.target.get_rectangle_for_damaged().x + self.target.get_rectangle_for_damaged().width / 2 
local player_center_y = self.target.get_rectangle_for_damaged().y + self.target.get_rectangle_for_damaged().height / 2 



if self.isdead == false then

if (self.target.get_detection() == "orc_mb" and self.target.dodge == true) then 

self.movement_wait(dt)

elseif not(self.target.get_detection() == "orc_mb" and self.target.dodge == true) then

if self.life_time < 0 then

self.isdead = true

else

self.life_time = self.life_time - dt

end	

local rectangle = self.get_rectangle_for_damaged()
local orc_mb_center_x = rectangle.x + rectangle.width / 2 
local orc_mb_center_y = rectangle.y + rectangle.height / 2 


if
(	(orc_mb_center_x == target_x_R or math.abs(orc_mb_center_x - player_center_x) < 140 * main_scaler.scale_x) and
(orc_mb_center_y == target_y or math.abs(orc_mb_center_y - player_center_y) < 20 * main_scaler.scale_y)    )  or
(	(orc_mb_center_x == target_x_L or math.abs(orc_mb_center_x - player_center_x) < 140 * main_scaler.scale_x) and
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
if self.respawn == true and self.target.isdead == false and self.target.respawn == true then
self.movement_ai(--[[position_decide , position_fill , ]]dt,self.target.get_rectangle_for_damaged())
end


end


end


if  self.respawn == true then
if self.get_center_x_of_rectangle_for_damaged() < self.target.get_rectangle_for_damaged().x then
self.islefty = false
self.isrighty = true
else
self.isrighty = false
self.islefty = true
end
end


end--(self.target.get_detection() == "orc_mb" and self.target.dodge == true)

end--if self.isdead == false

if self.respawn == false then

self.animate_respawn()	

else

if self.isdead == false then

if self.isidle == true then 

self.animate_idle()

elseif self.walk == true then

self.animate_move()

elseif self.attacking == true then

self.animate_attacks() 

elseif self.dodge == true then

self.animate_dodging()

elseif self.isgothit == true then

self.animate_gothit()

end	

else


self.animate_die()

end--if self.isdead == true

end--if self.respawn == true

end--end of function update state











self.set_spell = function (spell)


self.spell = spell


end



---function for get attack for check and hiting enemys -> -> -> using in check collision
self.is_attacking = function()
if self.isdead == true then
return false 
else	
return (self.attacking == true and  
self.attacks.frame == #self.attacks.quads)
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
rectangle_for_attack.width = (2 * width_L) + 10 * main_scaler.scale_x
rectangle_for_attack.height = height_L
elseif self.islefty == true then
rectangle_for_attack.x = target_center_x_L
rectangle_for_attack.y = target_center_y
rectangle_for_attack.width = (2 * width_L) + 20 * main_scaler.scale_x
rectangle_for_attack.height = height_L
end	

--for test
rectangle_for_attack.damage = 2

return rectangle_for_attack

end



self.draw_collision_for_attacks = function()



local rectangle_for_collision = self.get_rectangle_for_damaged()

local width_L = rectangle_for_collision.width 
local height_L = rectangle_for_collision.height 

local target_center_x_R = rectangle_for_collision.x 
local target_center_x_L = rectangle_for_collision.x - (width_L + 20 * main_scaler.scale_x)
local target_center_y = rectangle_for_collision.y 

if self.is_attacking() == true then

if self.isrighty == true then	
love.graphics.rectangle("fill" , target_center_x_R , target_center_y , (2 * width_L) + 10 * main_scaler.scale_x , height_L)
elseif self.islefty == true then	
love.graphics.rectangle("fill" , target_center_x_L , target_center_y , (2 * width_L) + 20 * main_scaler.scale_x , height_L)
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


local x_R = self.center_x_coordinate - (64 - 30 ) * main_scaler.scale_x
local y = self.center_y_coordinate - (64 )  * main_scaler.scale_y
local x_L = self.center_x_coordinate - (64 - 60 ) * main_scaler.scale_x


if self.isdead == false then

if self.isrighty == true then
return CheckCollision(x_R , y , main_scaler.width * 0.05 * main_scaler.scale_x ,  0.12 * main_scaler.height * main_scaler.scale_y , enemy_x , enemy_y , attacks_width , attacks_height)
elseif self.islefty == true then
return CheckCollision(x_L , y , main_scaler.width * 0.05 * main_scaler.scale_x ,  0.12 * main_scaler.height * main_scaler.scale_y , enemy_x , enemy_y , attacks_width , attacks_height)
end


else 

return false

end


end



self.draw_collision_for_damaged = function()


local x_R = self.center_x_coordinate - (64 - 30 ) * main_scaler.scale_x
local y = self.center_y_coordinate - (64 )  * main_scaler.scale_y
local x_L = self.center_x_coordinate - (64 - 60 ) * main_scaler.scale_x

if self.isrighty == true then
love.graphics.rectangle("fill" , x_R , y , main_scaler.width * 0.05 * main_scaler.scale_x , 0.12 * main_scaler.height * main_scaler.scale_y)
elseif self.islefty == true then
love.graphics.rectangle("fill" , x_L , y , main_scaler.width * 0.05 * main_scaler.scale_x , 0.12 * main_scaler.height * main_scaler.scale_y)
end

end


self.get_rectangle_for_damaged = function()

local rectangle = {x = 1 , y = 1 , width = 1 , height = 1}

local x_R = self.center_x_coordinate - (64 - 30 ) * main_scaler.scale_x
local y = self.center_y_coordinate - (64 )  * main_scaler.scale_y
local x_L = self.center_x_coordinate - (64 - 60 ) * main_scaler.scale_x


rectangle.y = y
rectangle.width = main_scaler.width * 0.05 * main_scaler.scale_x
rectangle.height = 0.12 * main_scaler.height * main_scaler.scale_y

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



self.animate_dodging = function()

self.dodging.update(1)

end




self.animate_attacks = function()

self.attacks.update(1)

end




self.animate_gothit = function()

self.gothit.update(1)


end



self.animate_die = function()

self.die.update(1)

end


self.animate_respawn = function()

if self.respawn_anim.frame == 7 then
self.respawn = true
else
self.respawn_anim.update(1)
end	

end


self.should_removed = function()

return self.should_remove

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

return self

end










