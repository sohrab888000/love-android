require("CODES/GUI/HUD/HUD")


function Enemy_creation()--this an abstract class


--ALL CODES :

local self = {}

--HUD
health_bar_x = nil--self.get_rectangle_for_damaged().x
health_bar_y = nil--self.get_center_y_of_rectangle_for_damaged() - self.get_rectangle_for_damaged().height 
health_bar_bar_img = love.graphics.newImage("ART/GUI/HUD/bar.png")
health_bar_inbar_imgs = {}
health_bar_inbar_imgs[1] = love.graphics.newImage("ART/GUI/HUD/enemy_inbar1.png")
health_bar_inbar_imgs[2] = love.graphics.newImage("ART/GUI/HUD/enemy_inbar2.png")
self.health_bar_HUD = make_hud(health_bar_x,health_bar_y,health_bar_bar_img,health_bar_inbar_imgs)
self.should_show_shadow = true
self.set_should_show_shadow = function(bool) self.should_show_shadow = bool end
self.get_should_show_shadow = function() return self.should_show_shadow end
--should do this in subclasses
--self.health_bar_HUD.setHealth(self.health) 
--self.health_bar_HUD.setMaxHealth(self.maxHealth)
--HUD


self.draw_player_hit_effect = function()
	
if self.isgothit == true then
self.hero_hit_effect.draw()
end

end--function


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

if self.gothit.frame == 1 then
self.hero_hit_effect.start()
end

end--function




self.respawning_super_class = function(x_,y_)

self.walk = true


local x = self.center_x_coordinate - x_
local y = self.center_y_coordinate - y_

if x <= main_scaler.screen_width/2 then

self.isrighty = true

if math.abs(self.respawn_x - x) > 3 * main_scaler.scale_x then
self.respawn_x = self.respawn_x + 3 * main_scaler.scale_x
else
self.respawn_x = x	
end

else

self.islefty = true	

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

if self.respawn_x == x and self.respawn_y == y then

self.respawn = true

end


end--end of function

self.respawn_position_set_super_class = function(x_,y_)

local x = self.center_x_coordinate - x_
local y = self.center_y_coordinate - y_

if x <= main_scaler.screen_width/2 then

self.respawn_x = - 50 * main_scaler.scale_x

if y <= main_scaler.screen_height/2 then

self.respawn_y = - 50 * main_scaler.scale_y

else

self.respawn_y = main_scaler.screen_height + 50 * main_scaler.scale_y

end

else

self.respawn_x = main_scaler.screen_width + 50 * main_scaler.scale_x

if y <= main_scaler.screen_height/2 then

self.respawn_y = - 50 * main_scaler.scale_y

else

self.respawn_y = main_scaler.screen_height + 50 * main_scaler.scale_y

end

end


end



self.should_removed = function()

return self.should_remove

end


self.get_pics = function()
return self.pics_for_thief
end

self.get_sound_of_attack = function()
return self.sounds[1]--[[sound of attack]]
end


self.set_hero_hit_effect = function(img,width,height,duration)
self.hero_hit_effect.set(img,width,height,duration)
end

self.set_hero_hit_effect_itrator = function(bool)
self.hero_hit_effect.set_itrator(bool)
end



self.get_center_x_of_rectangle_for_damaged = function()
local rect = self.get_rectangle_for_damaged()--abstract func from child
local to_return = (rect.x + (rect.width/2)) 
return to_return
end


self.get_center_y_of_rectangle_for_damaged = function()
local rect = self.get_rectangle_for_damaged()--abstract func from child
local to_return = (rect.y + (rect.height/2)) 
return to_return
end


return self

end
