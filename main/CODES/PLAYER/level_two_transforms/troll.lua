require("CODES/HELPERS/SCALE")

function troll_transform(center_x_coordinate,center_y_coordinate)

local self = {}

self.thief_attack_bool = false
self.center_x_coordinate = center_x_coordinate
self.center_y_coordinate = center_y_coordinate

self.time_for_end_damage = 10
self.troll_time = 45


main_scaler = NEW_MAIN_SCALER()

self.transforms_draw = function(thief_pics,last_move,center_x_coordinate,center_y_coordinate)
--should draw animtion for effects too
local y = center_y_coordinate - ((124/2) * main_scaler.scale_y) + 155 * main_scaler.scale_y 	
if last_move == true then	
local x = center_x_coordinate - ((170/2) * main_scaler.scale_x) + 200 * main_scaler.scale_x
thief_pics.set_position(x,y)
thief_pics.set_scale(((0.2*main_scaler.width)/170)*main_scaler.scale_x,((0.2*main_scaler.height)/124)*main_scaler.scale_y)
thief_pics.draw(0,0)
else
local x = center_x_coordinate - ((170/2) * main_scaler.scale_x) + 150 * main_scaler.scale_x
thief_pics.set_position(x,y)
thief_pics.set_scale(((-0.2*main_scaler.width)/170)*main_scaler.scale_x,((0.2*main_scaler.height)/124)*main_scaler.scale_y)
thief_pics.draw(170,0)
end

end



self.transforms_update = function(dt,thief,summon_pet,thief_pics,center_x_coordinate,center_y_coordinate)

self.transform__position_update(center_x_coordinate,center_y_coordinate)

if thief == true and summon_pet == nil then
if self.troll_time > 0 then	

if self.time_for_end_damage > 1 then	
self.thief_attack_bool = true
self.time_for_end_damage = 0
else
self.thief_attack_bool = false	
end 	
	
end

end

if thief == true and summon_pet == nil and thief_pics.frame%2 == 0 then
self.time_for_end_damage = 10
end

if thief == false then
self.troll_time = 45
self.thief_attack_bool = false	
end


end



self.troll_act = function(last_move,get_rectangle_for_damaged)


if last_move == false then
	
local rectangle_for_collision = get_rectangle_for_damaged
local w = (170 * main_scaler.scale_x + rectangle_for_collision.width)/2
local h = rectangle_for_collision.height 

--if self.get_should_freez_in_x() == false then	                   should change and consider this condition

if self.center_x_coordinate -  self.troll_time > main_scaler.screen_width - ((170) * main_scaler.scale_x  + w) then 
self.center_x_coordinate = main_scaler.screen_width - ((170) * main_scaler.scale_x  + w)
elseif self.center_x_coordinate -  self.troll_time < - ((170) * main_scaler.scale_x  + w) then
self.center_x_coordinate = - ((160) * main_scaler.scale_x  + w)
else
self.center_x_coordinate = self.center_x_coordinate -  self.troll_time/1.5  * main_scaler.scale_x
end	


else

local rectangle_for_collision = get_rectangle_for_damaged
local w = (170 * main_scaler.scale_x + rectangle_for_collision.width)/2
local h = rectangle_for_collision.height 


--if self.get_should_freez_in_x() == false then	                   should change and consider this condition

if self.center_x_coordinate +  self.troll_time  > main_scaler.screen_width - ((170) * main_scaler.scale_x  + w) then 
self.center_x_coordinate = main_scaler.screen_width - ((170) * main_scaler.scale_x  + w)
elseif self.center_x_coordinate +  self.troll_time  < - ((170) * main_scaler.scale_x  + w) then
self.center_x_coordinate = - ((170) * main_scaler.scale_x  + w)
else
self.center_x_coordinate = self.center_x_coordinate +  self.troll_time/1.5 * main_scaler.scale_x
end

end


self.troll_time = self.troll_time - 1

end





--from level two make transforms:

self.transform__position_update = function(center_x_coordinate,center_y_coordinate)
self.center_x_coordinate = center_x_coordinate
self.center_y_coordinate = center_y_coordinate
end

self.get_x = function()
return self.center_x_coordinate
end

self.get_y = function()
return self.center_y_coordinate
end




self.transforms_attacking = function()

return self.thief_attack_bool

end



self.get_dont_stop_on_last_frame = function()
return true
end




return self	


end